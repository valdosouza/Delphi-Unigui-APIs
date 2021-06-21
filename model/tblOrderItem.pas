unit tblOrderItem;

interface

Uses GenericEntity,CAtribEntity, Classes, SysUtils;
Type
  //nome da classe de entidade
  [TableName('tb_order_item')]
  TOrderItem = Class(TGenericEntity)
  private
    Ftb_product_id: Integer;
    Fdiscount_value: Real;
    FId: Integer;
    Ftb_stock_list_id: Integer;
    Fupdated_at: TDAteTime;
    Fqtty: Real;
    Fdiscount_aliquot: Real;
    Ftb_institution_id: Integer;
    Funit_value: Real;
    Ftb_order_id: Integer;
    Fcreated_at: TDAteTime;
    Fterminal: Integer;
    Ftb_price_list_id: Integer;
    procedure setFcreated_at(const Value: TDAteTime);
    procedure setFdiscount_aliquot(const Value: Real);
    procedure setFdiscount_value(const Value: Real);
    procedure setFId(const Value: Integer);
    procedure setFqtty(const Value: Real);
    procedure setFtb_institution_id(const Value: Integer);
    procedure setFtb_order_id(const Value: Integer);
    procedure setFtb_product_id(const Value: Integer);
    procedure setFtb_stock_list_id(const Value: Integer);
    procedure setFunit_value(const Value: Real);
    procedure setFupdated_at(const Value: TDAteTime);
    procedure setFterminal(const Value: Integer);
    procedure setFtb_price_list_id(const Value: Integer);


  public
    [FieldName('id')]
    [KeyField('id')]
    property Codigo: Integer read FId write setFId;

    [FieldName('tb_institution_id')]
    [KeyField('tb_institution_id')]
    property Estabelecimento: Integer read Ftb_institution_id write setFtb_institution_id;

    [FieldName('tb_order_id')]
    [KeyField('tb_order_id')]
    property Ordem: Integer read Ftb_order_id write setFtb_order_id;

    [FieldName('terminal')]
    [KeyField('terminal')]
    property Terminal: Integer read Fterminal write setFterminal;

    [FieldName('tb_product_id')]
    property Produto: Integer read Ftb_product_id write setFtb_product_id;

    [FieldName('tb_stock_list_id')]
    property Estoque: Integer read Ftb_stock_list_id write setFtb_stock_list_id;

    [FieldName('tb_price_list_id')]
    property TabelaPreco: Integer read Ftb_price_list_id write setFtb_price_list_id;

    [FieldName('quantity')]
    property Quantidade: Real read Fqtty write setFqtty;

    [FieldName('unit_value')]
    property ValorUnitario: Real read Funit_value write setFunit_value;

    [FieldName('discount_aliquot')]
    property AliquotaDesconto: Real read Fdiscount_aliquot write setFdiscount_aliquot;

    [FieldName('discount_value')]
    property ValorDesconto: Real read Fdiscount_value write setFdiscount_value;

    [FieldName('created_at')]
    property RegistroCriado: TDAteTime read Fcreated_at write setFcreated_at;

    [FieldName('updated_at')]
    property RegistroAlterado: TDAteTime read Fupdated_at write setFupdated_at;

  End;


implementation


{ TOrderItem }

procedure TOrderItem.setFcreated_at(const Value: TDAteTime);
begin
  Fcreated_at := Value;
end;

procedure TOrderItem.setFdiscount_aliquot(const Value: Real);
begin
  Fdiscount_aliquot := Value;
end;

procedure TOrderItem.setFdiscount_value(const Value: Real);
begin
  Fdiscount_value := Value;
end;

procedure TOrderItem.setFId(const Value: Integer);
begin
  FId := Value;
end;

procedure TOrderItem.setFqtty(const Value: Real);
begin
  Fqtty := Value;
end;

procedure TOrderItem.setFtb_institution_id(const Value: Integer);
begin
  Ftb_institution_id := Value;
end;

procedure TOrderItem.setFtb_order_id(const Value: Integer);
begin
  Ftb_order_id := Value;
end;

procedure TOrderItem.setFtb_price_list_id(const Value: Integer);
begin
  Ftb_price_list_id := Value;
end;

procedure TOrderItem.setFtb_product_id(const Value: Integer);
begin
  Ftb_product_id := Value;
end;

procedure TOrderItem.setFtb_stock_list_id(const Value: Integer);
begin
  Ftb_stock_list_id := Value;
end;

procedure TOrderItem.setFterminal(const Value: Integer);
begin
  Fterminal := Value;
end;

procedure TOrderItem.setFunit_value(const Value: Real);
begin
  Funit_value := Value;
end;

procedure TOrderItem.setFupdated_at(const Value: TDAteTime);
begin
  Fupdated_at := Value;
end;

end.
