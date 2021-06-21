unit uDataFinancialStatementCC;

interface

uses  uDataCC;
type

  TSMFinancialStatementClient = class(TDataCC)
  private

  public
    function save(par: string; const ARequestFilter: string = ''): String;
  end;

  implementation


function TSMFinancialStatementClient.save(par: string; const ARequestFilter: string): String;
begin
  Result := execCommand('TSMFinancialStatement.save',par,ARequestFilter);
end;

end.
