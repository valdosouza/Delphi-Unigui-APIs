unit uDataStockBalanceCC;

interface

uses  uDataCC;
type

  TSMStockBalanceClient = class(TDataCC)
  private

  public
    function save(par: string; const ARequestFilter: string = ''): String;
    function getSyncronize(par: string; const ARequestFilter: string = ''): String;
  end;


implementation

function TSMStockBalanceClient.save(par: string; const ARequestFilter: string): String;
begin
  Result := execCommand('TSMStockBalance.save',par,ARequestFilter);
end;

function TSMStockBalanceClient.getSyncronize(par: string; const ARequestFilter: string): String;
begin
  Result := execCommand('TSMStockBalance.getSyncronize',par,ARequestFilter);
end;

end.
