unit uDataCityCC;

interface

uses  uDataCC;
type
  TSMCityClient = class(TDataCC)
  private

  public
    function getList(par: string; const ARequestFilter: string = ''): String;
    function getSyncronize(par: string; const ARequestFilter: string = ''): String;
  end;

implementation

function TSMCityClient.getList(par: string; const ARequestFilter: string): String;
begin
  Result := execCommand('TSMCity.getList',par,ARequestFilter);
end;

function TSMCityClient.getSyncronize(par: string;  const ARequestFilter: string): String;
begin
  Result := execCommand('TSMCity.getSyncronize',par,ARequestFilter);
end;

end.


