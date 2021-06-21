unit uDataOrderConsignmentCC;

interface

uses  uDataCC;
type

  TSMOrderConsignmentClient = class(TDataCC)
  private

  public
    function save(par: string; const ARequestFilter: string = ''): String;
    function getByKey(Par: string; const ARequestFilter: string = ''): String;
    function getListSpl(Par: string; const ARequestFilter: string = ''): String;
    function getList(par: string; const ARequestFilter: string = ''): String;
    function getSyncronize(par: string; const ARequestFilter: string = ''): String;
    function getLastOrderID(Par: string; const ARequestFilter: string = ''): String;
  end;

implementation

function TSMOrderConsignmentClient.save(par: string; const ARequestFilter: string): String;
begin
  Result := execCommand('TSMOrderConsignment.save',par,ARequestFilter);
end;

function TSMOrderConsignmentClient.getByKey(Par: string; const ARequestFilter: string): String;
begin
  Result := execCommand('TSMOrderConsignment.getByKey',par,ARequestFilter);
end;


function TSMOrderConsignmentClient.getListSpl(Par: string; const ARequestFilter: string): String;
begin
  Result := execCommand('TSMOrderConsignment.getListSpl',par,ARequestFilter);
end;

function TSMOrderConsignmentClient.getList(par: string; const ARequestFilter: string): String;
begin
  Result := execCommand('TSMOrderConsignment.getList',par,ARequestFilter);
end;

function TSMOrderConsignmentClient.getSyncronize(par: string; const ARequestFilter: string): String;
begin
  Result := execCommand('TSMOrderConsignment.getSyncronize',par,ARequestFilter);
end;

function TSMOrderConsignmentClient.getLastOrderID(Par: string; const ARequestFilter: string): String;
begin
  Result := execCommand('TSMOrderConsignment.getLastOrderID',par,ARequestFilter);
end;


end.
