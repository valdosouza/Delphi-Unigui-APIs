unit prm_order_stock_adjust;

interface

uses System.SysUtils, tblOrder, tblOrderItem, tblOrderStockAdjust, tblOrderTotalizer,
  tblEntity,TypesCollection,prm_base;

type
  TPrmOrderStockAdjust = class(TPrmBase)
    private
    FEntidade: TEntity;
    FOrdemItens: TListOrdemItem;
    FOrdemAjuste: TOrderStockAdjust;
    FTotalizador: TOrderTotalizer;
    FOrdem: TOrder;
    procedure setFEntidade(const Value: TEntity);
    procedure setFOrdem(const Value: TOrder);
    procedure setFOrdemAjuste(const Value: TOrderStockAdjust);
    procedure setFOrdemItens(const Value: TListOrdemItem);
    procedure setFTotalizador(const Value: TOrderTotalizer);

    public
      constructor Create;Override;
      destructor Destroy;Override;
      property Ordem : TOrder read FOrdem write setFOrdem;
      property OrdemAjuste : TOrderStockAdjust read FOrdemAjuste write setFOrdemAjuste;
      property Entidade : TEntity read FEntidade write setFEntidade;
      property OrdemItens : TListOrdemItem read FOrdemItens write setFOrdemItens;
      property Totalizador : TOrderTotalizer read FTotalizador write setFTotalizador;
  end;
implementation

{ TPrmOrderSale }

constructor TPrmOrderStockAdjust.Create;
begin
  FOrdem := TOrder.Create;
  FOrdemAjuste := TOrderStockAdjust.Create;
  FEntidade := TEntity.Create;
  FOrdemItens := TListOrdemItem.Create;
  FTotalizador := TOrderTotalizer.Create;
end;

destructor TPrmOrderStockAdjust.Destroy;
begin
  FOrdem.DisposeOf;
  FOrdemAjuste.DisposeOf;
  FEntidade.DisposeOf;
  FOrdemItens.DisposeOf;
  FTotalizador.DisposeOf;
end;



procedure TPrmOrderStockAdjust.setFEntidade(const Value: TEntity);
begin
  FEntidade := Value;
end;

procedure TPrmOrderStockAdjust.setFOrdem(const Value: TOrder);
begin
  FOrdem := Value;
end;

procedure TPrmOrderStockAdjust.setFOrdemAjuste(const Value: TOrderStockAdjust);
begin
  FOrdemAjuste := Value;
end;

procedure TPrmOrderStockAdjust.setFOrdemItens(const Value: TListOrdemItem);
begin
  FOrdemItens := Value;
end;

procedure TPrmOrderStockAdjust.setFTotalizador(const Value: TOrderTotalizer);
begin
  FTotalizador := Value;
end;

end.
