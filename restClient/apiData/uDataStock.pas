unit uDataStock;

interface

uses  uDataCC;
type

  TSMStockClient = class(TDataCC)
  private

  public
    function save(par: string; const ARequestFilter: string = ''): String;
    function getSyncronize(par: string; const ARequestFilter: string = ''): String;
  end;

implementation


function TSMStockClient.save(par: string; const ARequestFilter: string): String;
begin
  Result := execCommand('TSMStock.save',par,ARequestFilter);
end;

function TSMStockClient.getSyncronize(par: string; const ARequestFilter: string): String;
begin
  Result := execCommand('TSMStock.getSyncronize',par,ARequestFilter);
end;

end.

