unit uReportCC;

interface

uses
  System.JSON, Datasnap.DSProxyRest, Datasnap.DSClientRest, Data.DBXCommon,
  Data.DBXClient, Data.DBXDataSnap, Data.DBXJSON, Datasnap.DSProxy,
  System.Classes, System.SysUtils, Data.DB, Data.SqlExpr, Data.DBXDBReaders,
  Data.DBXCDSReaders, Data.DBXJSONReflect;

type
  TSMRestReport = class(TDSAdminRestClient)
  private
    FGetReportCommand: TDSRestCommand;
    FGetOrderPurchaseCommand: TDSRestCommand;
    FGetOrderStockTransferCommand: TDSRestCommand;
    FGetOrderJobCommand: TDSRestCommand;
    function GetReport(par: string; report:String;  const ARequestFilter: string = ''): string;
  public
    constructor Create(ARestConnection: TDSRestConnection); overload;
    constructor Create(ARestConnection: TDSRestConnection; AInstanceOwner: Boolean); overload;
    destructor Destroy; override;
    //Produto
    function GetProductFile(par: string): string;
    //Pedidos
    function GetOrderPurchase(par: string): string;
    function GetOrderStockTransfer(par: string): string;
    function GetOrderJob(par: string): string;
    function GetOrderPacking(par: string): string;
    function GetOrderPI(par: string): string;
    function GetVisualizacaoPecas(par: string): string;
    //Order List
    function GetOrderListPurchase(par: string): string;
    function GetOrderListSale(par: string): string;
    function GetOrderListAdjust(par: string): string;
    function GetOrderListPacking(par: string): string;
    function GetOrderListJob(par: string): string;
    function GetOrderListStockTransfer(par: string): string;

    //Empresas
    function GetCustomerFile(par: string): string;
    function GetProviderFile(par: string): string;
    function GetCarrierFile(par: string): string;
    //Lista de Pedidos
    function GetJobList(par: string): string;

    //Notas
    function GetInvoiceList(par: string): string;
  end;

const

  TSM_GetReport: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'par'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'string')
  );

implementation

function TSMRestReport.GetReport( par: string; report:String; const ARequestFilter: string): string;
begin
  if FGetReportCommand = nil then
  begin
    FGetReportCommand := FConnection.CreateCommand;
    FGetReportCommand.RequestType := 'GET';
    FGetReportCommand.Text := concat('TSM.',Report);
    FGetReportCommand.Prepare(TSM_GetReport);
  end;
  FGetReportCommand.Parameters[0].Value.SetWideString(par);
  FGetReportCommand.Execute(ARequestFilter);
  Result := FGetReportCommand.Parameters[1].Value.GetWideString;
end;

function TSMRestReport.GetVisualizacaoPecas(par: string): string;
begin
  REsult := GetReport(par,'GetVisualizacaoPecas');
end;

function TSMRestReport.GetOrderPacking(par: string): string;
begin
  REsult := GetReport(par,'GetOrderPacking');
end;

function TSMRestReport.GetOrderPI(par: string): string;
begin
  REsult := GetReport(par,'GetOrderPI');
end;

function TSMRestReport.GetOrderPurchase(par: string): string;
begin
  REsult := GetReport(par,'GetOrderPurchase');
end;

function TSMRestReport.GetOrderStockTransfer(par: string): string;
begin
  REsult := GetReport(par,'GetOrderStockTransfer');
end;

function TSMRestReport.GetProductFile(par: string): string;
begin
  REsult := GetReport(par,'GetProductFile');
end;

function TSMRestReport.GetCarrierFile(par: string): string;
begin
  REsult := GetReport(par,'GetCarrierFile');
end;

function TSMRestReport.GetProviderFile(par: string): string;
begin
  REsult := GetReport(par,'GetProviderFile');
end;

function TSMRestReport.GetCustomerFile(par: string): string;
begin
  REsult := GetReport(par,'GetCustomerFile');
end;

function TSMRestReport.GetInvoiceList(par: string): string;
begin
  REsult := GetReport(par,'GetInvoiceList');
end;

function TSMRestReport.GetJobList(par: string): string;
begin
  REsult := GetReport(par,'GetJobList');
end;

function TSMRestReport.GetOrderJob(par: string): string;
begin
  REsult := GetReport(par,'GetOrderJob');
end;

function TSMRestReport.GetOrderListAdjust(par: string): string;
begin
  REsult := GetReport(par,'GetOrderListAdjust');
end;

function TSMRestReport.GetOrderListJob(par: string): string;
begin
  REsult := GetReport(par,'GetOrderListJob');
end;

function TSMRestReport.GetOrderListPacking(par: string): string;
begin
  REsult := GetReport(par,'GetOrderListPacking');
end;

function TSMRestReport.GetOrderListPurchase(par: string): string;
begin
  REsult := GetReport(par,'GetOrderListPurchase');
end;

function TSMRestReport.GetOrderListSale(par: string): string;
begin
  REsult := GetReport(par,'GetOrderListSale');
end;

function TSMRestReport.GetOrderListStockTransfer(par: string): string;
begin
  REsult := GetReport(par,'GetOrderListStockTransfer');
end;

constructor TSMRestReport.Create(ARestConnection: TDSRestConnection);
begin
  inherited Create(ARestConnection);
end;

constructor TSMRestReport.Create(ARestConnection: TDSRestConnection; AInstanceOwner: Boolean);
begin
  inherited Create(ARestConnection, AInstanceOwner);
end;

destructor TSMRestReport.Destroy;
begin
  FGetReportCommand.DisposeOf;
  FGetOrderPurchaseCommand.DisposeOf;
  FGetOrderStockTransferCommand.DisposeOf;
  FGetOrderJobCommand.DisposeOf;
  inherited;
end;

end.

