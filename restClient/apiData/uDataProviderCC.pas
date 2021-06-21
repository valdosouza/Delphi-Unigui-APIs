unit uDataProviderCC;

interface

uses  uDataCC;
type

  TSMProviderClient = class(TDataCC)
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

function TSMProviderClient.save(par: string; const ARequestFilter: string): String;
begin
  Result := execCommand('TSMProvider.save',par,ARequestFilter);
end;

function TSMProviderClient.getByKey(par: string; const ARequestFilter: string): String;
begin
  Result := execCommand('TSMProvider.getByKey',par,ARequestFilter);
end;


function TSMProviderClient.getListSpl(Par: string; const ARequestFilter: string): String;
begin
  Result := execCommand('TSMProvider.getListSpl',par,ARequestFilter);
end;

function TSMProviderClient.getList(par: string; const ARequestFilter: string = ''): String;
begin
  Result := execCommand('TSMProvider.getList',par,ARequestFilter);
end;

function TSMProviderClient.getSyncronize(par: string; const ARequestFilter: string): String;
begin
  Result := execCommand('TSMProvider.getSyncronize',par,ARequestFilter);
end;

function TSMProviderClient.getEntity(par: string;  const ARequestFilter: string): String;
begin
  Result := execCommand('TSMProvider.getEntity',par,ARequestFilter);
end;

end.
