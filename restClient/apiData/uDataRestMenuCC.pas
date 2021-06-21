unit uDataRestMenuCC;

interface

uses  uDataCC;

type
  TSMRestMenuClient = class(TDataCC)
  private

  public
    function save(par: string; const ARequestFilter: string = ''): String;
  end;

implementation


function TSMRestMenuClient.save(par: string; const ARequestFilter: string): String;
begin
  Result := execCommand('TSMRestMenu.save',par,ARequestFilter);
end;



end.

