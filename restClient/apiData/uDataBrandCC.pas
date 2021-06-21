unit uDataBrandCC;

interface

uses  uDataCC;
type

  TSMBrandClient = class(TDataCC)
  private
  public
    function save(par: string; const ARequestFilter: string = ''): String;
    function getSyncronize(par: string; const ARequestFilter: string = ''): String;
  end;

implementation


function TSMBrandClient.save(par: string; const ARequestFilter: string): String;
begin
  Result := execCommand('TSMBrand.save',par,ARequestFilter);
end;

function TSMBrandClient.getSyncronize(par: string; const ARequestFilter: string): String;
begin
  Result := execCommand('TSMBrand.getSyncronize',par,ARequestFilter);
end;
end.


