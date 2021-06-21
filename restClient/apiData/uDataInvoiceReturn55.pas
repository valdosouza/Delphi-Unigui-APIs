unit uDataInvoiceReturn55;

interface

uses  uDataCC;
type
  TSMInvoiceReturn55Client = class(TDataCC)
  private

  public
    function save(par: string; const ARequestFilter: string = ''): String;
  end;

implementation

function TSMInvoiceReturn55Client.save(par: string; const ARequestFilter: string): String;
begin
  Result := execCommand('TSMInvoiceReturn55.save',par,ARequestFilter);
end;

end.
