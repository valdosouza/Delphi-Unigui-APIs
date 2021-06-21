unit uDataKickbackCC;

interface

uses  uDataCC;
type

  TSMKickbackClient = class(TDataCC)
  private

  public
    function save(par: string; const ARequestFilter: string = ''): String;
    function getSyncronize(par: string; const ARequestFilter: string = ''): String;
  end;

implementation

function TSMKickbackClient.save(par: string; const ARequestFilter: string): String;
begin
  Result := execCommand('TSMKickback.save',par,ARequestFilter);
end;

function TSMKickbackClient.getSyncronize(par: string; const ARequestFilter: string): String;
begin
  Result := execCommand('TSMKickback.getSyncronize',par,ARequestFilter);
end;

end.
