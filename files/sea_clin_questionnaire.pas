unit sea_clin_questionnaire;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, base_search, Vcl.Menus, uniMainMenu,
  Datasnap.Provider, Data.DB, Datasnap.DBClient, uniButton, uniBitBtn,
  uniSpeedButton, uniBasicGrid, uniDBGrid, uniEdit, uniGUIClasses, uniCheckBox,
  uniPageControl, uniGUIBaseClasses, uniPanel, fm_clin_module, fm_lineBusiness,
  fm_clin_professional, uniDateTimePicker;

type
  TSeaClinQuestionnaire = class(TBaseSearch)
    pnl_param_row_4_1: TUniPanel;
    pnl_data: TUniPanel;
    chbx_periodo: TUniCheckBox;
    pnl_data_campos: TUniPanel;
    DTP_Date_Initial: TUniDateTimePicker;
    DTP_Date_End: TUniDateTimePicker;
    E_Questionnaire: TUniEdit;
    ctn_clin_module: TUniContainerPanel;
    pnl_fundo_row_2: TUniPanel;
    Ctn_LineBusiness: TUniContainerPanel;
    Ctn_clin_professional: TUniContainerPanel;
    pnl_fundo_row_4: TUniPanel;
    chbx_ativo: TUniCheckBox;
    cds_searchdt_record: TDateField;
    cds_searchquestionnaire: TStringField;
    cds_searchmodule: TStringField;
    cds_searchspeciality: TStringField;
    cds_searchprofessional: TStringField;
    cds_searchid: TIntegerField;
  private
    { Private declarations }
    FrClinModule : TFmClinModule;
    FrLineBusiness : TFmLineBusiness;
    FrClinProfessional : TFmClinProfessional;
    procedure ShowClinModule;
    procedure ShowLineBusiness;
    procedure ShowClinProfessional;
  protected
    procedure InitVariable; Override;
    procedure FormatScreen;Override;
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
  SeaClinQuestionnaire: TSeaClinQuestionnaire;

implementation

{$R *.dfm}

uses openForms,UnFunctions, MainModule;

{ TSeaClinQuestionnaire }

procedure TSeaClinQuestionnaire.FormatScreen;
begin
  inherited;
  ShowClinModule;
  ShowLineBusiness;
  ShowClinProfessional;
  chbx_ativo.Checked := TRue;
end;

procedure TSeaClinQuestionnaire.GetView;
begin
  opencadclinQuestionnaire(cds_searchid.AsInteger,nil);
end;

procedure TSeaClinQuestionnaire.InitVariable;
begin
  PInterface := 51;
  inherited;

end;

procedure TSeaClinQuestionnaire.InnerJoinSql;
begin
  inherited;
  InnerJoinTxt := Concat(
                   ' inner join tb_clin_module clm ',
                   ' on  (clm.id = qtn.tb_clin_module_id) ',
                   '    and (clm.tb_institution_id = qtn.tb_institution_id) ',
                   ' inner join tb_linebusiness lbs ',
                   ' on  (lbs.id = qtn.tb_linebusiness_id) ',
                   ' inner join tb_clin_professional clp ',
                   ' on  (clp.id = qtn.tb_clin_professional_id) ',
                   '   and (clp.tb_institution_id = qtn.tb_institution_id) ',
                   ' inner join tb_entity prf ',
                   ' on (prf.id = qtn.tb_clin_professional_id) '
  );

end;

procedure TSeaClinQuestionnaire.OrderBySql;
begin
  inherited;
  OrderByTxt := concat(
                'order by dt_record, ',
                ' clm.description, ',
                ' lbs.description,  ',
                ' prf.name_company '
  );
end;

procedure TSeaClinQuestionnaire.SelectSql;
begin
  inherited;
  SelectTxt := concat(
                'select qtn.id, qtn.dt_record, qtn.description questionnaire, ',
                'clm.description module, lbs.description speciality,  ',
                ' prf.name_company professional ',
                'from tb_clin_questionnaire qtn '
  );
end;

procedure TSeaClinQuestionnaire.SetParameters;
begin
  with UMM.Qr_Crud do
  Begin
    ParamByName('tb_institution_id').AsInteger := UMM.GInstitution.registro.Codigo;

    if chbx_periodo.Checked then
    Begin
      ParamByName('dataini').AsString := ConverteData( DTP_Date_Initial.DateTime );
      ParamByName('datafim').AsString := ConverteData( DTP_Date_End.DateTime );
    End;

    if (FrClinModule.DBLCB_Lista.Text  <> '') then
    Begin
      ParamByName('tb_clin_module_id').AsInteger := FrClinModule.DBLCB_Lista.KeyValue;
    End;

    if (FrLineBusiness.DBLCB_Lista.Text  <> '') then
    Begin
      ParamByName('tb_linebusiness_id').AsInteger := FrLineBusiness.DBLCB_Lista.KeyValue;
    End;

    if (FrClinProfessional.DBLCB_Lista.Text  <> '') then
    Begin
      ParamByName('tb_clin_professional_id').AsInteger := FrClinProfessional.DBLCB_Lista.KeyValue;
    End;
  End;

end;

procedure TSeaClinQuestionnaire.SetRegister;
begin
  inherited;
  opencadclinQuestionnaire(0,nil);
end;

procedure TSeaClinQuestionnaire.ShowClinModule;
begin
  FrClinModule := TFmClinModule.Create(Self);
  FrClinModule.Parent := ctn_clin_module;
  FrClinModule.Listar;
  FrClinModule.Show;
  FrClinModule.Align := alClient;

end;

procedure TSeaClinQuestionnaire.ShowClinProfessional;
begin
  FrClinProfessional := TFmClinProfessional.Create(Self);
  FrClinProfessional.Parent := Ctn_clin_professional;
  FrClinProfessional.Listar;
  FrClinProfessional.Show;
  FrClinProfessional.Align := alClient;
end;

procedure TSeaClinQuestionnaire.ShowLineBusiness;
begin
  FrLineBusiness := TFmLineBusiness.Create(Self);
  FrLineBusiness.Parent := Ctn_LineBusiness;
  FrLineBusiness.Align := alClient;
  FrLineBusiness.Listar;
  FrLineBusiness.Show;

end;

procedure TSeaClinQuestionnaire.WhereSql;
begin
  inherited;
  WhereTxt := 'where ( qtn.tb_institution_id =:tb_institution_id) ';

  if ChBx_Periodo.Checked then
  Begin
    WhereTxt := concat(
                  WhereTxt,
                  ' AND ( qtn.dt_recodrd between :dataini and :datafim ) '
    );
  end;

  if (FrClinModule.DBLCB_Lista.Text  <> '') then
  Begin
    WhereTxt := concat(
                  WhereTxt,
                  ' AND ( qtn.tb_clin_module_id =:tb_clin_module_id) '
    );
  End;

  if (FrLineBusiness.DBLCB_Lista.Text  <> '') then
  Begin
    WhereTxt := concat(
                  WhereTxt,
                  ' AND ( qtn.tb_linebusiness_id =:tb_linebusiness_id) '
    );
  End;

  if (FrClinProfessional.DBLCB_Lista.Text  <> '') then
  Begin
    WhereTxt := concat(
                  WhereTxt,
                  ' AND ( qtn.tb_clin_professional_id =:tb_clin_professional_id) '
    );
  End;

  if chbx_ativo.Checked then
    WhereTxt := concat(WhereTxt, ' and (qtn.active = ''S'')')
  else
    WhereTxt := concat(WhereTxt, ' and (qtn.active = ''N'')');



end;

end.
