unit prm_order_sale;

interface

uses System.SysUtils, tblOrder, tblOrderItem, tblOrderSale, tblOrderTotalizer,
  tblEntity,TypesCollection,prm_base;

type
  TPrmOrderSale = class(TPrmBase)
    private
    FEntidade: TEntity;
    FOrdemItens: TOrderItem;
    FOrdem: TOrder;
    FOrdemVenda: TOrderSale;
    procedure setFEntidade(const Value: TEntity);
    procedure setFOrdem(const Value: TOrder);
    procedure setFOrdemItens(const Value: TOrderItem);
    procedure setFOrdemVenda(const Value: TOrderSale);


    public
      constructor Create;Override;
      destructor Destroy;Override;
      property Ordem        : TOrder read FOrdem write setFOrdem;
      property OrdemVenda   : TOrderSale read FOrdemVenda write setFOrdemVenda;
      property Entidade     : TEntity read FEntidade write setFEntidade;
      property OrdemItens   : TOrderItem read FOrdemItens write setFOrdemItens;
  end;
implementation

{ TPrmOrderSale }

constructor TPrmOrderSale.Create;
begin
  FOrdem := TOrder.Create;
  FOrdem.RegistroCriado := 0;
  FOrdem.RegistroAlterado := 0;

  FOrdemVenda := TOrderSale.Create;
  FOrdemVenda.RegistroCriado := 0;
  FOrdemVenda.RegistroAlterado := 0;

  FEntidade := TEntity.Create;
  FEntidade.RegistroCriado := 0;
  FEntidade.RegistroAlterado := 0;

  FOrdemItens := TOrderItem.Create;
  FOrdemItens.RegistroCriado := 0;
  FOrdemItens.RegistroAlterado := 0;

end;

destructor TPrmOrderSale.Destroy;
begin
  FOrdem.DisposeOf;
  FOrdemVenda.DisposeOf;
  FEntidade.DisposeOf;
  FOrdemItens.DisposeOf;
end;

procedure TPrmOrderSale.setFEntidade(const Value: TEntity);
begin
  FEntidade := Value;
end;

procedure TPrmOrderSale.setFOrdem(const Value: TOrder);
begin
  FOrdem := Value;
end;

procedure TPrmOrderSale.setFOrdemItens(const Value: TOrderItem);
begin
  FOrdemItens := Value;
end;

procedure TPrmOrderSale.setFOrdemVenda(const Value: TOrderSale);
begin
  FOrdemVenda := Value;
end;

end.
