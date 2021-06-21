unit prm_price;

interface

uses System.SysUtils, prm_base,tblprice;

Type
  TPrmPrice = class(TPrmbase)
  private
    FPreco: TPrice;
    procedure setFPreco(const Value: TPrice);

  public
    constructor Create;Override;
    destructor Destroy;Override;
    property Preco: TPrice read FPreco write setFPreco;
  end;
implementation

{ TPrmPRice }

constructor TPrmPRice.Create;
begin
  inherited;
  FPreco := TPrice.Create;
  FPreco.RegistroCriado := 0;
  FPreco.RegistroAlterado := 0;

end;

destructor TPrmPRice.Destroy;
begin
  FPreco.DisposeOf;
  inherited;
end;

procedure TPrmPRice.setFPreco(const Value: TPrice);
begin
  FPreco := Value;
end;

end.
