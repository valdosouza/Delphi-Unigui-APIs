unit tblCommand;

interface

Uses GenericEntity,GenericDao,CAtribEntity;

Type
  //nome da classe de entidade
  [TableName('tb_command')]
  TCommand = Class(TGenericEntity)
  private
    Fdt_record: TDateTime;
    Fcontrol_name: String;
    Ftb_order_id: Integer;
    Fcontrol_id: String;
    Ftb_institution_id: Integer;
    Fcontrol_phone: String;
    procedure setFcontrol_id(const Value: String);
    procedure setFcontrol_name(const Value: String);
    procedure setFcontrol_phone(const Value: String);
    procedure setFdt_record(const Value: TDateTime);
    procedure setFtb_institution_id(const Value: Integer);
    procedure setFtb_order_id(const Value: Integer);
  public
    [KeyField('tb_institution_id')]
    [FieldName('tb_institution_id')]
    property Estabelecimento: Integer read Ftb_institution_id write setFtb_institution_id;

    [KeyField('tb_order_id')]
    [FieldName('tb_order_id')]
    property Pedido: Integer read Ftb_order_id write setFtb_order_id;

    [FieldName('dt_record')]
    property DataRegistro: TDateTime read Fdt_record write setFdt_record;

    [FieldName('control_id')]
    property Numero: String read Fcontrol_id write setFcontrol_id;

    [FieldName('control_name')]
    property NomeCliente: String read Fcontrol_name write setFcontrol_name;

    [FieldName('control_phone')]
    property Telefone: String read Fcontrol_phone write setFcontrol_phone;

  End;

implementation

{ TCommand }

procedure TCommand.setFcontrol_id(const Value: String);
begin
  Fcontrol_id := Value;
end;

procedure TCommand.setFcontrol_name(const Value: String);
begin
  Fcontrol_name := Value;
end;

procedure TCommand.setFcontrol_phone(const Value: String);
begin
  Fcontrol_phone := Value;
end;

procedure TCommand.setFdt_record(const Value: TDateTime);
begin
  Fdt_record := Value;
end;

procedure TCommand.setFtb_institution_id(const Value: Integer);
begin
  Ftb_institution_id := Value;
end;

procedure TCommand.setFtb_order_id(const Value: Integer);
begin
  Ftb_order_id := Value;
end;

end.
