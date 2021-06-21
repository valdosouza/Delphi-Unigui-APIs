unit tblClinQuiz;

interface

Uses GenericEntity,CAtribEntity, Classes, SysUtils;

Type
  //nome da classe de entidade
  [TableName('tb_clin_quiz')]
  TClinQuiz = Class(TGenericEntity)
  private
    Ftb_clin_patient_id: Integer;
    Ftb_clin_professional_id: Integer;
    Ftb_clin_questionnaire_id: Integer;
    FId: Integer;
    Fupdated_at: TDAteTime;
    Ftb_institution_id: Integer;
    Ftb_linebusiness_id: Integer;
    Freached_tx: Real;
    Ftb_clin_modulo_id: Integer;
    Fdt_record: TDateTime;
    Fcreated_at: TDAteTime;
    procedure setFcreated_at(const Value: TDAteTime);
    procedure setFdt_record(const Value: TDateTime);
    procedure setFId(const Value: Integer);
    procedure setFreached_tx(const Value: Real);
    procedure setFtb_clin_modulo_id(const Value: Integer);
    procedure setFtb_clin_patient_id(const Value: Integer);
    procedure setFtb_clin_professional_id(const Value: Integer);
    procedure setFtb_clin_questionnaire_id(const Value: Integer);
    procedure setFtb_institution_id(const Value: Integer);
    procedure setFtb_linebusiness_id(const Value: Integer);
    procedure setFupdated_at(const Value: TDAteTime);


  public
    [FieldName('id')]
    [KeyField('id')]
    property Codigo: Integer read FId write setFId;

    [FieldName('tb_institution_id')]
    [KeyField('tb_institution_id')]
    property Estabelecimento: Integer read Ftb_institution_id write setFtb_institution_id;

    [FieldName('tb_clin_questionnaire_id')]
    [KeyField('tb_clin_questionnaire_id')]
    property Questionario: Integer read Ftb_clin_questionnaire_id write setFtb_clin_questionnaire_id;

    [FieldName('dt_record')]
    property Data: TDateTime read Fdt_record write setFdt_record;

    [FieldName('tb_clin_module_id')]
    property Modulo: Integer read Ftb_clin_modulo_id write setFtb_clin_modulo_id;

    [FieldName('tb_linebusiness_id')]
    property Especialidade: Integer read Ftb_linebusiness_id write setFtb_linebusiness_id;

    [FieldName('tb_clin_professional_id')]
    property Profissional: Integer read Ftb_clin_professional_id write setFtb_clin_professional_id;

    [FieldName('tb_clin_patient_id')]
    property Paciente: Integer read Ftb_clin_patient_id write setFtb_clin_patient_id;

    [FieldName('reached_tx')]
    property TaxaAlcance: Real read Freached_tx write setFreached_tx;

    [FieldName('created_at')]
    property RegistroCriado: TDAteTime read Fcreated_at write setFcreated_at;

    [FieldName('updated_at')]
    property RegistroAlterado: TDAteTime read Fupdated_at write setFupdated_at;

  End;

implementation


{ TClinQuiz }

procedure TClinQuiz.setFcreated_at(const Value: TDAteTime);
begin
  Fcreated_at := Value;
end;

procedure TClinQuiz.setFdt_record(const Value: TDateTime);
begin
  Fdt_record := Value;
end;

procedure TClinQuiz.setFId(const Value: Integer);
begin
  FId := Value;
end;

procedure TClinQuiz.setFreached_tx(const Value: Real);
begin
  Freached_tx := Value;
end;

procedure TClinQuiz.setFtb_clin_modulo_id(const Value: Integer);
begin
  Ftb_clin_modulo_id := Value;
end;

procedure TClinQuiz.setFtb_clin_patient_id(const Value: Integer);
begin
  Ftb_clin_patient_id := Value;
end;

procedure TClinQuiz.setFtb_clin_professional_id(const Value: Integer);
begin
  Ftb_clin_professional_id := Value;
end;

procedure TClinQuiz.setFtb_clin_questionnaire_id(const Value: Integer);
begin
  Ftb_clin_questionnaire_id := Value;
end;

procedure TClinQuiz.setFtb_institution_id(const Value: Integer);
begin
  Ftb_institution_id := Value;
end;

procedure TClinQuiz.setFtb_linebusiness_id(const Value: Integer);
begin
  Ftb_linebusiness_id := Value;
end;

procedure TClinQuiz.setFupdated_at(const Value: TDAteTime);
begin
  Fupdated_at := Value;
end;

end.
