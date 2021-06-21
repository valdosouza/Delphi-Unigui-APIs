unit tblInterfaceHasPrivilege;

interface

Uses GenericEntity,GenericDao,CAtribEntity, System.Classes, System.SysUtils;

Type
  //nome da classe de entidade
  [TableName('tb_interface_has_privilege')]
  TInterfaceHasPrivilege = Class(TGenericEntity)
  private
    Factive: String;
    Fupdated_at: TDAteTime;
    Ftb_interface_id: Integer;
    Fcreated_at: TDAteTime;
    Ftb_privilege_id: Integer;
    procedure setFactive(const Value: String);
    procedure setFcreated_at(const Value: TDAteTime);
    procedure setFtb_interface_id(const Value: Integer);
    procedure setFtb_privilege_id(const Value: Integer);
    procedure setFupdated_at(const Value: TDAteTime);


  public

    [FieldName('tb_interface_id')]
    [KeyField('tb_interface_id')]
    property CodigoInterface: Integer read Ftb_interface_id write setFtb_interface_id;

    [FieldName('tb_privilege_id')]
    [KeyField('tb_privilege_id')]
    property CodigoPrivilegio: Integer read Ftb_privilege_id write setFtb_privilege_id;

    [FieldName('active')]
    property Ativo: String read Factive write setFactive;

    [FieldName('created_at')]
    property RegistroCriado: TDAteTime read Fcreated_at write setFcreated_at;

    [FieldName('updated_at')]
    property RegistroAlterado: TDAteTime read Fupdated_at write setFupdated_at;
  End;
implementation

{ TInterfaceHasPrivilege }

procedure TInterfaceHasPrivilege.setFactive(const Value: String);
begin
  Factive := Value;
end;

procedure TInterfaceHasPrivilege.setFcreated_at(const Value: TDAteTime);
begin
  Fcreated_at := Value;
end;

procedure TInterfaceHasPrivilege.setFtb_interface_id(const Value: Integer);
begin
  Ftb_interface_id := Value;
end;

procedure TInterfaceHasPrivilege.setFtb_privilege_id(const Value: Integer);
begin
  Ftb_privilege_id := Value;
end;

procedure TInterfaceHasPrivilege.setFupdated_at(const Value: TDAteTime);
begin
  Fupdated_at := Value;
end;

end.
