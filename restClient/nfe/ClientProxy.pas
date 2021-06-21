unit ClientProxy;


interface

uses DBXCommon, DBXJSON, Classes, SysUtils, DB, SqlExpr, DBXDBReaders,
     System.JSON, Datasnap.DSProxyRest, Datasnap.DSClientRest,
     Data.DBXClient, Data.DBXDataSnap, Datasnap.DSProxy,
     Data.DBXCDSReaders, Data.DBXJSONReflect;

type
  TCProxy = class(TDSAdminRestClient)
  private
    FDBXConnection: TDBXConnection;
    FInstanceOwner: Boolean;
    FEchoCommand: TDBXCommand;
    FGetRestCommand: TDSRestCommand;
    procedure SendCmd(cmd,value:String;Callback: TDBXCallback);
  public
    constructor Create(ADBXConnection: TDBXConnection); overload;
    constructor Create(ADBXConnection: TDBXConnection; AInstanceOwner: Boolean); overload;
    destructor Destroy; override;
    procedure Echo(s: string; Callback: TDBXCallback);
    procedure ValidtoInvoice(s: string; Callback: TDBXCallback);
    procedure CalculateInvoice(s: string; Callback: TDBXCallback);
    procedure ToInvoice(s: string; Callback: TDBXCallback);
    procedure getValidityCertificate(s: string; Callback: TDBXCallback);

    procedure ValidateConference(s: string; Callback: TDBXCallback);
    procedure PrintConference(s: string; Callback: TDBXCallback);

    procedure ValidateAuthorization(s: string; Callback: TDBXCallback);
    procedure Authorization(s: string; Callback: TDBXCallback);

    procedure ValidateConsult(s: string; Callback: TDBXCallback);
    procedure Consult(s: string; Callback: TDBXCallback);

    procedure ValidateCancel(s: string; Callback: TDBXCallback);
    procedure Cancel(s: string; Callback: TDBXCallback);

    procedure ValidatePrint(s: string; Callback: TDBXCallback);
    procedure Print(s: string; Callback: TDBXCallback);

    procedure ValidateSendEmail(s: string; Callback: TDBXCallback);
    procedure SendEmail(s: string; Callback: TDBXCallback);

    procedure setManifestation(s: string; Callback: TDBXCallback);
    procedure getDownloadXML(s: string; Callback: TDBXCallback);
  end;

implementation


constructor TCProxy.Create(ADBXConnection: TDBXConnection);
begin
  inherited Create;
  if ADBXConnection = nil then
    raise EInvalidOperation.Create('Connection cannot be nil.  Tenha certeza que que a conexão está aberta.');
  FDBXConnection := ADBXConnection;
  FInstanceOwner := True;
end;

constructor TCProxy.Create(ADBXConnection: TDBXConnection; AInstanceOwner: Boolean);
begin
  inherited Create;
  if ADBXConnection = nil then
    raise EInvalidOperation.Create('Connection cannot be nil.  Make sure the connection has been opened.');
  FDBXConnection := ADBXConnection;
  FInstanceOwner := AInstanceOwner;
end;


destructor TCProxy.Destroy;
begin
  FEchoCommand.DisposeOf;
  inherited;
end;

procedure TCProxy.SendCmd(cmd,value:String; Callback: TDBXCallback);
begin
  if FEchoCommand = nil then
  begin
    FEchoCommand := FDBXConnection.CreateCommand;
    FEchoCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FEchoCommand.Text := cmd;
    FEchoCommand.Prepare;
  end;
  FEchoCommand.Parameters[0].Value.SetWideString(Value);
  FEchoCommand.Parameters[1].Value.SetCallbackValue(Callback);
  FEchoCommand.ExecuteUpdate;
end;

procedure TCProxy.SendEmail(s: string; Callback: TDBXCallback);
begin
  SendCmd('TSM.SendEmail',s,Callback);
end;

procedure TCProxy.setManifestation(s: string; Callback: TDBXCallback);
begin
  SendCmd('TSM.setManifestation',s,Callback);
end;

procedure TCProxy.Echo(s: string; Callback: TDBXCallback);
begin
  SendCmd('TSM.Echo',s,Callback);
end;

procedure TCProxy.getDownloadXML(s: string; Callback: TDBXCallback);
begin
  SendCmd('TSM.getDownloadXML',s,Callback);
end;

procedure TCProxy.getValidityCertificate(s: string; Callback: TDBXCallback);
begin
  SendCmd('TSM.getValidityCertificate',s,Callback);
end;

procedure TCProxy.ToInvoice(s: string; Callback: TDBXCallback);
begin
  SendCmd('TSM.ToInvoice',s,Callback);
end;

procedure TCProxy.ValidateAuthorization(s: string; Callback: TDBXCallback);
begin
  SendCmd('TSM.ValidateAuthorization',s,Callback);
end;

procedure TCProxy.ValidateCancel(s: string; Callback: TDBXCallback);
begin
  SendCmd('TSM.ValidateCancel',s,Callback);
end;

procedure TCProxy.ValidateConference(s: string; Callback: TDBXCallback);
begin
  SendCmd('TSM.ValidateConference',s,Callback);
end;

procedure TCProxy.ValidateConsult(s: string; Callback: TDBXCallback);
begin
  SendCmd('TSM.ValidateConsult',s,Callback);
end;

procedure TCProxy.ValidatePrint(s: string; Callback: TDBXCallback);
begin
  SendCmd('TSM.ValidatePrint',s,Callback);
end;

procedure TCProxy.ValidateSendEmail(s: string; Callback: TDBXCallback);
begin
  SendCmd('TSM.ValidateSendEmail',s,Callback);
end;

procedure TCProxy.ValidtoInvoice(s: string; Callback: TDBXCallback);
begin
  SendCmd('TSM.ValidtoInvoice',s,Callback);
end;

procedure TCProxy.CalculateInvoice(s: string; Callback: TDBXCallback);
begin
  SendCmd('TSM.CalculateInvoice',s,Callback);
end;

procedure TCProxy.Cancel(s: string; Callback: TDBXCallback);
begin
  SendCmd('TSM.Cancel',s,Callback);
end;

procedure TCProxy.Consult(s: string; Callback: TDBXCallback);
begin
  SendCmd('TSM.Consult',s,Callback);
end;

procedure TCProxy.Print(s: string; Callback: TDBXCallback);
begin
  SendCmd('TSM.Print',s,Callback);
end;

procedure TCProxy.PrintConference(s: string; Callback: TDBXCallback);
begin
  SendCmd('TSM.PrintConference',s,Callback);
end;


procedure TCProxy.Authorization(s: string; Callback: TDBXCallback);
begin
  SendCmd('TSM.Authorization',s,Callback);
end;


end.
