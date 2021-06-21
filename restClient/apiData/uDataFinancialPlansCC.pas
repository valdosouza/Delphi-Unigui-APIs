unit uDataFinancialPlansCC;

interface

uses  uDataCC;
type

  TSMFinancialPlansClient = class(TDataCC)
  private

  public
    function save(par: string; const ARequestFilter: string = ''): String;
  end;

implementation


function TSMFinancialPlansClient.save(par: string; const ARequestFilter: string): String;
begin
  Result := execCommand('TSMFinancialPlans.save',par,ARequestFilter);
end;


end.
