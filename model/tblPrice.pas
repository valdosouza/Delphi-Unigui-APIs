unit tblPrice;


interface

Uses GenericEntity,CAtribEntity, Classes, SysUtils;
Type
  //nome da classe de entidade
  [TableName('tb_price')]
  TPrice = Class(TGenericEntity)
  private
    Fprice_tag: Real;
    Ftb_product_id: Integer;
    Faliq_kickback: Real;
    Fupdated_at: TDAteTime;
    Faliq_profit: Real;
    Fquantity: Real;
    Ftb_price_list_id: Integer;
    Ftb_institution_id: Integer;
    Fcreated_at: TDAteTime;
    procedure setFaliq_kickback(const Value: Real);
    procedure setFaliq_profit(const Value: Real);
    procedure setFcreated_at(const Value: TDAteTime);
    procedure setFprice_tag(const Value: Real);
    procedure setFquantity(const Value: Real);
    procedure setFtb_institution_id(const Value: Integer);
    procedure setFtb_price_list_id(const Value: Integer);
    procedure setFtb_product_id(const Value: Integer);
    procedure setFupdated_at(const Value: TDAteTime);

  public

    [FieldName('tb_institution_id')]
    [KeyField('tb_institution_id')]
    property Estabelecimento: Integer read Ftb_institution_id write setFtb_institution_id;

    [FieldName('tb_price_list_id')]
    [KeyField('tb_price_list_id')]
    property Tabela: Integer read Ftb_price_list_id write setFtb_price_list_id;

    [FieldName('tb_product_id')]
    [KeyField('tb_product_id')]
    property Produto: Integer read Ftb_product_id write setFtb_product_id;

    [FieldName('price_tag')]
    property Preco: Real read Fprice_tag write setFprice_tag;

    [FieldName('aliq_profit')]
    property MargemLucro: Real read Faliq_profit write setFaliq_profit;

    [FieldName('aliq_kickback')]
    property Comissao : Real read Faliq_kickback write setFaliq_kickback;

    [FieldName('quantity')]
    property Quantidade: Real read Fquantity write setFquantity;

    [FieldName('created_at')]
    property RegistroCriado: TDAteTime read Fcreated_at write setFcreated_at;

    [FieldName('updated_at')]
    property RegistroAlterado: TDAteTime read Fupdated_at write setFupdated_at;


  End;


implementation


{ TPrice }

procedure TPrice.setFaliq_kickback(const Value: Real);
begin
  Faliq_kickback := Value;
end;

procedure TPrice.setFaliq_profit(const Value: Real);
begin
  Faliq_profit := Value;
end;

procedure TPrice.setFcreated_at(const Value: TDAteTime);
begin
  Fcreated_at := Value;
end;

procedure TPrice.setFprice_tag(const Value: Real);
begin
  Fprice_tag := Value;
end;

procedure TPrice.setFquantity(const Value: Real);
begin
  Fquantity := Value;
end;

procedure TPrice.setFtb_institution_id(const Value: Integer);
begin
  Ftb_institution_id := Value;
end;

procedure TPrice.setFtb_price_list_id(const Value: Integer);
begin
  Ftb_price_list_id := Value;
end;

procedure TPrice.setFtb_product_id(const Value: Integer);
begin
  Ftb_product_id := Value;
end;

procedure TPrice.setFupdated_at(const Value: TDAteTime);
begin
  Fupdated_at := Value;
end;

end.
