unit uDataContactCC;

interface

uses  uDataCC;
type

  TSMContactClient = class(TDataCC)
  private

  public
    function save(par: string; const ARequestFilter: string = ''): String;
  end;

implementation


function TSMContactClient.save(par: string; const ARequestFilter: string): String;
begin
  Result := execCommand('TSMContact.save',par,ARequestFilter);
end;

end.

