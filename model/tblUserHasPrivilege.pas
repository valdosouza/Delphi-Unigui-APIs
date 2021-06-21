unit tblUserHasPrivilege;

interface

Uses GenericEntity,GenericDao,CAtribEntity, System.Classes, System.SysUtils;

Type
  //nome da classe de entidade
  [TableName('tb_user_has_privilege')]
  TUserHasPrivilege = Class(TGenericEntity)
  private
    Factive: String;
    Ftb_interface_id: Integer;
    Fupdated_at: TDAteTime;
    Ftb_privilege_id: Integer;
    Ftb_institution_id: Integer;
    Ftb_user_id: Integer;
    Fcreated_at: TDAteTime;
    procedure setFactive(const Value: String);
    procedure setFcreated_at(const Value: TDAteTime);
    procedure setFtb_institution_id(const Value: Integer);
    procedure setFtb_interface_id(const Value: Integer);
    procedure setFtb_privilege_id(const Value: Integer);
    procedure setFtb_user_id(const Value: Integer);
    procedure setFupdated_at(const Value: TDAteTime);

  public

    [FieldName('tb_institution_id')]
    [KeyField('tb_institution_id')]
    property Estabelecimento: Integer read Ftb_institution_id write setFtb_institution_id;

    [FieldName('tb_user_id')]
    [KeyField('tb_user_id')]
    property Usuario: Integer read Ftb_user_id write setFtb_user_id;

    [FieldName('tb_interface_id')]
    [KeyField('tb_interface_id')]
    property TelaInterface: Integer read Ftb_interface_id write setFtb_interface_id;

    [FieldName('tb_privilege_id')]
    [KeyField('tb_privilege_id')]
    property Privilegio: Integer read Ftb_privilege_id write setFtb_privilege_id;

    [FieldName('active')]
    property Ativo: String read Factive write setFactive;

    [FieldName('created_at')]
    property RegistroCriado: TDAteTime read Fcreated_at write setFcreated_at;

    [FieldName('updated_at')]
    property RegistroAlterado: TDAteTime read Fupdated_at write setFupdated_at;
  End;
implementation


{ TUserHasPrivilege }

procedure TUserHasPrivilege.setFactive(const Value: String);
begin
  Factive := Value;
end;

procedure TUserHasPrivilege.setFcreated_at(const Value: TDAteTime);
begin
  Fcreated_at := Value;
end;

procedure TUserHasPrivilege.setFtb_institution_id(const Value: Integer);
begin
  Ftb_institution_id := Value;
end;

procedure TUserHasPrivilege.setFtb_interface_id(const Value: Integer);
begin
  Ftb_interface_id := Value;
end;

procedure TUserHasPrivilege.setFtb_privilege_id(const Value: Integer);
begin
  Ftb_privilege_id := Value;
end;

procedure TUserHasPrivilege.setFtb_user_id(const Value: Integer);
begin
  Ftb_user_id := Value;
end;

procedure TUserHasPrivilege.setFupdated_at(const Value: TDAteTime);
begin
  Fupdated_at := Value;
end;

end.
