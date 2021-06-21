unit uDataMerchandiseCC;

interface

uses uDataCC;

type
  TSMMerchandiseClient = class(TDataCC)
  private

  public
    function save(par: string; const ARequestFilter: string = ''): String;
    function getByKey(par: string; const ARequestFilter: string = ''): String;
    function getList(par: string; const ARequestFilter: string = ''): String;
    function getListSpl(Par: string; const ARequestFilter: string = ''): String;
    function getSyncronize(par: string; const ARequestFilter: string = ''): String;
    function getSyncronizeObj(par: string; const ARequestFilter: string = ''): String;
  end;

implementation


function TSMMerchandiseClient.save(par: string; const ARequestFilter: string): String;
begin
  Result := execCommand('TSMMerchandise.save',par,ARequestFilter);
end;

function TSMMerchandiseClient.getByKey(par: string; const ARequestFilter: string): String;
begin
  Result := execCommand('TSMMerchandise.getByKey',par,ARequestFilter);
end;

function TSMMerchandiseClient.getList(par: string; const ARequestFilter: string): String;
begin
  Result := execCommand('TSMMerchandise.getList',par,ARequestFilter);
end;

function TSMMerchandiseClient.getListSpl(Par: string; const ARequestFilter: string): String;
begin
  Result := execCommand('TSMMerchandise.getListSpl',par,ARequestFilter);
end;

function TSMMerchandiseClient.getSyncronize(par: string; const ARequestFilter: string): String;
begin
  Result := execCommand('TSMMerchandise.getSyncronize',par,ARequestFilter);
end;

function TSMMerchandiseClient.getSyncronizeObj(par: string; const ARequestFilter: string): String;
begin
  Result := execCommand('TSMMerchandise.getSyncronizeObj',par,ARequestFilter);
end;


end.


