unit MainModule;

interface

uses System.SysUtils, System.Classes,Winapi.Windows,
  Datasnap.DSServer, Datasnap.DSCommonServer,IniFiles,
  IPPeerServer, IPPeerAPI, Datasnap.DSAuth,
  System.Generics.Collections, Data.DBXCommon,
  Datasnap.DSMetadata, Datasnap.DSServerMetadata,
  Datasnap.DSSession,  FireDAC.Comp.UI, FireDAC.Comp.Client,
  IPPeerClient, FireDAC.Phys.DSDef, FireDAC.Stan.Intf, FireDAC.Phys,
  FireDAC.Phys.TDBXBase, FireDAC.Phys.DS, FireDAC.Phys.MySQLDef,
  FireDAC.UI.Intf, FireDAC.VCLUI.Wait, FireDAC.Stan.Option, FireDAC.Stan.Error,
  FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async,

  uSMMerchandise, uSMPriceList, uSMStockList, uSMPaymentTypes, uSMSalesMan,
  uSMOrderSale, uSMProduct, uSMBrand, uSMPackage, uSMCategory, ControllerStock,
  uSMStock, uSMPrice, uSMStockBalance, uSMMeasure, uSMBankAccount,
  uSMFinancialPlans, uSMFinancialStatement, uSMStockStatement, uSMAdvertiser,
  uSMBroadcaster, uSMOrderPI, uSMMedMaterial, uSMMedPosProg, uSMMedPriceJR,
  uSMLineBusiness, uSMContact, uSMFinancialBills, uSMInvoice,
  USMCountry, uSMAgency, uSMState, uSMCity, uSMServices, uSMEntityFiscal,
  uSMPromotion,uSMCustomer, uSMInstitution,uSMCashier,
  uSMPromotionItems, uSMInvoiceMerchandise, UnTrataExcecao, Vcl.AppEvnts,
  uSMOrderConsignment, uSMKickback,

  Data.DB, FireDAC.Phys.MySQL, FireDAC.ConsoleUI.Wait, Datasnap.DSHTTP,
  Datasnap.DSHTTPWebBroker, Vcl.Forms, uSMInvoiceReturn55, uSMInvoiceReturn65,
  uSMInvoiceReturnService, uSMInvoiceRectification, ClasseUtil,UnitConstantes,
  uSMRestGroup, uSMRestGroupHasMeasure, uSMRestGroupHasOptional, uSMRestMenu,
  uSMRestMenuHasIngredient, uSMRestSubgroup;
type

  TDSPoolConfig = record
    CleanupTimeout: string;
    ExpireTimeout: string;
    MaximumItems: string;
    Server: string;
    Driver : String;
    DataBase :String;
    Port: string;
    DSUserName, DSPassword: string;
    IsHttpClient:Boolean;
    procedure ReadConfig;
  end;

  TSC = class(TDataModule)
    MysqlLink: TFDPhysMySQLDriverLink;
    FDGUIxWaitCursor1: TFDGUIxWaitCursor;
    DS_SC_Country: TDSServerClass;
    DS_SC_Agency: TDSServerClass;
    DS_SC_State: TDSServerClass;
    DS_SC_City: TDSServerClass;
    DS_SC_Services: TDSServerClass;
    DS_SC_customer: TDSServerClass;
    DS_SC_Institution: TDSServerClass;
    DS_SC_Merchandise: TDSServerClass;
    DS_SC_Price_List: TDSServerClass;
    DS_SC_Stock_List: TDSServerClass;
    DS_SC_Payment_types: TDSServerClass;
    DS_SC_SalesMan: TDSServerClass;
    DS_SC_Order_Sale: TDSServerClass;
    DS_SC_Product: TDSServerClass;
    DS_SC_Brand: TDSServerClass;
    DS_SC_Package: TDSServerClass;
    DS_SC_Category: TDSServerClass;
    DS_SC_Stock: TDSServerClass;
    DS_SC_Price: TDSServerClass;
    DS_SC_Stock_Balance: TDSServerClass;
    DS_SC_Measure: TDSServerClass;
    DS_SC_BankAccount: TDSServerClass;
    DS_SC_FinancialPlans: TDSServerClass;
    DS_SC_FinancialStatement: TDSServerClass;
    DS_SC_Stock_Statement: TDSServerClass;
    DS_SC_Advertiser: TDSServerClass;
    DS_SC_Broadcaster: TDSServerClass;
    DS_SC_Order_PI: TDSServerClass;
    DS_SC_Med_Material: TDSServerClass;
    DS_SC_Med_Pos_Prog: TDSServerClass;
    DS_SC_Med_Price_JR: TDSServerClass;
    DS_SC_Line_Business: TDSServerClass;
    DS_SC_Contact: TDSServerClass;
    DS_SC_FinancialBills: TDSServerClass;
    DS_SC_Invoice: TDSServerClass;
    DS_SC_Entity_Fiscal: TDSServerClass;
    DS_SC_Cashier: TDSServerClass;
    DS_SC_Promotion: TDSServerClass;
    DS_SC_Promotion_Items: TDSServerClass;
    DS_SC_Invoice_Merchandise: TDSServerClass;
    DS_SC_Order_Consignment: TDSServerClass;
    DS_SC_Kickback: TDSServerClass;
    DSServer1: TDSServer;
    AppEvent: TApplicationEvents;
    DS_SC_Invoice_Return_55: TDSServerClass;
    DS_SC_Invoice_Return_65: TDSServerClass;
    DS_SC_Invoice_Return_Service: TDSServerClass;
    DS_SC_Invoice_Rectification: TDSServerClass;
    DS_SC_Order_Purchase: TDSServerClass;
    DS_SC_Order_Stock_Adjust: TDSServerClass;
    DS_SC_Rest_Menu: TDSServerClass;
    DS_SC_Rest_Menu_Has_Ingredient: TDSServerClass;
    DS_SC_Rest_Group: TDSServerClass;
    DS_SC_Rest_Subgroup: TDSServerClass;
    DS_SC_Rest_Group_Has_Measure: TDSServerClass;
    DS_SC_Rest_Group_Has_Optional: TDSServerClass;
    DS_SC_Provider: TDSServerClass;
    procedure DataModuleCreate(Sender: TObject);
    procedure DS_SC_InstitutionGetClass(DSServerClass: TDSServerClass;
      var PersistentClass: TPersistentClass);
    procedure DS_SC_Entity_FiscalGetClass(DSServerClass: TDSServerClass;
      var PersistentClass: TPersistentClass);
    procedure DS_SC_MeasureGetClass(DSServerClass: TDSServerClass;
      var PersistentClass: TPersistentClass);
    procedure DS_SC_Stock_ListGetClass(DSServerClass: TDSServerClass;
      var PersistentClass: TPersistentClass);
    procedure DS_SC_CountryGetClass(DSServerClass: TDSServerClass;
      var PersistentClass: TPersistentClass);
    procedure DS_SC_MerchandiseGetClass(DSServerClass: TDSServerClass;
      var PersistentClass: TPersistentClass);
    procedure DS_SC_BrandGetClass(DSServerClass: TDSServerClass;
      var PersistentClass: TPersistentClass);
    procedure DS_SC_BankAccountGetClass(DSServerClass: TDSServerClass;
      var PersistentClass: TPersistentClass);
    procedure DS_SC_Stock_StatementGetClass(DSServerClass: TDSServerClass;
      var PersistentClass: TPersistentClass);
    procedure DS_SC_StateGetClass(DSServerClass: TDSServerClass;
      var PersistentClass: TPersistentClass);
    procedure DS_SC_Price_ListGetClass(DSServerClass: TDSServerClass;
      var PersistentClass: TPersistentClass);
    procedure DS_SC_PackageGetClass(DSServerClass: TDSServerClass;
      var PersistentClass: TPersistentClass);
    procedure DS_SC_FinancialPlansGetClass(DSServerClass: TDSServerClass;
      var PersistentClass: TPersistentClass);
    procedure DS_SC_PromotionGetClass(DSServerClass: TDSServerClass;
      var PersistentClass: TPersistentClass);
    procedure DS_SC_CityGetClass(DSServerClass: TDSServerClass;
      var PersistentClass: TPersistentClass);
    procedure DS_SC_CategoryGetClass(DSServerClass: TDSServerClass;
      var PersistentClass: TPersistentClass);
    procedure DS_SC_FinancialStatementGetClass(DSServerClass: TDSServerClass;
      var PersistentClass: TPersistentClass);
    procedure DS_SC_Promotion_ItemsGetClass(DSServerClass: TDSServerClass;
      var PersistentClass: TPersistentClass);
    procedure DS_SC_ServicesGetClass(DSServerClass: TDSServerClass;
      var PersistentClass: TPersistentClass);
    procedure DS_SC_Payment_typesGetClass(DSServerClass: TDSServerClass;
      var PersistentClass: TPersistentClass);
    procedure DS_SC_StockGetClass(DSServerClass: TDSServerClass;
      var PersistentClass: TPersistentClass);
    procedure DS_SC_FinancialBillsGetClass(DSServerClass: TDSServerClass;
      var PersistentClass: TPersistentClass);
    procedure DS_SC_customerGetClass(DSServerClass: TDSServerClass;
      var PersistentClass: TPersistentClass);
    procedure DS_SC_SalesManGetClass(DSServerClass: TDSServerClass;
      var PersistentClass: TPersistentClass);
    procedure DS_SC_PriceGetClass(DSServerClass: TDSServerClass;
      var PersistentClass: TPersistentClass);
    procedure DS_SC_InvoiceGetClass(DSServerClass: TDSServerClass;
      var PersistentClass: TPersistentClass);
    procedure DS_SC_Order_SaleGetClass(DSServerClass: TDSServerClass;
      var PersistentClass: TPersistentClass);
    procedure DS_SC_ProductGetClass(DSServerClass: TDSServerClass;
      var PersistentClass: TPersistentClass);
    procedure DS_SC_Stock_BalanceGetClass(DSServerClass: TDSServerClass;
      var PersistentClass: TPersistentClass);
    procedure DS_SC_AdvertiserGetClass(DSServerClass: TDSServerClass;
      var PersistentClass: TPersistentClass);
    procedure DS_SC_AgencyGetClass(DSServerClass: TDSServerClass;
      var PersistentClass: TPersistentClass);
    procedure DS_SC_BroadcasterGetClass(DSServerClass: TDSServerClass;
      var PersistentClass: TPersistentClass);
    procedure DS_SC_ContactGetClass(DSServerClass: TDSServerClass;
      var PersistentClass: TPersistentClass);
    procedure DS_SC_CashierGetClass(DSServerClass: TDSServerClass;
      var PersistentClass: TPersistentClass);
    procedure DS_SC_Order_PIGetClass(DSServerClass: TDSServerClass;
      var PersistentClass: TPersistentClass);
    procedure DS_SC_Med_MaterialGetClass(DSServerClass: TDSServerClass;
      var PersistentClass: TPersistentClass);
    procedure DS_SC_Med_Pos_ProgGetClass(DSServerClass: TDSServerClass;
      var PersistentClass: TPersistentClass);
    procedure DS_SC_Med_Price_JRGetClass(DSServerClass: TDSServerClass;
      var PersistentClass: TPersistentClass);
    procedure DS_SC_Line_BusinessGetClass(DSServerClass: TDSServerClass;
      var PersistentClass: TPersistentClass);
    procedure DS_SC_Invoice_MerchandiseGetClass(DSServerClass: TDSServerClass;
      var PersistentClass: TPersistentClass);
    procedure DS_SC_Order_ConsignmentGetClass(DSServerClass: TDSServerClass;
      var PersistentClass: TPersistentClass);
    procedure DS_SC_KickbackGetClass(DSServerClass: TDSServerClass;
      var PersistentClass: TPersistentClass);
    procedure DSServer1Disconnect(DSConnectEventObject: TDSConnectEventObject);
    procedure AppEventException(Sender: TObject; E: Exception);
    procedure DSServer1Error(DSErrorEventObject: TDSErrorEventObject);
    procedure DS_SC_Invoice_Return_55GetClass(DSServerClass: TDSServerClass;
      var PersistentClass: TPersistentClass);
    procedure DS_SC_Invoice_Return_65GetClass(DSServerClass: TDSServerClass;
      var PersistentClass: TPersistentClass);
    procedure DS_SC_Invoice_Return_ServiceGetClass(
      DSServerClass: TDSServerClass; var PersistentClass: TPersistentClass);
    procedure DS_SC_Invoice_RectificationGetClass(DSServerClass: TDSServerClass;
      var PersistentClass: TPersistentClass);
    procedure DS_SC_Order_PurchaseGetClass(DSServerClass: TDSServerClass;
      var PersistentClass: TPersistentClass);
    procedure DS_SC_Order_Stock_AdjustGetClass(DSServerClass: TDSServerClass;
      var PersistentClass: TPersistentClass);
    procedure DS_SC_Rest_MenuGetClass(DSServerClass: TDSServerClass;
      var PersistentClass: TPersistentClass);
    procedure DS_SC_Rest_Menu_Has_IngredientGetClass(
      DSServerClass: TDSServerClass; var PersistentClass: TPersistentClass);
    procedure DS_SC_Rest_GroupGetClass(DSServerClass: TDSServerClass;
      var PersistentClass: TPersistentClass);
    procedure DS_SC_Rest_SubgroupGetClass(DSServerClass: TDSServerClass;
      var PersistentClass: TPersistentClass);
    procedure DS_SC_Rest_Group_Has_MeasureGetClass(
      DSServerClass: TDSServerClass; var PersistentClass: TPersistentClass);
    procedure DS_SC_Rest_Group_Has_OptionalGetClass(
      DSServerClass: TDSServerClass; var PersistentClass: TPersistentClass);
    procedure DS_SC_ProviderGetClass(DSServerClass: TDSServerClass;
      var PersistentClass: TPersistentClass);

  private
    ListofConnection : TDictionary<Integer,TFDConnection>;
    procedure LimpaMemoria;
  public
    Config:TDSPoolConfig;
    function GetSessionConnection : TFDConnection;
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
  end;

  function DSServer: TDSServer;
  function GetConnection : TFDConnection;
  function GetListConnection:TList<Integer>;
  function GetListConnectionSession:TList<String>;

implementation

{$R *.dfm}

uses UnFunctions, uSMOrderPurchase, uSMOrderStockAdjust, uSMProvider;

var
  FModule: TComponent;
  FDSServer: TDSServer;

function DSServer: TDSServer;
begin
  Result := FDSServer;
end;

function GetConnection : TFDConnection;
BEgin
  Result := TSC(FModule).GetSessionConnection;
End;

function GetListConnection:TList<Integer>;
BEgin
  REsult := TList<Integer>.Create( TSC(FModule).ListofConnection.Keys );
End;

function GetListConnectionSession:TList<String>;
Var
  Lc_list_int : TList<Integer>;
  I:Integer;
  Lc_Keys : String;
Begin
  Lc_list_int := TList<Integer>.Create( TSC(FModule).ListofConnection.Keys );

  REsult := TList<String>.Create;
  for I := 0 to Lc_list_int.Count-1 do
  Begin
    Lc_Keys := Lc_list_int[I].ToString;
    if TSC(FModule).ListofConnection.ContainsKey(Lc_list_int[I]) then
    Begin
      if Assigned(TSC(FModule).ListofConnection[I]) then
      Begin
        if TSC(FModule).ListofConnection[I].Connected then
          REsult.Add(concat(Lc_Keys, ' - Conectado'))
        else
          REsult.Add(concat(Lc_Keys, ' - Desconectado'))
      End;
    End
    else
    Begin
      REsult.Add(concat(Lc_Keys, ' - Não associados'))
    End;
  End;
End;

procedure TDSPoolConfig.ReadConfig;
var
   ArquivoIni: TIniFile;
   sArqConfig,
   sDriver,
   sDriverBanco,
   sNomeBanco,
   sServer,
   sUsername,
   sPassword,
   sPublic,
   sPrivate,
   sUrl  : String;
begin
  try
    sDriver := TUtil.LeIni(STRNG_ARQUIVO_CONFIGURACAO,'Configuracao','DriverBanco');
    if sDriver = '' then
    begin
      sDriver := 'MySql';
      TUtil.GravaIni(STRNG_ARQUIVO_CONFIGURACAO, 'Configuracao', 'DriverBanco', sDriver);
    end;

    sServer := TUtil.LeIni(STRNG_ARQUIVO_CONFIGURACAO, sDriver,'Server');
    if sServer = '' then
    begin
      sServer := 'localhost';
      TUtil.GravaIni(STRNG_ARQUIVO_CONFIGURACAO, sDriver, 'Server', sServer);
    end;

    sNomeBanco := TUtil.LeIni(STRNG_ARQUIVO_CONFIGURACAO, sDriver,'Database');
    if sNomeBanco = '' then
    begin
      sNomeBanco := 'gestao_setes';
      TUtil.GravaIni(STRNG_ARQUIVO_CONFIGURACAO, sDriver, 'Database', sNomeBanco);
    end;

    sUsername := TUtil.LeIni(STRNG_ARQUIVO_CONFIGURACAO, sDriver,'User_Api_Data');
    if sUsername = '' then
    begin
      sUsername := 'gestao_apidata';
      TUtil.GravaIni(STRNG_ARQUIVO_CONFIGURACAO, sDriver, 'User_Api_Data', sUsername);
    end;

    sPassword := TUtil.LeIni(STRNG_ARQUIVO_CONFIGURACAO, sDriver,'Pass_Api_Data');
    if sPassword = '' then
    begin
      sPassword := 'u6G53#yg';
      TUtil.GravaIni(STRNG_ARQUIVO_CONFIGURACAO, sDriver, 'Pass_Api_Data', sPassword);
    end;

    sDriverBanco := TUtil.LeIni(STRNG_ARQUIVO_CONFIGURACAO, sDriver,'DriverID');
    if sDriverBanco = '' then begin
      sDriverBanco := 'MySql';
      TUtil.GravaIni(STRNG_ARQUIVO_CONFIGURACAO, sDriver, 'DriverID', sDriverBanco);
    end;

    sPublic := TUtil.LeIni(STRNG_ARQUIVO_CONFIGURACAO, 'Diretorios','Publico');
    if sPublic = '' then begin
      sPublic := STRNG_CAMINHO_PUBLICO;
      TUtil.GravaIni(STRNG_ARQUIVO_CONFIGURACAO, 'Diretorios', 'Publico', sPublic);
    end;

    sPrivate := TUtil.LeIni(STRNG_ARQUIVO_CONFIGURACAO, 'Diretorios','Privado');
    if sPrivate = '' then begin
      sPrivate := STRNG_CAMINHO_PRIVADO;
      TUtil.GravaIni(STRNG_ARQUIVO_CONFIGURACAO, 'Diretorios', 'Privado', sPrivate);
    end;

    sUrl := TUtil.LeIni(STRNG_ARQUIVO_CONFIGURACAO, 'Diretorios','URL');
    if sUrl = '' then begin
      sUrl := STRNG_CAMINHO_URL;
      TUtil.GravaIni(STRNG_ARQUIVO_CONFIGURACAO, 'Diretorios', 'URL', sUrl);
    end;

    CleanupTimeout  := '30000';
    ExpireTimeout   := '90000';
    MaximumItems    := '50';
    Server          := sServer;
    Port            := '3306';
    Driver          := sDriver;
    DataBase        := sNomeBanco;
    DSUserName      := sUsername;
    DSPassword      := sPassword;
    IsHttpClient    := True;
  finally
    ArquivoIni.Free;
  end;

end;

procedure TSC.AppEventException(Sender: TObject; E: Exception);
begin
  GeralogFile(concat('ApiData - uWM - ',sender.ClassName),E.Message);
  abort;
end;

constructor TSC.Create(AOwner: TComponent);
begin
  inherited;
  FDSServer := DSServer1;
end;

procedure TSC.DataModuleCreate(Sender: TObject);
begin
  ListofConnection := TDictionary<Integer, TFDConnection>.Create;
  MysqlLink.VendorLib := 'libmysql.dll';
  Config.ReadConfig;
end;

destructor TSC.Destroy;
begin
  inherited;
  FDSServer := nil;
end;

function TSC.GetSessionConnection: TFDConnection;
var
  DB : TFDConnection;
begin
  //  CodeSite.Send('Thread ID', TDSSessionManager.GetThreadSession.Id);
  if ListofConnection.ContainsKey(TDSSessionManager.GetThreadSession.Id) then
     Result := ListofConnection[TDSSessionManager.GetThreadSession.Id]
  else
  begin
    DB := TFDConnection.Create(nil);
    DB.Params.Clear;
    DB.Params.Add('Server='+Config.Server);
    DB.Params.Add('Port='+  Config.Port);
    //DB.Params.Add('UseSSL=False');
    DB.Params.DriverID                := Config.Driver;
    DB.Params.Database                := Config.DataBase;
    DB.Params.UserName                := Config.DSUserName;
    DB.Params.Password                := Config.DSPassword;
    DB.LoginPrompt                    := False;
    DB.Params.Pooled                  := FAlse;

    DB.ResourceOptions.AutoReconnect  := True;
    try
      DB.Connected := True;
    except
      on e: Exception do
        Geraloglocal('TSC.GetSessionConnection: TFDConnection',e.Message);

    end;
    ListofConnection.Add(TDSSessionManager.GetThreadSession.Id, DB);
    Result := DB;
  end;
  if not Result.Connected then
    Result.Connected := True;
end;

procedure TSC.LimpaMemoria;
var
   MainHandle : THandle;
begin
  try
    MainHandle := OpenProcess(PROCESS_ALL_ACCESS, false, GetCurrentProcessID) ;
    SetProcessWorkingSetSize(MainHandle, $FFFFFFFF, $FFFFFFFF) ;
    CloseHandle(MainHandle);
  except
    on E: Exception do
      GeralogCrashlytics('TSC.LimpaMemoria - ',E.Message);
  end;
end;

procedure TSC.DSServer1Disconnect(DSConnectEventObject: TDSConnectEventObject);
Begin
  if GetConnection <> nil then
  Begin
     //GetConnection.Connected := FAlse;
     GetConnection.Close;
     //GetConnection.DisposeOf;
  End;
  LimpaMemoria;
end;

procedure TSC.DSServer1Error(DSErrorEventObject: TDSErrorEventObject);
Var
  LcErro : String;
begin
  LcErro := DSErrorEventObject.Error.Message;
  GeralogFile(concat('ApiData - TSC - ',DSErrorEventObject.ClassName),LcErro);
  LimpaMemoria;
  abort;
end;

procedure TSC.DS_SC_Rest_GroupGetClass(DSServerClass: TDSServerClass;
  var PersistentClass: TPersistentClass);
begin
  PersistentClass := uSMRestGroup.TSMRestGroup;
end;

procedure TSC.DS_SC_Rest_Group_Has_MeasureGetClass(
  DSServerClass: TDSServerClass; var PersistentClass: TPersistentClass);
begin
  PersistentClass := uSMRestGroupHasMeasure.TSMRestGroupHasMeasure;
end;

procedure TSC.DS_SC_Rest_Group_Has_OptionalGetClass(
  DSServerClass: TDSServerClass; var PersistentClass: TPersistentClass);
begin
  PersistentClass := uSMRestGroupHasOptional.TSMRestGroupHasOptional;
end;

procedure TSC.DS_SC_Rest_MenuGetClass(DSServerClass: TDSServerClass;
  var PersistentClass: TPersistentClass);
begin
  PersistentClass := uSMRestMenu.TSMRestMenu;
end;

procedure TSC.DS_SC_Rest_Menu_Has_IngredientGetClass(
  DSServerClass: TDSServerClass; var PersistentClass: TPersistentClass);
begin
  PersistentClass := uSMRestMenuHasIngredient.TSMRestMenuHasIngredient;
end;

procedure TSC.DS_SC_Rest_SubgroupGetClass(DSServerClass: TDSServerClass;
  var PersistentClass: TPersistentClass);
begin
  PersistentClass := uSMRestSubgroup.TSMRestSubgroup;
end;

procedure TSC.DS_SC_AdvertiserGetClass(DSServerClass: TDSServerClass;
  var PersistentClass: TPersistentClass);
begin
  PersistentClass := uSMAdvertiser.TSMAdvertiser;
end;

procedure TSC.DS_SC_AgencyGetClass(DSServerClass: TDSServerClass;
  var PersistentClass: TPersistentClass);
begin
  PersistentClass := uSMAgency.TSMAgency;
end;

procedure TSC.DS_SC_BankAccountGetClass(DSServerClass: TDSServerClass;
  var PersistentClass: TPersistentClass);
begin
  PersistentClass := uSMBankAccount.TSMBankAccount;
end;

procedure TSC.DS_SC_BrandGetClass(DSServerClass: TDSServerClass;
  var PersistentClass: TPersistentClass);
begin
  PersistentClass := uSMBrand.TSMBrand;
end;

procedure TSC.DS_SC_BroadcasterGetClass(DSServerClass: TDSServerClass;
  var PersistentClass: TPersistentClass);
begin
  PersistentClass := uSMBroadcaster.TSMBroadcaster;
end;

procedure TSC.DS_SC_CashierGetClass(DSServerClass: TDSServerClass;
  var PersistentClass: TPersistentClass);
begin
  PersistentClass := uSMCashier.TSMCashier;
end;

procedure TSC.DS_SC_CategoryGetClass(DSServerClass: TDSServerClass;
  var PersistentClass: TPersistentClass);
begin
    PersistentClass := uSMCategory.TSMCAtegory;
end;

procedure TSC.DS_SC_CityGetClass(DSServerClass: TDSServerClass;
  var PersistentClass: TPersistentClass);
begin
  PersistentClass := uSMCity.TSMCity;
end;

procedure TSC.DS_SC_ContactGetClass(DSServerClass: TDSServerClass;
  var PersistentClass: TPersistentClass);
begin
  PersistentClass := uSMContact.TSMContact;
end;

procedure TSC.DS_SC_CountryGetClass(DSServerClass: TDSServerClass;
  var PersistentClass: TPersistentClass);
begin
  PersistentClass := USMCountry.TSMCountry;
end;

procedure TSC.DS_SC_customerGetClass(DSServerClass: TDSServerClass;
  var PersistentClass: TPersistentClass);
begin
  PersistentClass := uSMCustomer.TSMCustomer;
end;

procedure TSC.DS_SC_Entity_FiscalGetClass(DSServerClass: TDSServerClass;
  var PersistentClass: TPersistentClass);
begin
  PersistentClass := uSMEntityFiscal.TSMEntityFiscal;
end;

procedure TSC.DS_SC_FinancialBillsGetClass(DSServerClass: TDSServerClass;
  var PersistentClass: TPersistentClass);
begin
  PersistentClass := uSMFinancialBills.TSMFinancialBills;
end;

procedure TSC.DS_SC_FinancialPlansGetClass(DSServerClass: TDSServerClass;
  var PersistentClass: TPersistentClass);
begin
  PersistentClass := uSMFinancialPlans.TSMFinancialPLans;
end;

procedure TSC.DS_SC_FinancialStatementGetClass(DSServerClass: TDSServerClass;
  var PersistentClass: TPersistentClass);
begin
  PersistentClass := uSMFinancialStatement.TSMFinancialStatement;
end;

procedure TSC.DS_SC_InstitutionGetClass(DSServerClass: TDSServerClass;
  var PersistentClass: TPersistentClass);
begin
  PersistentClass := uSMInstitution.TSMInstitution;
end;

procedure TSC.DS_SC_InvoiceGetClass(DSServerClass: TDSServerClass;
  var PersistentClass: TPersistentClass);
begin
  PersistentClass := uSMInvoice.TSMInvoice;
end;

procedure TSC.DS_SC_Invoice_MerchandiseGetClass(DSServerClass: TDSServerClass;
  var PersistentClass: TPersistentClass);
begin
  PersistentClass := uSMInvoiceMerchandise.TSMInvoiceMerchandise;
end;

procedure TSC.DS_SC_Invoice_RectificationGetClass(DSServerClass: TDSServerClass;
  var PersistentClass: TPersistentClass);
begin
  PersistentClass := uSMInvoiceRectification.TSMInvoiceRectification;
end;

procedure TSC.DS_SC_Invoice_Return_55GetClass(DSServerClass: TDSServerClass;
  var PersistentClass: TPersistentClass);
begin
  PersistentClass := uSMInvoiceReturn55.TSMInvoiceReturn55;
end;

procedure TSC.DS_SC_Invoice_Return_65GetClass(DSServerClass: TDSServerClass;
  var PersistentClass: TPersistentClass);
begin
  PersistentClass := uSMInvoiceReturn65.TSMInvoiceReturn65;
end;

procedure TSC.DS_SC_Invoice_Return_ServiceGetClass(
  DSServerClass: TDSServerClass; var PersistentClass: TPersistentClass);
begin
  PersistentClass := uSMInvoiceReturnService.TSMInvoiceReturnService;
end;

procedure TSC.DS_SC_KickbackGetClass(DSServerClass: TDSServerClass;
  var PersistentClass: TPersistentClass);
begin
  PersistentClass := uSMKickback.TSMKickback;
end;

procedure TSC.DS_SC_Line_BusinessGetClass(DSServerClass: TDSServerClass;
  var PersistentClass: TPersistentClass);
begin
  PersistentClass := uSMLineBusiness.TSMLineBusiness;
end;

procedure TSC.DS_SC_MeasureGetClass(DSServerClass: TDSServerClass;
  var PersistentClass: TPersistentClass);
begin
  PersistentClass := uSMMeasure.TSMMeasure;
end;

procedure TSC.DS_SC_Med_MaterialGetClass(DSServerClass: TDSServerClass;
  var PersistentClass: TPersistentClass);
begin
  PersistentClass := uSMMedMaterial.TSMMedMaterial;
end;

procedure TSC.DS_SC_Med_Pos_ProgGetClass(DSServerClass: TDSServerClass;
  var PersistentClass: TPersistentClass);
begin
  PersistentClass := uSMMedPosProg.TSMMedPosProg;
end;

procedure TSC.DS_SC_Med_Price_JRGetClass(DSServerClass: TDSServerClass;
  var PersistentClass: TPersistentClass);
begin
  PersistentClass := uSMMedPriceJR.TSMMedPriceJR;
end;

procedure TSC.DS_SC_MerchandiseGetClass(DSServerClass: TDSServerClass;
  var PersistentClass: TPersistentClass);
begin
  PersistentClass := uSMMerchandise.TSMMerchandise;
end;

procedure TSC.DS_SC_Order_ConsignmentGetClass(DSServerClass: TDSServerClass;
  var PersistentClass: TPersistentClass);
begin
  PersistentClass := uSMOrderConsignment.TSMOrderConsignment;
end;

procedure TSC.DS_SC_Order_PIGetClass(DSServerClass: TDSServerClass;
  var PersistentClass: TPersistentClass);
begin
  PersistentClass := uSMOrderPI.TSMOrderPI;
end;

procedure TSC.DS_SC_Order_PurchaseGetClass(DSServerClass: TDSServerClass;
  var PersistentClass: TPersistentClass);
begin
  PersistentClass := uSMOrderPurchase.TSMOrderPurchase;
end;

procedure TSC.DS_SC_Order_SaleGetClass(DSServerClass: TDSServerClass;
  var PersistentClass: TPersistentClass);
begin
  PersistentClass := uSMOrderSale.TSMOrderSale;
end;

procedure TSC.DS_SC_Order_Stock_AdjustGetClass(DSServerClass: TDSServerClass;
  var PersistentClass: TPersistentClass);
begin
  PersistentClass := uSMOrderStockAdjust.TSMOrderStockAdjust;
end;

procedure TSC.DS_SC_PackageGetClass(DSServerClass: TDSServerClass;
  var PersistentClass: TPersistentClass);
begin
  PersistentClass := uSMPackage.TSMPackage;
end;

procedure TSC.DS_SC_Payment_typesGetClass(DSServerClass: TDSServerClass;
  var PersistentClass: TPersistentClass);
begin
  PersistentClass := uSMPaymentTypes.TSMPaymentTypes;
end;

procedure TSC.DS_SC_PriceGetClass(DSServerClass: TDSServerClass;
  var PersistentClass: TPersistentClass);
begin
  PersistentClass := uSMPrice.TSMPrice;
end;

procedure TSC.DS_SC_Price_ListGetClass(DSServerClass: TDSServerClass;
  var PersistentClass: TPersistentClass);
begin
  PersistentClass := uSMPriceList.TSMPriceList;
end;

procedure TSC.DS_SC_ProductGetClass(DSServerClass: TDSServerClass;
  var PersistentClass: TPersistentClass);
begin
  PersistentClass := uSMProduct.TSMProduct;
end;

procedure TSC.DS_SC_PromotionGetClass(DSServerClass: TDSServerClass;
  var PersistentClass: TPersistentClass);
begin
  PersistentClass := uSMPromotion.TSMPromotion;
end;

procedure TSC.DS_SC_Promotion_ItemsGetClass(DSServerClass: TDSServerClass;
  var PersistentClass: TPersistentClass);
begin
  PersistentClass := uSMPromotionItems.TSMPromotionItems;
end;

procedure TSC.DS_SC_ProviderGetClass(DSServerClass: TDSServerClass;
  var PersistentClass: TPersistentClass);
begin
  PersistentClass := uSMProvider.TSMProvider;
end;

procedure TSC.DS_SC_SalesManGetClass(DSServerClass: TDSServerClass;
  var PersistentClass: TPersistentClass);
begin
  PersistentClass := uSMSalesMan.TSMSalesMan;
end;

procedure TSC.DS_SC_ServicesGetClass(DSServerClass: TDSServerClass;
  var PersistentClass: TPersistentClass);
begin
  PersistentClass := uSMServices.TSMServices;
end;

procedure TSC.DS_SC_StateGetClass(DSServerClass: TDSServerClass;
  var PersistentClass: TPersistentClass);
begin
  PersistentClass := uSMState.TSMState;
end;

procedure TSC.DS_SC_StockGetClass(DSServerClass: TDSServerClass;
  var PersistentClass: TPersistentClass);
begin
  PersistentClass := uSMStock.TSMStock;
end;

procedure TSC.DS_SC_Stock_BalanceGetClass(DSServerClass: TDSServerClass;
  var PersistentClass: TPersistentClass);
begin
  PersistentClass := uSMStockBalance.TSMStockBalance;
end;

procedure TSC.DS_SC_Stock_ListGetClass(DSServerClass: TDSServerClass;
  var PersistentClass: TPersistentClass);
begin
  PersistentClass := uSMStockList.TSMStockList;
end;

procedure TSC.DS_SC_Stock_StatementGetClass(DSServerClass: TDSServerClass;
  var PersistentClass: TPersistentClass);
begin
  PersistentClass := uSMStockStatement.TSMStockStatement;
end;

initialization
  FModule := TSC.Create(nil);
finalization
  FModule.Free;

end.

