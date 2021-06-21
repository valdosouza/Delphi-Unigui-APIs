unit tblPriority;

interface
Uses GenericEntity,GenericDao,CAtribEntity, System.Classes, System.SysUtils;
Type
  //nome da classe de entidade
  [TableName('tb_Priority')]
  TPriority = Class(TGenericEntity)

  private
    Fdescription: String;
    FId: Integer;
    Fupdated_at: TDAteTime;
    Ftb_institution_id: integer;
    Fcreated_at: TDAteTime;
    procedure setFcreated_at(const Value: TDAteTime);
    procedure setFdescription(const Value: String);
    procedure setFId(const Value: Integer);
    procedure setFtb_institution_id(const Value: integer);
    procedure setFupdated_at(const Value: TDAteTime);


  public

    [FieldName('id')]
    [KeyField('id')]
    property Codigo: Integer read FId write setFId;

    [FieldName('tb_institution_id')]
    [KeyField('tb_institution_id')]
    property Estabelecimento: integer read Ftb_institution_id write setFtb_institution_id;

    [FieldName('description')]
    property Descricao: String read Fdescription write setFdescription;

    [FieldName('created_at')]
    property RegistroCriado: TDAteTime read Fcreated_at write setFcreated_at;

    [FieldName('updated_at')]
    property RegistroAlterado: TDAteTime read Fupdated_at write setFupdated_at;

  End;

implementation
{ TPriority }

procedure TPriority.setFcreated_at(const Value: TDAteTime);
begin
  Fcreated_at := Value;
end;

procedure TPriority.setFdescription(const Value: String);
begin
  Fdescription := Value;
end;

procedure TPriority.setFId(const Value: Integer);
begin
  FId := Value;
end;

procedure TPriority.setFtb_institution_id(const Value: integer);
begin
  Ftb_institution_id := Value;
end;

procedure TPriority.setFupdated_at(const Value: TDAteTime);
begin
  Fupdated_at := Value;
end;

end.
