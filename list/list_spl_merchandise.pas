unit list_spl_merchandise;

interface
type
  TListSplMerchandise = class
  private
    FPreco: Real;
    FDescricao: String;
    FCodigo: Integer;
    FEstoque: Real;
    FEmbalagem: String;
    procedure setFCodigo(const Value: Integer);
    procedure setFDescricao(const Value: String);
    procedure setFEmbalagem(const Value: String);
    procedure setFEstoque(const Value: Real);
    procedure setFPreco(const Value: Real);

   public
      property Codigo : Integer read FCodigo write setFCodigo;
      property Descricao : String Read FDescricao write setFDescricao;
      property Embalagem : String read FEmbalagem write setFEmbalagem;
      property Estoque : Real read FEstoque write setFEstoque;
      property Preco : Real read FPreco write setFPreco;
  end;

implementation

{ TListSplMerchandise }

procedure TListSplMerchandise.setFCodigo(const Value: Integer);
begin
  FCodigo := Value;
end;

procedure TListSplMerchandise.setFDescricao(const Value: String);
begin
  FDescricao := Value;
end;

procedure TListSplMerchandise.setFEmbalagem(const Value: String);
begin
  FEmbalagem := Value;
end;

procedure TListSplMerchandise.setFEstoque(const Value: Real);
begin
  FEstoque := Value;
end;

procedure TListSplMerchandise.setFPreco(const Value: Real);
begin
  FPreco := Value;
end;

end.

