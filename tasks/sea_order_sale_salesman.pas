unit sea_order_sale_salesman;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, base_search, uniPanel, uniLabel,
  uniEdit, uniDateTimePicker, uniCheckBox, Datasnap.Provider, Data.DB,
  Datasnap.DBClient, uniButton, uniBitBtn, uniSpeedButton, uniGUIClasses,
  uniBasicGrid, uniDBGrid, uniPageControl, uniGUIBaseClasses,unFunctions,
  ControllerOrderSaleSalesman, fm_Salesman, MainModule, Vcl.Menus, uniMainMenu;

type
  TSeaOrderSaleSalesman = class(TBaseSearch)
    chbx_periodo: TUniCheckBox;
    DTP_Date_Initial: TUniDateTimePicker;
    DTP_Date_End: TUniDateTimePicker;
    E_Number: TUniEdit;
    L_Codigo: TUniLabel;
    Ctn_salesMan: TUniContainerPanel;
    procedure InitVariable;Override;
    procedure SelectSql;Override;
    procedure InnerJoinSql;Override;
    procedure WhereSql;Override;
    procedure OrderBySql;Override;
    procedure FormatScreen;Override;

    procedure SetParameters;Override;
    procedure GetView;Override;
    procedure SetRegister;Override;

  private
    { Private declarations }
      procedure ShowSalesman;
  public
    { Public declarations }
    frSalesman : TFmSalesman;
    OrderSaleSalesMan: TControllerOrderSaleSalesman;
  end;

var
  SeaOrderSaleSalesman: TSeaOrderSaleSalesman;

implementation

{$R *.dfm}

{ TSeaOrderSaleSalesman }

procedure TSeaOrderSaleSalesman.FormatScreen;
begin
  inherited;
  ShowSalesman;
end;

procedure TSeaOrderSaleSalesman.GetView;
begin
  //openTasOrderSale(cds_searchid.AsInteger, cds_searchtb_salesman_id.AsInteger);
end;

procedure TSeaOrderSaleSalesman.InitVariable;
begin
  inherited;
  OrderSaleSalesman := TControllerOrderSaleSalesman.Create(self);
end;

procedure TSeaOrderSaleSalesman.InnerJoinSql;
begin
  InnerJoinTxt := concat(
                  InnerJoinTxt,
                  ' inner join tb_order_sale os ',
                  ' on (ord.id = os.id) ',

                  ' Inner join tb_order_totalizer ot ',
                  ' on (ord.id = ot.id) ',

                  ' inner join tb_entity en ',
                  ' on (en.id = os.tb_customer_id) ',

                  ' inner join tb_salesman sl',
                  ' on (sl.id= os.tb_salesman_id)'

                  );
end;

procedure TSeaOrderSaleSalesman.OrderBySql;
begin
  inherited;
  OrderByTxt := 'order by en.name_company '
end;

procedure TSeaOrderSaleSalesman.SelectSql;
begin
  SelectTxt := ' Select distinct ord.id, ord.dt_record, os.number, en.name_company, ot.total_value, os.tb_salesman_id  '+
               ' from tb_order ord  ';
end;

procedure TSeaOrderSaleSalesman.SetParameters;
begin
  with UMM.Qr_Crud do
  Begin
    ParamByName('tb_institution_id').AsInteger := UMM.GInstitution.registro.Codigo;

    if frSalesman.DBLCB_Lista.KeyValue <> null then
      ParamByName('tb_salesman_id').AsInteger :=  frSalesman.DBLCB_Lista.KeyValue;

    if chbx_periodo.Checked then
    Begin
      ParamByName('dataini').AsString := ConverteData( DTP_Date_Initial.DateTime );
      ParamByName('datafim').AsString := ConverteData( DTP_Date_End.DateTime );
    End;

    if E_Number.Text <> '' then
      ParamByName('number').AsString :=  E_Number.Text;
  end;
end;

procedure TSeaOrderSaleSalesman.SetRegister;
begin
  //openTasOrderSale(0,0);
end;

procedure TSeaOrderSaleSalesman.ShowSalesman;
begin
  frSalesman := TFmSalesman.Create(Self);
  frSalesman.Parent := Ctn_salesMan;
  frSalesman.Align := alClient;
  frSalesman.listar;
  frSalesman.Show;

end;

procedure TSeaOrderSaleSalesman.WhereSql;
begin
  inherited;
  WhereTxt := ' where ord.tb_institution_id =:tb_institution_id ';

  if E_Number.Text <> '' then
    WhereTxt := WhereTxt + ' and (os.number =:number)';

    if chbx_periodo.Checked then
  Begin
    WhereTxt := WhereTxt + ' and (ord.dt_record between :dataini and :datafim)';
  End;

  if  E_Number.text <> '' then
    WhereTxt := WhereTxt + ' and (os.number =:number)';

  if  frSalesman.DBLCB_Lista.KeyValue <> null then
    WhereTxt := WhereTxt + ' and (os.tb_salesman_id =:tb_salesman_id)';
end;

end.
