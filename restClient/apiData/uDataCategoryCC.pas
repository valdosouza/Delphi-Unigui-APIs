unit uDataCategoryCC;

interface

uses  uDataCC;
type

  TSMCAtegoryClient = class(TDataCC)
  private
  public
    function save(par: string; const ARequestFilter: string = ''): String;
    function delete(par: string; const ARequestFilter: string = ''): String;
    function getList(par: string; const ARequestFilter: string = ''): String;
    function getSyncronize(par: string; const ARequestFilter: string = ''): String;
  end;

implementation

function TSMCAtegoryClient.save(par: string; const ARequestFilter: string): String;
begin
  Result := execCommand('TSMCAtegory.save',par,ARequestFilter);
end;

function TSMCAtegoryClient.delete(par: string;  const ARequestFilter: string): String;
begin
  Result := execCommand('TSMCAtegory.delete',par,ARequestFilter);
end;

function TSMCAtegoryClient.getList(par: string; const ARequestFilter: string): String;
begin
  Result := execCommand('TSMCAtegory.getList',par,ARequestFilter);
end;

function TSMCAtegoryClient.getSyncronize(par: string; const ARequestFilter: string): String;
begin
  Result := execCommand('TSMCAtegory.getSyncronize',par,ARequestFilter);
end;

end.

