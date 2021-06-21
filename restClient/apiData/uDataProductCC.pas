unit uDataProductCC;

interface

uses  uDataCC;

type
  TSMProductClient = class(TDataCC)
  private

  public
    function save(par: string; const ARequestFilter: string = ''): String;
    function getSyncronize(par: string; const ARequestFilter: string = ''): String;
  end;

implementation

function TSMProductClient.save(par: string; const ARequestFilter: string): String;
begin
  Result := execCommand('TSMProduct.save',par,ARequestFilter);
end;

function TSMProductClient.getSyncronize(par: string; const ARequestFilter: string): String;
begin
  Result := execCommand('TSMProduct.getSyncronize',par,ARequestFilter);
end;
end.


