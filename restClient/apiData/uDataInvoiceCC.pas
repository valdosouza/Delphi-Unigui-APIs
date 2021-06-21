unit uDataInvoiceCC;

interface

uses  uDataCC;
type

  TSMInvoiceClient = class(TDataCC)
  private

  public
    function save(par: string; const ARequestFilter: string = ''): String;
    function getSyncronize(par: string; const ARequestFilter: string = ''): String;
  end;

implementation


function TSMInvoiceClient.save(par: string; const ARequestFilter: string): String;
begin
  Result := execCommand('TSMInvoice.save',par,ARequestFilter);
end;

function TSMInvoiceClient.getSyncronize(par: string; const ARequestFilter: string): String;
begin
  Result := execCommand('TSMInvoice.getSyncronize',par,ARequestFilter);
end;

end.

