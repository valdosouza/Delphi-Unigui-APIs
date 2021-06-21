unit tblClinQuestionnaire;

interface

Uses GenericEntity,CAtribEntity, Classes, SysUtils;

Type
  //nome da classe de entidade
  [TableName('tb_clin_questionnaire')]
  TClinQuestionnaire = Class(TGenericEntity)
  private
    Factive: String;
    Ftb_clin_professional_id: Integer;
    Fdescription: String;
    FId: Integer;
    Fupdated_at: TDAteTime;
    Ftb_institution_id: Integer;
    Ftb_linebusiness_id: Integer;
    Ftb_clin_module_id: Integer;
    Fdt_record: TDateTime;
    Fcreated_at: TDAteTime;
    procedure setFactive(const Value: String);
    procedure setFcreated_at(const Value: TDAteTime);
    procedure setFdescription(const Value: String);
    procedure setFdt_record(const Value: TDateTime);
    procedure setFId(const Value: Integer);
    procedure setFtb_clin_module_id(const Value: Integer);
    procedure setFtb_clin_professional_id(const Value: Integer);
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

    [FieldName('description')]
    property Descricao: String read Fdescription write setFdescription;

    [FieldName('dt_record')]
    property Data: TDateTime read Fdt_record write setFdt_record;

    [FieldName('tb_clin_module_id')]
    property Modulo : Integer read Ftb_clin_module_id write setFtb_clin_module_id;

    [FieldName('tb_linebusiness_id')]
    property Especialidade : Integer read Ftb_linebusiness_id write setFtb_linebusiness_id;

    [FieldName('tb_clin_professional_id')]
    property Profissional : Integer read Ftb_clin_professional_id write setFtb_clin_professional_id;

    [FieldName('active')]
    property Ativo: String read Factive write setFactive;

    [FieldName('created_at')]
    property RegistroCriado: TDAteTime read Fcreated_at write setFcreated_at;

    [FieldName('updated_at')]
    property RegistroAlterado: TDAteTime read Fupdated_at write setFupdated_at;

  End;
implementation


{ TClinQuestionnaire }

procedure TClinQuestionnaire.setFactive(const Value: String);
begin
  Factive := Value;
end;

procedure TClinQuestionnaire.setFcreated_at(const Value: TDAteTime);
begin
  Fcreated_at := Value;
end;

procedure TClinQuestionnaire.setFdescription(const Value: String);
begin
  Fdescription := Value;
end;

procedure TClinQuestionnaire.setFdt_record(const Value: TDateTime);
begin
  Fdt_record := Value;
end;

procedure TClinQuestionnaire.setFId(const Value: Integer);
begin
  FId := Value;
end;

procedure TClinQuestionnaire.setFtb_clin_module_id(const Value: Integer);
begin
  Ftb_clin_module_id := Value;
end;

procedure TClinQuestionnaire.setFtb_clin_professional_id(const Value: Integer);
begin
  Ftb_clin_professional_id := Value;
end;

procedure TClinQuestionnaire.setFtb_institution_id(const Value: Integer);
begin
  Ftb_institution_id := Value;
end;

procedure TClinQuestionnaire.setFtb_linebusiness_id(const Value: Integer);
begin
  Ftb_linebusiness_id := Value;
end;

procedure TClinQuestionnaire.setFupdated_at(const Value: TDAteTime);
begin
  Fupdated_at := Value;
end;

end.
