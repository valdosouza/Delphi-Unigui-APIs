unit uDataSalesManCC;

interface

uses  uDataCC;

type

  TSMSalesManClient = class(TDataCC)
  private

  public
    function save(par: string; const ARequestFilter: string = ''): String;
    function getbyKey(par: string; const ARequestFilter: string = ''): String;
    function getSalesman(par: string; const ARequestFilter: string = ''): String;
  end;

implementation

function TSMSalesManClient.save(par: string; const ARequestFilter: string): String;
begin
  Result := execCommand('TSMSalesMan.save',par,ARequestFilter);
end;

function TSMSalesManClient.getbyKey(par: string; const ARequestFilter: string): String;
begin
  Result := execCommand('TSMSalesMan.getbyKey',par,ARequestFilter);
end;

function TSMSalesManClient.getSalesman(par: string; const ARequestFilter: string): String;
begin
  Result := execCommand('TSMSalesMan.getSalesman',par,ARequestFilter);
end;

end.
