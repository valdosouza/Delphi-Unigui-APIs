unit list_spl_order_purchase;

interface
type
  TListSplOrderPurchase = class
    private
    FPedido: String;
    FCodigo: Integer;
    FValorPedido: Real;
    FNomeFornecedor: String;
    FData: TDate;
    procedure setFCodigo(const Value: Integer);
    procedure setFData(const Value: TDate);
    procedure setFNomeFornecedor(const Value: String);
    procedure setFPedido(const Value: String);
    procedure setFValorPedido(const Value: Real);


    public
      property Codigo : Integer read FCodigo write setFCodigo;
      property Pedido : String Read FPedido write setFPedido;
      property Data : TDate read FData write setFData;
      property NomeFornecedor : String read FNomeFornecedor write setFNomeFornecedor;
      property ValorPedido : Real read FValorPedido write setFValorPedido;
  end;

implementation

{ TListSplOrderPurchase }

procedure TListSplOrderPurchase.setFCodigo(const Value: Integer);
begin
  FCodigo := Value;
end;

procedure TListSplOrderPurchase.setFData(const Value: TDate);
begin
  FData := Value;
end;

procedure TListSplOrderPurchase.setFNomeFornecedor(const Value: String);
begin
  FNomeFornecedor := Value;
end;

procedure TListSplOrderPurchase.setFPedido(const Value: String);
begin
  FPedido := Value;
end;

procedure TListSplOrderPurchase.setFValorPedido(const Value: Real);
begin
  FValorPedido := Value;
end;

end.
