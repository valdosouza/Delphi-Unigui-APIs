unit uDataOrderPurchaseCC;

interface

uses  uDataCC;

type
  TSMOrderPurchaseClient = class(TDataCC)
  private

  public
    function save(par: string; const ARequestFilter: string = ''): String;
    function getByKey(par: string; const ARequestFilter: string = ''): String;
    function getListSpl(Par: string; const ARequestFilter: string = ''): String;
    function getListSplByDate(Par: string; const ARequestFilter: string = ''): String;
    function getList(par: string; const ARequestFilter: string = ''): String;
    function getSyncronize(par: string; const ARequestFilter: string = ''): String;
    function getLastOrderID(Par: string; const ARequestFilter: string = ''): String;
    function getLastOrder(Par: string; const ARequestFilter: string = ''): String;
  end;

implementation

function TSMOrderPurchaseClient.save(par: string; const ARequestFilter: string): String;
begin
  Result := execCommand('TSMOrderPurchase.save',par,ARequestFilter);
end;

function TSMOrderPurchaseClient.getByKey(par: string; const ARequestFilter: string = ''): String;
begin
  Result := execCommand('TSMOrderPurchase.getByKey',par,ARequestFilter);
end;

function TSMOrderPurchaseClient.getListSpl(Par: string; const ARequestFilter: string): String;
begin
  Result := execCommand('TSMOrderPurchase.getListSpl',par,ARequestFilter);
end;

function TSMOrderPurchaseClient.getListSplByDate(Par: string;
  const ARequestFilter: string): String;
begin
  Result := execCommand('TSMOrderPurchase.getListSplByDate',par,ARequestFilter);
end;

function TSMOrderPurchaseClient.getList(par: string; const ARequestFilter: string): String;
begin
  Result := execCommand('TSMOrderPurchase.getList',par,ARequestFilter);
end;

function TSMOrderPurchaseClient.getSyncronize(par: string; const ARequestFilter: string): String;
begin
  Result := execCommand('TSMOrderPurchase.getSyncronize',par,ARequestFilter);
end;

function TSMOrderPurchaseClient.getLastOrderID(Par: string; const ARequestFilter: string): String;
begin
  Result := execCommand('TSMOrderPurchase.getLastOrderID',par,ARequestFilter);
end;

function TSMOrderPurchaseClient.getLastOrder(Par: string; const ARequestFilter: string): String;
begin
  Result := execCommand('TSMOrderPurchase.getLastOrder',par,ARequestFilter);
end;

end.
