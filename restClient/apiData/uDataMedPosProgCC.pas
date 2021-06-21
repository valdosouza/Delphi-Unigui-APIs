unit uDataMedPosProgCC;

interface

uses  uDataCC;

type

  TSMMedPosProgClient = class(TDataCC)
  private

  public
    function save(par: string; const ARequestFilter: string = ''): String;
  end;

implementation

{ TSMMedPosProgClient }

function TSMMedPosProgClient.save(par: string;
  const ARequestFilter: string): String;
begin
  Result := execCommand('TSMMedPosProg.save',par,ARequestFilter);
end;

end.

