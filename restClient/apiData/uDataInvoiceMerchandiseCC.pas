unit uDataInvoiceMerchandiseCC;

interface

uses  uDataCC;
type

  TSMInvoiceMerchandiseClient = class(TDataCC)
  private

  public
    function save(par: string; const ARequestFilter: string = ''): String;
    function getByKey(par: string;  const ARequestFilter: string = ''): String;
    function getListSpl(Par: string; const ARequestFilter: string = ''): String;
    function getSyncronize(par: string;  const ARequestFilter: string = ''): String;
  end;

implementation

function TSMInvoiceMerchandiseClient.save(par: string; const ARequestFilter: string): String;
begin
  Result := execCommand('TSMInvoiceMerchandise.save',par,ARequestFilter);
end;

function TSMInvoiceMerchandiseClient.getByKey(par:String;  const ARequestFilter: string): String;
begin
  Result := execCommand('TSMInvoiceMerchandise.getByKey',par,ARequestFilter);
end;

function TSMInvoiceMerchandiseClient.getListSpl(Par: string; const ARequestFilter: string): String;
begin
  Result := execCommand('TSMInvoiceMerchandise.getListSpl',par,ARequestFilter);
end;

function TSMInvoiceMerchandiseClient.getSyncronize(par:String;  const ARequestFilter: string): String;
begin
  Result := execCommand('TSMInvoiceMerchandise.getSyncronize',par,ARequestFilter);
end;

end.
