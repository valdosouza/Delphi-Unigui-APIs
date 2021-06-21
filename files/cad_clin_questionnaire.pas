unit cad_clin_questionnaire;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, base_registry, Vcl.Menus, uniMainMenu,
  Data.DB, Datasnap.DBClient, uniButton, uniBitBtn, uniSpeedButton,
  uniGUIBaseClasses, uniGUIClasses, uniPanel, uniEdit, uniDateTimePicker,
  uniBasicGrid, uniDBGrid,  fm_clin_module,fm_clin_professional, fm_lineBusiness,
  ControllerClinQuestionnaire, uniCheckBox, Datasnap.Provider;

type
  TCadClinQuestionnaire = class(TBaseRegistry)
    pnl_fundo_row_1: TUniPanel;
    DTP_Date: TUniDateTimePicker;
    E_Questionnaire: TUniEdit;
    ctn_clin_module: TUniContainerPanel;
    pnl_fundo_row_2: TUniPanel;
    Ctn_LineBusiness: TUniContainerPanel;
    Ctn_clin_professional: TUniContainerPanel;
    pnl_fundo_row_3: TUniPanel;
    pnl_fundo_row_3_1: TUniPanel;
    E_Question: TUniEdit;
    pnl_fundo_row_3_2: TUniPanel;
    sb_Insert_Question: TUniSpeedButton;
    sb_Delete_Question: TUniSpeedButton;
    dbg_Search: TUniDBGrid;
    pnl_fundo_row_4: TUniPanel;
    chbx_ativo: TUniCheckBox;
    cds_question: TClientDataSet;
    ds_question: TDataSource;
    cds_questionid: TIntegerField;
    cds_questiondescription: TStringField;
    SB_Save_Question: TUniSpeedButton;
    SB_Cancel_Question: TUniSpeedButton;
    sb_Change_Question: TUniSpeedButton;
    procedure sb_Delete_QuestionClick(Sender: TObject);
    procedure sb_Insert_QuestionClick(Sender: TObject);
    procedure SB_Cancel_QuestionClick(Sender: TObject);
    procedure SB_Save_QuestionClick(Sender: TObject);
    procedure sb_Change_QuestionClick(Sender: TObject);
  private
    { Private declarations }
    EditionStateQuestion : String;
    FrClinModule : TFmClinModule;
    FrLineBusiness : TFmLineBusiness;
    FrClinProfessional : TFmClinProfessional;
    procedure ShowClinModule;
    procedure ShowLineBusiness;
    procedure ShowClinProfessional;
    procedure SaveClinPatient;

    procedure InsertQuestion;
    procedure EditionControlQuestion;
    function validateSaveQuestion:Boolean;
    procedure SaveQuestion;
    function validateEditQuestion:Boolean;
    procedure EditQuestion;
    function validateDeleteQuestion:Boolean;
    procedure DeleteQuestion;
    procedure CancelQuestion;

  protected
    procedure setImages;Override;
    procedure FormatScreen;Override;
    procedure InitVariable;Override;
    procedure EditionControl;Override;
    procedure setvariable;override;

    procedure ShowData;Override;
    procedure ShowDataQuestionnaire;
    procedure ShowDataQuestions;

    procedure ClearAllFields;Override;
    function ValidaInsert():boolean;Override;
    procedure Insert;Override;
    procedure change;Override;

    function ValidateSave: boolean;Override;
    procedure Save;Override;
    procedure SaveQuestionnaire;
    procedure DeletedQuestion;
    procedure SaveQuestions;

    function ValidateDelete:boolean;Override;
    procedure Delete;Override;

    


  public
    { Public declarations }
    Questionnaire : TControllerClinQuestionnaire;
  end;

var
  CadClinQuestionnaire: TCadClinQuestionnaire;

implementation

{$R *.dfm}

uses MainModule, unMessages, msg_form, UnFunctions;

{ TCadClinQuestionnaire }

procedure TCadClinQuestionnaire.CancelQuestion;
begin
  E_Question.Clear;
  cds_question.Cancel;
  EditionStateQuestion := 'B';
  EditionControlQuestion;
end;

procedure TCadClinQuestionnaire.change;
begin
  inherited;
  setFocus(E_Questionnaire.JSName);
end;

procedure TCadClinQuestionnaire.ClearAllFields;
begin
  inherited;
  Questionnaire.clear
end;

procedure TCadClinQuestionnaire.Delete;
begin
  MensageYesNo(['C O N F I R M A Ç Ã O!',
                '',
                'Deseja realmente excluir este registro?',
                'clique em SIM para confirmar.'],mpAlerta);
  FormMsg.ShowModal(
  Procedure(Sender: TComponent; AResult:Integer)
  begin
    if (Sender as TMsgForm).BotaoEscolhido > 0 then
    Begin
      Self.Questionnaire.Pergunta.Registro.Estabelecimento := UMM.GInstitution.Registro.Codigo;
      Self.Questionnaire.Pergunta.Registro.Questionario    := Self.Questionnaire.Registro.Codigo;
      Self.Questionnaire.Pergunta.deleteByQuestionnaire;
      Self.Questionnaire.delete;
      Self.Close;
    End;
  end
  );
end;

procedure TCadClinQuestionnaire.DeletedQuestion;
Var
  LcOperacao : String;
  cds_temp : TClientDataSet;
begin
  if cds_question.ChangeCount > 0 then
  Begin
    Try
      cds_temp := TClientDataSet.Create(nil);
      cds_temp.Data := cds_question.Delta;
      cds_temp.First;
      cds_question.First;
      //Trata somente os dados deletados
      while not cds_temp.eof do
      Begin
        with Questionnaire.Pergunta do
        Begin
          if cds_temp.UpdateStatus = usDeleted then
          Begin
            //Detalhe
            Registro.Codigo           := cds_Temp.FieldByName('id').AsInteger;
            Registro.Estabelecimento  := UMM.GInstitution.registro.Codigo;
            Registro.Questionario     := Questionnaire.Registro.Codigo;
            Questionnaire.Pergunta.delete;
          End;
        End;
        cds_temp.Next;
      end;
    Finally
      cds_temp.Close;
      cds_temp.DisposeOf;
    End;
  End;
end;

procedure TCadClinQuestionnaire.DeleteQuestion;
begin
  cds_question.Delete;
end;

procedure TCadClinQuestionnaire.EditionControl;
begin
  inherited;
  EditionControler(FrClinModule);
  EditionControler(FrLineBusiness);
  EditionControler(FrClinProfessional);
  EditionStateQuestion := 'B';
  EditionControlQuestion;
end;

procedure TCadClinQuestionnaire.EditionControlQuestion;
begin
  E_Question.ReadOnly     := ( EditionStateQuestion = 'B' );
  sb_Insert_Question.Enabled := ( EditionStateQuestion = 'B' );
  SB_Change_Question.Enabled := ( EditionStateQuestion = 'B' );
  sb_Delete_Question.Enabled := ( EditionStateQuestion = 'B' );
  SB_Save_Question.Enabled   := ( EditionStateQuestion = 'I' ) or ( EditionStateQuestion = 'E' );
  SB_Cancel_Question.Enabled := ( EditionStateQuestion = 'I' ) or ( EditionStateQuestion = 'E' );
end;

procedure TCadClinQuestionnaire.EditQuestion;
begin
  EditionStateQuestion := 'E';
  EditionControlQuestion;
  Questionnaire.Pergunta.Registro.Codigo :=  cds_questionid.AsInteger;
  E_Question.Text                        := cds_questiondescription.AsString;
  setFocus(E_Question.JSName);
end;

procedure TCadClinQuestionnaire.FormatScreen;
begin
  inherited;
  ShowClinModule;
  ShowLineBusiness;
  ShowClinProfessional;
end;

procedure TCadClinQuestionnaire.InitVariable;
begin
  PInterface := 51;
  inherited;
  Questionnaire := TControllerClinQuestionnaire.Create(Self);
  cds_question.Close;
  EditionStateQuestion := 'B';
end;

procedure TCadClinQuestionnaire.Insert;
begin
  inherited;
  chbx_ativo.Checked := TRue;
  setFocus(E_Questionnaire.JSName);
end;

procedure TCadClinQuestionnaire.InsertQuestion;
begin
  EditionStateQuestion := 'I';
  EditionControlQuestion;
  Questionnaire.Pergunta.Registro.Codigo := 0;
  E_Question.Clear;
  setFocus(E_Question.JSName);
end;

procedure TCadClinQuestionnaire.SaveQuestion;
begin
  if not cds_question.Active then cds_question.createDataset;
  if Questionnaire.Pergunta.Registro.Codigo = 0 then
  Begin
    Questionnaire.Pergunta.Registro.Codigo :=  getNextIdDataSet(cds_question);
    cds_question.Append;
  End
  else
  Begin
    cds_question.edit;
  End;
  cds_questionid.AsInteger          := Questionnaire.Pergunta.Registro.Codigo;
  cds_questiondescription.AsString  := E_Question.Text;
  cds_question.post;
end;

procedure TCadClinQuestionnaire.Save;
begin
  SaveQuestionnaire;
  DeletedQuestion;
  SaveQuestions;
end;

procedure TCadClinQuestionnaire.SaveClinPatient;
begin

end;

procedure TCadClinQuestionnaire.SaveQuestionnaire;
begin
  with Questionnaire.Registro do
  BEgin
    Estabelecimento := UMM.GInstitution.Registro.Codigo;
    Descricao       := E_Questionnaire.Text;
    Data            := DTP_Date.DateTime;
    if FrClinModule.DBLCB_Lista.Text <> '' then
      Modulo        := FrClinModule.DBLCB_Lista.KeyValue
    else
      Modulo        := 0;

    if FrLineBusiness.DBLCB_Lista.Text <> '' then
      Especialidade := FrLineBusiness.DBLCB_Lista.KeyValue
    else
      Especialidade := 0;

    if FrClinProfessional.DBLCB_Lista.Text <> '' then
      Profissional  := FrClinProfessional.DBLCB_Lista.KeyValue
    else
      Profissional  := 0;

    if chbx_ativo.Checked then
      Ativo := 'S'
    else
      Ativo := 'N';
  End;
  Questionnaire.save;
end;

procedure TCadClinQuestionnaire.SaveQuestions;
begin
  if cds_question.ChangeCount > 0 then
  Begin
    Try
      cds_question.First;
      //Trata somente os dados Inseridos ou Alterados
      while not cds_question.eof do
      Begin
        if cds_question.UpdateStatus <> UsUnModified  then
        Begin
          with Questionnaire do
          Begin
            with Pergunta do
            Begin
              Registro.Codigo          := cds_question.FieldByName('id').AsInteger;
              Registro.Estabelecimento := UMM.GInstitution.registro.Codigo;
              Registro.Questionario    := Questionnaire.Registro.Codigo;
              Registro.Descricao       := cds_question.FieldByName('description').AsString;
              Registro.Tipo            := '0';
              case cds_question.UpdateStatus of
                usModified: Pergunta.Update;
                usInserted: Pergunta.insert;
              end;
            End;
          End;
        End;
        cds_question.next;
      End;
    Finally
      cds_question.MergeChangeLog;
    End;
  End;
end;

procedure TCadClinQuestionnaire.SB_Cancel_QuestionClick(Sender: TObject);
begin
  CancelQuestion;
end;

procedure TCadClinQuestionnaire.sb_Change_QuestionClick(Sender: TObject);
begin
  if validateEditQuestion then
    EditQuestion;
end;

procedure TCadClinQuestionnaire.sb_Delete_QuestionClick(Sender: TObject);
begin
  if validateDeleteQuestion then
    DeleteQuestion;
end;

procedure TCadClinQuestionnaire.sb_Insert_QuestionClick(Sender: TObject);
begin
  InsertQuestion;
end;

procedure TCadClinQuestionnaire.SB_Save_QuestionClick(Sender: TObject);
begin
  if validateSaveQuestion then
  BEgin
    SaveQuestion;
    E_Question.Clear;
    Questionnaire.Pergunta.Registro.Codigo := 0;
    EditionStateQuestion := 'B';
    EditionControlQuestion;
  End;

end;

procedure TCadClinQuestionnaire.setImages;
begin
  inherited;
  buttonIcon(sb_Insert_Question,'insert.bmp');
  buttonIcon(sb_Change_Question,'change.bmp');
  buttonIcon(sb_Delete_Question,'delete.bmp');
  buttonIcon(SB_Save_Question,'save.bmp');
  buttonIcon(SB_Cancel_Question,'cancel.bmp');
end;

procedure TCadClinQuestionnaire.setvariable;
begin
  if CodigoRegistro > 0 then
  Begin
    Questionnaire.Registro.Codigo := CodigoRegistro;
    Questionnaire.Registro.Estabelecimento := UMM.GInstitution.registro.Codigo;
    Questionnaire.getAllByKey;
  End;
  inherited;
end;

procedure TCadClinQuestionnaire.ShowClinModule;
begin
  FrClinModule := TFmClinModule.Create(Self);
  FrClinModule.Parent := ctn_clin_module;
  FrClinModule.Listar;
  FrClinModule.Show;
  FrClinModule.Align := alClient;
end;

procedure TCadClinQuestionnaire.ShowClinProfessional;
begin
  FrClinProfessional := TFmClinProfessional.Create(Self);
  FrClinProfessional.Parent := Ctn_clin_professional;
  FrClinProfessional.Listar;
  FrClinProfessional.Show;
  FrClinProfessional.Align := alClient;
end;

procedure TCadClinQuestionnaire.ShowData;
begin
  ShowDataQuestionnaire;
  ShowDataQuestions;
end;

procedure TCadClinQuestionnaire.ShowDataQuestionnaire;
begin
  with Questionnaire.Registro do
  BEgin
    E_Questionnaire.Text                    := Descricao;
    DTP_Date.DateTime                       := Data;
    FrClinModule.DBLCB_Lista.KeyValue       := Modulo;
    FrLineBusiness.DBLCB_Lista.KeyValue     := Especialidade;
    FrClinProfessional.DBLCB_Lista.KeyValue := Profissional;
    chbx_ativo.Checked                      := ( Ativo = 'S' );
  End;

end;

procedure TCadClinQuestionnaire.ShowDataQuestions;
Var
  I : Integer;
begin
  with Questionnaire.Pergunta do
  BEgin
    cds_question.Active := False;
    if not cds_question.Active then cds_question.CreateDataSet;
    cds_question.LogChanges := False;
    cds_question.EmptyDataSet;
    for I := 0 to Lista.Count -1 do
    Begin
      cds_question.Append;
      cds_questionid.AsInteger          := Lista[I].Codigo;
      cds_questiondescription.AsString  := Lista[I].Descricao;
      cds_question.post;
    End;
    cds_question.LogChanges := True;
  End;
end;

procedure TCadClinQuestionnaire.ShowLineBusiness;
begin
  FrLineBusiness := TFmLineBusiness.Create(Self);
  FrLineBusiness.Parent := Ctn_LineBusiness;
  FrLineBusiness.Align := alClient;
  FrLineBusiness.Listar;
  FrLineBusiness.Show;
end;

function TCadClinQuestionnaire.ValidaInsert: boolean;
begin
  Result := True;
end;

function TCadClinQuestionnaire.ValidateDelete: boolean;
begin
  Result := True;
end;

function TCadClinQuestionnaire.validateDeleteQuestion: Boolean;
begin
  Result := True;
  if (cds_question.RecordCount = 0) then
  begin
    MensageAlert(['A T E N Ç Ã O!.',
                  '',
                  'Não há perguntas para excluir.',
                  'Preencha o campo para continuar']);
    Result := False;
    exit;
  end; 
  if (cds_questionid.AsInteger = 0) then
  begin
    MensageAlert(['A T E N Ç Ã O!.',
                  '',
                  'Não foi selecionada a ´perguntas para excluir.',
                  'Preencha o campo para continuar']);
    Result := False;
    exit;
  end;   
  
end;

function TCadClinQuestionnaire.validateEditQuestion: Boolean;
begin
  Result := True;
  if (cds_question.RecordCount = 0) then
  begin
    MensageAlert(['A T E N Ç Ã O!.',
                  '',
                  'Não há perguntas para editar.',
                  'Preencha o campo para continuar']);
    Result := False;
    exit;
  end; 
  if (cds_questionid.AsInteger = 0) then
  begin
    MensageAlert(['A T E N Ç Ã O!.',
                  '',
                  'Não foi selecionada a ´perguntas para editar.',
                  'Preencha o campo para continuar']);
    Result := False;
    exit;
  end;   
end;

function TCadClinQuestionnaire.validateSaveQuestion: Boolean;
begin
  Result := True;
  if trim(E_Question.Text) = '' then
  begin
    MensageAlert(['A T E N Ç Ã O!.',
                  '',
                  'Campo Descrição da pergunta não informado.',
                  'Preencha o campo para continuar']);
    Result := False;
    exit;
  end;
  
end;

function TCadClinQuestionnaire.ValidateSave: boolean;
begin
  Result := TRue;
  if trim(E_Questionnaire.Text) = '' then
  begin
    MensageAlert(['A T E N Ç Ã O!.',
                  '',
                  'Campo Descrição do questionário não informado.',
                  'Preencha o campo para continuar']);
    Result := False;
    exit;
  end;

  if trim(FrClinModule.DBLCB_Lista.Text) = '' then
  begin
    MensageAlert(['A T E N Ç Ã O!.',
                  '',
                  'Campo Módulo não informado.',
                  'Preencha o campo para continuar']);
    Result := False;
    exit;
  end;

  if trim(FrLineBusiness.DBLCB_Lista.Text) = '' then
  begin
    MensageAlert(['A T E N Ç Ã O!.',
                  '',
                  'Campo Especialidade não informado.',
                  'Preencha o campo para continuar']);
    Result := False;
    exit;
  end;

  if trim(FrClinProfessional.DBLCB_Lista.Text) = '' then
  begin
    MensageAlert(['A T E N Ç Ã O!.',
                  '',
                  'Campo Profissional não informado.',
                  'Preencha o campo para continuar']);
    Result := False;
    exit;
  end; 
end;

end.

