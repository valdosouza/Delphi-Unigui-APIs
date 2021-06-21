unit uAuthCC;

interface

uses System.JSON, Datasnap.DSProxyRest, Datasnap.DSClientRest, Data.DBXCommon, Data.DBXClient, Data.DBXDataSnap, Data.DBXJSON, Datasnap.DSProxy, System.Classes, System.SysUtils, Data.DB, Data.SqlExpr, Data.DBXDBReaders, Data.DBXCDSReaders, Data.DBXJSONReflect;

type
  TSMClient = class(TDSAdminRestClient)
  private
    FGetAuthenticationCommand: TDSRestCommand;
    FupdateCommand: TDSRestCommand;
    FupdateCommand_Cache: TDSRestCommand;
    FgetByKeyCommand: TDSRestCommand;
    FgetByKeyCommand_Cache: TDSRestCommand;
    FvalidaMobileDeviceCommand: TDSRestCommand;
    FvalidaMobileDeviceCommand_Cache: TDSRestCommand;
  public
    constructor Create(ARestConnection: TDSRestConnection); overload;
    constructor Create(ARestConnection: TDSRestConnection; AInstanceOwner: Boolean); overload;
    destructor Destroy; override;
    function GetAuthentication(par: string; const ARequestFilter: string = ''): string;
    function update(par: string; const ARequestFilter: string = ''): TJSONValue;
    function update_Cache(par: string; const ARequestFilter: string = ''): IDSRestCachedJSONValue;
    function getByKey(institutionID: Integer; userID: Integer; const ARequestFilter: string = ''): TJSONObject;
    function getByKey_Cache(institutionID: Integer; userID: Integer; const ARequestFilter: string = ''): IDSRestCachedJSONObject;
    function validaMobileDevice(par: string; const ARequestFilter: string = ''): TJSONObject;
    function validaMobileDevice_Cache(par: string; const ARequestFilter: string = ''): IDSRestCachedJSONObject;
  end;

const
  TSM_GetAuthentication: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'par'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'string')
  );

  TSM_update: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'par'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 37; TypeName: 'TJSONValue')
  );

  TSM_update_Cache: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'par'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'String')
  );

  TSM_getByKey: array [0..2] of TDSRestParameterMetaData =
  (
    (Name: 'institutionID'; Direction: 1; DBXType: 6; TypeName: 'Integer'),
    (Name: 'userID'; Direction: 1; DBXType: 6; TypeName: 'Integer'),
    (Name: ''; Direction: 4; DBXType: 37; TypeName: 'TJSONObject')
  );

  TSM_getByKey_Cache: array [0..2] of TDSRestParameterMetaData =
  (
    (Name: 'institutionID'; Direction: 1; DBXType: 6; TypeName: 'Integer'),
    (Name: 'userID'; Direction: 1; DBXType: 6; TypeName: 'Integer'),
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'String')
  );

  TSM_validaMobileDevice: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'par'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 37; TypeName: 'TJSONObject')
  );

  TSM_validaMobileDevice_Cache: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'par'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'String')
  );

implementation

function TSMClient.GetAuthentication(par: string; const ARequestFilter: string): string;
begin
  if FGetAuthenticationCommand = nil then
  begin
    FGetAuthenticationCommand := FConnection.CreateCommand;
    FGetAuthenticationCommand.RequestType := 'GET';
    FGetAuthenticationCommand.Text := 'TSM.GetAuthentication';
    FGetAuthenticationCommand.Prepare(TSM_GetAuthentication);
  end;
  FGetAuthenticationCommand.Parameters[0].Value.SetWideString(par);
  FGetAuthenticationCommand.Execute(ARequestFilter);
  Result := FGetAuthenticationCommand.Parameters[1].Value.GetWideString;
end;

function TSMClient.update(par: string; const ARequestFilter: string): TJSONValue;
begin
  if FupdateCommand = nil then
  begin
    FupdateCommand := FConnection.CreateCommand;
    FupdateCommand.RequestType := 'GET';
    FupdateCommand.Text := 'TSM.update';
    FupdateCommand.Prepare(TSM_update);
  end;
  FupdateCommand.Parameters[0].Value.SetWideString(par);
  FupdateCommand.Execute(ARequestFilter);
  Result := TJSONValue(FupdateCommand.Parameters[1].Value.GetJSONValue(FInstanceOwner));
end;

function TSMClient.update_Cache(par: string; const ARequestFilter: string): IDSRestCachedJSONValue;
begin
  if FupdateCommand_Cache = nil then
  begin
    FupdateCommand_Cache := FConnection.CreateCommand;
    FupdateCommand_Cache.RequestType := 'GET';
    FupdateCommand_Cache.Text := 'TSM.update';
    FupdateCommand_Cache.Prepare(TSM_update_Cache);
  end;
  FupdateCommand_Cache.Parameters[0].Value.SetWideString(par);
  FupdateCommand_Cache.ExecuteCache(ARequestFilter);
  Result := TDSRestCachedJSONValue.Create(FupdateCommand_Cache.Parameters[1].Value.GetString);
end;

function TSMClient.getByKey(institutionID: Integer; userID: Integer; const ARequestFilter: string): TJSONObject;
begin
  if FgetByKeyCommand = nil then
  begin
    FgetByKeyCommand := FConnection.CreateCommand;
    FgetByKeyCommand.RequestType := 'GET';
    FgetByKeyCommand.Text := 'TSM.getByKey';
    FgetByKeyCommand.Prepare(TSM_getByKey);
  end;
  FgetByKeyCommand.Parameters[0].Value.SetInt32(institutionID);
  FgetByKeyCommand.Parameters[1].Value.SetInt32(userID);
  FgetByKeyCommand.Execute(ARequestFilter);
  Result := TJSONObject(FgetByKeyCommand.Parameters[2].Value.GetJSONValue(FInstanceOwner));
end;

function TSMClient.getByKey_Cache(institutionID: Integer; userID: Integer; const ARequestFilter: string): IDSRestCachedJSONObject;
begin
  if FgetByKeyCommand_Cache = nil then
  begin
    FgetByKeyCommand_Cache := FConnection.CreateCommand;
    FgetByKeyCommand_Cache.RequestType := 'GET';
    FgetByKeyCommand_Cache.Text := 'TSM.getByKey';
    FgetByKeyCommand_Cache.Prepare(TSM_getByKey_Cache);
  end;
  FgetByKeyCommand_Cache.Parameters[0].Value.SetInt32(institutionID);
  FgetByKeyCommand_Cache.Parameters[1].Value.SetInt32(userID);
  FgetByKeyCommand_Cache.ExecuteCache(ARequestFilter);
  Result := TDSRestCachedJSONObject.Create(FgetByKeyCommand_Cache.Parameters[2].Value.GetString);
end;

function TSMClient.validaMobileDevice(par: string; const ARequestFilter: string): TJSONObject;
begin
  if FvalidaMobileDeviceCommand = nil then
  begin
    FvalidaMobileDeviceCommand := FConnection.CreateCommand;
    FvalidaMobileDeviceCommand.RequestType := 'GET';
    FvalidaMobileDeviceCommand.Text := 'TSM.validaMobileDevice';
    FvalidaMobileDeviceCommand.Prepare(TSM_validaMobileDevice);
  end;
  FvalidaMobileDeviceCommand.Parameters[0].Value.SetWideString(par);
  FvalidaMobileDeviceCommand.Execute(ARequestFilter);
  Result := TJSONObject(FvalidaMobileDeviceCommand.Parameters[1].Value.GetJSONValue(FInstanceOwner));
end;

function TSMClient.validaMobileDevice_Cache(par: string; const ARequestFilter: string): IDSRestCachedJSONObject;
begin
  if FvalidaMobileDeviceCommand_Cache = nil then
  begin
    FvalidaMobileDeviceCommand_Cache := FConnection.CreateCommand;
    FvalidaMobileDeviceCommand_Cache.RequestType := 'GET';
    FvalidaMobileDeviceCommand_Cache.Text := 'TSM.validaMobileDevice';
    FvalidaMobileDeviceCommand_Cache.Prepare(TSM_validaMobileDevice_Cache);
  end;
  FvalidaMobileDeviceCommand_Cache.Parameters[0].Value.SetWideString(par);
  FvalidaMobileDeviceCommand_Cache.ExecuteCache(ARequestFilter);
  Result := TDSRestCachedJSONObject.Create(FvalidaMobileDeviceCommand_Cache.Parameters[1].Value.GetString);
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
  FGetAuthenticationCommand.DisposeOf;
  FupdateCommand.DisposeOf;
  FupdateCommand_Cache.DisposeOf;
  FgetByKeyCommand.DisposeOf;
  FgetByKeyCommand_Cache.DisposeOf;
  {
  if Assigned(FvalidaMobileDeviceCommand) then
    FvalidaMobileDeviceCommand.DisposeOf;
  if Assigned(FvalidaMobileDeviceCommand_Cache) then
    FvalidaMobileDeviceCommand_Cache.DisposeOf;
  }
  inherited;
end;

end.


