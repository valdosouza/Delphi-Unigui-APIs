unit tblMailingGroup;

interface

Uses GenericEntity,GenericDao,CAtribEntity;

Type
  //nome da classe de entidade
  [TableName('tb_mailing_group')]
  TMailingGroup = Class(TGenericEntity)
  private
    Fid : Integer;
    Fdescription : String;
    Fcreated_at: TDAteTime;
    Fupdated_at: TDAteTime;

    procedure setFcreated_at(const Value: TDAteTime);
    procedure setFdescription(const Value: String);
    procedure setFID(const Value: Integer);
    procedure setFupdated_at(const Value: TDAteTime);

  public

    [KeyField('id')]
    [FieldName('id')]
    property Codigo: Integer read FID write setFID;

    [FieldName('description')]
    property Descricao: String read Fdescription write setFdescription;

    [FieldName('created_at')]
    property RegistroCriado: TDAteTime read Fcreated_at write setFcreated_at;

    [FieldName('updated_at')]
    property RegistroAlterado: TDAteTime read Fupdated_at write setFupdated_at;

  End;

implementation


{ TMailingGroup }

procedure TMailingGroup.setFcreated_at(const Value: TDAteTime);
begin
  Fcreated_at := Value;
end;

procedure TMailingGroup.setFdescription(const Value: String);
begin
  Fdescription := Value;
end;

procedure TMailingGroup.setFID(const Value: Integer);
begin
  FID := Value;
end;

procedure TMailingGroup.setFupdated_at(const Value: TDAteTime);
begin
  Fupdated_at := Value;
end;

end.
