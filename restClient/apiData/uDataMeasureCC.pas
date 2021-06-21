unit uDataMeasureCC;

interface

uses  uDataCC;
type

  TSMMeasureClient = class(TDataCC)
  private
  public
    function save(par: string; const ARequestFilter: string = ''): String;
    function getSyncronize(par: string; const ARequestFilter: string = ''): String;
  end;


implementation

function TSMMeasureClient.save(par: string; const ARequestFilter: string): String;
begin
  Result := execCommand('TSMMeasure.save',par,ARequestFilter);
end;

function TSMMeasureClient.getSyncronize(par: string; const ARequestFilter: string): String;
begin
  Result := execCommand('TSMMeasure.getSyncronize',par,ARequestFilter);
end;

end.


