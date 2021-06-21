unit list_spl_order_sale;

interface
type
  TListSplOrderSale = class
    private
    FNomeCliente: String;
    FPedido: String;
    FCodigo: Integer;
    FValorPedido: Real;
    FData: TDate;
    procedure setFCodigo(const Value: Integer);
    procedure setFData(const Value: TDate);
    procedure setFNomeCliente(const Value: String);
    procedure setFPedido(const Value: String);
    procedure setFValorPedido(const Value: Real);

    public
      property Codigo : Integer read FCodigo write setFCodigo;
      property Pedido : String Read FPedido write setFPedido;
      property Data : TDate read FData write setFData;
      property NomeCliente : String read FNomeCliente write setFNomeCliente;
      property ValorPedido : Real read FValorPedido write setFValorPedido;
  end;

implementation

{ TListSplOrderSale }

procedure TListSplOrderSale.setFCodigo(const Value: Integer);
begin
  FCodigo := Value;
end;

procedure TListSplOrderSale.setFData(const Value: TDate);
begin
  FData := Value;
end;

procedure TListSplOrderSale.setFNomeCliente(const Value: String);
begin
  FNomeCliente := Value;
end;

procedure TListSplOrderSale.setFPedido(const Value: String);
begin
  FPedido := Value;
end;

procedure TListSplOrderSale.setFValorPedido(const Value: Real);
begin
  FValorPedido := Value;
end;

end.
