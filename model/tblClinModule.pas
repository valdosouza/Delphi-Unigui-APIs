unit tblClinModule;

interface

Uses GenericEntity,CAtribEntity, Classes, SysUtils;

Type
  //nome da classe de entidade
  [TableName('tb_clin_module')]
  TClinModule = Class(TGenericEntity)
  private
    Fsequence_id: Integer;
    Fdescription: String;
    FId: Integer;
    Fupdated_at: TDAteTime;
    Fcreated_at: TDAteTime;
    Ftb_institution_id: Integer;
    procedure setFcreated_at(const Value: TDAteTime);
    procedure setFdescription(const Value: String);
    procedure setFId(const Value: Integer);
    procedure setFsequence_id(const Value: Integer);
    procedure setFupdated_at(const Value: TDAteTime);
    procedure setFtb_institution_id(const Value: Integer);

  public
    [FieldName('id')]
    [KeyField('id')]
    property Codigo: Integer read FId write setFId;

    [FieldName('tb_institution_id')]
    [KeyField('tb_institution_id')]
    property Estabelecimento: Integer read Ftb_institution_id write setFtb_institution_id;

    [FieldName('sequence_id')]
    property Sequencia: Integer read Fsequence_id write setFsequence_id;

    [FieldName('description')]
    property Descricao: String read Fdescription write setFdescription;

    [FieldName('created_at')]
    property RegistroCriado: TDAteTime read Fcreated_at write setFcreated_at;

    [FieldName('updated_at')]
    property RegistroAlterado: TDAteTime read Fupdated_at write setFupdated_at;

  End;

implementation


{ TClinModule }

procedure TClinModule.setFcreated_at(const Value: TDAteTime);
begin
  Fcreated_at := Value;
end;

procedure TClinModule.setFdescription(const Value: String);
begin
  Fdescription := Value;
end;

procedure TClinModule.setFId(const Value: Integer);
begin
  FId := Value;
end;

procedure TClinModule.setFsequence_id(const Value: Integer);
begin
  Fsequence_id := Value;
end;

procedure TClinModule.setFtb_institution_id(const Value: Integer);
begin
  Ftb_institution_id := Value;
end;

procedure TClinModule.setFupdated_at(const Value: TDAteTime);
begin
  Fupdated_at := Value;
end;

end.
