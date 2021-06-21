unit tblCheckOutItems;

interface

Uses GenericEntity,GenericDao,CAtribEntity;

Type
  //nome da classe de entidade
  [TableName('tb_check_out_items')]
  TCheckOutItems = Class(TGenericEntity)
  private
    Ftb_order_id: Integer;
    Fpromo_price: REal;
    Fpromo_id: Integer;
    Fcost_price: Real;
    Ftb_product_id: Integer;
    FID: Integer;
    Funit_value: Real;
    Fpromo_qtde: REal;
    Fncm: String;
    Fidentifier: String;
    Fdesc_measure: String;
    Fquantity: Real;
    Ftb_institution_id: Integer;
    Fpromo_orig_price: REal;
    Fdesc_product: String;
    Fsource: String;
    procedure setFcost_price(const Value: Real);
    procedure setFdesc_measure(const Value: String);
    procedure setFdesc_product(const Value: String);
    procedure setFID(const Value: Integer);
    procedure setFidentifier(const Value: String);
    procedure setFncm(const Value: String);
    procedure setFpromo_id(const Value: Integer);
    procedure setFpromo_orig_price(const Value: REal);
    procedure setFpromo_price(const Value: REal);
    procedure setFpromo_qtde(const Value: REal);
    procedure setFquantity(const Value: Real);
    procedure setFsource(const Value: String);
    procedure setFtb_institution_id(const Value: Integer);
    procedure setFtb_order_id(const Value: Integer);
    procedure setFtb_product_id(const Value: Integer);
    procedure setFunit_value(const Value: Real);
  public
    [KeyField('id')]
    [FieldName('id')]
    property Codigo: Integer read FID write setFID;

    [KeyField('tb_institution_id')]
    [FieldName('tb_institution_id')]
    property Estabelecimento: Integer read Ftb_institution_id write setFtb_institution_id;

    [KeyField('tb_order_id')]
    [FieldName('tb_order_id')]
    property Pedido: Integer read Ftb_order_id write setFtb_order_id;

    [FieldName('tb_product_id')]
    property CodigoProduto: Integer read Ftb_product_id write setFtb_product_id;

    [FieldName('desc_measure')]
    property Unidade: String read Fdesc_measure write setFdesc_measure;

    [FieldName('desc_product')]
    property DescProduto: String read Fdesc_product write setFdesc_product;

    [FieldName('quantity')]
    property Quantidade: Real read Fquantity write setFquantity;

    [FieldName('unit_value')]
    property ValorUnitario: Real read Funit_value write setFunit_value;

    [FieldName('identifier')]
    property CodigoFabrica: String read Fidentifier write setFidentifier;

    [FieldName('cost_price')]
    property PrecoCusto: Real read Fcost_price write setFcost_price;

    [FieldName('ncm')]
    property NCM: String read Fncm write setFncm;

    [FieldName('source')]
    property Origem: String read Fsource write setFsource;

    [FieldName('promo_id')]
    property PromoCodigo: Integer read Fpromo_id write setFpromo_id;

    [FieldName('promo_qtde')]
    property PromoQtde: REal read Fpromo_qtde write setFpromo_qtde;

    [FieldName('promo_price')]
    property PromoPreco: REal read Fpromo_price write setFpromo_price;

    [FieldName('promo_orig_price')]
    property PromoOriginal: REal read Fpromo_orig_price write setFpromo_orig_price;

  End;

implementation

{ TCheckOutItems }

procedure TCheckOutItems.setFcost_price(const Value: Real);
begin
  Fcost_price := Value;
end;

procedure TCheckOutItems.setFdesc_measure(const Value: String);
begin
  Fdesc_measure := Value;
end;

procedure TCheckOutItems.setFdesc_product(const Value: String);
begin
  Fdesc_product := Value;
end;

procedure TCheckOutItems.setFID(const Value: Integer);
begin
  FID := Value;
end;

procedure TCheckOutItems.setFidentifier(const Value: String);
begin
  Fidentifier := Value;
end;

procedure TCheckOutItems.setFncm(const Value: String);
begin
  Fncm := Value;
end;

procedure TCheckOutItems.setFpromo_id(const Value: Integer);
begin
  Fpromo_id := Value;
end;

procedure TCheckOutItems.setFpromo_orig_price(const Value: REal);
begin
  Fpromo_orig_price := Value;
end;

procedure TCheckOutItems.setFpromo_price(const Value: REal);
begin
  Fpromo_price := Value;
end;

procedure TCheckOutItems.setFpromo_qtde(const Value: REal);
begin
  Fpromo_qtde := Value;
end;

procedure TCheckOutItems.setFquantity(const Value: Real);
begin
  Fquantity := Value;
end;

procedure TCheckOutItems.setFsource(const Value: String);
begin
  Fsource := Value;
end;

procedure TCheckOutItems.setFtb_institution_id(const Value: Integer);
begin
  Ftb_institution_id := Value;
end;

procedure TCheckOutItems.setFtb_order_id(const Value: Integer);
begin
  Ftb_order_id := Value;
end;

procedure TCheckOutItems.setFtb_product_id(const Value: Integer);
begin
  Ftb_product_id := Value;
end;

procedure TCheckOutItems.setFunit_value(const Value: Real);
begin
  Funit_value := Value;
end;

end.
