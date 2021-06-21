unit tblOrderConsignmentOperation;

interface

Uses GenericEntity,CAtribEntity, System.Classes, System.SysUtils;
Type
  //nome da classe de entidade
  [TableName('TB_ORDER_CONSIGNMENT_OPERATION')]
  TOrderConsignmentOperation = Class(TGenericEntity)
  private
    Fupdated_at: TDAteTime;
    Ftb_order_item_id: Integer;
    Ftb_institution_id: Integer;
    Fkind: String;
    Ftb_order_id: Integer;
    Fterminal: Integer;
    Fdt_record: TDateTime;
    Fcreated_at: TDAteTime;
    procedure setFcreated_at(const Value: TDAteTime);
    procedure setFdt_record(const Value: TDateTime);
    procedure setFkind(const Value: String);
    procedure setFtb_institution_id(const Value: Integer);
    procedure setFtb_order_id(const Value: Integer);
    procedure setFtb_order_item_id(const Value: Integer);
    procedure setFterminal(const Value: Integer);
    procedure setFupdated_at(const Value: TDAteTime);

  Public

    [FieldName('tb_order_item_id')]
    [KeyField('tb_order_item_id')]
    property ItemOrdem: Integer read Ftb_order_item_id write setFtb_order_item_id;

    [KeyField('tb_institution_id')]
    [FieldName('tb_institution_id')]
    property Estabelecimento: Integer read Ftb_institution_id write setFtb_institution_id;

    [KeyField('terminal')]
    [FieldName('terminal')]
    property Terminal: Integer read Fterminal write setFterminal;

    [KeyField('tb_order_id')]
    [FieldName('tb_order_id')]
    property Ordem: Integer read Ftb_order_id write setFtb_order_id;

    [FieldName('dt_record')]
    property Data: TDateTime read Fdt_record write setFdt_record;

    [FieldName('kind')]
    property Tipo: String read Fkind write setFkind;

    [FieldName('created_at')]
    property RegistroCriado: TDAteTime read Fcreated_at write setFcreated_at;

    [FieldName('updated_at')]
    property RegistroAlterado: TDAteTime read Fupdated_at write setFupdated_at;


  End;
implementation



{ TOrderConsignmentOperation }

procedure TOrderConsignmentOperation.setFcreated_at(const Value: TDAteTime);
begin
  Fcreated_at := Value;
end;

procedure TOrderConsignmentOperation.setFdt_record(const Value: TDateTime);
begin
  Fdt_record := Value;
end;

procedure TOrderConsignmentOperation.setFkind(const Value: String);
begin
  Fkind := Value;
end;

procedure TOrderConsignmentOperation.setFtb_institution_id(
  const Value: Integer);
begin
  Ftb_institution_id := Value;
end;

procedure TOrderConsignmentOperation.setFtb_order_id(const Value: Integer);
begin
  Ftb_order_id := Value;
end;

procedure TOrderConsignmentOperation.setFtb_order_item_id(const Value: Integer);
begin
  Ftb_order_item_id := Value;
end;

procedure TOrderConsignmentOperation.setFterminal(const Value: Integer);
begin
  Fterminal := Value;
end;

procedure TOrderConsignmentOperation.setFupdated_at(const Value: TDAteTime);
begin
  Fupdated_at := Value;
end;

end.
