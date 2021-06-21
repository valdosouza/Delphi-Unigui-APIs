unit sea_log_operation;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, base_search, Vcl.Menus, uniMainMenu,
  Datasnap.Provider, Data.DB, Datasnap.DBClient, uniButton, uniBitBtn,
  uniSpeedButton, uniBasicGrid, uniDBGrid, uniEdit, uniGUIClasses, uniCheckBox,
  uniPageControl, uniGUIBaseClasses, uniPanel, uniDateTimePicker, fm_User;

type
  TSeaLogOperation = class(TBaseSearch)
    ctn_User: TUniContainerPanel;
    pnl_param_row_1: TUniPanel;
    pnl_data: TUniPanel;
    chbx_periodo: TUniCheckBox;
    pnl_data_campos: TUniPanel;
    DTP_Date_Initial: TUniDateTimePicker;
    DTP_Date_End: TUniDateTimePicker;
    E_Interface: TUniEdit;
    cds_searchid: TIntegerField;
    cds_searchtb_institution_id: TIntegerField;
    cds_searchtb_user_id: TIntegerField;
    cds_searchlog_timestamp: TDateTimeField;
    cds_searchlog_interface: TStringField;
    cds_searchlog_operation: TStringField;
    cds_searchlog_description: TStringField;
    cds_searchnick_trade: TStringField;
  private
    { Private declarations }
    FrUser : TFmUser;
    procedure ShowUser;
  protected
    procedure InitVariable; Override;
    procedure FormatScreen;Override;
    procedure SelectSql;Override;
    procedure InnerJoinSql;Override;
    procedure WhereSql;Override;
    procedure OrderBySql;Override;

    procedure SetParameters;Override;

  public
    { Public declarations }
  end;

var
  SeaLogOperation: TSeaLogOperation;

implementation

{$R *.dfm}

uses MainModule, UnFunctions;

{ TSeaLogOperation }

procedure TSeaLogOperation.FormatScreen;
begin
  inherited;
  ShowUser;
end;

procedure TSeaLogOperation.InitVariable;
begin
  inherited;

end;

procedure TSeaLogOperation.InnerJoinSql;
begin
  inherited;
  InnerJoinTxt := concat(
                     '  inner join tb_entity etd ',
                     '  on ( etd.id = tb_user_id ) '
                  );
end;

procedure TSeaLogOperation.OrderBySql;
begin
  inherited;
  OrderByTxt := 'order by log_timestamp desc ';
end;

procedure TSeaLogOperation.SelectSql;
begin
  inherited;
  SelectTxt := concat(
                  'select lop.*, etd.nick_trade ',
                  'from tb_log_operation lop '
                );
end;

procedure TSeaLogOperation.SetParameters;
begin
  with UMM.Qr_Crud do
  Begin
    ParamByName('tb_institution_id').AsInteger := UMM.GInstitution.registro.Codigo;

    if chbx_periodo.Checked then
    Begin
      ParamByName('dataini').AsString := ConverteData( DTP_Date_Initial.DateTime );
      ParamByName('datafim').AsString := ConverteData( DTP_Date_End.DateTime );
    End;

    if (FrUser.DBLCB_Lista.Text  <> '') then
    Begin
      ParamByName('tb_user_id').AsInteger := FrUser.DBLCB_Lista.KeyValue;
    End;

    if (E_Interface.Text  <> '') then
    Begin
      ParamByName('log_interface').AsString := E_Interface.Text;
    End;
  End;
end;

procedure TSeaLogOperation.ShowUser;
begin
  FrUser := TFmUser.Create(Self);
  FrUser.Parent := ctn_User;
  FrUser.Listar;
  FrUser.Align := alClient;
  FrUser.Show;

end;

procedure TSeaLogOperation.WhereSql;
begin
  inherited;
  WhereTxt := 'where ( lop.tb_institution_id =:tb_institution_id) ';

  if ChBx_Periodo.Checked then
  Begin
    WhereTxt := concat(
                  WhereTxt,
                  ' AND ( lop.log_timestamp between :dataini and :datafim ) '
    );
  end;

  if (FrUser.DBLCB_Lista.Text  <> '') then
  Begin
    WhereTxt := concat(
                  WhereTxt,
                  ' AND ( log.tbuser_id =:tbuser_id ) '
    );
  End;

  if (E_Interface.Text  <> '') then
  Begin
    WhereTxt := concat(
                  WhereTxt,
                  ' AND ( log.log_interface like :log_interface) '
    );
  End;

end;

end.
