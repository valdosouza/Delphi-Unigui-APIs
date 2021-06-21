unit tblModuleHasInterface;

interface

Uses GenericEntity,GenericDao,CAtribEntity, System.Classes, System.SysUtils;

Type
  //nome da classe de entidade
  [TableName('tb_module_has_interface')]
  TModuleHasInterface = Class(TGenericEntity)
  private
    Factive: String;
    Ftb_modules_id: Integer;
    Fupdated_at: TDAteTime;
    Ftb_interfaces_id: Integer;
    Fcreated_at: TDAteTime;
    procedure setFactive(const Value: String);
    procedure setFcreated_at(const Value: TDAteTime);
    procedure setFtb_interfaces_id(const Value: Integer);
    procedure setFtb_modules_id(const Value: Integer);
    procedure setFupdated_at(const Value: TDAteTime);

  public
    [FieldName('tb_module_id')]
    [KeyField('tb_module_id')]
    property CodigoModulo: Integer read Ftb_modules_id write setFtb_modules_id;

    [FieldName('tb_interface_id')]
    [KeyField('tb_interface_id')]
    property CodigoInterface: Integer read Ftb_interfaces_id write setFtb_interfaces_id;

    [FieldName('active')]
    property Ativo: String read Factive write setFactive;

    [FieldName('created_at')]
    property RegistroCriado: TDAteTime read Fcreated_at write setFcreated_at;

    [FieldName('updated_at')]
    property RegistroAlterado: TDAteTime read Fupdated_at write setFupdated_at;

  End;
implementation



{ TModuleHasInterface }

procedure TModuleHasInterface.setFactive(const Value: String);
begin
  Factive := Value;
end;

procedure TModuleHasInterface.setFcreated_at(const Value: TDAteTime);
begin
  Fcreated_at := Value;
end;

procedure TModuleHasInterface.setFtb_interfaces_id(const Value: Integer);
begin
  Ftb_interfaces_id := Value;
end;

procedure TModuleHasInterface.setFtb_modules_id(const Value: Integer);
begin
  Ftb_modules_id := Value;
end;

procedure TModuleHasInterface.setFupdated_at(const Value: TDAteTime);
begin
  Fupdated_at := Value;
end;

end.
