unit tblUser;

interface

Uses GenericEntity,GenericDao,CAtribEntity;

Type
  //nome da classe de entidade
  [TableName('tb_user')]
  TUser = Class(TGenericEntity)
  private
    Factivation_key: String;
    Fsalt: String;
    Factive: String;
    Fid: Integer;
    Fupdated_at: TDAteTime;
    Fpassword: String;
    Ftb_device_id: Integer;
    FKind: String;
    Fcreated_at: TDAteTime;
    procedure setFactivation_key(const Value: String);
    procedure setFactive(const Value: String);
    procedure setFcreated_at(const Value: TDAteTime);
    procedure setFid(const Value: Integer);
    procedure setFKind(const Value: String);
    procedure setFpassword(const Value: String);
    procedure setFSalt(const Value: String);
    procedure setFupdated_at(const Value: TDAteTime);
    procedure settb_device_id(const Value: Integer);


  public

    [KeyField('id')]
    [FieldName('id')]
    property Codigo: Integer read Fid write setFid;

    [FieldName('password')]
    property Password: String read Fpassword write setFpassword;

    [FieldName('kind')]
    property Tipo: String read FKind write setFKind;

    [FieldName('salt')]
    property Salt: String read Fsalt write setFSalt;

    [FieldName('tb_device_id')]
    property Dispositivo: Integer read Ftb_device_id write settb_device_id;

    [FieldName('active')]
    property Ativo: String read Factive write setFactive;

    [FieldName('activation_key')]
    property ChaveAtivacao: String read Factivation_key write setFactivation_key;

    [FieldName('created_at')]
    property RegistroCriado: TDAteTime read Fcreated_at write setFcreated_at;

    [FieldName('updated_at')]
    property RegistroAlterado: TDAteTime read Fupdated_at write setFupdated_at;

  End;

implementation


{ TUser }

procedure TUser.setFactivation_key(const Value: String);
begin
  Factivation_key := Value;
end;

procedure TUser.setFactive(const Value: String);
begin
  Factive := Value;
end;

procedure TUser.setFcreated_at(const Value: TDAteTime);
begin
  Fcreated_at := Value;
end;

procedure TUser.setFid(const Value: Integer);
begin
  Fid := Value;
end;

procedure TUser.setFKind(const Value: String);
begin
  FKind := Value;
end;

procedure TUser.setFpassword(const Value: String);
begin
  Fpassword := Value;
end;

procedure TUser.setFSalt(const Value: String);
begin
  Fsalt := Value;
end;

procedure TUser.setFupdated_at(const Value: TDAteTime);
begin
  Fupdated_at := Value;
end;

procedure TUser.settb_device_id(const Value: Integer);
begin
  Ftb_device_id := Value;
end;

end.

