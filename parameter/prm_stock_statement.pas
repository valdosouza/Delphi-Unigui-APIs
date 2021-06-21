unit prm_stock_statement;

interface

uses System.SysUtils, tblStockStatement,prm_base;

Type

  TPrmStockStatement = class(TPrmbase)
  private
    FVendedor: Integer;
    FMovimento: TStockStatement;
    procedure setFVendedor(const Value: Integer);
    procedure setFMovimento(const Value: TStockStatement);

  public
    constructor Create;Override;
    destructor Destroy;Override;
    property Vendedor : Integer read FVendedor write setFVendedor;
    property Movimento : TStockStatement read FMovimento write setFMovimento;
  end;

implementation

{ TPrmStockStatement }

constructor TPrmStockStatement.Create;
begin
  inherited;
  FMovimento := TStockStatement.Create;
  FMovimento.RegistroCriado := 0;
  FMovimento.RegistroAlterado := 0;

end;

destructor TPrmStockStatement.Destroy;
begin
  FMovimento.DisposeOf;
  inherited;
end;

procedure TPrmStockStatement.setFMovimento(const Value: TStockStatement);
begin
  FMovimento := Value;
end;

procedure TPrmStockStatement.setFVendedor(const Value: Integer);
begin
  FVendedor := Value;
end;

end.
