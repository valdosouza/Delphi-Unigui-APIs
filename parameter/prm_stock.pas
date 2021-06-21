unit prm_stock;

interface

uses System.SysUtils, tblStock, prm_base ;

Type
  TPrmStock = class(TPrmBase)
  private
    FEstoque: TStock;
    procedure setFEstoque(const Value: TStock);
  public
    constructor Create;override;
    destructor Destroy;override;
    property Estoque : TStock read FEstoque write setFEstoque;
  end;


implementation

{ TPrmStock }

constructor TPrmStock.Create;
begin
  inherited;
  FEstoque := TStock.Create;
  FEstoque.RegistroCriado := 0;
  FEstoque.RegistroAlterado := 0;

end;

destructor TPrmStock.Destroy;
begin
  FEstoque.DisposeOf;
  inherited;
end;

procedure TPrmStock.setFEstoque(const Value: TStock);
begin
  FEstoque := Value;
end;

end.
