unit tas_in_out_product;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, base_form, uniDateTimePicker,
  uniGroupBox, uniMultiItem, uniComboBox, uniButton, uniBitBtn, uniSpeedButton,
  uniGUIClasses, uniCheckBox, uniGUIBaseClasses, uniPanel, uniBasicGrid,unFunctions,
  uniDBGrid, uniLabel, uniEdit, uniRadioGroup, base_search, Datasnap.Provider,
  Data.DB, Datasnap.DBClient, Fm_Entity,Fm_merchandise, Fm_Brand, uniPageControl,
  Vcl.Menus, uniMainMenu, tas_nf_55;

type
  TTasInOutProduct = class(TBaseSearch)
    ChBx_Periodo: TUniCheckBox;
    DTP_Date_Initial: TUniDateTimePicker;
    DTP_Date_End: TUniDateTimePicker;
    Ctn_Company: TUniContainerPanel;
    Ctn_Product: TUniContainerPanel;
    Ctn_Brand: TUniContainerPanel;
    Rg_Direction: TUniRadioGroup;
    UniLabel1: TUniLabel;
    cb_kind_operation: TUniComboBox;
    cds_searchinvoice_id: TIntegerField;
    cds_searchway: TStringField;
    cds_searchnotafiscal: TStringField;
    cds_searchdt_emission: TDateField;
    cds_searchid: TIntegerField;
    cds_searchdescription: TStringField;
    cds_searchquantity: TBCDField;
    cds_searchunit_value: TFMTBCDField;
    cds_searchsubtotal: TFMTBCDField;
    cds_searchname_company: TStringField;
    cds_searchdirecao: TStringField;
    cds_searchordem: TStringField;

    procedure InitVariable;Override;
    procedure SelectSql;Override;
    procedure InnerJoinSql;Override;
    procedure WhereSql;Override;
    procedure OrderBySql;Override;
    procedure FormatScreen;Override;

    procedure SetParameters;Override;
    procedure GetView;Override;
    procedure SetRegister;Override;
    procedure chbx_periodoClick(Sender: TObject);
    procedure cds_searchCalcFields(DataSet: TDataSet);
  private
    { Private declarations }
    procedure ShowBrand;
    procedure ShowProduct;
    procedure ShowCompany;
  public
    { Public declarations }
    FrBrand         : TFmBrand;
    FrProduct       : TFmMerchandise;
    FrCompany       : TFmEntity;
  end;

var
  TasInOutProduct: TTasInOutProduct;

implementation

{$R *.dfm}

uses MainModule,openForms;

{ TTasInOutProduct }

procedure TTasInOutProduct.cds_searchCalcFields(DataSet: TDataSet);
begin
  if ( DataSet.FieldByName('way').AsString  = 'S' ) then
    DataSet.FieldByName('direcao').AsString  := 'Saída'
  else
    DataSet.FieldByName('direcao').AsString  := 'Entrada';
end;

procedure TTasInOutProduct.chbx_periodoClick(Sender: TObject);
begin
//
end;

procedure TTasInOutProduct.FormatScreen;
begin
  inherited;
  ShowBrand;
  ShowProduct;
  ShowCompany;
end;

procedure TTasInOutProduct.GetView;
var
  Form : TTasNf55;
begin
  if Form = nil then
    Form := TTasNf55.Create(Self);
  Form.CodigoRegistro   := cds_searchid.AsInteger;
  Form.Terminal         := 1;
  Form.Vendedor         := 0;
  Form.Show(
    Procedure(Sender: TComponent; AResult:Integer)
    begin
      Form := nil;
    end
  );
end;

procedure TTasInOutProduct.InitVariable;
begin
  DTP_Date_Initial.DateTime := Date - 30;
  DTP_Date_End.DateTime := Date;
end;

procedure TTasInOutProduct.InnerJoinSql;
begin
  if ( cb_kind_operation.ItemIndex > 0 ) then
  Begin
    case cb_kind_operation.ItemIndex of
      //COMPRA
      1:InnerJoinTxt := '  inner join tb_order_purchase ord ';
      //VENDA
      2:InnerJoinTxt := '  inner join tb_order_sale ord ';
      //AJUSTES
      3:InnerJoinTxt := '  inner join tb_order_stock_adjust ord ';
      //ROMANEIO
      4:InnerJoinTxt := '  inner join tb_order_packing ord ';
      //TRANSFERÊNCIA
      5:InnerJoinTxt := '  inner join tb_order_stock_transfer ord ';
      //PRODUÇÃO
      6:InnerJoinTxt := '  inner join tb_order_production ord ';
      //ENGENHARIA
      7:InnerJoinTxt := '  inner join tb_order_job ord ';
    end;

    InnerJoinTxt := concat(
                       InnerJoinTxt,
                       '  on (ord.id = inv.id)'
                    );
  End;

  InnerJoinTxt := concat(
                    InnerJoinTxt,
                    '   INNER JOIN tb_cfop cfop ',
                    '   ON (inv.tb_cfop_id = cfop.id) ',

                    '   INNER JOIN tb_order_item oi ',
                    '   ON (inv.id = oi.tb_order_id) and (inv.tb_institution_id = oi.tb_institution_id)  ',

                    '   INNER JOIN tb_product pro ',
                    '   ON (oi.tb_product_id = pro.id) and (oi.tb_institution_id = pro.tb_institution_id) ',

                    '   INNER JOIN tb_entity en ',
                    '   ON (en.id = inv.tb_entity_id) ',

                    '   INNER JOIN tb_merchandise mr ',
                    '   ON (mr.id = pro.id) and (mr.tb_institution_id = pro.tb_institution_id) ',

                    '   INNER JOIN tb_brand br ',
                    '   on ( br.id = mr.tb_brand_id) '
                 );
End;

procedure TTasInOutProduct.OrderBySql;
begin
  inherited;
  OrderByTxt := 'Order By cfop.way ';
end;

procedure TTasInOutProduct.SelectSql;
begin
  SelectTxt := concat(
              'SELECT DISTINCT inv.id invoice_id, cfop.way,  ',
              'inv.number notafiscal, inv.dt_emission, ',
              'pro.id, pro.description, oi.quantity, oi.unit_value, ',
              '(oi.quantity*oi.unit_value)subtotal, en.name_company, br.id '
              );
  if ( cb_kind_operation.ItemIndex = 0 ) then
  Begin
    SelectTxt := concat(
                    SelectTxt,
                    ', ''0'' ordem '
                  );
    dbg_Search.Columns.Items[1].Visible := False;
  End
  else
  Begin
    SelectTxt := concat(
                    SelectTxt,
                    ', cast(ord.number as char(10)) ordem '
                  );
    dbg_Search.Columns.Items[1].Visible := True;
  End;
  SelectTxt := concat(
                  SelectTxt,
                  'FROM tb_invoice inv '
                );
end;

procedure TTasInOutProduct.SetParameters;
begin
  with UMM.Qr_Crud do
  Begin
    ParamByName('institution_id').AsInteger := UMM.GInstitution.registro.Codigo;

    if ChBx_Periodo.Checked then
    Begin
      ParamByName('dataini').AsString := ConverteData( DTP_Date_Initial.DateTime );
      ParamByName('datafim').AsString := ConverteData( DTP_Date_End.DateTime );
    end;

    if (FrCompany.DBLCB_Lista.KeyValue <> null) then
      ParamByName('en_id').AsInteger := FrCompany.DBLCB_Lista.KeyValue ;

    if (FrProduct.DBLCB_Lista.KeyValue <> null) then
      ParamByName('pro_id').AsInteger := FrProduct.DBLCB_Lista.KeyValue;

    if (FrBrand.DBLCB_Lista.KeyValue <> null) then
      ParamByName('bra_id').AsInteger:= FrBrand.DBLCB_Lista.KeyValue;

  end;
end;

procedure TTasInOutProduct.SetRegister;
begin
  inherited;
//
end;

procedure TTasInOutProduct.ShowBrand;
begin
  FrBrand := TFmBrand.Create(Self);
  FrBrand.Parent := Ctn_Brand;
  FrBrand.Align := alClient;
  FrBrand.listar;
  FrBrand.Show;
end;

procedure TTasInOutProduct.ShowCompany;
begin
  FrCompany := TFmEntity.Create(Self);
  FrCompany.Parent := Ctn_Company;
  FrCompany.Align := alClient;
  FrCompany.listar;
  FrCompany.Show;
end;

procedure TTasInOutProduct.ShowProduct;
begin
  FrProduct := TFmMerchandise.Create(Self);
  FrProduct.Parent := Ctn_Product;
  FrProduct.Align := alClient;
  FrProduct.listar;
  FrProduct.Show;
end;

procedure TTasInOutProduct.WhereSql;
begin
  inherited;
  WhereTxt := ' where ( inv.tb_institution_id =:institution_id ) ';

  if ChBx_Periodo.Checked then
    WhereTxt := WhereTxt + ' AND ( inv.dt_emission between :dataini and :datafim ) ';

  if FrCompany.DBLCB_Lista.KeyValue <> null then
    WhereTxt := WhereTxt + ' and (en.id =:en_id)';

  if FrProduct.DBLCB_Lista.KeyValue <> null then
    WhereTxt := WhereTxt + ' and (pro.id =:pro_id)';

  if FrBrand.DBLCB_Lista.KeyValue <> null then
    WhereTxt := WhereTxt + ' and (br.id =:bra_id)';

  case Rg_Direction.ItemIndex of
    0: WhereTxt := WhereTxt + ' and (cfop.way = ''E'')';
    1: WhereTxt := WhereTxt + ' and (cfop.way = ''S'')';
  end;

end;

end.
