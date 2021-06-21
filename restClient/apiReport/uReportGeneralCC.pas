unit uReportGeneralCC;

interface

uses System.JSON, Datasnap.DSProxyRest, Datasnap.DSClientRest,
      Data.DBXCommon, Data.DBXClient, Data.DBXDataSnap, Data.DBXJSON,
      Datasnap.DSProxy, System.Classes, System.SysUtils,
      Data.DB, Data.SqlExpr, Data.DBXDBReaders, Data.DBXCDSReaders,
      Data.DBXJSONReflect, uReportCC;

type


  TSMGeneralClient = class(TReportCC)
  private
  public
    function GetOrderPurchase(par: string; const ARequestFilter: string = ''): string;
    function GetOrderStockTransfer(par: string; const ARequestFilter: string = ''): string;
    function GetOrderJob(par: string; const ARequestFilter: string = ''): string;
    function GetOrderPacking(par: string; const ARequestFilter: string = ''): string;
    function GetProductFile(par: string; const ARequestFilter: string = ''): string;
    function GetOrderListPurchase(par: string; const ARequestFilter: string = ''): string;
    function GetOrderListSale(par: string; const ARequestFilter: string = ''): string;
    function GetOrderListAdjust(par: string; const ARequestFilter: string = ''): string;
    function GetOrderListPacking(par: string; const ARequestFilter: string = ''): string;
    function GetOrderListJob(par: string; const ARequestFilter: string = ''): string;
    function GetOrderListStockTransfer(par: string; const ARequestFilter: string = ''): string;
    function GetCustomerFile(par: string; const ARequestFilter: string = ''): string;
    function GetProviderFile(par: string; const ARequestFilter: string = ''): string;
    function GetCarrierFile(par: string; const ARequestFilter: string = ''): string;
    function GetJobList(par: string; const ARequestFilter: string = ''): string;
    function GetInvoiceList(par: string; const ARequestFilter: string = ''): string;
  end;

implementation

function TSMGeneralClient.GetOrderPurchase(par: string; const ARequestFilter: string): string;
begin
  Result := execCommand('TSMGeneral.GetOrderPurchase',par,ARequestFilter);
end;

function TSMGeneralClient.GetOrderStockTransfer(par: string; const ARequestFilter: string): string;
begin
  Result := execCommand('TSMGeneral.GetOrderStockTransfer',par,ARequestFilter);
end;

function TSMGeneralClient.GetOrderJob(par: string; const ARequestFilter: string): string;
begin
  Result := execCommand('TSMGeneral.GetOrderJob',par,ARequestFilter);
end;

function TSMGeneralClient.GetOrderPacking(par: string; const ARequestFilter: string): string;
begin
  Result := execCommand('TSMGeneral.GetOrderPacking',par,ARequestFilter);
end;

function TSMGeneralClient.GetProductFile(par: string; const ARequestFilter: string): string;
begin
  Result := execCommand('TSMGeneral.GetProductFile',par,ARequestFilter);
end;

function TSMGeneralClient.GetOrderListPurchase(par: string; const ARequestFilter: string): string;
begin
  Result := execCommand('TSMGeneral.GetOrderListPurchase',par,ARequestFilter);
end;

function TSMGeneralClient.GetOrderListSale(par: string; const ARequestFilter: string): string;
begin
  Result := execCommand('TSMGeneral.GetOrderListSale',par,ARequestFilter);
end;

function TSMGeneralClient.GetOrderListAdjust(par: string; const ARequestFilter: string): string;
begin
  Result := execCommand('TSMGeneral.GetOrderListAdjust',par,ARequestFilter);
end;

function TSMGeneralClient.GetOrderListPacking(par: string; const ARequestFilter: string): string;
begin
  Result := execCommand('TSMGeneral.GetOrderListPacking',par,ARequestFilter);
end;

function TSMGeneralClient.GetOrderListJob(par: string; const ARequestFilter: string): string;
begin
  Result := execCommand('TSMGeneral.GetOrderListJob',par,ARequestFilter);
end;

function TSMGeneralClient.GetOrderListStockTransfer(par: string; const ARequestFilter: string): string;
begin
  Result := execCommand('TSMGeneral.GetOrderListStockTransfer',par,ARequestFilter);
end;

function TSMGeneralClient.GetCustomerFile(par: string; const ARequestFilter: string): string;
begin
  Result := execCommand('TSMGeneral.GetCustomerFile',par,ARequestFilter);
end;

function TSMGeneralClient.GetProviderFile(par: string; const ARequestFilter: string): string;
begin
  Result := execCommand('TSMGeneral.GetProviderFile',par,ARequestFilter);
end;

function TSMGeneralClient.GetCarrierFile(par: string; const ARequestFilter: string): string;
begin
  Result := execCommand('TSMGeneral.GetCarrierFile',par,ARequestFilter);
end;

function TSMGeneralClient.GetJobList(par: string; const ARequestFilter: string): string;
begin
  Result := execCommand('TSMGeneral.GetJobList',par,ARequestFilter);
end;

function TSMGeneralClient.GetInvoiceList(par: string; const ARequestFilter: string): string;
begin
  Result := execCommand('TSMGeneral.GetInvoiceList',par,ARequestFilter);
end;


end.
