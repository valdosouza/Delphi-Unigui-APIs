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

  Data.DB, FireDAC.Phys.MySQL, FireDAC.ConsoleUI.Wait, Datasnap.DSHTTP,
  Datasnap.DSHTTPWebBroker, Vcl.Forms, ClasseUtil,UnitConstantes,
  Vcl.AppEvnts, uSMMedia, uSMFinancial, uSMGeneral;
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
    DS_SC_Media: TDSServerClass;
    DSServidor: TDSServer;
    AppEvent: TApplicationEvents;
    TesteDB: TFDConnection;
    DS_SC_Financial: TDSServerClass;
    DSServerClass1: TDSServerClass;
    procedure DataModuleCreate(Sender: TObject);
    procedure DSServidorDisconnect(DSConnectEventObject: TDSConnectEventObject);
    procedure DSServidorError(DSErrorEventObject: TDSErrorEventObject);
    procedure DS_SC_MediaGetClass(DSServerClass: TDSServerClass;
      var PersistentClass: TPersistentClass);
    procedure DS_SC_FinancialGetClass(DSServerClass: TDSServerClass;
      var PersistentClass: TPersistentClass);
    procedure DSServerClass1GetClass(DSServerClass: TDSServerClass;
      var PersistentClass: TPersistentClass);
    procedure DataModuleDestroy(Sender: TObject);

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

implementation

{$R *.dfm}

uses UnFunctions;

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

constructor TSC.Create(AOwner: TComponent);
begin
  inherited;
  FDSServer := DSServidor;
end;

procedure TSC.DataModuleCreate(Sender: TObject);
begin
  ListofConnection := TDictionary<Integer, TFDConnection>.Create;
  MysqlLink.VendorLib := 'libmysql.dll';
  Config.ReadConfig;
end;

procedure TSC.DataModuleDestroy(Sender: TObject);
begin
  ListofConnection.DisposeOf;
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
    DB.Params.DriverID                := Config.Driver;
    DB.Params.Database                := Config.DataBase;
    DB.Params.UserName                := Config.DSUserName;
    DB.Params.Password                := Config.DSPassword;
    DB.LoginPrompt                    := False;
    DB.Params.Pooled                  := FAlse;
    DB.ResourceOptions.AutoReconnect  := True;
    ListofConnection.Add(TDSSessionManager.GetThreadSession.Id, DB);
    DB.Connected := True;
    Result := DB;
  end;
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

procedure TSC.DSServidorDisconnect(DSConnectEventObject: TDSConnectEventObject);
Begin
  LimpaMemoria;
  if ListofConnection.ContainsKey(TDSSessionManager.GetThreadSession.Id) then
  Begin
    ListofConnection[TDSSessionManager.GetThreadSession.Id].Close;
    ListofConnection.Remove(TDSSessionManager.GetThreadSession.Id);
  End;
end;

procedure TSC.DSServidorError(DSErrorEventObject: TDSErrorEventObject);
Var
  LcErro : String;
begin
  LcErro := DSErrorEventObject.Error.Message;
  GeralogFile(concat('ApiData - TSC - ',DSErrorEventObject.ClassName),LcErro);
  LimpaMemoria;
  abort;
end;

procedure TSC.DSServerClass1GetClass(DSServerClass: TDSServerClass;
  var PersistentClass: TPersistentClass);
begin
  PersistentClass := uSMGeneral.TSMGeneral;
end;

procedure TSC.DS_SC_FinancialGetClass(DSServerClass: TDSServerClass;
  var PersistentClass: TPersistentClass);
begin
  PersistentClass := uSMFinancial.TSMFinancial;
end;

procedure TSC.DS_SC_MediaGetClass(DSServerClass: TDSServerClass;
  var PersistentClass: TPersistentClass);
begin
  PersistentClass := uSMMedia.TSMMedia;
end;

initialization
  FModule := Tsc.Create(nil);
finalization
  FModule.Free;

end.

