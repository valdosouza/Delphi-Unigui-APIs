unit uDataRestGroupCC;

interface

uses  uDataCC;

type
  TSMRestGroupClient = class(TDataCC)
  private

  public
    function save(par: string; const ARequestFilter: string = ''): String;
  end;

implementation


function TSMRestGroupClient.save(par: string; const ARequestFilter: string): String;
begin
  Result := execCommand('TSMRestGroup.save',par,ARequestFilter);
end;



end.
