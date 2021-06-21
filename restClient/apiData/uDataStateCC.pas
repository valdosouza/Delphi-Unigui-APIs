unit uDataStateCC;

interface

uses  uDataCC;
type
  TSMStateClient = class(TDataCC)
  private

  public
    function getList(par: string; const ARequestFilter: string = ''): String;
    function getSyncronize(par: string; const ARequestFilter: string = ''): String;
  end;


implementation

function TSMStateClient.getList(par: string; const ARequestFilter: string): String;
begin
  Result := execCommand('TSMState.getList',par,ARequestFilter);
end;

function TSMStateClient.getSyncronize(par: string;  const ARequestFilter: string): String;
begin
  Result := execCommand('TSMState.getSyncronize',par,ARequestFilter);
end;

end.



