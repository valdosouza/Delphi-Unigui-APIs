unit uDataBroadcaster;

interface

uses  uDataCC;
type
  TSMBroadcasterClient = class(TDataCC)
  private

  public
    function save(par: string; const ARequestFilter: string = ''): String;
  end;

implementation

{ TSMBroadcasterClient }

function TSMBroadcasterClient.save(par: string;
  const ARequestFilter: string): String;
begin
  Result := execCommand('TSMBroadcaster.save',par,ARequestFilter);
end;

end.
