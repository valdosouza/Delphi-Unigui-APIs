unit uDataAgency;

interface
uses  uDataCC;
type
  TSMAgencyClient = class(TDataCC)
  private

  public
    function save(par: string; const ARequestFilter: string = ''): String;
  end;

implementation

{ TSMAgencyClient }

function TSMAgencyClient.save(par: string;
  const ARequestFilter: string): String;
begin
  Result := execCommand('TSMAgency.save',par,ARequestFilter);
end;

end.

