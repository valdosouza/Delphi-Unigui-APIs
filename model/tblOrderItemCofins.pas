unit tblOrderItemCofins;

interface

Uses GenericEntity,CAtribEntity;

Type
  //nome da classe de entidade
  [TableName('tb_order_item_cofins')]
  TOrderItemCofins = Class(TGenericEntity)
  private
    Ftag_value: Real;
    Fupdated_at: TDatetime;
    Ftb_order_item_id: Integer;
    Ftb_institution_id: Integer;
    Faliq_value: Real;
    Fqt_aliq_value: Real;
    Fbase_value: Real;
    Fqt_sale_qtty: Real;
    Ftb_tax_cofins_id: String;
    Fcreated_at: TDatetime;
    Ftb_order_id: Integer;
    Fterminal: Integer;
    procedure setFaliq_value(const Value: Real);
    procedure setFbase_value(const Value: Real);
    procedure setFcreated_at(const Value: TDatetime);
    procedure setFqt_aliq_value(const Value: Real);
    procedure setFqt_sale_qtty(const Value: Real);
    procedure setFtag_value(const Value: Real);
    procedure setFtb_institution_id(const Value: Integer);
    procedure setFtb_order_item_id(const Value: Integer);
    procedure setFtb_tax_cofins_id(const Value: String);
    procedure setFupdated_at(const Value: TDatetime);
    procedure setFtb_order_id(const Value: Integer);
    procedure setFterminal(const Value: Integer);


  public
    [KeyField('tb_order_item_id')]
    [FieldName('tb_order_item_id')]
    property ItemOrdem: Integer read Ftb_order_item_id write setFtb_order_item_id;

    [KeyField('tb_order_id')]
    [FieldName('tb_order_id')]
    property Ordem: Integer read Ftb_order_id write setFtb_order_id;

    [KeyField('tb_institution_id')]
    [FieldName('tb_institution_id')]
    property Estabelecimento: Integer read Ftb_institution_id write setFtb_institution_id;

    [FieldName('terminal')]
    [KeyField('terminal')]
    property Terminal: Integer read Fterminal write setFterminal;

    [FieldName('cst')]
    property Cst: String read Ftb_tax_cofins_id write setFtb_tax_cofins_id;

    [FieldName('base_value')]
    property ValorBase: Real read Fbase_value write setFbase_value;

    [FieldName('aliq_value')]
    property Aliquota: Real read Faliq_value write setFaliq_value;

    [FieldName('tag_value')]
    property Valor: Real read Ftag_value write setFtag_value;

	  [FieldName('qt_sale_qtty')]
    property QuantVendas: Real read Fqt_sale_qtty write setFqt_sale_qtty;

	  [FieldName('qt_aliq_value')]
    property QuantValorAliquota: Real read Fqt_aliq_value write setFqt_aliq_value;

    [FieldName('created_at')]
    property RegistroCriado: TDatetime read Fcreated_at write setFcreated_at;

	  [FieldName('updated_at')]
    property RegistroAlterado: TDatetime read Fupdated_at write setFupdated_at;

	End;

implementation

{ TOrderItemCofins }

procedure TOrderItemCofins.setFaliq_value(const Value: Real);
begin
  Faliq_value := Value;
end;

procedure TOrderItemCofins.setFbase_value(const Value: Real);
begin
  Fbase_value := Value;
end;

procedure TOrderItemCofins.setFcreated_at(const Value: TDatetime);
begin
  Fcreated_at := Value;
end;

procedure TOrderItemCofins.setFqt_aliq_value(const Value: Real);
begin
  Fqt_aliq_value := Value;
end;

procedure TOrderItemCofins.setFqt_sale_qtty(const Value: Real);
begin
  Fqt_sale_qtty := Value;
end;

procedure TOrderItemCofins.setFtag_value(const Value: Real);
begin
  Ftag_value := Value;
end;

procedure TOrderItemCofins.setFtb_institution_id(const Value: Integer);
begin
  Ftb_institution_id := Value;
end;

procedure TOrderItemCofins.setFtb_order_id(const Value: Integer);
begin
  Ftb_order_id := Value;
end;

procedure TOrderItemCofins.setFtb_order_item_id(const Value: Integer);
begin
  Ftb_order_item_id := Value;
end;

procedure TOrderItemCofins.setFtb_tax_cofins_id(const Value: String);
begin
  Ftb_tax_cofins_id := Value;
end;

procedure TOrderItemCofins.setFterminal(const Value: Integer);
begin
  Fterminal := Value;
end;

procedure TOrderItemCofins.setFupdated_at(const Value: TDatetime);
begin
  Fupdated_at := Value;
end;

end.
