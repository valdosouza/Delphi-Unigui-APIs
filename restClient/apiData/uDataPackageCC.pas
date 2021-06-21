unit uDataPackageCC;

interface

uses  uDataCC;

type
  TSMPackageClient = class(TDataCC)
  private

  public
    function save(par: string; const ARequestFilter: string = ''): String;
    function getSyncronize(par: string; const ARequestFilter: string = ''): String;
  end;

implementation


function TSMPackageClient.save(par: string; const ARequestFilter: string): String;
begin
  Result := execCommand('TSMPackage.save',par,ARequestFilter);
end;

function TSMPackageClient.getSyncronize(par: string; const ARequestFilter: string): String;
begin
  Result := execCommand('TSMPackage.getSyncronize',par,ARequestFilter);
end;

end.

