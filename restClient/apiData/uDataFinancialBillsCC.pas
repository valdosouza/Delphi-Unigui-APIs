unit uDataFinancialBillsCC;

interface

uses  uDataCC;
type

  TSMFinancialBillsClient = class(TDataCC)
  private

  public
    function save(par: string; const ARequestFilter: string = ''): String;
    function getSyncronize(par: string; const ARequestFilter: string = ''): String;
    function getByKey(Par: string; const ARequestFilter: string = ''): String;
    function getList(par: string; const ARequestFilter: string = ''): String;
  end;
implementation

function TSMFinancialBillsClient.save(par: string; const ARequestFilter: string): String;
begin
  Result := execCommand('TSMFinancialBills.save',par,ARequestFilter);
end;

function TSMFinancialBillsClient.getSyncronize(par: string; const ARequestFilter: string): String;
begin
  Result := execCommand('TSMFinancialBills.getSyncronize',par,ARequestFilter);
end;

function TSMFinancialBillsClient.getByKey(Par: string; const ARequestFilter: string): String;
begin
  Result := execCommand('TSMFinancialBills.getByKey',par,ARequestFilter);
end;

function TSMFinancialBillsClient.getList(par: string; const ARequestFilter: string): String;
begin
  Result := execCommand('TSMFinancialBills.getList',par,ARequestFilter);
end;

end.

