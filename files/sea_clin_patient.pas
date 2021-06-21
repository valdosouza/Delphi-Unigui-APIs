unit sea_clin_patient;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, sea_entity_fiscal, Vcl.Menus,
  uniMainMenu, Datasnap.Provider, Data.DB, Datasnap.DBClient, uniButton,
  uniBitBtn, uniSpeedButton, uniBasicGrid, uniDBGrid, uniRadioGroup, uniEdit,
  uniDateTimePicker, uniGUIClasses, uniCheckBox, uniPageControl,
  uniGUIBaseClasses, uniPanel, fm_clin_module, MainModule;

type
  TSeaClinPatient = class(TSeaEntityFiscal)
    ctn_clin_module: TUniContainerPanel;
  private
    { Private declarations }
    FrClinModule : TFmClinModule;
    procedure ShowClinModule;
  protected
    procedure InitVariable; Override;
    procedure FormatScreen;Override;
    procedure InnerJoinSql;Override;
    procedure WhereSql;Override;
    procedure SetParameters;Override;
    procedure GetView;Override;
    procedure SetRegister;Override;

  public
    { Public declarations }
  end;

var
  SeaClinPatient: TSeaClinPatient;

implementation

{$R *.dfm}

uses openForms;

{ TSeaClinPatient }

procedure TSeaClinPatient.FormatScreen;
begin
  inherited;
  ShowClinModule;
end;

procedure TSeaClinPatient.GetView;
begin
  opencadclinPatient(cds_searchid.AsInteger,nil);
end;

procedure TSeaClinPatient.InitVariable;
begin
  PInterface := 50;
  inherited;

end;

procedure TSeaClinPatient.InnerJoinSql;
begin
  inherited;
  InnerJoinTxt := InnerJoinTxt +
                  ' inner join tb_clin_patient p '+
                  ' on (p.id = en.id) ';
  InnerJoinTxt_1 := InnerJoinTxt_1 +
                  ' inner join tb_clin_patient p '+
                  ' on (p.id = en.id) ';

end;

procedure TSeaClinPatient.SetParameters;
begin
  inherited;
   with UMM.Qr_Crud do
  Begin
    ParamByName('tb_institution_id').AsInteger := UMM.GInstitution.registro.Codigo;
    if chbx_Active.checked then
      ParamByName('active').AsString := 'S'
    else
      ParamByName('active').AsString := 'N';

    if FrClinModule.DBLCB_Lista.Text <> '' then
      ParamByName('tb_clin_module_id').AsInteger := FrClinModule.DBLCB_Lista.KeyValue;
  end;
end;

procedure TSeaClinPatient.SetRegister;
begin
  opencadclinPatient(0,nil);
end;

procedure TSeaClinPatient.ShowClinModule;
begin
  FrClinModule := TFmClinModule.Create(Self);
  FrClinModule.Parent := ctn_clin_module;
  FrClinModule.Listar;
  FrClinModule.Show;
  FrClinModule.Align := alClient;

end;

procedure TSeaClinPatient.WhereSql;
begin
  inherited;
  if ChBx_Periodo.Checked then
  Begin
    WhereTxt := WhereTxt + ' AND ( p.created_at between :dataini and :datafim ) ';
    WhereTxt_1 := WhereTxt_1 + ' AND ( p.created_at between :dataini and :datafim ) ';
  end;

  WhereTxt := WhereTxt + ' and (p.tb_institution_id =:tb_institution_id) '+
                         ' and (p.active=:active) ';
  WhereTxt_1 := WhereTxt_1 + ' and (p.tb_institution_id =:tb_institution_id)'+
                                   ' and (p.active=:active) ';

  if FrClinModule.DBLCB_Lista.Text <> '' then
  Begin
    WhereTxt := WhereTxt + ' and (p.tb_clin_module_id =:tb_clin_module_id )';
    WhereTxt_1 := WhereTxt_1 + ' and (p.tb_clin_module_id =:tb_clin_module_id )';
  End;

end;

end.
