unit uDataOrderSaleCC;

interface

uses  uDataCC;

type
  TSMOrderSaleClient = class(TDataCC)
  private

  public
    function save(par: string; const ARequestFilter: string = ''): String;
    function getByKey(par: string; const ARequestFilter: string = ''): String;
    function getListSpl(Par: string; const ARequestFilter: string = ''): String;
    function getListSplByHour(Par: string; const ARequestFilter: string = ''): String;
    function getListSplByDate(Par: string; const ARequestFilter: string = ''): String;
    function getList(par: string; const ARequestFilter: string = ''): String;
    function getSyncronize(par: string; const ARequestFilter: string = ''): String;
    function getLastOrderID(Par: string; const ARequestFilter: string = ''): String;
    function getLastOrder(Par: string; const ARequestFilter: string = ''): String;
  end;

implementation

function TSMOrderSaleClient.save(par: string; const ARequestFilter: string): String;
begin
  Result := execCommand('TSMOrderSale.save',par,ARequestFilter);
end;

function TSMOrderSaleClient.getByKey(par: string; const ARequestFilter: string = ''): String;
begin
  Result := execCommand('TSMOrderSale.getByKey',par,ARequestFilter);
end;

function TSMOrderSaleClient.getListSpl(Par: string; const ARequestFilter: string): String;
begin
  Result := execCommand('TSMOrderSale.getListSpl',par,ARequestFilter);
end;

function TSMOrderSaleClient.getListSplByDate(Par: string;
  const ARequestFilter: string): String;
begin
  Result := execCommand('TSMOrderSale.getListSplByDate',par,ARequestFilter);
end;

function TSMOrderSaleClient.getListSplByHour(Par: string; const ARequestFilter: string): String;
begin
  Result := execCommand('TSMOrderSale.getListSplByHour',par,ARequestFilter);
end;

function TSMOrderSaleClient.getList(par: string; const ARequestFilter: string): String;
begin
  Result := execCommand('TSMOrderSale.getList',par,ARequestFilter);
end;

function TSMOrderSaleClient.getSyncronize(par: string; const ARequestFilter: string): String;
begin
  Result := execCommand('TSMOrderSale.getSyncronize',par,ARequestFilter);
end;

function TSMOrderSaleClient.getLastOrderID(Par: string; const ARequestFilter: string): String;
begin
  Result := execCommand('TSMOrderSale.getLastOrderID',par,ARequestFilter);
end;

function TSMOrderSaleClient.getLastOrder(Par: string; const ARequestFilter: string): String;
begin
  Result := execCommand('TSMOrderSale.getLastOrder',par,ARequestFilter);
end;


end.
