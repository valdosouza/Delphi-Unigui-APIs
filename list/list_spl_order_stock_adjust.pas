unit list_spl_order_stock_adjust;

interface
type
  TListSplOrderStockAdjust = class
    private
    FDestinatario: String;
    FPedido: String;
    FCodigo: Integer;
    FValorPedido: Real;
    FData: TDate;
    procedure setFCodigo(const Value: Integer);
    procedure setFData(const Value: TDate);
    procedure setFDestinatario(const Value: String);
    procedure setFPedido(const Value: String);
    procedure setFValorPedido(const Value: Real);
    public
      property Codigo : Integer read FCodigo write setFCodigo;
      property Pedido : String Read FPedido write setFPedido;
      property Data : TDate read FData write setFData;
      property Destinatario : String read FDestinatario write setFDestinatario;
      property ValorPedido : Real read FValorPedido write setFValorPedido;
  end;

implementation

{ TListSplOrderStockAdjust }

procedure TListSplOrderStockAdjust.setFCodigo(const Value: Integer);
begin
  FCodigo := Value;
end;

procedure TListSplOrderStockAdjust.setFData(const Value: TDate);
begin
  FData := Value;
end;

procedure TListSplOrderStockAdjust.setFDestinatario(const Value: String);
begin
  FDestinatario := Value;
end;

procedure TListSplOrderStockAdjust.setFPedido(const Value: String);
begin
  FPedido := Value;
end;

procedure TListSplOrderStockAdjust.setFValorPedido(const Value: Real);
begin
  FValorPedido := Value;
end;

end.
