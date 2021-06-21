unit prm_order_purchase;

interface

uses System.SysUtils, tblOrder, tblOrderItem, tblOrderSale, tblOrderTotalizer,
  tblEntity,TypesCollection, tblOrderPurchase,prm_base;

type
  TPrmOrderPurchase = class(TPrmBase)
    private
    FEntity: TEntity;
    FOrderItens: TOrderItem;
    FOrderPurchase: TOrderPurchase;
    FOrder: TOrder;
    procedure setFEntidade(const Value: TEntity);
    procedure setFOrder(const Value: TOrder);
    procedure setFOrderItens(const Value: TOrderItem);
    procedure setFOrderPurchase(const Value: TOrderPurchase);

    public
      constructor Create;Override;
      destructor Destroy;Override;
      property Ordem : TOrder read FOrder write setFOrder;
      property OrdemCompra : TOrderPurchase read FOrderPurchase write setFOrderPurchase;
      property Entidade : TEntity read FEntity write setFEntidade;
      property OrdemItens : TOrderItem read FOrderItens write setFOrderItens;
  end;
implementation

{ TPrmOrderPurchase }

constructor TPrmOrderPurchase.Create;
begin
  FOrder          := TOrder.Create;
  FOrderPurchase  := TOrderPurchase.Create;
  FEntity         := TEntity.Create;
  FOrderItens     := TOrderItem.Create;
end;

destructor TPrmOrderPurchase.Destroy;
begin
  FOrder.DisposeOf;
  FOrderPurchase.DisposeOf;
  FEntity.DisposeOf;
  FOrderItens.DisposeOf;
end;



procedure TPrmOrderPurchase.setFEntidade(const Value: TEntity);
begin
  FEntity := Value;
end;

procedure TPrmOrderPurchase.setFOrder(const Value: TOrder);
begin
  FOrder := Value;
end;

procedure TPrmOrderPurchase.setFOrderItens(const Value: TOrderItem);
begin
  FOrderItens := Value;
end;

procedure TPrmOrderPurchase.setFOrderPurchase(const Value: TOrderPurchase);
begin
  FOrderPurchase := Value;
end;

end.
