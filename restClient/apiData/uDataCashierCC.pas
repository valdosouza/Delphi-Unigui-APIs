unit uDataCashierCC;

interface

uses  uDataCC;
type

  TSMCashierClient = class(TDataCC)
  private

  public
    function save(par: string; const ARequestFilter: string = ''): String;
    function getSyncronize(par: string; const ARequestFilter: string = ''): String;
  end;

implementation


function TSMCashierClient.save(par: string; const ARequestFilter: string): String;
begin
  Result := execCommand('TSMCashier.save',par,ARequestFilter);
end;

function TSMCashierClient.getSyncronize(par: string; const ARequestFilter: string): String;
begin
  Result := execCommand('TSMCashier.getSyncronize',par,ARequestFilter);
end;

end.
