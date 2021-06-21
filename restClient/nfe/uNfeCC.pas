// 
// Created by the DataSnap proxy generator.
// 02/09/2017 11:45:00
// 

unit uNfeCC;

interface

uses System.JSON, Datasnap.DSProxyRest, Datasnap.DSClientRest, Data.DBXCommon,
    Data.DBXClient, Data.DBXDataSnap, Data.DBXJSON, Datasnap.DSProxy, System.Classes,
    System.SysUtils, Data.DB, Data.SqlExpr, Data.DBXDBReaders, Data.DBXCDSReaders,
    Data.DBXJSONReflect;

type
  TSMClient = class(TDSAdminRestClient)
 private
    FDSServerModuleCreateCommand: TDSRestCommand;
    FValidtoInvoiceCommand: TDSRestCommand;
    FtoInvoiceNfeCommand: TDSRestCommand;
    FauthorizationNfeCommand: TDSRestCommand;
  public
    constructor Create(ARestConnection: TDSRestConnection); overload;
    constructor Create(ARestConnection: TDSRestConnection; AInstanceOwner: Boolean); overload;
    destructor Destroy; override;
    procedure DSServerModuleCreate(Sender: TObject);
    function ValidtoInvoice(Value: string; const ARequestFilter: string = ''): string;
    function toInvoiceNfe(Value: string; const ARequestFilter: string = ''): string;
    function authorizationNfe(Value: string; const ARequestFilter: string = ''): string;
  end;

const
  TSM_DSServerModuleCreate: array [0..0] of TDSRestParameterMetaData =
  (
    (Name: 'Sender'; Direction: 1; DBXType: 37; TypeName: 'TObject')
  );

  TSM_ValidtoInvoice: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'Value'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'string')
  );

  TSM_toInvoiceNfe: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'Value'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'string')
  );

  TSM_authorizationNfe: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'Value'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'string')
  );

implementation

procedure TSMClient.DSServerModuleCreate(Sender: TObject);
begin
  if FDSServerModuleCreateCommand = nil then
  begin
    FDSServerModuleCreateCommand := FConnection.CreateCommand;
    FDSServerModuleCreateCommand.RequestType := 'POST';
    FDSServerModuleCreateCommand.Text := 'TSM."DSServerModuleCreate"';
    FDSServerModuleCreateCommand.Prepare(TSM_DSServerModuleCreate);
  end;
  if not Assigned(Sender) then
    FDSServerModuleCreateCommand.Parameters[0].Value.SetNull
  else
  begin
    FMarshal := TDSRestCommand(FDSServerModuleCreateCommand.Parameters[0].ConnectionHandler).GetJSONMarshaler;
    try
      FDSServerModuleCreateCommand.Parameters[0].Value.SetJSONValue(FMarshal.Marshal(Sender), True);
      if FInstanceOwner then
        Sender.Free
    finally
      FreeAndNil(FMarshal)
    end
    end;
  FDSServerModuleCreateCommand.Execute;
end;

function TSMClient.ValidtoInvoice(Value: string; const ARequestFilter: string): string;
begin
  if FValidtoInvoiceCommand = nil then
  begin
    FValidtoInvoiceCommand := FConnection.CreateCommand;
    FValidtoInvoiceCommand.RequestType := 'GET';
    FValidtoInvoiceCommand.Text := 'TSM.ValidtoInvoice';
    FValidtoInvoiceCommand.Prepare(TSM_ValidtoInvoice);
  end;
  FValidtoInvoiceCommand.Parameters[0].Value.SetWideString(Value);
  FValidtoInvoiceCommand.Execute(ARequestFilter);
  Result := FValidtoInvoiceCommand.Parameters[1].Value.GetWideString;
end;

function TSMClient.toInvoiceNfe(Value: string; const ARequestFilter: string): string;
begin
  if FtoInvoiceNfeCommand = nil then
  begin
    FtoInvoiceNfeCommand := FConnection.CreateCommand;
    FtoInvoiceNfeCommand.RequestType := 'GET';
    FtoInvoiceNfeCommand.Text := 'TSM.toInvoiceNfe';
    FtoInvoiceNfeCommand.Prepare(TSM_toInvoiceNfe);
  end;
  FtoInvoiceNfeCommand.Parameters[0].Value.SetWideString(Value);
  FtoInvoiceNfeCommand.Execute(ARequestFilter);
  Result := FtoInvoiceNfeCommand.Parameters[1].Value.GetWideString;
end;

function TSMClient.authorizationNfe(Value: string; const ARequestFilter: string): string;
begin
  if FauthorizationNfeCommand = nil then
  begin
    FauthorizationNfeCommand := FConnection.CreateCommand;
    FauthorizationNfeCommand.RequestType := 'GET';
    FauthorizationNfeCommand.Text := 'TSM.authorizationNfe';
    FauthorizationNfeCommand.Prepare(TSM_authorizationNfe);
  end;
  FauthorizationNfeCommand.Parameters[0].Value.SetWideString(Value);
  FauthorizationNfeCommand.Execute(ARequestFilter);
  Result := FauthorizationNfeCommand.Parameters[1].Value.GetWideString;
end;

constructor TSMClient.Create(ARestConnection: TDSRestConnection);
begin
  inherited Create(ARestConnection);
end;

constructor TSMClient.Create(ARestConnection: TDSRestConnection; AInstanceOwner: Boolean);
begin
  inherited Create(ARestConnection, AInstanceOwner);
end;

destructor TSMClient.Destroy;
begin
  FDSServerModuleCreateCommand.DisposeOf;
  FValidtoInvoiceCommand.DisposeOf;
  FtoInvoiceNfeCommand.DisposeOf;
  FauthorizationNfeCommand.DisposeOf;
  inherited;
end;

end.

