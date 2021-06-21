unit uReportFinancialCC;

interface

uses System.JSON, Datasnap.DSProxyRest, uReportCC, Datasnap.DSClientRest,
        Data.DBXCommon, Data.DBXClient, Data.DBXDataSnap, Data.DBXJSON,
        Datasnap.DSProxy, System.Classes, System.SysUtils,
        Data.DB, Data.SqlExpr, Data.DBXDBReaders, Data.DBXCDSReaders,
        Data.DBXJSONReflect;

type
  TSMFinancialClient = class(TReportCC)
  private
  public
    function GetFinancialBills(par: string; const ARequestFilter: string = ''): string;
    function GetFinancialPayment(par: string; const ARequestFilter: string = ''): string;
    function GetFinancialRealManager(par: string; const ARequestFilter: string = ''): string;
    function GetFinancialToReceiveMedia(par: string; const ARequestFilter: string = ''): string;
    function GetFinancialMediaToReceiveOpen(par: string; const ARequestFilter: string = ''): string;
    function GetFinancialMediaToReceiveClosed(par: string; const ARequestFilter: string = ''): string;
    function GetFinancialMediaToReceiveAll(par: string; const ARequestFilter: string = ''): string;

  end;


implementation


{ TSMFinancialClient }

function TSMFinancialClient.GetFinancialBills(par: string;
  const ARequestFilter: string): string;
begin
  Result := execCommand('TSMFinancial.GetFinancialBills',par,ARequestFilter);
end;


function TSMFinancialClient.GetFinancialMediaToReceiveAll(par: string;
  const ARequestFilter: string): string;
begin
  Result := execCommand('TSMFinancial.GetFinancialMediaToReceiveAll',par,ARequestFilter);
end;

function TSMFinancialClient.GetFinancialMediaToReceiveClosed(par: string;
  const ARequestFilter: string): string;
begin
  Result := execCommand('TSMFinancial.GetFinancialMediaToReceiveClosed',par,ARequestFilter);
end;

function TSMFinancialClient.GetFinancialMediaToReceiveOpen(par: string;
  const ARequestFilter: string): string;
begin
  Result := execCommand('TSMFinancial.GetFinancialMediaToReceiveOpen',par,ARequestFilter);
end;

function TSMFinancialClient.GetFinancialPayment(par: string;
  const ARequestFilter: string): string;
begin
  Result := execCommand('TSMFinancial.GetFinancialPayment',par,ARequestFilter);
end;

function TSMFinancialClient.GetFinancialRealManager(par: string;
  const ARequestFilter: string): string;
begin
  Result := execCommand('TSMFinancial.GetFinancialRealManager',par,ARequestFilter);
end;

function TSMFinancialClient.GetFinancialToReceiveMedia(par: string;
  const ARequestFilter: string): string;
begin
  Result := execCommand('TSMFinancial.GetFinancialToReceiveMedia',par,ARequestFilter);

end;

end.
