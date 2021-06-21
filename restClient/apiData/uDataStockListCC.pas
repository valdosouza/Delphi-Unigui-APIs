unit uDataStockListCC;

interface

uses  uDataCC;
type

  TSMStockListClient = class(TDataCC)
  private

  public
    function save(par: string; const ARequestFilter: string = ''): String;
    function getSyncronize(par: string;  const ARequestFilter: string = ''): String;
    function getSalesmanStock(par: string; const ARequestFilter: string = ''): String;
  end;

implementation

function TSMStockListClient.save(par: string; const ARequestFilter: string): String;
begin
  Result := execCommand('TSMStockList.save',par,ARequestFilter);
end;

function TSMStockListClient.getSalesmanStock(par: string;
  const ARequestFilter: string): String;
begin
  Result := execCommand('TSMStockList.getSalesmanStock',par,ARequestFilter);
end;

function TSMStockListClient.getSyncronize(par: string; const ARequestFilter: string): String;
begin
  Result := execCommand('TSMStockList.getSyncronize',par,ARequestFilter);
end;

end.
