unit uDataLineBusinessCC;

interface

uses  uDataCC;
type

  TSMLineBusinessClient = class(TDataCC)
  private

  public
    function save(par: string; const ARequestFilter: string = ''): String;
  end;

implementation


function TSMLineBusinessClient.save(par: string; const ARequestFilter: string): String;
begin
  Result := execCommand('TSMLineBusiness.save',par,ARequestFilter);
end;

end.
