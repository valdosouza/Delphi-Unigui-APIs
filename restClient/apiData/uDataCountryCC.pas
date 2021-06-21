unit uDataCountryCC;

interface

uses  uDataCC;
type
  TSMCountryClient = class(TDataCC)
  private

  public
    function getList(par: string; const ARequestFilter: string = ''): String;
    function getSyncronize(par: string; const ARequestFilter: string = ''): String;
  end;


implementation

function TSMCountryClient.getList(par: string; const ARequestFilter: string): String;
begin
  Result := execCommand('TSMCountry.getList',par,ARequestFilter);
end;

function TSMCountryClient.getSyncronize(par: string; const ARequestFilter: string): String;
begin
  Result := execCommand('TSMCountry.getSyncronize',par,ARequestFilter);
end;

end.


