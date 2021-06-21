unit uDataRestGroupHasOptionalCC;

interface

uses  uDataCC;

type
  TSMRestGroupHasOptionalClient = class(TDataCC)
  private

  public
    function save(par: string; const ARequestFilter: string = ''): String;
  end;

implementation


function TSMRestGroupHasOptionalClient.save(par: string; const ARequestFilter: string): String;
begin
  Result := execCommand('TSMRestGroupHasOptinal.save',par,ARequestFilter);
end;



end.
