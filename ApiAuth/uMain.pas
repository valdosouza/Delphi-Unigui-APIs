unit uMain;

interface

uses
  Winapi.Messages, System.SysUtils, System.Variants,System.IniFiles,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  Vcl.AppEvnts, Vcl.StdCtrls, IdHTTPWebBrokerBridge, Web.HTTPApp, MainModule,
  ClasseUtil, UnitConstantes, UnTrataExcecao, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf,
  FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys,
  FireDAC.VCLUI.Wait, Data.DB, FireDAC.Comp.Client, IdContext,Datasnap.DSSession;

type
  TMain = class(TForm)
    btn_inicia: TButton;
    btn_para: TButton;
    EditPort: TEdit;
    Label1: TLabel;
    ApplicationEvents1: TApplicationEvents;
    procedure FormCreate(Sender: TObject);
    procedure ApplicationEvents1Idle(Sender: TObject; var Done: Boolean);
    procedure btn_iniciaClick(Sender: TObject);
    procedure btn_paraClick(Sender: TObject);
//    procedure OnContextCreated(AContext: TIdContext);
  private
    FServer: TIdHTTPWebBrokerBridge;

    { Private declarations }
  public
    { Public declarations }
    procedure StartServer;
    procedure StopServer;
  end;

var
  Main: TMain;

implementation


{$R *.dfm}



procedure TMain.ApplicationEvents1Idle(Sender: TObject; var Done: Boolean);
begin
  btn_inicia.Enabled := not FServer.Active;
  btn_para.Enabled := FServer.Active;
  EditPort.Enabled := not FServer.Active;
end;

procedure TMain.btn_iniciaClick(Sender: TObject);
begin
  StartServer;
end;

procedure TerminateThreads;
begin
  if TDSSessionManager.Instance <> nil then
    TDSSessionManager.Instance.TerminateAllSessions;
end;

procedure TMain.btn_paraClick(Sender: TObject);
begin
  StopServer;
end;



procedure TMain.FormCreate(Sender: TObject);
begin
  FServer := TIdHTTPWebBrokerBridge.Create(Self);
  {Here you assign the new procedure for this event}
  //FServer.OnContextCreated:= OnContextCreated;

end;
{
procedure TMain.OnContextCreated(AContext: TIdContext);
begin
  AContext.Connection.IOHandler.MaxLineLength:= 512*1024 ;
end;
}
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
end;

end.
