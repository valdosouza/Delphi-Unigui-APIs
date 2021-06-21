unit uDataInstitutionCC;

interface

uses  uDataCC;
type

  TSMInstitutionClient = class(TDataCC)
  private

  public
    function getCodigo(cnpj: string; const ARequestFilter: string = ''): String;
    function getList(par: string; const ARequestFilter: string = ''): String;
    function getListByUser(par: string; const ARequestFilter: string = ''): String;
    function getByKey(par: string; const ARequestFilter: string = ''): String;
  end;

implementation

function TSMInstitutionClient.getCodigo(cnpj: string; const ARequestFilter: string): String;
begin
  Result := execCommand('TSMInstitution.getCodigo',cnpj,ARequestFilter);
end;

function TSMInstitutionClient.getList(par: string; const ARequestFilter: string): String;
begin
  Result := execCommand('TSMInstitution.getList',par,ARequestFilter);
end;


function TSMInstitutionClient.getListByUser(par: string;
  const ARequestFilter: string): String;
begin
  Result := execCommand('TSMInstitution.getlistByUser',par,ARequestFilter);
end;

function TSMInstitutionClient.getByKey(par: string; const ARequestFilter: string): String;
begin
  Result := execCommand('TSMInstitution.getByKey',par,ARequestFilter);
end;

end.
