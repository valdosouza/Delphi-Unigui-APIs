unit uWM;

interface

uses
  System.SysUtils, System.Classes, Web.HTTPApp, Datasnap.DSHTTPCommon,
  Datasnap.DSHTTPWebBroker, Datasnap.DSServer,
  Web.WebFileDispatcher, Web.HTTPProd,
  DataSnap.DSAuth,
  Datasnap.DSProxyJavaScript, IPPeerServer, Datasnap.DSMetadata,
  Datasnap.DSServerMetadata, Datasnap.DSClientMetadata, Datasnap.DSCommonServer,
  Datasnap.DSHTTP, Datasnap.DSProxyDelphiRest, System.Generics.Collections,
  Datasnap.DSSession, Vcl.Forms, System.IniFiles,
  ClasseUtil, UnitConstantes, UI,
  UnFunctions,Vcl.AppEvnts;

type

  TWM = class(TWebModule)
    ApplicationEvents1: TApplicationEvents;
    DSHTTPWebDispatcher1: TDSHTTPWebDispatcher;
    WebFileDispatcher1: TWebFileDispatcher;
    DSProxyGenerator1: TDSProxyGenerator;
    DSServerMetaDataProvider1: TDSServerMetaDataProvider;
    procedure WebModule1DefaultHandlerAction(Sender: TObject;
      Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);
    procedure WebFileDispatcher1BeforeDispatch(Sender: TObject;
      const AFileName: string; Request: TWebRequest; Response: TWebResponse;
      var Handled: Boolean);
    procedure WebModuleCreate(Sender: TObject);
    procedure ApplicationEvents1Exception(Sender: TObject; E: Exception);
    procedure WebModuleException(Sender: TObject; E: Exception;
      var Handled: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }

  end;

var
  WebModuleClass: TComponentClass = TWM;

implementation

{$R *.dfm}

uses Web.WebReq, uMain, MainModule;


procedure TWM.WebModule1DefaultHandlerAction(Sender: TObject;
  Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);
begin
  Response.Content :=
    '<html>' +
    '<head><title>API Dados - Web Gestao</title></head>' +
    '<body>DataSnap Server</body>' +
    '</html>';

end;


procedure TWM.ApplicationEvents1Exception(Sender: TObject; E: Exception);
begin
  GeralogFile(concat('ApiData - TWM - ',sender.ClassName),E.Message);
  abort;
end;

procedure TWM.WebFileDispatcher1BeforeDispatch(Sender: TObject;
  const AFileName: string; Request: TWebRequest; Response: TWebResponse;
  var Handled: Boolean);
var
  D1, D2: TDateTime;
begin
  Handled := False;
  if SameFileName(ExtractFileName(AFileName), 'serverfunctions.js') then
    if not FileExists(AFileName) or (FileAge(AFileName, D1) and FileAge(WebApplicationFileName, D2) and (D1 < D2)) then
    begin
      DSProxyGenerator1.TargetDirectory := ExtractFilePath(AFileName);
      DSProxyGenerator1.TargetUnitName := ExtractFileName(AFileName);
      DSProxyGenerator1.Write;
    end;
end;

procedure TWM.WebModuleCreate(Sender: TObject);
begin
  DSHTTPWebDispatcher1.Server := DSServer;
  if DSServer.Started then
  begin
    DSHTTPWebDispatcher1.DbxContext := DSServer.DbxContext;
    DSHTTPWebDispatcher1.Start;
  end;
end;



procedure TWM.WebModuleException(Sender: TObject; E: Exception;
  var Handled: Boolean);
begin
  GeralogFile(concat('ApiData - TWM - ',sender.ClassName),E.Message);
  abort;
end;

initialization

finalization
  Web.WebReq.FreeWebModules;

end.

