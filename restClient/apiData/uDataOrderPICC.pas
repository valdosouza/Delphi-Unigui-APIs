unit uDataOrderPICC;

interface
uses  uDataCC;
type

  TSMOrderPIClient = class(TDAtaCC)
  private

  public
    function save(par: string; const ARequestFilter: string = ''): String;
  end;

implementation

{ TSMOrderPIClient }

function TSMOrderPIClient.save(par: string;
  const ARequestFilter: string): String;
begin
  Result := execCommand('TSMOrderPI.save',par,ARequestFilter);
end;

end.

