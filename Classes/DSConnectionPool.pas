unit DSConnectionPool;

interface

uses
    SysUtils, Classes,
    DB,Variants, Windows, Math,
    System.IniFiles,
    IPPeerClient,
    FireDAC.Comp.Client,
    FireDAC.Phys.DS,
    FireDAC.Comp.UI,
    FireDAC.Phys.Intf,
    FireDAC.Stan.Util,
    FireDAC.Stan.Def,
    FireDAC.Stan.Pool ,
    FireDAC.Stan.Error,
    FireDAC.Stan.Intf,
    Datasnap.DSHTTPLayer,
    ClasseUtil,
    UnitConstantes;

Type
    TDSPoolConfig = record
      CleanupTimeout: string;
      ExpireTimeout: string;
      MaximumItems: string;
      Server: string;
      Port: string;
      DSUserName, DSPassword: string;
      IsHttpClient:Boolean;
      procedure ReadConfig;
    end;

  TDSConnectionPool = class(TComponent)
    const
      POOL_DEFNAME = 'POOL';
    private
      DSLink: TFDPhysDSDriverLink;
      WaitCursor:TFDGUIxWaitCursor;
      fIsReConn: Boolean;
      Config:TDSPoolConfig;
      function GetCount: Integer;
      procedure LiftUp;
      procedure ShutDown;
      procedure OnError(ASender, AInitiator: TObject; var AException: Exception);
      procedure OnRecover(ASender, AInitiator: TObject;AException: Exception; var AAction: TFDPhysConnectionRecoverAction);
      procedure OnRestored(ASender:TObject);
      procedure OnLost(ASender:TObject);
    public
      constructor Create; overload;
      destructor Destroy; override;
      function getConnection: TFDConnection;
      procedure WriteParams;
      property Count:Integer read GetCount;
      // if true the connection is not active
      property IsReConn:Boolean read fIsReConn write fIsReConn;
    end;

implementation

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

    sUsername := TUtil.LeIni(STRNG_ARQUIVO_CONFIGURACAO, sDriver,'User_Name');
    if sUsername = '' then begin
      sUsername := 'gestao_setes';
      TUtil.GravaIni(STRNG_ARQUIVO_CONFIGURACAO, sDriver, 'User_Name', sUsername);
    end;

    sPassword := TUtil.LeIni(STRNG_ARQUIVO_CONFIGURACAO, sDriver,'Password');
    if sPassword = '' then begin
      sPassword := '12345';
      TUtil.GravaIni(STRNG_ARQUIVO_CONFIGURACAO, sDriver, 'Password', sPassword);
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

  finally
    ArquivoIni.Free;
  end;
end;

{ TDSConnectionPool }
constructor TDSConnectionPool.Create;
begin
  DSLink := TFDPhysDSDriverLink.Create(self);
  WaitCursor := TFDGUIxWaitCursor.Create(self);
  Config.ReadConfig;
  LiftUp;
end;
destructor TDSConnectionPool.Destroy;
begin
  ShutDown;
  FDFreeAndNil(DSLink);
  FDFreeAndNil(WaitCursor);
  inherited;
end;
function TDSConnectionPool.getConnection: TFDConnection;
begin
{
  if ListofConnection.ContainsKey(TDSSessionManager.GetThreadSession.Id) then
     Result := ListofConnection[TDSSessionManager.GetThreadSession.Id]
  else
  begin
    Result := TFDConnection.Create(nil);
    Result.ConnectionDefName := POOL_DEFNAME;

    dbconn := TSQLConnection.Create(nil);
    dbconn.Params.Clear;
    dbconn.LoadParamsOnConnect := true;
    dbconn.ConnectionName := 'DS Employee';
    ListofConnection.Add(TDSSessionManager.GetThreadSession.Id, dbconn);
    Result := dbconn;
  end;


  // make some different actions for main thread and other thread
  if GetCurrentThreadID = MainThreadID then
  begin
    Result.OnRecover := OnRecover;
    Result.OnRestored := OnRestored;
  end
  else
  begin
    Result.OnRecover := OnRecoverIgnore;
    Result.OnRestored := OnRestored;
  end;
  }
end;

function TDSConnectionPool.GetCount: Integer;
begin
  Result := FDManager.ConnectionCount;
end;

procedure TDSConnectionPool.LiftUp;
var
  oParams: TStrings;
begin
  oParams := TStringList.Create;
  oParams.Add('DriverID=DS');
  oParams.Add('Server='+ Config.Server);
  oParams.Add('Port='+  Config.Port);
  oParams.Add('Pooled='+  'True');
  oParams.Add('POOL_CleanupTimeout='+  Config.CleanupTimeout);
  oParams.Add('POOL_ExpireTimeout='+  Config.ExpireTimeout);
  oParams.Add('POOL_MaximumItems='+  Config.MaximumItems);
  // also can support http protocol
  if Config.IsHttpClient then
    oParams.Add('Protocol='+  'http')
  else
    oParams.Add('Protocol='+  'tcp/ip');
  //oParams.Add('LoginTimeout='+'2000');
  //oParams.Add('CommunicationTimeout='+'2000');
  oParams.Add('User_Name='+  Config.DSUserName);
  oParams.Add('Password='+  Config.DSPassword);
//  FDManager.ResourceOptions.AutoReconnect := True;
  FDManager.AddConnectionDef(POOL_DEFNAME, 'DS', oParams);
  FreeAndNil(oParams);
  FDManager.Active := True;
end;
// may be used to write out params to file for debug
procedure TDSConnectionPool.WriteParams;
begin
 FileFromString(RecordSaveJSON(Config,TypeInfo(TDSPoolConfig)),
   ExtractFilePath(ParamStr(0))+'ConnParam.connection',True);
end;
procedure TDSConnectionPool.ShutDown;
begin
  FDManager.CloseConnectionDef(POOL_DEFNAME);
  FDManager.Close;
end;
procedure TDSConnectionPool.OnError(ASender, AInitiator: TObject;
  var AException: Exception);
begin
  // log error
end;
procedure TDSConnectionPool.OnRecover(ASender, AInitiator: TObject;
  AException: Exception; var AAction: TFDPhysConnectionRecoverAction);
begin
  IsReConn := True;
  // set global flag
  if ReConnectionCount = 0 then
  begin
    ReConnectionCount := ReConnectionCount + 1;
  end
  else
  begin
    ReConnectionCount := ReConnectionCount + 1;
  end;
  AAction := faFail; // if set to faRetry, this event will be triggered many times
end;
procedure TDSConnectionPool.OnRestored(ASender: TObject);
begin
  IsReConn := False;
  // set global flag
  if ReConnectionCount > 0 then
  begin
    ReConnectionCount := 0;
  end
  else
  begin
    ReConnectionCount := 0;
  end;
end;
procedure TDSConnectionPool.OnLost(ASender: TObject);
begin
  // notify to handle connection lost. only when faRetry
end;

procedure TDSConnectionPool.OnRecoverIgnore(ASender, AInitiator: TObject;
  AException: Exception; var AAction: TFDPhysConnectionRecoverAction);
begin
  // can do something different here when get connection in a thread
  IsReConn := True;
  // set global flag
  if ReConnectionCount = 0 then
  begin
    ReConnectionCount := ReConnectionCount + 1;
  end
  else
  begin
    ReConnectionCount := ReConnectionCount + 1;
  end;
  AAction := faFail;
end;
end.
