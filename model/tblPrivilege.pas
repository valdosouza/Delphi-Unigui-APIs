unit tblPrivilege;

interface

Uses GenericEntity,GenericDao,CAtribEntity, System.Classes, System.SysUtils;

Type
  //nome da classe de entidade
  [TableName('tb_privilege')]
  TPrivilege = Class(TGenericEntity)
  private
    Fdescription: String;
    FId: Integer;
    Fupdated_at: TDAteTime;
    Fcreated_at: TDAteTime;
    FAtivo: String;
    procedure setFcreated_at(const Value: TDAteTime);
    procedure setFdescription(const Value: String);
    procedure setFId(const Value: Integer);
    procedure setFupdated_at(const Value: TDAteTime);
    procedure setFAtivo(const Value: String);

  public
    [FieldName('id')]
    [KeyField('id')]
    property Codigo: Integer read FId write setFId;

    [FieldName('description')]
    property Descricao: String read Fdescription write setFdescription;

    [FieldName('created_at')]
    property RegistroCriado: TDAteTime read Fcreated_at write setFcreated_at;

    [FieldName('updated_at')]
    property RegistroAlterado: TDAteTime read Fupdated_at write setFupdated_at;

    property Ativo: String read FAtivo write setFAtivo;
  End;
implementation

{ TPrivilege }

procedure TPrivilege.setFAtivo(const Value: String);
begin
  FAtivo := Value;
end;

procedure TPrivilege.setFcreated_at(const Value: TDAteTime);
begin
  Fcreated_at := Value;
end;

procedure TPrivilege.setFdescription(const Value: String);
begin
  Fdescription := Value;
end;

procedure TPrivilege.setFId(const Value: Integer);
begin
  FId := Value;
end;

procedure TPrivilege.setFupdated_at(const Value: TDAteTime);
begin
  Fupdated_at := Value;
end;

end.
