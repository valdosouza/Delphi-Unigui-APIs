unit objFinancial;

interface

uses System.SysUtils, ObjBase,  tblFinancial, objFinancialbills;

Type

  TObjFinancial = Class(TObjBase)
  private
    FFinanceiro: TFinancial;
    procedure setFFinanceiro(const Value: TFinancial);

  public
      constructor Create; override;
      destructor Destroy; override;
      property Financeiro : TFinancial read FFinanceiro write setFFinanceiro;
  End;

implementation


{ TObjFinancial }

constructor TObjFinancial.Create;
begin
  inherited;
  FFinanceiro := TFinancial.Create;
end;

destructor TObjFinancial.Destroy;
begin
  FFinanceiro.DisposeOf;
end;


procedure TObjFinancial.setFFinanceiro(
  const Value: TFinancial);
begin
  FFinanceiro := Value;
end;

end.
