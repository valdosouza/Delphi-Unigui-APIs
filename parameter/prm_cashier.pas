unit prm_cashier;

interface

uses System.SysUtils, prm_base, tblcashier ;

Type
  TPrmCashier = class(TPrmBase)
  private
    FCaixa: TCashier;
    procedure setFCaixa(const Value: TCashier);
  public
    constructor Create;override;
    destructor Destroy;override;
    property Caixa : TCashier read FCaixa write setFCaixa;
  end;


implementation

{ TPrmCashier }

constructor TPrmCashier.Create;
begin
  inherited;
  FCaixa := TCashier.Create;
end;

destructor TPrmCashier.Destroy;
begin
  FCaixa.DisposeOf;
  inherited;
end;

procedure TPrmCashier.setFCaixa(const Value: TCashier);
begin
  FCaixa := Value;
end;

end.
