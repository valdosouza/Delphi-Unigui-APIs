unit uDataAdvertiserCC;

interface
uses  uDataCC;
type
  TSMAdvertiserClient = class(TDataCC)
  private

  public
    function save(par: string; const ARequestFilter: string = ''): String;
  end;
implementation

{ TSMAdvertiserClient }

function TSMAdvertiserClient.save(par: string;
  const ARequestFilter: string): String;
begin
  Result := execCommand('TSMAdvertiser.save',par,ARequestFilter);
end;

end.

