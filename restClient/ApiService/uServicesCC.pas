unit uServicesCC;

interface

uses System.JSON, uDataCC, Datasnap.DSProxyRest, Datasnap.DSClientRest, Data.DBXCommon, Data.DBXClient, Data.DBXDataSnap, Data.DBXJSON, Datasnap.DSProxy, System.Classes, System.SysUtils, Data.DB, Data.SqlExpr, Data.DBXDBReaders, Data.DBXCDSReaders, Data.DBXJSONReflect;

type
  TSMServicesClient = class(TDataCC)
  private
  public
    function getZipCode(par: string; const ARequestFilter: string = ''): string;
    function setCrashlytics(par: string; const ARequestFilter: string = ''): string;
    function CNPJUpdateCaptcha(const ARequestFilter: string = ''): string;
    function setImagemFile(par: string; const ARequestFilter: string = ''): string;
    function setXMLFile(par: string; const ARequestFilter: string = ''): string;
  end;

implementation

function TSMServicesClient.getZipCode(par: string; const ARequestFilter: string): string;
begin
  Result := execCommand('TSMServices.getZipCode',par,ARequestFilter);
end;

function TSMServicesClient.setCrashlytics(par: string; const ARequestFilter: string): string;
begin
  Result := execCommand('TSMServices.setCrashlytics',par,ARequestFilter);
end;

function TSMServicesClient.CNPJUpdateCaptcha(const ARequestFilter: string): string;
begin
  Result := execCommand('TSMServices.CNPJUpdateCaptcha','',ARequestFilter);
end;

function TSMServicesClient.setImagemFile(par: string; const ARequestFilter: string): string;
begin
  Result := execCommand('TSMServices.setImagemFile',par,ARequestFilter);
end;

function TSMServicesClient.setXMLFile(par: string; const ARequestFilter: string): string;
begin
  Result := execCommand('TSMServices.setXMLFile',par,ARequestFilter);
end;


end.

