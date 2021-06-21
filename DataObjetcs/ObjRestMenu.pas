unit ObjRestMenu;

interface

uses System.SysUtils, System.Generics.Collections,
     objbase, tblRestMenu, tblRestMenuHasProduct;

Type
  TListHasProduct = TObjectList<TRestMenuHasProduct>;
  TObjRestMenu = Class(TObjBase)
    private
    FProduto: TListHasProduct;
    FRestMenu: TRestMenu;
    procedure setFProduto(const Value: TListHasProduct);
    procedure setFRestMenu(const Value: TRestMenu);

    public
    constructor Create;override;
    destructor Destroy;override;
    procedure Clear;
    property RestMenu : TRestMenu read FRestMenu write setFRestMenu;
    property Produto : TListHasProduct read FProduto write setFProduto;

  End;

implementation

{ TObjRestMenu }

procedure TObjRestMenu.Clear;
begin
  FProduto.Clear;
end;

constructor TObjRestMenu.Create;
begin
  inherited;
  RestMenu  := TRestMenu.Create;
  Produto   := TListHasProduct.Create;

end;

destructor TObjRestMenu.Destroy;
begin
  RestMenu.DisposeOf;
  Produto.DisposeOf;
  inherited;
end;

procedure TObjRestMenu.setFProduto(const Value: TListHasProduct);
begin
  FProduto := Value;
end;

procedure TObjRestMenu.setFRestMenu(const Value: TRestMenu);
begin
  FRestMenu := Value;
end;

end.
