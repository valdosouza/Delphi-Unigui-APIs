unit MainModule;

interface

uses System.SysUtils, System.Classes,Winapi.Windows,
  Datasnap.DSServer, Datasnap.DSCommonServer,IniFiles,
  IPPeerServer, IPPeerAPI, Datasnap.DSAuth,
  System.Generics.Collections, Data.DBXCommon,
  ClasseUtil, UnitConstantes, Datasnap.DSMetadata, Datasnap.DSServerMetadata,
  Datasnap.DSSession,  FireDAC.Comp.UI, FireDAC.Comp.Client,
  IPPeerClient, FireDAC.Phys.DSDef, FireDAC.Stan.Intf, FireDAC.Phys,
  FireDAC.Phys.TDBXBase, FireDAC.Phys.DS, FireDAC.Phys.MySQLDef,
  FireDAC.UI.Intf, FireDAC.VCLUI.Wait, FireDAC.Stan.Option, FireDAC.Stan.Error,
  FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async,
  Data.DB, FireDAC.Phys.MySQL, Datasnap.DSHTTP, Datasnap.DSHTTPWebBroker,
  Datasnap.DSTCPServerTransport, Vcl.Forms, uSM, Vcl.AppEvnts ;
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
    DSServer1: TDSServer;
    DS_SC_Auth: TDSServerClass;
    MysqlLink: TFDPhysMySQLDriverLink;
    FDGUIxWaitCursor: TFDGUIxWaitCursor;
    AppEvent: TApplicationEvents;
    procedure DS_SC_AuthGetClass(DSServerClass: TDSServerClass;
      var PersistentClass: TPersistentClass);
    procedure DSServer1Disconnect(DSConnectEventObject: TDSConnectEventObject);
    procedure DSServer1Error(DSErrorEventObject: TDSErrorEventObject);
    procedure DataModuleCreate(Sender: TObject);
    procedure AppEventException(Sender: TObject; E: Exception);
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

{%CLASSGROUP 'Vcl.Controls.TControl'}

uses UnFunctions;

{$R *.dfm}
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
procedure TSC.AppEventException(Sender: TObject; E: Exception);
begin
  GeralogFile(concat('ApiData - uWM - ',sender.ClassName),E.Message);
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

procedure TSC.DSServer1Disconnect(DSConnectEventObject: TDSConnectEventObject);
begin
  if ListofConnection.ContainsKey(TDSSessionManager.GetThreadSession.Id) then
  Begin
     ListofConnection[TDSSessionManager.GetThreadSession.Id].Close;
     ListofConnection[TDSSessionManager.GetThreadSession.Id].DisposeOf;
     Try
       ListofConnection.Remove(TDSSessionManager.GetThreadSession.Id)
     except
      on E:Exception do
        GeralogFile(concat('ApiData - TSC.DSServer1Disconnect - ',DSConnectEventObject.ClassName),E.Message);
     End;
  End;
  LimpaMemoria;
end;

procedure TSC.DSServer1Error(DSErrorEventObject: TDSErrorEventObject);
begin
  GeralogFile(concat('ApiAuth - TSC - ',DSErrorEventObject.ClassName),DSErrorEventObject.Error.Message);
end;

procedure TSC.DS_SC_AuthGetClass(DSServerClass: TDSServerClass;
  var PersistentClass: TPersistentClass);
begin
  PersistentClass := uSM.TSM;
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

{ TDSPoolConfig }

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
    if sDriver = '' then begin
      sDriver := 'MySql';
      TUtil.GravaIni(STRNG_ARQUIVO_CONFIGURACAO, 'Configuracao', 'DriverBanco', sDriver);
    end;

    sServer := TUtil.LeIni(STRNG_ARQUIVO_CONFIGURACAO, sDriver,'Server');
    if sServer = '' then begin
      sServer := 'localhost';
      TUtil.GravaIni(STRNG_ARQUIVO_CONFIGURACAO, sDriver, 'Server', sServer);
    end;

    sNomeBanco := TUtil.LeIni(STRNG_ARQUIVO_CONFIGURACAO, sDriver,'Database');
    if sNomeBanco = '' then begin
      sNomeBanco := 'gestao_setes';
      TUtil.GravaIni(STRNG_ARQUIVO_CONFIGURACAO, sDriver, 'Database', sNomeBanco);
    end;

    sUsername := TUtil.LeIni(STRNG_ARQUIVO_CONFIGURACAO, sDriver,'User_Api_Auth');
    if sUsername = '' then begin
      sUsername := 'gestao_setes';
      TUtil.GravaIni(STRNG_ARQUIVO_CONFIGURACAO, sDriver, 'User_Api_Auth', sUsername);
    end;

    sPassword := TUtil.LeIni(STRNG_ARQUIVO_CONFIGURACAO, sDriver,'Pass_Api_Auth');
    if sPassword = '' then begin
      sPassword := '8Az%4py0';
      TUtil.GravaIni(STRNG_ARQUIVO_CONFIGURACAO, sDriver, 'Pass_Api_Auth', sPassword);
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


initialization
  FModule := TSC.Create(nil);
finalization
  FModule.Free;
end.

