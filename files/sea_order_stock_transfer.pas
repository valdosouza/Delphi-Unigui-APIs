unit sea_order_stock_transfer;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, base_search, Datasnap.Provider, Data.DB,
  Datasnap.DBClient, uniButton, uniBitBtn, uniSpeedButton, uniGUIClasses,
  uniBasicGrid, uniDBGrid, uniGUIBaseClasses, uniPanel, uniRadioGroup, uniEdit,
  uniLabel, uniDateTimePicker, uniCheckBox, fm_stock_list , fm_situation,
  uniPageControl, Vcl.Menus, uniMainMenu,unFunctions;

type
  TSeaOrderStockTransfer = class(TBaseSearch)
    cds_searchid: TIntegerField;
    cds_searchdt_record: TDateField;
    cds_searchnumber: TIntegerField;
    cds_searchdescription: TStringField;
    cds_searchname_company: TStringField;
    cds_searchest_origem: TStringField;
    cds_searchest_destino: TStringField;
    chbx_periodo: TUniCheckBox;
    DTP_Date_Initial: TUniDateTimePicker;
    DTP_Date_End: TUniDateTimePicker;
    L_Codigo: TUniLabel;
    E_Number: TUniEdit;
    ctn_Stock_Id_Ori: TUniContainerPanel;
    ctn_Stock_Id_Des: TUniContainerPanel;
    Ctn_Situation: TUniContainerPanel;

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

  private
    { Private declarations }
    procedure ShowStockIdOri;
    procedure ShowStockIdDes;
    procedure ShowSituation;

  public
    { Public declarations }
    FrStockListori : TFmStockList;
    FrStockListdes : TFmStockList;
    FrSituation  : TFmSituation;
  end;

var
  SeaOrderStockTransfer: TSeaOrderStockTransfer;

implementation

{$R *.dfm}

uses openForms, MainModule;

{ TBaseSearch1 }

procedure TSeaOrderStockTransfer.chbx_periodoClick(Sender: TObject);
begin
  DTP_Date_Initial.Enabled := chbx_periodo.Checked;
  DTP_Date_End.Enabled := chbx_periodo.Checked;
end;

procedure TSeaOrderStockTransfer.FormatScreen;
begin
  inherited;
  ShowStockIdOri;
  ShowStockIdDes;
  ShowSituation;

end;

procedure TSeaOrderStockTransfer.GetView;
  Var
  lcodigo : TuniEdit;
  begin
    lcodigo := TuniEdit.Create(Self);
    lcodigo.Tag := cds_searchid.AsInteger;
    openTasOrderStockTransfer(lcodigo);
  end;

procedure TSeaOrderStockTransfer.InitVariable;
begin
  DTP_Date_Initial.DateTime := Date - 30;
  DTP_Date_End.DateTime := Date;
end;

procedure TSeaOrderStockTransfer.InnerJoinSql;
begin
  InnerJoinTxt := concat(
                  InnerJoinTxt,
                    '  inner join tb_order_stock_transfer ost ',
                    '  on (ord.id = ost.id) and (ord.tb_institution_id = ost.tb_institution_id) ',
                    '  inner join tb_entity en ',
                    ' on (en.id = ost.tb_entity_id) ',
                    ' inner join tb_situation st ',
                    ' on (st.id = ost.tb_situation_id) ',
                    ' inner join tb_stock_list slo ',
                    ' on (slo.id = ost.tb_stock_list_id_ori) and (slo.tb_institution_id = ost.tb_institution_id) ',
                    ' inner join tb_stock_list sld ',
                    ' on (sld.id = ost.tb_stock_list_id_des) and (sld.tb_institution_id = ost.tb_institution_id) '
                  );
end;

procedure TSeaOrderStockTransfer.OrderBySql;
begin
//
end;

procedure TSeaOrderStockTransfer.SelectSql;
begin
  SelectTxt := concat(
                  'Select distinct ord.id, ord.dt_record, ost.number,',
                  'st.description, en.name_company, slo.description est_origem,',
                  'sld.description est_destino ',
                  'from tb_order ord '
               );
end;

procedure TSeaOrderStockTransfer.SetParameters;
begin
  with UMM.Qr_Crud do
  Begin
    ParamByName('tb_institution_id').AsInteger := UMM.GInstitution.registro.Codigo;

    if chbx_periodo.Checked then
    Begin
      ParamByName('dataini').AsString := ConverteData( DTP_Date_Initial.DateTime );
      ParamByName('datafim').AsString := ConverteData( DTP_Date_End.DateTime );
    End;

    if E_Number.Text <> '' then
      ParamByName('number').AsString := E_Number.Text;

    if FrStockListori.DBLCB_Lista.KeyValue <> null then
      ParamByName('tb_stock_list_id_ori').AsInteger := FrStockListori.DBLCB_Lista.KeyValue ;

    if FrStockListdes.DBLCB_Lista.KeyValue <> null then
      ParamByName('tb_stock_list_id_des').AsInteger := FrStockListdes.DBLCB_Lista.KeyValue ;

    if (FrSituation.DBLCB_Lista.KeyValue <> null) then
      ParamByName('st_id').AsInteger := FrSituation.DBLCB_Lista.KeyValue;

   end;
end;

procedure TSeaOrderStockTransfer.SetRegister;
begin
 openTasOrderStockTransfer(nil);
end;

procedure TSeaOrderStockTransfer.ShowSituation;
begin
  FrSituation := TFmSituation.Create(Self);
  FrSituation.Parent := ctn_Situation;
  FrSituation.Align := alClient;
  FrSituation.listar;
  FrSituation.DBLCB_Lista.KeyValue := Null;
  FrSituation.Show;
end;

procedure TSeaOrderStockTransfer.ShowStockIdDes;
begin
  FrStockListdes := TFmStockList.Create(Self);
  FrStockListdes.Name := 'FrStockListdes';
  FrStockListdes.Parent := ctn_Stock_Id_Des;
  FrStockListdes.Align := alClient;
  FrStockListdes.chbx_UpdateStock.Visible := False;
  FrStockListdes.DBLCB_Lista.FieldLabel := 'Informe o nome do estoque';
  FrStockListdes.listar;
  FrStockListdes.DBLCB_Lista.KeyValue := Null;
  FrStockListdes.Show;
end;

procedure TSeaOrderStockTransfer.ShowStockIdOri;
begin
  FrStockListori := TFmStockList.Create(Self);
  FrStockListori.Name := 'FrStockListori';
  FrStockListori.Parent := ctn_Stock_Id_Ori;
  FrStockListori.Align := alClient;
  FrStockListori.chbx_UpdateStock.Visible := False;
  FrStockListori.DBLCB_Lista.FieldLabel := 'Informe o nome do estoque';
  FrStockListori.listar;
  FrStockListori.DBLCB_Lista.KeyValue := Null;
  FrStockListori.Show;
end;

procedure TSeaOrderStockTransfer.WhereSql;
begin
  inherited;
  WhereTxt := concat(' where ( ord.tb_institution_id =:tb_institution_id ) ',
                     ' and ( st.tb_institution_id =:tb_institution_id) ');

  if E_Number.Text <> '' then
    WhereTxt := WhereTxt + ' and (ost.number =:number)';

  if FrStockListori.DBLCB_Lista.KeyValue <> null then
    WhereTxt := WhereTxt + ' and (ost.tb_stock_list_id_ori =:tb_stock_list_id_ori)';

  if FrStockListdes.DBLCB_Lista.KeyValue <> null then
    WhereTxt := WhereTxt + ' and (ost.tb_stock_list_id_des =:tb_stock_list_id_des)';

  if FrSituation.DBLCB_Lista.KeyValue <> null then
    WhereTxt := WhereTxt + ' and (st.id =:s_id)';


    if chbx_periodo.Checked then
  Begin
    WhereTxt := WhereTxt + ' and (ord.dt_record between :dataini and :datafim)';
  End;
end;

end.
