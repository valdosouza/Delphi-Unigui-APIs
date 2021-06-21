unit sea_order_budg_advertise;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, base_search, Vcl.Menus, uniMainMenu,
  Datasnap.Provider, Data.DB, Datasnap.DBClient, uniButton, uniBitBtn,
  uniSpeedButton, uniBasicGrid, uniDBGrid, uniEdit, uniGUIClasses, uniCheckBox,
  uniPageControl, uniGUIBaseClasses, uniPanel, uniDateTimePicker,
  tas_order_budg_advertise;

type
  TSeaOrderBudgAdvertise = class(TBaseSearch)
    pnl_param_row_4_1: TUniPanel;
    pnl_data: TUniPanel;
    chbx_periodo: TUniCheckBox;
    pnl_data_campos: TUniPanel;
    DTP_Date_Initial: TUniDateTimePicker;
    DTP_Date_End: TUniDateTimePicker;
    E_Number: TUniEdit;
    E_Email: TUniEdit;
    cds_searchid: TIntegerField;
    cds_searchtb_institution_id: TIntegerField;
    cds_searchdt_record: TDateField;
    cds_searchnumber: TIntegerField;
    cds_searchemail: TStringField;
  private
    { Private declarations }
  Protected
    procedure SelectSql;Override;
    procedure InnerJoinSql;Override;
    procedure WhereSql;Override;
    procedure OrderBySql;Override;

    procedure SetParameters;Override;
    procedure GetView;Override;
    procedure SetRegister;Override;
  public
    { Public declarations }
  end;

var
  SeaOrderBudgAdvertise: TSeaOrderBudgAdvertise;

implementation

{$R *.dfm}

uses MainModule, UnFunctions;

{ TSeaOrderBudgAdvertise }

procedure TSeaOrderBudgAdvertise.GetView;
Var
  Form : TTasOrderBudgAdvertise;
begin
  if Form = nil then
    Form := TTasOrderBudgAdvertise.Create(UniApplication);
  Form.CodigoRegistro := cds_searchid.AsInteger;
  Form.Show(
    Procedure(Sender: TComponent; AResult:Integer)
    begin
      Form := nil;
    end
  );
end;

procedure TSeaOrderBudgAdvertise.InnerJoinSql;
begin
  inherited;
  InnerJoinTxt := concat(
   'inner join tb_order od ',
   'on (od.id = bo.id) '
  );
end;

procedure TSeaOrderBudgAdvertise.OrderBySql;
begin
  inherited;
  OrderByTxt := 'order by od.dt_record ';
end;

procedure TSeaOrderBudgAdvertise.SelectSql;
begin
  SelectTxt := concat(
    'Select od.id, od.tb_institution_id, od.dt_record, bo.number, bo.email ',
    'from  tb_budg_advertise bo '
  );

end;

procedure TSeaOrderBudgAdvertise.SetParameters;
begin
  with UMM.Qr_Crud do
  Begin
    ParamByName('tb_institution_id').AsInteger := UMM.GInstitution.registro.Codigo;

    if ChBx_Periodo.Checked then
    BEgin
      ParamByName('dataini').AsString := ConverteData( DTP_Date_Initial.DateTime );
      ParamByName('datafim').AsString := ConverteData( DTP_Date_End.DateTime );
    End;

    if E_Number.Text <> '' then
      ParamByName('number').AsString := E_Number.Text;

   if E_Email.Text <> '' then
      ParamByName('email').AsString := concat('%',E_Email.Text,'%') ;
  end;
end;

procedure TSeaOrderBudgAdvertise.SetRegister;
begin
  inherited;

end;

procedure TSeaOrderBudgAdvertise.WhereSql;
begin
  inherited;
  WhereTxt := ' where od.tb_institution_id =:tb_institution_id ';

  if ChBx_Periodo.Checked then
  BEgin
    WhereTxt := WhereTxt + ' and (od.dt_record between :dataini and :datafim) ';
  End;

  if E_Number.Text <> '' then
    WhereTxt := WhereTxt + ' and ( bo.number =:number)';

  if E_Email.Text <> '' then
    WhereTxt := WhereTxt + ' and ( bo.email like :email)';

end;

end.
