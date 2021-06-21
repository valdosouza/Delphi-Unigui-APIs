unit uDataPriceListCC;

interface

uses  uDataCC;
type

  TSMPriceListClient = class(TDataCC)
  private

  public
    function save(par: string; const ARequestFilter: string = ''): String;
    function getSyncronize(par: string; const ARequestFilter: string = ''): String;
  end;

implementation


function TSMPriceListClient.save(par: string; const ARequestFilter: string): String;
begin
  Result := execCommand('TSMPriceList.save',par,ARequestFilter);
end;

function TSMPriceListClient.getSyncronize(par: string;const ARequestFilter: string): String;
begin
  Result := execCommand('TSMPriceList.getSyncronize',par,ARequestFilter);
end;

end.

