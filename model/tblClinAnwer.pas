unit tblClinAnwer;

interface

Uses GenericEntity,CAtribEntity, Classes, SysUtils;

Type
  //nome da classe de entidade
  [TableName('tb_clin_answer')]
  TClinAnwer = Class(TGenericEntity)
  private
    Fnote: String;
    Freached: String;
    Ftb_question_id: Integer;
    Ftb_clin_questionnaire_id: Integer;
    Fupdated_at: TDAteTime;
    Ftb_institution_id: Integer;
    Ftb_clin_quiz_id: Integer;
    Fcreated_at: TDAteTime;
    procedure setFcreated_at(const Value: TDAteTime);
    procedure setFnote(const Value: String);
    procedure setFreached(const Value: String);
    procedure setFtb_clin_questionnaire_id(const Value: Integer);
    procedure setFtb_clin_quiz_id(const Value: Integer);
    procedure setFtb_institution_id(const Value: Integer);
    procedure setFtb_question_id(const Value: Integer);
    procedure setFupdated_at(const Value: TDAteTime);

  public

    [FieldName('tb_institution_id')]
    [KeyField('tb_institution_id')]
    property Estabelecimento: Integer read Ftb_institution_id write setFtb_institution_id;

    [FieldName('tb_clin_quiz_id')]
    [KeyField('tb_clin_quiz_id')]
    property Pesquisa: Integer read Ftb_clin_quiz_id write setFtb_clin_quiz_id;

    [FieldName('tb_clin_questionnaire_id')]
    [KeyField('tb_clin_questionnaire_id')]
    property Questionario: Integer read Ftb_clin_questionnaire_id write setFtb_clin_questionnaire_id;

    [FieldName('tb_clin_question_id')]
    [KeyField('tb_clin_question_id')]
    property Questao: Integer read Ftb_question_id write setFtb_question_id;

    [FieldName('reached')]
    property Alcacado: String read Freached write setFreached;

    [FieldName('note')]
    property Observacao: String read Fnote write setFnote;

    [FieldName('created_at')]
    property RegistroCriado: TDAteTime read Fcreated_at write setFcreated_at;

    [FieldName('updated_at')]
    property RegistroAlterado: TDAteTime read Fupdated_at write setFupdated_at;

  End;

implementation




{ TClinAnwer }

procedure TClinAnwer.setFcreated_at(const Value: TDAteTime);
begin
  Fcreated_at := Value;
end;

procedure TClinAnwer.setFnote(const Value: String);
begin
  Fnote := Value;
end;

procedure TClinAnwer.setFreached(const Value: String);
begin
  Freached := Value;
end;

procedure TClinAnwer.setFtb_clin_questionnaire_id(const Value: Integer);
begin
  Ftb_clin_questionnaire_id := Value;
end;

procedure TClinAnwer.setFtb_clin_quiz_id(const Value: Integer);
begin
  Ftb_clin_quiz_id := Value;
end;

procedure TClinAnwer.setFtb_institution_id(const Value: Integer);
begin
  Ftb_institution_id := Value;
end;

procedure TClinAnwer.setFtb_question_id(const Value: Integer);
begin
  Ftb_question_id := Value;
end;

procedure TClinAnwer.setFupdated_at(const Value: TDAteTime);
begin
  Fupdated_at := Value;
end;

end.
