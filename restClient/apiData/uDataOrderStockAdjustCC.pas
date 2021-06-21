unit uDataOrderStockAdjustCC;

interface

uses  uDataCC;

type

  TSMOrderStockAdjustClient = class(TDataCC)
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

function TSMOrderStockAdjustClient.save(par: string; const ARequestFilter: string): String;
begin
  Result := execCommand('TSMOrderStockAdjust.save',par,ARequestFilter);
end;

function TSMOrderStockAdjustClient.getByKey(par: string; const ARequestFilter: string = ''): String;
begin
  Result := execCommand('TSMOrderStockAdjust.getByKey',par,ARequestFilter);
end;

function TSMOrderStockAdjustClient.getListSpl(Par: string; const ARequestFilter: string): String;
begin
  Result := execCommand('TSMOrderStockAdjust.getListSpl',par,ARequestFilter);
end;

function TSMOrderStockAdjustClient.getListSplByDate(Par: string;
  const ARequestFilter: string): String;
begin
  Result := execCommand('TSMOrderStockAdjust.getListSplByDate',par,ARequestFilter);
end;

function TSMOrderStockAdjustClient.getList(par: string; const ARequestFilter: string): String;
begin
  Result := execCommand('TSMOrderStockAdjust.getList',par,ARequestFilter);
end;

function TSMOrderStockAdjustClient.getSyncronize(par: string; const ARequestFilter: string): String;
begin
  Result := execCommand('TSMOrderStockAdjust.getSyncronize',par,ARequestFilter);
end;

function TSMOrderStockAdjustClient.getLastOrderID(Par: string; const ARequestFilter: string): String;
begin
  Result := execCommand('TSMOrderStockAdjust.getLastOrderID',par,ARequestFilter);
end;

function TSMOrderStockAdjustClient.getLastOrder(Par: string; const ARequestFilter: string): String;
begin
  Result := execCommand('TSMOrderStockAdjust.getLastOrder',par,ARequestFilter);
end;

end.
