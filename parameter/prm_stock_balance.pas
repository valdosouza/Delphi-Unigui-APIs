unit prm_stock_balance;

interface

uses  System.SysUtils, prm_base, tblstockbalance ;

Type
  TPrmStockBalance = class(TPrmBase)
  private
    FVendedor: Integer;
    FSaldo: TStockBalance;
    procedure setFVendedor(const Value: Integer);
    procedure setFSaldo(const Value: TStockBalance);
  public
    constructor Create;override;
    destructor Destroy;override;

    property Vendedor : Integer read FVendedor write setFVendedor;
    property Saldo : TStockBalance read FSaldo write setFSaldo;
  end;


implementation

{ TPrmStockBalance }

constructor TPrmStockBalance.Create;
begin
  inherited;
  FSaldo := TStockBalance.Create;
  FSaldo.RegistroCriado := 0;
  FSaldo.RegistroAlterado := 0;

end;

destructor TPrmStockBalance.Destroy;
begin
  FSaldo.DisposeOf;
  inherited;
end;

procedure TPrmStockBalance.setFSaldo(const Value: TStockBalance);
begin
  FSaldo := Value;
end;

procedure TPrmStockBalance.setFVendedor(const Value: Integer);
begin
  FVendedor := Value;
end;

end.
