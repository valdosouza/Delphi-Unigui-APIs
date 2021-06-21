unit uReportMediaCC;

interface

uses System.JSON, Datasnap.DSProxyRest, uReportCC, Datasnap.DSClientRest,
    Data.DBXCommon, Data.DBXClient, Data.DBXDataSnap, Data.DBXJSON,
    Datasnap.DSProxy, System.Classes, System.SysUtils, Data.DB, Data.SqlExpr,
    Data.DBXDBReaders, Data.DBXCDSReaders, Data.DBXJSONReflect;

type
  TSMMediaClient = class(TReportCC)
  private
  public
    function GetOrderPI(par: string; const ARequestFilter: string = ''): string;
    function GetVisualizacaoPecas(par: string; const ARequestFilter: string = ''): string;
    function GetCotacaoOnline(par: string; const ARequestFilter: string = ''): string;
  end;

implementation

function TSMMediaClient.GetOrderPI(par: string; const ARequestFilter: string): string;
begin
  Result := execCommand('TSMMedia.GetOrderPI',par,ARequestFilter);
end;

function TSMMediaClient.GetVisualizacaoPecas(par: string; const ARequestFilter: string): string;
begin
  Result := execCommand('TSMMedia.GetVisualizacaoPecas',par,ARequestFilter);
end;

function TSMMediaClient.GetCotacaoOnline(par: string; const ARequestFilter: string): string;
begin
  Result := execCommand('TSMMedia.GetCotacaoOnline',par,ARequestFilter);
end;

end.
