unit uDataCC;

interface

uses System.JSON, Datasnap.DSProxyRest, Datasnap.DSClientRest, Data.DBXCommon, Data.DBXClient, Data.DBXDataSnap, Data.DBXJSON, Datasnap.DSProxy, System.Classes, System.SysUtils, Data.DB, Data.SqlExpr, Data.DBXDBReaders, Data.DBXCDSReaders, Data.DBXJSONReflect;

type
  TDataCC = class(TDSAdminRestClient)
  private

  protected
    FCommand: TDSRestCommand;
    function execCommand(service:String;par: string; const ARequestFilter: string = ''): String;
  public
    constructor Create(ARestConnection: TDSRestConnection); overload;
    constructor Create(ARestConnection: TDSRestConnection; AInstanceOwner: Boolean); overload;
    destructor Destroy; override;


  end;

const

  TSMComand: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'par'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'string')
  );

implementation

{ TDataCC }

constructor TDataCC.Create(ARestConnection: TDSRestConnection);
begin
  inherited Create(ARestConnection);
end;

constructor TDataCC.Create(ARestConnection: TDSRestConnection;
  AInstanceOwner: Boolean);
begin
  inherited Create(ARestConnection, AInstanceOwner);
end;

destructor TDataCC.Destroy;
begin
  FCommand.DisposeOf;
  inherited;
end;

function TDataCC.execCommand(service, par: string;
  const ARequestFilter: string): String;
begin
  if FCommand = nil then
  begin
    FCommand := FConnection.CreateCommand;
    FCommand.RequestType := 'GET';
  end;
  FCommand.Text := service;
  FCommand.Prepare(TSMComand);
  FCommand.Parameters[0].Value.SetWideString(par);
  FCommand.Execute(ARequestFilter);
  Result := FCommand.Parameters[1].Value.GetWideString;
end;


end.
