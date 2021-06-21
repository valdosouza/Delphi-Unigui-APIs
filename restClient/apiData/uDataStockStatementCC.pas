unit uDataStockStatementCC;

interface

uses  uDataCC;
type

  TSMStockStatementClient = class(TDataCC)
  private

  public
    function save(par: string; const ARequestFilter: string = ''): String;
    function getSyncronize(par: string; const ARequestFilter: string = ''): String;
  end;

implementation

function TSMStockStatementClient.save(par: string; const ARequestFilter: string): String;
begin
  Result := execCommand('TSMStockStatement.save',par,ARequestFilter);
end;

function TSMStockStatementClient.getSyncronize(par: string; const ARequestFilter: string): String;
begin
  Result := execCommand('TSMStockStatement.getSyncronize',par,ARequestFilter);
end;


end.
