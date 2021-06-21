unit prm_print_product;

interface
uses prm_base_report;

Type
  TPrmPrintProduct = Class(TPrmBaseReport)
  private
    FEstoque: Integer;
    FCategoria: Integer;
    procedure setFCategoria(const Value: Integer);
    procedure setFEstoque(const Value: Integer);

  public
    property Estoque: Integer read FEstoque write setFEstoque;
    property Categoria: Integer read FCategoria write setFCategoria;
  End;

implementation

{ TPrmPrintProduct }

procedure TPrmPrintProduct.setFCategoria(const Value: Integer);
begin
  FCategoria := Value;
end;

procedure TPrmPrintProduct.setFEstoque(const Value: Integer);
begin
  FEstoque := Value;
end;

end.
