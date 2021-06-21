unit tas_clin_quiz;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, base_form, Vcl.Menus, uniMainMenu,tblClinAnwer,
  Data.DB, Datasnap.DBClient, uniPanel, uniGUIClasses, uniPageControl,
  uniGUIBaseClasses, uniButton, uniBitBtn, uniSpeedButton, uniBasicGrid,
  uniDBGrid, MainModule, Datasnap.Provider, uniScrollBox, uniLabel,
  uniRadioGroup, uniRadioButton, fm_clin_question, ControllerClinQuestion,
  ControllerClinQuiz, ControllerClinAnwer, msg_form, TypesCollection, uniEdit,
  uniDateTimePicker;

type
  TTasClinQuiz = class(TBaseForm)
    pg_Main: TUniPageControl;
    tbs_professional: TUniTabSheet;
    pnl_prof_botao: TUniPanel;
    Sb_Prof_Next: TUniSpeedButton;
    Sb_Prof_adjust: TUniSpeedButton;
    dbg_Profissional: TUniDBGrid;
    cds_profissional: TClientDataSet;
    ds_Profissional: TDataSource;
    DSP: TDataSetProvider;
    cds_profissionalid: TIntegerField;
    cds_profissionalnick_trade: TStringField;
    cds_profissionaldescription: TStringField;
    tbs_patient: TUniTabSheet;
    pnl_pati_botao: TUniPanel;
    Sb_Pati_Next: TUniSpeedButton;
    Sb_Pati_Prior: TUniSpeedButton;
    dbg_Patiente: TUniDBGrid;
    cds_patient: TClientDataSet;
    ds_patient: TDataSource;
    cds_patientid: TIntegerField;
    cds_patientnick_trade: TStringField;
    cds_patienttb_clin_module_id: TIntegerField;
    cds_patientdescription: TStringField;
    tbs_questionnaire: TUniTabSheet;
    dbg_Questionnaire: TUniDBGrid;
    pnl_ques_botao: TUniPanel;
    Sb_ques_next: TUniSpeedButton;
    Sb_ques_prior: TUniSpeedButton;
    cds_questionnaire: TClientDataSet;
    ds_questionnaire: TDataSource;
    cds_questionnaireid: TIntegerField;
    cds_questionnairetb_institution_id: TIntegerField;
    cds_questionnairedescription: TStringField;
    cds_questionnairedt_record: TDateField;
    cds_questionnairetb_clin_module_id: TIntegerField;
    cds_questionnairetb_linebusiness_id: TIntegerField;
    cds_questionnairetb_clin_professional_id: TIntegerField;
    cds_questionnaireactive: TStringField;
    cds_questionnairecreated_at: TDateTimeField;
    cds_questionnaireupdated_at: TDateTimeField;
    cds_profissionalIDLineBusiness: TIntegerField;
    tbs_quiz: TUniTabSheet;
    scx_quiz: TUniScrollBox;
    pnl_quiz_button: TUniPanel;
    Sb_quiz_finish: TUniSpeedButton;
    Sb_quiz_prior: TUniSpeedButton;
    UniHiddenPanel1: TUniHiddenPanel;
    E_Patient: TUniEdit;
    E_Modulo: TUniEdit;
    pnl_quiz_Top: TUniPanel;
    E_Data: TUniDateTimePicker;
    procedure Sb_Prof_NextClick(Sender: TObject);
    procedure Sb_Pati_PriorClick(Sender: TObject);
    procedure Sb_Pati_NextClick(Sender: TObject);
    procedure Sb_ques_priorClick(Sender: TObject);
    procedure Sb_ques_nextClick(Sender: TObject);
    procedure Sb_Prof_adjustClick(Sender: TObject);
    procedure Sb_quiz_priorClick(Sender: TObject);
    procedure Sb_quiz_finishClick(Sender: TObject);
    procedure UniFormDestroy(Sender: TObject);
    procedure dbg_PatienteColumnSort(Column: TUniDBGridColumn;
      Direction: Boolean);
    procedure dbg_QuestionnaireColumnSort(Column: TUniDBGridColumn;
      Direction: Boolean);
    procedure dbg_ProfissionalColumnSort(Column: TUniDBGridColumn;
      Direction: Boolean);
    procedure dbg_PatienteColumnFilter(Sender: TUniDBGrid;
      const Column: TUniDBGridColumn; const Value: Variant);
    procedure dbg_PatienteClearFilters(Sender: TObject);
  private
    { Private declarations }
    CssAnterior : String;
    Quiz : TControllerClinQuiz;
    procedure ListaProfissional;
    procedure ListaPatient;
    procedure ListaQuestionnaire;
    procedure ShowQuestion;
    procedure ClearFrames;
    procedure CriaFrameQuestion(CodeID:Integer;Question:String);
    procedure AddCssDbGRid;
    procedure RemoveCssDbGRid;
    procedure setSortable;
  protected
    procedure InitVariable;override;
    procedure FormatScreen;override;
    function ValidateFinish:Boolean;
    procedure Save;
    procedure SaveQuiz;
    procedure SaveAnswer;
  public
    { Public declarations }
    QtdePerguntas : TStringList;
    Frame :TFmClinQuestion;
  end;

var
  TasClinQuiz: TTasClinQuiz;

implementation

{$R *.dfm}

uses unmessages,UnFunctions;

{ TTasClinQuiz }

procedure TTasClinQuiz.ClearFrames;
var
  I : Integer;
  variavel : TComponent;
begin
  for I := 0 to QtdePerguntas.Count - 1 do
  begin
    //Encontrar o frame
    variavel := findcomponent('FrClinQuestion' + QtdePerguntas[I]);
    //Limpa o Frame
    FreeAndNil(variavel);
  end;
  //Limpa o controlador de quantidade de parcelas
  QtdePerguntas.Clear;
end;

procedure TTasClinQuiz.CriaFrameQuestion(CodeID:Integer;Question:String);
Var
  Lc_Indice : Integer;
begin
  Lc_Indice := QtdePerguntas.Count - 1;
  Frame := TFmClinQuestion.Create(Self);
  with Frame do
  begin
    AlignWithMargins := True;
    Margins.Left := 10;
    Margins.Right := 10;
    Align := alTop;
    Parent := scx_quiz;
    Name := 'FrClinQuestion' + QtdePerguntas[Lc_Indice];
    Lb_Question.Tag := CodeID;
    Lb_Question.Caption := concat(' - ',Question);
  end;
end;

procedure TTasClinQuiz.dbg_PatienteClearFilters(Sender: TObject);
var
  I : Integer;
begin
 if cds_patient.Active then
 begin
   cds_patient.Filter := '';
   cds_patient.Filtered := False;
 end;
end;

procedure TTasClinQuiz.dbg_PatienteColumnFilter(Sender: TUniDBGrid;
  const Column: TUniDBGridColumn; const Value: Variant);
begin
  if cds_patient.Active then
  begin
    cds_patient.Filtered := False;
    if Value  <> '' then
    Begin
      cds_patient.FilterOptions := [];
      cds_patient.Filter := concat(Column.FieldName, ' LIKE ''%' , Value , '%''');
      cds_patient.Filtered := True;
    End;
  end;
end;

procedure TTasClinQuiz.dbg_PatienteColumnSort(Column: TUniDBGridColumn;
  Direction: Boolean);
begin
  SortClientDataSetByField(cds_patient,Column.FieldName, Direction);
end;

procedure TTasClinQuiz.dbg_ProfissionalColumnSort(Column: TUniDBGridColumn;
  Direction: Boolean);
begin
  SortClientDataSetByField(cds_profissional,Column.FieldName, Direction);
end;

procedure TTasClinQuiz.dbg_QuestionnaireColumnSort(Column: TUniDBGridColumn;
  Direction: Boolean);
begin
  SortClientDataSetByField(cds_questionnaire,Column.FieldName, Direction);
end;

procedure TTasClinQuiz.AddCssDbGRid;
Var
  LcCSS : String;
begin
  LcCSS := concat(
            '.x-grid .x-grid-column { ',
            '    border-style: solid; ',
            '    border-width: 1px 1px 0; ',
            '    height: 30px; ',
            '    line-height: 30px; ',
            '    padding: 0 8px; ',
            '    vertical-align: middle; ',
            '    font-size:  11pt; ',
            '    font-weight: bold; ',
            '} ',
            '.x-grid .x-grid-cell { ',
            '    height: 30px !important; ',
            '    line-height: 30px !important; ',
            '    font-size:  11pt; ',
            '} '
  );

  dbg_Profissional.JSInterface.JSCallGlobal(
             'Ext.util.CSS.createStyleSheet',
             [
                concat('#',dbg_Profissional.JSName,'_id ',
                LcCSS),
                concat(dbg_Profissional.JSName,'_css')
             ]);

end;

procedure TTasClinQuiz.RemoveCssDbGRid;
begin
  dbg_Profissional.JSInterface.JSCallGlobal(
  'Ext.util.CSS.removeStyleSheet', [ dbg_Profissional.JSName+'_css' ]);
end;

procedure TTasClinQuiz.FormatScreen;
begin
  AddCssDbGRid;
  ListaProfissional;
end;

procedure TTasClinQuiz.InitVariable;
begin
  PInterface := 60;
  inherited;
  QtdePerguntas := TStringList.Create;
  Quiz := TControllerClinQuiz.Create(self);
  setSortable;
end;

procedure TTasClinQuiz.ListaPatient;
begin
  try
    cds_patient.Active := False;
    with UMM.Qr_Crud do
    Begin
      Active := FAlse;
      sql.Clear;
      sql.Add(concat(
                'SELECT en.id, en.nick_trade,                                   ',
                '   p.tb_clin_module_id, cm.description                        ',
                'FROM tb_entity en                                              ',
                '   inner join tb_institution_has_entity ihe                    ',
                '   on (en.id = ihe.tb_entity_id)                               ',
                '   inner join tb_person pe                                     ',
                '   on ( en.id = pe.id )                                        ',
                '   inner join tb_clin_patient p                                ',
                '   on (p.id = en.id)                                           ',
                '   and (p.tb_institution_id =  ihe.tb_institution_id)          ',
//                '   inner join tb_clin_professional_has_patient php             ',
//                '   on (php.tb_clin_patient_id = p.id)                          ',
//                '     and (php.tb_institution_id = p.tb_institution_id)         ',
                '   inner join tb_clin_module cm                                ',
                '   on (cm.id = p.tb_clin_module_id)                            ',
                '   and (cm.tb_institution_id = p.tb_institution_id)            ',
                'WHERE ( en.id > 0 )                                            ',
                '  and (p.tb_institution_id =:tb_institution_id)                ',
                '  and (p.active=''S'')                                         '
//                '  and (php.tb_clin_professional_id =:tb_clin_professional_id ) '
      ));
      ParamByName('tb_institution_id').AsInteger := UMM.GInstitution.Registro.Codigo;
//      ParamByName('tb_clin_professional_id').AsInteger := cds_profissionalid.AsInteger;
      Prepare;
      Active := True;
      FetchAll;
    End;
  Finally
    cds_patient.Active := True;
    Umm.Qr_Crud.close;
  End;

end;

procedure TTasClinQuiz.ListaProfissional;
begin
  try
    cds_profissional.Active := False;
    with UMM.Qr_Crud do
    Begin
      Active := FAlse;
      sql.Clear;
      sql.Add(concat(
                'SELECT en.id, en.nick_trade,                         ',
                ' lnb.id IDLineBusiness, lnb.description              ',
                'FROM tb_entity en                                    ',
                '   inner join tb_institution_has_entity i            ',
                '   on (en.id = i.tb_entity_id)                       ',
                '   inner join tb_person pe                           ',
                '   on ( en.id = pe.id )                              ',
                '   inner join tb_clin_professional p                 ',
                '   on (p.id = en.id)                                 ',
                '   inner join tb_linebusiness lnb                    ',
                '   ON (en.tb_line_business_id = lnb.id)              ',
                'WHERE ( en.id > 0 )                                  ',
                '  and (p.tb_institution_id =:tb_institution_id)      ',
                '  and (p.active=''S'')                               ',
                'Union                                                ',
                'SELECT en.id, en.nick_trade,                         ',
                ' lnb.id IDLineBusiness, lnb.description              ',
                'FROM tb_entity en                                    ',
                '   INNER JOIN tb_company co                          ',
                '   ON ( en.id = co.id  )                             ',
                '   inner join tb_institution_has_entity i            ',
                '   on (en.id = i.tb_entity_id)                       ',
                '   inner join tb_clin_professional p                 ',
                '   on (p.id = en.id)                                 ',
                '   inner join tb_linebusiness lnb                    ',
                '   ON (en.tb_line_business_id = lnb.id)              ',
                'WHERE ( en.id > 0 )                                  ',
                '   and (p.tb_institution_id =:tb_institution_id)     ',
                '   and (p.active=''S'')                              ',
                ' order by 2                              '
      ));
      ParamByName('tb_institution_id').AsInteger := UMM.GInstitution.Registro.Codigo;
      Prepare;
      Active := True;
      FetchAll;
    End;
  Finally
    cds_profissional.Active := True;
    Umm.Qr_Crud.close;
  End;


end;

procedure TTasClinQuiz.ListaQuestionnaire;
begin
  try
    cds_questionnaire.Active := False;
    with UMM.Qr_Crud do
    Begin
      Active := FAlse;
      sql.Clear;
      sql.Add(concat(
                'select qtn.*                                                   ',
                'from tb_clin_questionnaire qtn                                 ',
                'where ( qtn.tb_institution_id =:tb_institution_id)             ',
                '  AND ( qtn.tb_clin_module_id =:tb_clin_module_id)             ',
                '  AND ( qtn.tb_linebusiness_id =:tb_linebusiness_id)           ',
//              '  AND ( qtn.tb_clin_professional_id =:tb_clin_professional_id) ',
                '  AND ( qtn.active = ''S'')                                    '
      ));
      ParamByName('tb_institution_id').AsInteger  := UMM.GInstitution.Registro.Codigo;
      ParamByName('tb_linebusiness_id').AsInteger := cds_profissionalIDLineBusiness.AsInteger;
      ParamByName('tb_clin_module_id').AsInteger  := cds_patienttb_clin_module_id.AsInteger;
      Prepare;
      Active := True;
      FetchAll;
    End;
  Finally
    cds_questionnaire.Active := True;
    Umm.Qr_Crud.close;
  End;

end;


procedure TTasClinQuiz.Save;
begin
  SaveQuiz;
  SaveAnswer;
end;

procedure TTasClinQuiz.SaveAnswer;
Var
  variavel : TComponent;
  Lc_Radiop : TUniRadioButton;
  I : Integer;
  Lc_Yes, Lc_No : Integer;
begin
  Lc_Yes :=0;
  Lc_No :=0;
  for I := 0 to QtdePerguntas.Count -1 do
  Begin
    //Encontrar o frame
    variavel := findcomponent('FrClinQuestion' + QtdePerguntas[I]);

    with Quiz.Respostas do
    Begin
      Registro.Estabelecimento := Quiz.Registro.Estabelecimento;
      Registro.Questionario    := Quiz.Registro.Questionario;
      Registro.Pesquisa        := Quiz.Registro.Codigo;
      Registro.Questao         := TFmClinQuestion(variavel).Lb_Question.Tag;
      if TFmClinQuestion(variavel).Rb_Yes.Checked then
      Begin
        Lc_Yes            := Lc_Yes +1;
        Registro.Alcacado := 'S';
      end
      else
      Begin
        Lc_No             := Lc_No +1;
        Registro.Alcacado := 'N';
      end;
      Registro.Observacao      := '';
    End;
    Quiz.Respostas.save;
  End;
  //Atualiza Alcance no Quiz
  Quiz.Registro.TaxaAlcance     := ( Lc_Yes/(Lc_Yes + Lc_No) ) *100;
  Quiz.updateReached;

end;

procedure TTasClinQuiz.SaveQuiz;
begin
  with Quiz do
  Begin
    Registro.Codigo          := 0;
    Registro.Estabelecimento := UMM.GInstitution.Registro.Codigo;
    Registro.Questionario    := cds_questionnaireid.AsInteger;
    Registro.Data            := E_Data.DateTime;
    Registro.Modulo          := cds_questionnairetb_clin_module_id.AsInteger;
    Registro.Especialidade   := cds_questionnairetb_linebusiness_id.AsInteger;
    Registro.Profissional    := cds_profissionalid.AsInteger;
    Registro.Paciente        := cds_patientid.AsInteger;
    Registro.TaxaAlcance     := 0;
  End;
  Quiz.save;
end;

procedure TTasClinQuiz.Sb_Pati_NextClick(Sender: TObject);
begin
  inherited;
  ListaQuestionnaire;
  pg_Main.ActivePage := tbs_questionnaire;
end;

procedure TTasClinQuiz.Sb_Pati_PriorClick(Sender: TObject);
begin
  inherited;
  pg_Main.ActivePage := tbs_professional;
end;

procedure TTasClinQuiz.Sb_Prof_adjustClick(Sender: TObject);
begin
  inherited;
  WindowState := wsMaximized;
end;

procedure TTasClinQuiz.Sb_Prof_NextClick(Sender: TObject);
begin
  inherited;
  ListaPatient;
  pg_Main.ActivePage := tbs_patient;
end;

procedure TTasClinQuiz.Sb_ques_nextClick(Sender: TObject);
begin
  inherited;
  ShowQuestion;
  pg_Main.ActivePage := tbs_quiz;
  Repaint;
  Refresh;
end;

procedure TTasClinQuiz.Sb_ques_priorClick(Sender: TObject);
begin
  inherited;
  pg_Main.ActivePage := tbs_patient;
end;

procedure TTasClinQuiz.Sb_quiz_finishClick(Sender: TObject);
begin
  Self.showMask('Aguarde Processamento');
  UniSession.Synchronize();
  if ValidateFinish then
  Begin
    MensageYesNo(['C O N F I R M A Ç Ã O!',
                  '',
                  'Deseja realmente Finalizar esta avaliação?',
                  'clique em SIM para confirmar.'],mpAlerta);
      FormMsg.ShowModal(
        Procedure(Sender: TComponent; AResult:Integer)
        begin
          if (Sender as TMsgForm).BotaoEscolhido > 0 then
          Begin
            Self.Save;
            MensageAlert(['A T E N Ç Ã O!.',
                          '',
                          'Avaliação gravada com Sucesso!',
                          'Clique em OK para continuar.']);
            Self.Close;
          End;
        end
      );
  End;
end;

procedure TTasClinQuiz.Sb_quiz_priorClick(Sender: TObject);
begin
  inherited;
  ClearFrames;
  pg_Main.ActivePage := tbs_questionnaire;
end;

procedure TTasClinQuiz.setSortable;
Var
  I:Integer;
begin
  for I := 0 to dbg_Profissional.Columns.Count -1 do
    dbg_Profissional.Columns[I].Sortable := TRue;

  for I := 0 to dbg_Patiente.Columns.Count -1 do
    dbg_Patiente.Columns[I].Sortable := TRue;

  for I := 0 to dbg_Questionnaire.Columns.Count -1 do
    dbg_Questionnaire.Columns[I].Sortable := TRue;

end;

procedure TTasClinQuiz.ShowQuestion;
Var
  I : Integer;
  LcResp : TClinAnwer;
begin
  Quiz.Respostas.Lista.Clear;
  with Quiz.Perguntas do
  Begin
    Registro.Estabelecimento := UMM.GInstitution.Registro.Codigo;
    Registro.Questionario    := cds_questionnaireid.AsInteger;
    orderby := 'Order by id desc ';
    getlist;
    QtdePerguntas.Clear;
    for I := 0 to Lista.Count -1 do
    Begin
      QtdePerguntas.Add(IntToStr(I + 1));
      CriaFrameQuestion(Lista[I].Codigo,Lista[I].Descricao);
    End;
  End;
end;

procedure TTasClinQuiz.UniFormDestroy(Sender: TObject);
begin
  RemoveCssDbGRid;
  inherited;

end;


function TTasClinQuiz.ValidateFinish: Boolean;
Var
  variavel : TComponent;
  I : Integer;
  LcClinQuestion : TFmClinQuestion;
begin
  REsult := True;
  for I := 0 to QtdePerguntas.Count -1 do
  Begin
    //Encontrar o frame
    variavel := FindComponent('FrClinQuestion' + QtdePerguntas[I]);
    //Encontra o RAdioButton
    if (not TFmClinQuestion(variavel).Rb_Yes.Checked) and (not TFmClinQuestion(variavel).Rb_No.Checked)  then
    Begin
      TFmClinQuestion(variavel).Lb_Question.Font.Color := clRed;
      Result := FAlse;
      Break;
    End
    else
    Begin
      TFmClinQuestion(variavel).Lb_Question.Font.Color := clBlack;
    End;

  End;
  if not Result then
  Begin
    self.HideMask;
    UniSession.Synchronize();
    MensageAlert(['A T E N Ç Ã O!.',
                  '',
                  'Verifique questões sem respostas.',
                  'Verifique para continuar']);
  End;
end;

end.
