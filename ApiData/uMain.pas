unit uMain;

interface

uses
  Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  Vcl.AppEvnts, Vcl.StdCtrls, IdHTTPWebBrokerBridge, Web.HTTPApp,

  ControllerCustomer,  ACBrBase, ACBrValidador,
  UnTrataExcecao, ControllerInvoice,
  ControllerOrderSale, System.Json, DSAuth,REST.json,ObjOrderSale,
  FireDAC.Comp.Client, System.Generics.Collections,

  System.IniFiles,ClasseUtil, UnitConstantes, uSMInvoiceReturn55,

  Winapi.WinSock, Vcl.Samples.Gauges, IdCustomHTTPServer, Datasnap.DSSession,
  IdContext, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error,
  FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool,
  FireDAC.Stan.Async, FireDAC.Phys, FireDAC.VCLUI.Wait, Data.DB, Vcl.ExtCtrls,
  UnFunctions, FireDAC.Phys.MySQLDef, FireDAC.ConsoleUI.Wait, FireDAC.Comp.UI,
  FireDAC.Phys.MySQL, MainModule;


type


  TMain = class(TForm)
    ButtonStart: TButton;
    ButtonStop: TButton;
    EditPort: TEdit;
    Label1: TLabel;
    ApplicationEvents1: TApplicationEvents;
    Btn_Processa: TButton;
    gg_processa: TGauge;
    Label3: TLabel;
    SessionIdList: TListBox;
    ListaConexoes: TListBox;
    ACBrValidador1: TACBrValidador;
    Label2: TLabel;
    brn_Listar_connection: TButton;
    btn_Lista_session: TButton;
    ApplicationEvents2: TApplicationEvents;
    procedure FormCreate(Sender: TObject);
    procedure ButtonStartClick(Sender: TObject);
    procedure ButtonStopClick(Sender: TObject);
    procedure ApplicationEvents1Idle(Sender: TObject; var Done: Boolean);
    procedure OnContextCreated(AContext: TIdContext);
    procedure DBConnError(ASender, AInitiator: TObject;
      var AException: Exception);
    procedure brn_Listar_connectionClick(Sender: TObject);
    procedure btn_Lista_sessionClick(Sender: TObject);
  private
    FServer: TIdHTTPWebBrokerBridge;

  public
    procedure StartServer;
    procedure StopServer;
    procedure ExceptionHandler( Sender : TObject; E : Exception );
  end;

var
  Main: TMain;



implementation

{$R *.dfm}




procedure TMain.ApplicationEvents1Idle(Sender: TObject; var Done: Boolean);
begin
  ButtonStart.Enabled := not FServer.Active;
  ButtonStop.Enabled := FServer.Active;
  EditPort.Enabled := not FServer.Active;
end;

procedure TMain.brn_Listar_connectionClick(Sender: TObject);
var
  Lista :TList<String>;
  I : Integer;
begin
  try
    Lista := GetListConnectionSession;
    ListaConexoes.Items.Clear;
    for I:=0 to Lista.Count do
      ListaConexoes.Items.Add(Lista[I]);
  finally
    Lista.DisposeOf;
  end;
end;

procedure TMain.btn_Lista_sessionClick(Sender: TObject);
begin
  if TDSSessionManager.Instance <> nil then
  BEgin
    //TDSSessionManager.
  End;
end;

procedure TMain.ButtonStartClick(Sender: TObject);
begin
  StartServer;
end;

procedure TerminateThreads;
begin
  if TDSSessionManager.Instance <> nil then
    TDSSessionManager.Instance.TerminateAllSessions;
end;

procedure TMain.ButtonStopClick(Sender: TObject);
begin
  StopServer;
end;

procedure TMain.DBConnError(ASender, AInitiator: TObject;
  var AException: Exception);
begin
  GeralogCrashlytics(concat(
                        'ApiData - ',Asender.ClassName
                         ),
                     concat(
                        'Asender - ',Asender.ClassName,' | ',
                        'AInitiator - ',AInitiator.ClassName,' | ',
                        'AException - ',AException.Message
                        )
                     );
end;

procedure TMain.ExceptionHandler(Sender: TObject; E: Exception);
begin
  GeralogCrashlytics(TComponent(Sender).Name,e.ToString);
end;

procedure TMain.OnContextCreated(AContext: TIdContext);
begin
  AContext.Connection.IOHandler.MaxLineLength:= 512*1024 {or whatever value you need};
end;

procedure TMain.FormCreate(Sender: TObject);
BEgin
  FServer := TIdHTTPWebBrokerBridge.Create(Self);
  {Here you assign the new procedure for this event}
  FServer.OnContextCreated:= OnContextCreated;
  Application.OnException := ExceptionHandler;
End;

procedure TMain.StartServer;
begin
  if not FServer.Active then
  begin
    FServer.Bindings.Clear;
    FServer.KeepAlive := True;
    FServer.MaxConnections := 150;
    FServer.SessionTimeOut := 1200000;
    FServer.DefaultPort := StrToInt(EditPort.Text);
    FServer.Active := True;
  end;
end;

procedure TMain.StopServer;
begin
  TerminateThreads;
  if FServer.Active  then
  Begin
    FServer.Active := False;
    FServer.Bindings.Clear;
  End;
  SessionIdList.Clear;

end;


end.
