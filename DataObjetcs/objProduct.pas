unit objProduct;

interface

uses System.SysUtils, System.Generics.Collections,
      tblProduct,tblCategory,ObjPriceList;

Type

  TObjProduct = Class
  private
    FProduto: TProduct;
    FCategoria: TCategory;
    procedure setFCategoria(const Value: TCategory);
    procedure setFProduto(const Value: TProduct);

  public
      constructor Create;
      destructor Destroy;
      property Produto : TProduct read FProduto write setFProduto;
      property Categoria : TCategory read FCategoria write setFCategoria;
  End;

implementation

{ TObjProduct }

constructor TObjProduct.Create;
begin
  FProduto := TProduct.create;
  FCategoria := TCategory.create;
end;

destructor TObjProduct.Destroy;
begin
  {$IFDEF WIN32}
  FProduto.DisposeOf;
  FCategoria.DisposeOf;
  {$ENDIF }
end;

procedure TObjProduct.setFCategoria(const Value: TCategory);
begin
  FCategoria := Value;
end;

procedure TObjProduct.setFProduto(const Value: TProduct);
begin
  FProduto := Value;
end;

end.

