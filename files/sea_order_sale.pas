unit sea_order_sale;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, base_search, Datasnap.Provider, Data.DB,
  Datasnap.DBClient, uniButton, uniBitBtn, uniSpeedButton, uniGUIClasses,
  uniBasicGrid, uniDBGrid, uniGUIBaseClasses, uniPanel, uniRadioGroup, uniLabel,
  uniEdit, uniDateTimePicker, uniCheckBox, fm_customer, fm_salesman,
  uniPageControl, Vcl.Menus, uniMainMenu,unFunctions, tas_order_sale;

type
  TSeaOrderSale = class(TBaseSearch)
    cds_searchdt_record: TDateField;
    cds_searchnumber: TIntegerField;
    cds_searchname_company: TStringField;
    cds_searchtotal_value: TBCDField;
    cds_searchtb_salesman_id: TIntegerField;
    cds_searchid: TIntegerField;
    ctn_Customer: TUniContainerPanel;
    Ctn_salesMan: TUniContainerPanel;
    cds_searchterminal: TIntegerField;
    pnl_row_1: TUniPanel;
    pnl_data: TUniPanel;
    chbx_periodo: TUniCheckBox;
    pnl_data_campos: TUniPanel;
    DTP_Date_Initial: TUniDateTimePicker;
    DTP_Date_End: TUniDateTimePicker;
    E_Nr_Order: TUniEdit;
    pnl_row_2: TUniPanel;

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
    procedure ShowCustomer;
    procedure ShowSalesman;

  public
    { Public declarations }
    FrCustomer : TFmCustomer;
    frSalesman : TFmSalesman;
  end;

var
  SeaOrderSale: TSeaOrderSale;

implementation

{$R *.dfm}

uses MainModule, openForms, tas_config_order_sale;

{ TSeaOrderSale }

procedure TSeaOrderSale.chbx_periodoClick(Sender: TObject);
begin
  DTP_Date_Initial.Enabled := chbx_periodo.Checked;
  DTP_Date_End.Enabled := chbx_periodo.Checked;
end;

procedure TSeaOrderSale.FormatScreen;
begin
  inherited;
  ShowCustomer;
  ShowSalesman;
end;

procedure TSeaOrderSale.GetView;
var
  Form : TTasOrderSale;
begin
  if Form = nil then
    Form := TTasOrderSale.Create(UniApplication);
  Form.CodigoRegistro                     := cds_searchid.AsInteger;
  Form.OrderSale.Parametro.OrdemVenda.Codigo          := cds_searchid.AsInteger;
  Form.OrderSale.Parametro.OrdemVenda.Estabelecimento := UMM.GInstitution.registro.Codigo;
  Form.OrderSale.Parametro.OrdemVenda.Terminal        := cds_searchterminal.AsInteger;
  Form.OrderSale.Parametro.OrdemVenda.Vendedor        := cds_searchtb_salesman_id.AsInteger;
  Form.Show(
    Procedure(Sender: TComponent; AResult:Integer)
    begin
      Form := nil;
    end
  );
end;

procedure TSeaOrderSale.InitVariable;
begin
  DTP_Date_Initial.DateTime := Date - 30;
  DTP_Date_End.DateTime := Date;
end;

procedure TSeaOrderSale.InnerJoinSql;
begin
  InnerJoinTxt := concat(
                  InnerJoinTxt,
                  ' inner join tb_order_sale ors ',
                  ' on (ord.id = ors.id) ',
                  '    and  (ord.tB_institution_id = ors.tB_institution_id) ',
                  '    and (ord.terminal= ors.terminal) ',


                  ' Inner join tb_order_totalizer ort ',
                  ' on (ord.id = ort.id) ',
                  '    and  (ord.tB_institution_id = ort.tB_institution_id) ',
                  '    and (ord.terminal= ort.terminal) ',


                  ' inner join tb_entity en ',
                  ' on (en.id = ors.tb_customer_id) ',

                  ' inner join tb_salesman sl',
                  ' on (sl.id= ors.tb_salesman_id)'

                  );
end;

procedure TSeaOrderSale.OrderBySql;
begin
  inherited;
  OrderByTxt := 'order by en.name_company '
end;

procedure TSeaOrderSale.SelectSql;
begin
  SelectTxt := concat(
                  ' Select distinct ord.id, ord.dt_record, ors.number, ',
                  'ord.terminal, en.name_company, ort.total_value, ors.tb_salesman_id  ',
                  ' from tb_order ord  '
    );
end;

procedure TSeaOrderSale.SetParameters;
begin
  with UMM.Qr_Crud do
  Begin

    ParamByName('tb_institution_id').AsInteger := UMM.GInstitution.registro.Codigo;

    if FrCustomer.DBLCB_Lista.KeyValue <> null then
      ParamByName('tb_customer_id').AsInteger :=  FrCustomer.DBLCB_Lista.KeyValue;

    if frSalesman.DBLCB_Lista.KeyValue <> null then
      ParamByName('tb_salesman_id').AsInteger :=  frSalesman.DBLCB_Lista.KeyValue;

    if chbx_periodo.Checked then
    Begin
      ParamByName('dataini').AsString := ConverteData( DTP_Date_Initial.DateTime );
      ParamByName('datafim').AsString := ConverteData( DTP_Date_End.DateTime );
    End;

    if E_Nr_Order.Text <> '' then
      ParamByName('number').AsString :=  E_Nr_Order.Text;

  end;
end;

procedure TSeaOrderSale.SetRegister;
var
  Form : TTasOrderSale;
begin
  if Form = nil then
    Form := TTasOrderSale.Create(UniApplication);
  Form.Show(
    Procedure(Sender: TComponent; AResult:Integer)
    begin
      Form := nil;
    end
  );
end;

procedure TSeaOrderSale.ShowCustomer;
begin
  FrCustomer := TFmCustomer.Create(Self);
  FrCustomer.Parent := ctn_Customer;
  FrCustomer.Align := alClient;
  FrCustomer.listar;
  FrCustomer.Show;
end;

procedure TSeaOrderSale.ShowSalesman;
begin
  frSalesman := TFmSalesman.Create(Self);
  frSalesman.Parent := Ctn_salesMan;
  frSalesman.Align := alClient;
  frSalesman.listar;
  frSalesman.Show;
end;

procedure TSeaOrderSale.WhereSql;
begin
  inherited;
  WhereTxt := ' where ord.tb_institution_id =:tb_institution_id ';


  if chbx_periodo.Checked then
  Begin
    WhereTxt := WhereTxt + ' and (ord.dt_record between :dataini and :datafim)';
  End;

  if  E_Nr_Order.text <> '' then
    WhereTxt := WhereTxt + ' and (ors.number =:number)';

  if  FrCustomer.DBLCB_Lista.KeyValue <> null then
    WhereTxt := WhereTxt + ' and (ors.tb_customer_id =:tb_customer_id)';


  if  frSalesman.DBLCB_Lista.KeyValue <> null then
    WhereTxt := WhereTxt + ' and (ors.tb_salesman_id =:tb_salesman_id)';

end;

end.
