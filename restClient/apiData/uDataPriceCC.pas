unit uDataPriceCC;

interface

uses  uDataCC;

type

  TSMPriceClient = class(TDataCC)
  private

  public
    function save(par: string; const ARequestFilter: string = ''): String;
    function getSyncronize(par: string; const ARequestFilter: string = ''): String;
  end;

implementation

function TSMPriceClient.save(par: string; const ARequestFilter: string): String;
begin
  Result := execCommand('TSMPrice.save',par,ARequestFilter);
end;

function TSMPriceClient.getSyncronize(par: string; const ARequestFilter: string): String;
begin
  Result := execCommand('TSMPrice.getSyncronize',par,ARequestFilter);
end;

end.


