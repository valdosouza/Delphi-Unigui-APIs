unit prm_product;

interface

uses TypesCollection, System.SysUtils, prm_base,tblproduct ;

Type
  TPrmProduct = class(TPrmBase)
  private
    FProduto: TProduct;
    FCodigoBarras: String;
    procedure setFProduto(const Value: TProduct);
    procedure setFCodigoBarras(const Value: String);
    public
      constructor Create;Override;
      destructor Destroy;Override;
      property Produto : TProduct read FProduto write setFProduto;
      property CodigoBarras : String read FCodigoBarras write setFCodigoBarras;
  end;

implementation

{ TPrmProduct }

constructor TPrmProduct.Create;
begin
  inherited;
  FProduto := TProduct.Create;
  FProduto.RegistroCriado := 0;
  FProduto.RegistroAlterado := 0;
end;

destructor TPrmProduct.Destroy;
begin
  Produto.DisposeOf;
  inherited;
end;

procedure TPrmProduct.setFCodigoBarras(const Value: String);
begin
  FCodigoBarras := Value;
end;

procedure TPrmProduct.setFProduto(const Value: TProduct);
begin
  FProduto := Value;
end;

end.
