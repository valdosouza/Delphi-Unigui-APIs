unit list_spl_order_items;

interface
type
  TListSplOrderItems = class
    private
    FProduto: Integer;
    FDescricao: String;
    FCodigo: Integer;
    FValorUnitario: Real;
    FValorSubTotal: Real;
    FQtde: Real;
    FEstabelecimento: Integer;
    FOrdem: Integer;
    FTerminal: Integer;
    procedure setFCodigo(const Value: Integer);
    procedure setFDescricao(const Value: String);
    procedure setFProduto(const Value: Integer);
    procedure setFQtde(const Value: Real);
    procedure setFValorSubTotal(const Value: Real);
    procedure setFValorUnitario(const Value: Real);
    procedure setFEstabelecimento(const Value: Integer);
    procedure setFOrdem(const Value: Integer);
    procedure setFTerminal(const Value: Integer);


   public
      property Estabelecimento : Integer read FEstabelecimento write setFEstabelecimento;
      property Terminal : Integer read FTerminal write setFTerminal;
      property Ordem : Integer read FOrdem write setFOrdem;
      property Codigo : Integer read FCodigo write setFCodigo;
      property Produto : Integer read FProduto write setFProduto;
      property Descricao : String Read FDescricao write setFDescricao;
      property Qtde : Real read FQtde write setFQtde;
      property ValorUnitario : Real read FValorUnitario write setFValorUnitario;
      property ValorSubTotal : Real read FValorSubTotal write setFValorSubTotal;
  end;


implementation

{ TListSplOrderItems }

procedure TListSplOrderItems.setFCodigo(const Value: Integer);
begin
  FCodigo := Value;
end;

procedure TListSplOrderItems.setFDescricao(const Value: String);
begin
  FDescricao := Value;
end;

procedure TListSplOrderItems.setFEstabelecimento(const Value: Integer);
begin
  FEstabelecimento := Value;
end;

procedure TListSplOrderItems.setFOrdem(const Value: Integer);
begin
  FOrdem := Value;
end;

procedure TListSplOrderItems.setFProduto(const Value: Integer);
begin
  FProduto := Value;
end;

procedure TListSplOrderItems.setFQtde(const Value: Real);
begin
  FQtde := Value;
end;

procedure TListSplOrderItems.setFTerminal(const Value: Integer);
begin
  FTerminal := Value;
end;

procedure TListSplOrderItems.setFValorSubTotal(const Value: Real);
begin
  FValorSubTotal := Value;
end;

procedure TListSplOrderItems.setFValorUnitario(const Value: Real);
begin
  FValorUnitario := Value;
end;

end.
