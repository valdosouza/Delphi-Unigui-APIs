unit uDataMedPriceJRCCC;

interface
uses  uDataCC;

type
  TSMMedPriceJRClient = class(TDataCC)
  private

  public
    function save(par: string; const ARequestFilter: string = ''): String;
  end;

implementation

{ TSMMedPriceJRClient }

function TSMMedPriceJRClient.save(par: string;
  const ARequestFilter: string): String;
begin
  Result := execCommand('TSMMedPriceJR.save',par,ARequestFilter);
end;

end.
