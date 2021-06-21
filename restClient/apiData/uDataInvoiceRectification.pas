unit uDataInvoiceRectification;

interface

uses  uDataCC;
type

  TSMInvoiceRectificationClient = class(TDataCC)
  private

  public
    function save(par: string; const ARequestFilter: string = ''): String;
  end;

implementation


function TSMInvoiceRectificationClient.save(par: string; const ARequestFilter: string): String;
begin
  Result := execCommand('TSMInvoiceRectification.save',par,ARequestFilter);
end;

end.
