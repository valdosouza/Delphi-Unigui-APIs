unit uDataCM;
interface

uses
  SysUtils, Classes, IPPeerClient, Datasnap.DSClientRest,
  uDataCityCC, uDataCountryCC, uDataCustomerCC, uDataProviderCC, uDataInstitutionCC, IniFiles,
  uDataMerchandiseCC, uDataServices, uDataStateCC, uDataPriceListCC,
  uDataStockListCC, uDataSalesManCC, uDataPaymentTypesCC, uDataOrderSaleCC,
  uDataPriceCC, uDataPackageCC, uDataCategoryCC, uDataBrandCC,
  uDataStockBalanceCC, uDataStock, uDataProductCC, uDataMeasureCC,
  uDataBankAccountCC, uDataFinancialPlansCC, uDataFinancialStatementCC,
  uDataStockStatementCC, uDataAgency, uDataBroadcaster, REST.json,
  uDataAdvertiserCC, uDataMedMaterialCC, uDataMedPosProgCC, uDataOrderPICC,
  uDataMedPriceJRCCC, uDataLineBusinessCC, uDataContactCC,
  uDataFinancialBillsCC,
  uDataInvoiceCC, json, uDataEntityFiscalCC,
  uDataPromotionCC, uDataPromotionItemsCC, uDataInvoiceMerchandiseCC,
  uDataOrderConsignmentCC, uDataKickbackCC, uDataCashierCC,uDataInvoiceReturn55,
  uDataInvoiceReturn65, uDataInvoiceReturnService, uDataInvoiceRectification,
  uDataOrderPurchaseCC, uDataOrderStockAdjustCC, uDataRestGroupCC,
  uDataRestGroupHasMeasureCC, uDataRestGroupHasOptionalCC, uDataRestMenuCC,
  uDataRestMenuHasIngredientCC, uDataRestSubgroupCC;

type
  TDataCM = class(TDataModule)
    DSRC_Data: TDSRestConnection;
    procedure DataModuleCreate(Sender: TObject);
  private
    FInstanceOwner: Boolean;
    FSMCountryClient: TSMCountryClient;
    FSMStateClient: TSMStateClient;
    FSMCityClient: TSMCityClient;
    FSMServicesClient: TSMServicesClient;
    FSMCustomerClient: TSMCustomerClient;
    FSMInstitutionClient: TSMInstitutionClient;
    FSMMerchandiseClient: TSMMerchandiseClient;
    FSMPriceListClient: TSMPriceListClient;
    FSMStockListClient: TSMStockListClient;
    FSMPaymentTypesClient: TSMPaymentTypesClient;
    FSMSalesManClient: TSMSalesManClient;
    FSMOrderSaleClient: TSMOrderSaleClient;
    FSMProductClient: TSMProductClient;
    FSMBrandClient: TSMBrandClient;
    FSMPackageClient: TSMPackageClient;
    FSMCAtegoryClient: TSMCAtegoryClient;
    FSMStockClient: TSMStockClient;
    FSMPriceClient: TSMPriceClient;
    FSMStockBalanceClient: TSMStockBalanceClient;
    FSMMeasureClient: TSMMeasureClient;
    FSMBankAccountClient: TSMBankAccountClient;
    FSMFinancialPLansClient: TSMFinancialPLansClient;
    FSMFinancialStatementClient: TSMFinancialStatementClient;
    FSMStockStatementClient: TSMStockStatementClient;
    FSMMedPriceJRClient: TSMMedPriceJRClient;
    FSMLineBusinessClient: TSMLineBusinessClient;
    FSMContactClient: TSMContactClient;
    FSMProviderClient: TSMProviderClient;
    FSMFinancialBillsClient: TSMFinancialBillsClient;
    FSMInvoiceClient: TSMInvoiceClient;
    FSMEntityFiscalClient: TSMEntityFiscalClient;
    FSMPromotionClient: TSMPromotionClient;
    FSMPromotionItemsClient: TSMPromotionItemsClient;
    FSMInvoiceMerchandiseClient: TSMInvoiceMerchandiseClient;
    FSMOrderConsignmentClient: TSMOrderConsignmentClient;
    FSMKickbackClient: TSMKickbackClient;
    FSMCashierClient: TSMCashierClient;
    FSMInvoiceReturn55Client: TSMInvoiceReturn55Client;
    FSMInvoiceReturn65Client: TSMInvoiceReturn65Client;
    FSMInvoiceReturnServiceClient: TSMInvoiceReturnServiceClient;
    FSMInvoiceRectificationClient: TSMInvoiceRectificationClient;
    FSMOrderPurchaseClient: TSMOrderPurchaseClient;
    FSMOrderStockAdjustClient: TSMOrderStockAdjustClient;
    FSMRestHasIngredientMenuClient: TSMRestMenuHasIngredientClient;
    FSMRestHasOptionalGroupClient: TSMRestGroupHasOptionalClient;
    FSMRestMenuClient: TSMRestMenuClient;
    FSMRestGroupHasMeasureClient: TSMRestGroupHasMeasureClient;
    FSMRestSubgroupClient: TSMRestSubgroupClient;
    FSMRestGroupClient: TSMRestGroupClient;
    function GetSMCountryClient: TSMCountryClient;
    function GetSMStateClient: TSMStateClient;
    function GetSMCityClient: TSMCityClient;
    function GetSMServicesClient: TSMServicesClient;
    function GetSMCustomerClient: TSMCustomerClient;
    function GetSMInstitutionClient: TSMInstitutionClient;
    function GetSMMerchandiseClient: TSMMerchandiseClient;
    function GetSMPriceListClient: TSMPriceListClient;
    function GetSMStockListClient: TSMStockListClient;
    function GetSMPaymentTypesClient: TSMPaymentTypesClient;
    function GetSMSalesManClient: TSMSalesManClient;
    function GetSMOrderSaleClient: TSMOrderSaleClient;
    function GetSMProductClient: TSMProductClient;
    function GetSMBrandClient: TSMBrandClient;
    function GetSMPackageClient: TSMPackageClient;
    function GetSMCAtegoryClient: TSMCAtegoryClient;
    function GetSMStockClient: TSMStockClient;
    function GetSMPriceClient: TSMPriceClient;
    function GetSMStockBalanceClient: TSMStockBalanceClient;
    function GetSMMeasureClient: TSMMeasureClient;
    function GetSMBankAccountClient: TSMBankAccountClient;
    function GetSMFinancialPLansClient: TSMFinancialPLansClient;
    function GetSMFinancialStatementClient: TSMFinancialStatementClient;
    function GetSMStockStatementClient: TSMStockStatementClient;
    function GetSMMedPriceJRClient: TSMMedPriceJRClient;
    function GetSMLineBusinessClient: TSMLineBusinessClient;
    function GetSMContactClient: TSMContactClient;
    function GetSMFinancialBillsClient: TSMFinancialBillsClient;
    function GetSMInvoiceClient: TSMInvoiceClient;
    function GetSMEntityFiscalClient: TSMEntityFiscalClient;
    function GetSMPromotionClient: TSMPromotionClient;
    function GetSMPromotionItemsClient: TSMPromotionItemsClient;
    function GetSMInvoiceMerchandiseClient: TSMInvoiceMerchandiseClient;
    function GetSMOrderConsignmentClient: TSMOrderConsignmentClient;
    function GetSMKickbackClient: TSMKickbackClient;
    function GetSMCashierClient: TSMCashierClient;
    function GetSMInvoiceReturn55Client: TSMInvoiceReturn55Client;
    function GetSMInvoiceReturn65Client: TSMInvoiceReturn65Client;
    function GetSMInvoiceReturnServiceClient: TSMInvoiceReturnServiceClient;
    function GetSMInvoiceRectificationClient: TSMInvoiceRectificationClient;
    function GetSMOrderPurchaseClient: TSMOrderPurchaseClient;
    function GetSMOrderStockAdjustClient: TSMOrderStockAdjustClient;

    function GetSMRestGroupClient: TSMRestGroupClient;
    function GetSMRestGroupHasMeasureClient: TSMRestGroupHasMeasureClient;
    function GetSMRestGroupHasOptionalClient: TSMRestGroupHasOptionalClient;
    function GetSMRestMenuClient: TSMRestMenuClient;
    function GetSMRestMenuHasIngredientClient: TSMRestMenuHasIngredientClient;
    function GetSMRestSubgroupClient: TSMRestSubgroupClient;
    function GetSMProviderClient: TSMProviderClient;
    { Private declarations }
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    property InstanceOwner: Boolean read FInstanceOwner write FInstanceOwner;
    property SMCountryClient: TSMCountryClient read GetSMCountryClient write FSMCountryClient;
    property SMStateClient: TSMStateClient read GetSMStateClient write FSMStateClient;
    property SMCityClient: TSMCityClient read GetSMCityClient write FSMCityClient;
    property SMServicesClient: TSMServicesClient read GetSMServicesClient write FSMServicesClient;
    property SMCustomerClient: TSMCustomerClient read GetSMCustomerClient write FSMCustomerClient;

    property SMProviderClient: TSMProviderClient read GetSMProviderClient write FSMProviderClient;

    property SMInstitutionClient: TSMInstitutionClient read GetSMInstitutionClient write FSMInstitutionClient;
    property SMMerchandiseClient: TSMMerchandiseClient read GetSMMerchandiseClient write FSMMerchandiseClient;
    property SMPriceListClient: TSMPriceListClient read GetSMPriceListClient write FSMPriceListClient;
    property SMStockListClient: TSMStockListClient read GetSMStockListClient write FSMStockListClient;
    property SMPaymentTypesClient: TSMPaymentTypesClient read GetSMPaymentTypesClient write FSMPaymentTypesClient;
    property SMSalesManClient: TSMSalesManClient read GetSMSalesManClient write FSMSalesManClient;
    property SMOrderSaleClient: TSMOrderSaleClient read GetSMOrderSaleClient write FSMOrderSaleClient;
    property SMProductClient: TSMProductClient read GetSMProductClient write FSMProductClient;
    property SMBrandClient: TSMBrandClient read GetSMBrandClient write FSMBrandClient;
    property SMPackageClient: TSMPackageClient read GetSMPackageClient write FSMPackageClient;
    property SMCAtegoryClient: TSMCAtegoryClient read GetSMCAtegoryClient write FSMCAtegoryClient;
    property SMStockClient: TSMStockClient read GetSMStockClient write FSMStockClient;
    property SMPriceClient: TSMPriceClient read GetSMPriceClient write FSMPriceClient;
    property SMStockBalanceClient: TSMStockBalanceClient read GetSMStockBalanceClient write FSMStockBalanceClient;
    property SMMeasureClient: TSMMeasureClient read GetSMMeasureClient write FSMMeasureClient;
    property SMBankAccountClient: TSMBankAccountClient read GetSMBankAccountClient write FSMBankAccountClient;
    property SMFinancialPLansClient: TSMFinancialPLansClient read GetSMFinancialPLansClient write FSMFinancialPLansClient;
    property SMFinancialStatementClient: TSMFinancialStatementClient read GetSMFinancialStatementClient write FSMFinancialStatementClient;
    property SMStockStatementClient: TSMStockStatementClient read GetSMStockStatementClient write FSMStockStatementClient;
    property SMMedPriceJRClient: TSMMedPriceJRClient read GetSMMedPriceJRClient write FSMMedPriceJRClient;
    property SMLineBusinessClient: TSMLineBusinessClient read GetSMLineBusinessClient write FSMLineBusinessClient;
    property SMContactClient: TSMContactClient read GetSMContactClient write FSMContactClient;
    property SMFinancialBillsClient: TSMFinancialBillsClient read GetSMFinancialBillsClient write FSMFinancialBillsClient;
    property SMInvoiceClient: TSMInvoiceClient read GetSMInvoiceClient write FSMInvoiceClient;
    property SMEntityFiscalClient: TSMEntityFiscalClient read GetSMEntityFiscalClient write FSMEntityFiscalClient;

    property SMPromotionClient: TSMPromotionClient read GetSMPromotionClient write FSMPromotionClient;
    property SMPromotionItemsClient: TSMPromotionItemsClient read GetSMPromotionItemsClient write FSMPromotionItemsClient;
    property SMInvoiceMerchandiseClient: TSMInvoiceMerchandiseClient read GetSMInvoiceMerchandiseClient write FSMInvoiceMerchandiseClient;
    property SMOrderConsignmentClient: TSMOrderConsignmentClient read GetSMOrderConsignmentClient write FSMOrderConsignmentClient;
    property SMKickbackClient: TSMKickbackClient read GetSMKickbackClient write FSMKickbackClient;
    property SMCashierClient: TSMCashierClient read GetSMCashierClient write FSMCashierClient;
    property SMInvoiceReturn55Client: TSMInvoiceReturn55Client read GetSMInvoiceReturn55Client write FSMInvoiceReturn55Client;
    property SMInvoiceReturn65Client: TSMInvoiceReturn65Client read GetSMInvoiceReturn65Client write FSMInvoiceReturn65Client;
    property SMInvoiceReturnServiceClient: TSMInvoiceReturnServiceClient read GetSMInvoiceReturnServiceClient write FSMInvoiceReturnServiceClient;
    property SMInvoiceRectificationClient: TSMInvoiceRectificationClient read GetSMInvoiceRectificationClient write FSMInvoiceRectificationClient;
    property SMOrderPurchaseClient: TSMOrderPurchaseClient read GetSMOrderPurchaseClient write FSMOrderPurchaseClient;
    property SMOrderStockAdjustClient: TSMOrderStockAdjustClient read GetSMOrderStockAdjustClient write FSMOrderStockAdjustClient;

    property SMRestMenuClient: TSMRestMenuClient read GetSMRestMenuClient write FSMRestMenuClient;
    property SMRestMenuHasIngredientClient: TSMRestMenuHasIngredientClient read GetSMRestMenuHasIngredientClient write FSMRestHasIngredientMenuClient;
    property SMRestGroupClient: TSMRestGroupClient read GetSMRestGroupClient write FSMRestGroupClient;
    property SMRestSubgroupClient: TSMRestSubgroupClient read GetSMRestSubgroupClient write FSMRestSubgroupClient;
    property SMRestGroupHasMeasureClient: TSMRestGroupHasMeasureClient read GetSMRestGroupHasMeasureClient write FSMRestGroupHasMeasureClient;
    property SMRestGroupHasOptionalClient: TSMRestGroupHasOptionalClient read GetSMRestGroupHasOptionalClient write FSMRestHasOptionalGroupClient;
end;

var
  DataCM: TDataCM;

implementation


{$R *.dfm}

constructor TDataCM.Create(AOwner: TComponent);
begin
  inherited;
  FInstanceOwner := True;
end;

procedure TDataCM.DataModuleCreate(Sender: TObject);
begin
  DSRC_Data.Host := '177.70.22.118';
//  DSRC_Data.Port := 228;
  DSRC_Data.Port := 229;
//  DSRC_Data.Host := 'localhost';
//  DSRC_Data.Port := 223;
  //DSRC_Data.Host := '192.168.100.24';
end;

destructor TDataCM.Destroy;
begin
  FSMCountryClient.DisposeOf;
  FSMStateClient.DisposeOf;
  FSMCityClient.DisposeOf;
  FSMServicesClient.DisposeOf;
  FSMCustomerClient.DisposeOf;
  SMProviderClient.DisposeOf;
  FSMInstitutionClient.DisposeOf;
  FSMMerchandiseClient.DisposeOf;
  FSMPriceListClient.DisposeOf;
  FSMStockListClient.DisposeOf;
  FSMPaymentTypesClient.DisposeOf;
  FSMSalesManClient.DisposeOf;
  FSMOrderSaleClient.DisposeOf;
  FSMProductClient.DisposeOf;
  FSMBrandClient.DisposeOf;
  FSMPackageClient.DisposeOf;
  FSMCAtegoryClient.DisposeOf;
  FSMStockClient.DisposeOf;
  FSMPriceClient.DisposeOf;
  FSMStockBalanceClient.DisposeOf;
  FSMMeasureClient.DisposeOf;
  FSMBankAccountClient.DisposeOf;
  FSMFinancialPLansClient.DisposeOf;
  FSMFinancialStatementClient.DisposeOf;
  FSMStockStatementClient.DisposeOf;
  FSMMedPriceJRClient.DisposeOf;
  FSMLineBusinessClient.DisposeOf;
  FSMContactClient.DisposeOf;
  FSMFinancialBillsClient.DisposeOf;
  FSMInvoiceClient.DisposeOf;
  FSMEntityFiscalClient.DisposeOf;
  FSMPromotionClient.DisposeOf;
  FSMPromotionItemsClient.DisposeOf;
  FSMInvoiceMerchandiseClient.DisposeOf;
  FSMOrderConsignmentClient.DisposeOf;
  FSMKickbackClient.DisposeOf;
  FSMCashierClient.DisposeOf;
  FSMInvoiceReturn55Client.DisposeOf;
  FSMInvoiceReturn65Client.DisposeOf;
  FSMInvoiceReturnServiceClient.DisposeOf;
  FSMInvoiceRectificationClient.DisposeOf;
  FSMOrderPurchaseClient.DisposeOf;
  FSMOrderStockAdjustClient.DisposeOf;
  inherited;
end;

function TDataCM.GetSMCountryClient: TSMCountryClient;
begin
  if FSMCountryClient = nil then
    FSMCountryClient:= TSMCountryClient.Create(DSRC_Data, FInstanceOwner);
  Result := FSMCountryClient;
end;
function TDataCM.GetSMStateClient: TSMStateClient;
begin
  if FSMStateClient = nil then
    FSMStateClient:= TSMStateClient.Create(DSRC_Data, FInstanceOwner);
  Result := FSMStateClient;
end;
function TDataCM.GetSMCityClient: TSMCityClient;
begin
  if FSMCityClient = nil then
    FSMCityClient:= TSMCityClient.Create(DSRC_Data, FInstanceOwner);
  Result := FSMCityClient;
end;
function TDataCM.GetSMServicesClient: TSMServicesClient;
begin
  if FSMServicesClient = nil then
    FSMServicesClient:= TSMServicesClient.Create(DSRC_Data, FInstanceOwner);
  Result := FSMServicesClient;
end;
function TDataCM.GetSMCustomerClient: TSMCustomerClient;
begin
  if FSMCustomerClient = nil then
    FSMCustomerClient:= TSMCustomerClient.Create(DSRC_Data, FInstanceOwner);
  Result := FSMCustomerClient;
end;

function TDataCM.GetSMProviderClient: TSMProviderClient;
begin
  if FSMProviderClient = nil then
    FSMProviderClient:= TSMProviderClient.Create(DSRC_Data, FInstanceOwner);
  Result := FSMProviderClient;
end;

function TDataCM.GetSMInstitutionClient: TSMInstitutionClient;
begin
  if FSMInstitutionClient = nil then
    FSMInstitutionClient:= TSMInstitutionClient.Create(DSRC_Data, FInstanceOwner);
  Result := FSMInstitutionClient;
end;
function TDataCM.GetSMMerchandiseClient: TSMMerchandiseClient;
begin
  if FSMMerchandiseClient = nil then
    FSMMerchandiseClient:= TSMMerchandiseClient.Create(DSRC_Data, FInstanceOwner);
  Result := FSMMerchandiseClient;
end;
function TDataCM.GetSMPriceListClient: TSMPriceListClient;
begin
  if FSMPriceListClient = nil then
    FSMPriceListClient:= TSMPriceListClient.Create(DSRC_Data, FInstanceOwner);
  Result := FSMPriceListClient;
end;
function TDataCM.GetSMStockListClient: TSMStockListClient;
begin
  if FSMStockListClient = nil then
    FSMStockListClient:= TSMStockListClient.Create(DSRC_Data, FInstanceOwner);
  Result := FSMStockListClient;
end;
function TDataCM.GetSMPaymentTypesClient: TSMPaymentTypesClient;
begin
  if FSMPaymentTypesClient = nil then
    FSMPaymentTypesClient:= TSMPaymentTypesClient.Create(DSRC_Data, FInstanceOwner);
  Result := FSMPaymentTypesClient;
end;
function TDataCM.GetSMSalesManClient: TSMSalesManClient;
begin
  if FSMSalesManClient = nil then
    FSMSalesManClient:= TSMSalesManClient.Create(DSRC_Data, FInstanceOwner);
  Result := FSMSalesManClient;
end;
function TDataCM.GetSMOrderConsignmentClient: TSMOrderConsignmentClient;
begin
  if FSMOrderConsignmentClient = nil then
    FSMOrderConsignmentClient:= TSMOrderConsignmentClient.Create(DSRC_Data, FInstanceOwner);
  Result := FSMOrderConsignmentClient;
end;

function TDataCM.GetSMOrderPurchaseClient: TSMOrderPurchaseClient;
begin
  if FSMOrderPurchaseClient = nil then
    FSMOrderPurchaseClient:= TSMOrderPurchaseClient.Create(DSRC_Data,  FInstanceOwner);
  Result := FSMOrderPurchaseClient;
end;

function TDataCM.GetSMOrderSaleClient: TSMOrderSaleClient;
begin
  if FSMOrderSaleClient = nil then
    FSMOrderSaleClient:= TSMOrderSaleClient.Create(DSRC_Data, FInstanceOwner);
  Result := FSMOrderSaleClient;
end;
function TDataCM.GetSMOrderStockAdjustClient: TSMOrderStockAdjustClient;
begin
  if FSMOrderStockAdjustClient = nil then
    FSMOrderStockAdjustClient:= TSMOrderStockAdjustClient.Create(DSRC_Data,  FInstanceOwner);
  Result := FSMOrderStockAdjustClient;
end;

function TDataCM.GetSMProductClient: TSMProductClient;
begin
  if FSMProductClient = nil then
    FSMProductClient:= TSMProductClient.Create(DSRC_Data, FInstanceOwner);
  Result := FSMProductClient;
end;
function TDataCM.GetSMBrandClient: TSMBrandClient;
begin
  if FSMBrandClient = nil then
    FSMBrandClient:= TSMBrandClient.Create(DSRC_Data, FInstanceOwner);
  Result := FSMBrandClient;
end;
function TDataCM.GetSMPackageClient: TSMPackageClient;
begin
  if FSMPackageClient = nil then
    FSMPackageClient:= TSMPackageClient.Create(DSRC_Data, FInstanceOwner);
  Result := FSMPackageClient;
end;
function TDataCM.GetSMCashierClient: TSMCashierClient;
begin
  if FSMCashierClient = nil then
    FSMCashierClient:= TSMCashierClient.Create(DSRC_Data, FInstanceOwner);
  Result := FSMCashierClient;
end;

function TDataCM.GetSMCAtegoryClient: TSMCAtegoryClient;
begin
  if FSMCAtegoryClient = nil then
    FSMCAtegoryClient:= TSMCAtegoryClient.Create(DSRC_Data, FInstanceOwner);
  Result := FSMCAtegoryClient;
end;
function TDataCM.GetSMStockClient: TSMStockClient;
begin
  if FSMStockClient = nil then
    FSMStockClient:= TSMStockClient.Create(DSRC_Data, FInstanceOwner);
  Result := FSMStockClient;
end;
function TDataCM.GetSMPriceClient: TSMPriceClient;
begin
  if FSMPriceClient = nil then
    FSMPriceClient:= TSMPriceClient.Create(DSRC_Data, FInstanceOwner);
  Result := FSMPriceClient;
end;
function TDataCM.GetSMStockBalanceClient: TSMStockBalanceClient;
begin
  if FSMStockBalanceClient = nil then
    FSMStockBalanceClient:= TSMStockBalanceClient.Create(DSRC_Data, FInstanceOwner);
  Result := FSMStockBalanceClient;
end;
function TDataCM.GetSMMeasureClient: TSMMeasureClient;
begin
  if FSMMeasureClient = nil then
    FSMMeasureClient:= TSMMeasureClient.Create(DSRC_Data, FInstanceOwner);
  Result := FSMMeasureClient;
end;
function TDataCM.GetSMBankAccountClient: TSMBankAccountClient;
begin
  if FSMBankAccountClient = nil then
    FSMBankAccountClient:= TSMBankAccountClient.Create(DSRC_Data, FInstanceOwner);
  Result := FSMBankAccountClient;
end;
function TDataCM.GetSMFinancialPLansClient: TSMFinancialPLansClient;
begin
  if FSMFinancialPLansClient = nil then
    FSMFinancialPLansClient:= TSMFinancialPLansClient.Create(DSRC_Data, FInstanceOwner);
  Result := FSMFinancialPLansClient;
end;
function TDataCM.GetSMFinancialStatementClient: TSMFinancialStatementClient;
begin
  if FSMFinancialStatementClient = nil then
    FSMFinancialStatementClient:= TSMFinancialStatementClient.Create(DSRC_Data, FInstanceOwner);
  Result := FSMFinancialStatementClient;
end;
function TDataCM.GetSMStockStatementClient: TSMStockStatementClient;
begin
  if FSMStockStatementClient = nil then
    FSMStockStatementClient:= TSMStockStatementClient.Create(DSRC_Data, FInstanceOwner);
  Result := FSMStockStatementClient;
end;
function TDataCM.GetSMMedPriceJRClient: TSMMedPriceJRClient;
begin
  if FSMMedPriceJRClient = nil then
    FSMMedPriceJRClient:= TSMMedPriceJRClient.Create(DSRC_Data, FInstanceOwner);
  Result := FSMMedPriceJRClient;
end;
function TDataCM.GetSMLineBusinessClient: TSMLineBusinessClient;
begin
  if FSMLineBusinessClient = nil then
    FSMLineBusinessClient:= TSMLineBusinessClient.Create(DSRC_Data, FInstanceOwner);
  Result := FSMLineBusinessClient;
end;
function TDataCM.GetSMContactClient: TSMContactClient;
begin
  if FSMContactClient = nil then
    FSMContactClient:= TSMContactClient.Create(DSRC_Data, FInstanceOwner);
  Result := FSMContactClient;
end;
function TDataCM.GetSMFinancialBillsClient: TSMFinancialBillsClient;
begin
  if FSMFinancialBillsClient = nil then
    FSMFinancialBillsClient:= TSMFinancialBillsClient.Create(DSRC_Data, FInstanceOwner);
  Result := FSMFinancialBillsClient;
end;
function TDataCM.GetSMInvoiceClient: TSMInvoiceClient;
begin
  if FSMInvoiceClient = nil then
    FSMInvoiceClient:= TSMInvoiceClient.Create(DSRC_Data, FInstanceOwner);
  Result := FSMInvoiceClient;
end;
function TDataCM.GetSMEntityFiscalClient: TSMEntityFiscalClient;
begin
  if FSMEntityFiscalClient = nil then
    FSMEntityFiscalClient:= TSMEntityFiscalClient.Create(DSRC_Data, FInstanceOwner);
  Result := FSMEntityFiscalClient;
end;

function TDataCM.GetSMPromotionClient: TSMPromotionClient;
begin
  if FSMPromotionClient = nil then
    FSMPromotionClient:= TSMPromotionClient.Create(DSRC_Data, FInstanceOwner);
  Result := FSMPromotionClient;
end;
function TDataCM.GetSMPromotionItemsClient: TSMPromotionItemsClient;
begin
  if FSMPromotionItemsClient = nil then
    FSMPromotionItemsClient:= TSMPromotionItemsClient.Create(DSRC_Data, FInstanceOwner);
  Result := FSMPromotionItemsClient;
end;


function TDataCM.GetSMRestGroupClient: TSMRestGroupClient;
begin
  if FSMRestGroupClient = nil then
    FSMRestGroupClient:= TSMRestGroupClient.Create(DSRC_Data,  FInstanceOwner);
  Result := FSMRestGroupClient;
end;

function TDataCM.GetSMRestGroupHasMeasureClient: TSMRestGroupHasMeasureClient;
begin
  if FSMRestGroupHasMeasureClient = nil then
    FSMRestGroupHasMeasureClient := TSMRestGroupHasMeasureClient.Create(DSRC_Data,  FInstanceOwner);
  Result := FSMRestGroupHasMeasureClient;
end;

function TDataCM.GetSMRestGroupHasOptionalClient: TSMRestGroupHasOptionalClient;
begin
  if FSMRestHasOptionalGroupClient = nil then
    FSMRestHasOptionalGroupClient:= TSMRestGroupHasOptionalClient.Create(DSRC_Data,  FInstanceOwner);
  Result := FSMRestHasOptionalGroupClient;
end;

function TDataCM.GetSMRestMenuClient: TSMRestMenuClient;
begin
  if FSMRestMenuClient = nil then
    FSMRestMenuClient:= TSMRestMenuClient.Create(DSRC_Data,  FInstanceOwner);
  Result := FSMRestMenuClient;
end;

function TDataCM.GetSMRestMenuHasIngredientClient: TSMRestMenuHasIngredientClient;
begin
  if FSMRestHasIngredientMenuClient = nil then
    FSMRestHasIngredientMenuClient := TSMRestMenuHasIngredientClient.Create(DSRC_Data,  FInstanceOwner);
  Result := FSMRestHasIngredientMenuClient;
end;

function TDataCM.GetSMRestSubgroupClient: TSMRestSubgroupClient;
begin
  if FSMRestSubgroupClient = nil then
    FSMRestSubgroupClient := TSMRestSubgroupClient.Create(DSRC_Data,  FInstanceOwner);
  Result := FSMRestSubgroupClient;
end;

function TDataCM.GetSMInvoiceMerchandiseClient: TSMInvoiceMerchandiseClient;
begin
  if FSMInvoiceMerchandiseClient = nil then
    FSMInvoiceMerchandiseClient:= TSMInvoiceMerchandiseClient.Create(DSRC_Data, FInstanceOwner);
  Result := FSMInvoiceMerchandiseClient;
end;

function TDataCM.GetSMInvoiceRectificationClient: TSMInvoiceRectificationClient;
begin
  if FSMInvoiceRectificationClient = nil then
    FSMInvoiceRectificationClient:= TSMInvoiceRectificationClient.Create(DSRC_Data, FInstanceOwner);
  Result := FSMInvoiceRectificationClient;
end;

function TDataCM.GetSMInvoiceReturn55Client: TSMInvoiceReturn55Client;
begin
  if FSMInvoiceReturn55Client = nil then
    FSMInvoiceReturn55Client:= TSMInvoiceReturn55Client.Create(DSRC_Data, FInstanceOwner);
  Result := FSMInvoiceReturn55Client;
end;

function TDataCM.GetSMInvoiceReturn65Client: TSMInvoiceReturn65Client;
begin
  if FSMInvoiceReturn65Client = nil then
    FSMInvoiceReturn65Client:= TSMInvoiceReturn65Client.Create(DSRC_Data, FInstanceOwner);

  Result := FSMInvoiceReturn65Client;
end;

function TDataCM.GetSMInvoiceReturnServiceClient: TSMInvoiceReturnServiceClient;
begin
  if FSMInvoiceReturnServiceClient = nil then
    FSMInvoiceReturnServiceClient:= TSMInvoiceReturnServiceClient.Create(DSRC_Data, FInstanceOwner);
  Result := FSMInvoiceReturnServiceClient;
end;

function TDataCM.GetSMKickbackClient: TSMKickbackClient;
begin
  if FSMKickbackClient = nil then
    FSMKickbackClient:= TSMKickbackClient.Create(DSRC_Data, FInstanceOwner);
  Result := FSMKickbackClient;
end;

end.

