unit uDataInvoiceReturnService;

interface

uses  uDataCC;
type


  TSMInvoiceReturnServiceClient = class(TDataCC)
  private

  public
    function save(par: string; const ARequestFilter: string = ''): String;
  end;

implementation

function TSMInvoiceReturnServiceClient.save(par: string; const ARequestFilter: string): String;
begin
  Result := execCommand('TSMInvoiceReturnService.save',par,ARequestFilter);
end;

end.
