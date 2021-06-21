unit uDataRestGroupHasMeasureCC;

interface

uses  uDataCC;

type
  TSMRestGroupHasMeasureClient = class(TDataCC)
  private

  public
    function save(par: string; const ARequestFilter: string = ''): String;
  end;

implementation


function TSMRestGroupHasMeasureClient.save(par: string; const ARequestFilter: string): String;
begin
  Result := execCommand('TSMRestGroupHasMeasure.save',par,ARequestFilter);
end;



end.
