unit uDataInvoiceReturn65;

interface

uses  uDataCC;
type
  TSMInvoiceReturn65Client = class(TDataCC)
  private

  public
    function save(par: string; const ARequestFilter: string = ''): String;
  end;

implementation

function TSMInvoiceReturn65Client.save(par: string; const ARequestFilter: string): String;
begin
  Result := execCommand('TSMInvoiceReturn65.save',par,ARequestFilter);
end;

end.
