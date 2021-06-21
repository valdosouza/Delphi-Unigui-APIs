unit uDataCustomerCC;

interface

uses  uDataCC;
type

  TSMCustomerClient = class(TDataCC)
  private

  public
    function save(par: string; const ARequestFilter: string = ''): String;
    function getByKey(par: string; const ARequestFilter: string = ''): String;
    function getListSpl(Par: string; const ARequestFilter: string = ''): String;
    function getList(par: string; const ARequestFilter: string = ''): String;
    function getSyncronize(par: string; const ARequestFilter: string = ''): String;
    function getEntity(par: string;  const ARequestFilter: string = ''): String;
  end;

implementation

function TSMCustomerClient.save(par: string; const ARequestFilter: string): String;
begin
  Result := execCommand('TSMCustomer.save',par,ARequestFilter);
end;

function TSMCustomerClient.getByKey(par: string; const ARequestFilter: string): String;
begin
  Result := execCommand('TSMCustomer.getByKey',par,ARequestFilter);
end;


function TSMCustomerClient.getListSpl(Par: string; const ARequestFilter: string): String;
begin
  Result := execCommand('TSMCustomer.getListSpl',par,ARequestFilter);
end;

function TSMCustomerClient.getList(par: string; const ARequestFilter: string = ''): String;
begin
  Result := execCommand('TSMCustomer.getList',par,ARequestFilter);
end;

function TSMCustomerClient.getSyncronize(par: string; const ARequestFilter: string): String;
begin
  Result := execCommand('TSMCustomer.getSyncronize',par,ARequestFilter);
end;

function TSMCustomerClient.getEntity(par: string;  const ARequestFilter: string): String;
begin
  Result := execCommand('TSMCustomer.getEntity',par,ARequestFilter);
end;

end.
