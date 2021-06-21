unit uSMInstitution;

interface

uses System.SysUtils, System.Classes, System.Json,
    DataSnap.DSProviderDataModuleAdapter,
    Datasnap.DSServer, Datasnap.DSAuth,REST.json, ControllerInstitution,
  UnFunctions,uSM,ObjInstitution;

type
  {$METHODINFO ON}
  TSMInstitution = class(TSM)
  private
    Institution: TControllerInstitution;
    Erro : String;
  public
    function getCodigo(par: string): String;
    function getList(par:String) : String;
    function getListByUser(par:String) : String;
    function getByKey(par:String) : String;
  end;
   {$METHODINFO OFF}

implementation

{ TSMInstitution }

function TSMInstitution.getByKey(par:String): String;
VAr
  LcOBj : TObjInstitution;
begin
  try
    institution := TControllerInstitution.create(nil);
    Institution.setParametro(par);
    institution.Registro.Codigo := Institution.parametro.Estabelecimento;
    institution.getByKey;
    LcOBj := TObjInstitution.Create;
    institution.fillDataObjeto(Institution.Registro,LcOBj);
    Result := setReturn( TJson.ObjectToJsonString(LcOBj) );
  finally
    Institution.DisposeOf;
  end;
end;

function TSMInstitution.getCodigo(par: string): String;
Var
  LcCod:Integer;
  LcResult : String;
  cnpj : String;
begin
  LcCod := 0;
  cnpj := par;
  cnpj := unMaskField(cnpj);
  LcResult := ValidDocFiscal(cnpj);
  if  LcResult = 'OK' then
  Begin
    Try
      Institution := TControllerInstitution.create(nil);
      LcCod := Institution.Fiscal.Juridica.getIDbyCNPJ(cnpj);
      Result := LcCod.ToString;
    Finally
      Institution.DisposeOf;
    End;
  End
  else
    Result := LcResult;
end;

function TSMInstitution.getList(par: String): String;
begin
  try
    Institution := TControllerInstitution.Create(nil);
    Try
      Institution.setParametro(par);
      Institution.getList;
      Result := setReturn( TJson.ObjectToJsonString( Institution.Lista) );
    except
      on E : Exception do
        Geralog('ApiData - ', E.Message);
    End;
  finally
    Institution.DisposeOf;
  end;

end;

function TSMInstitution.getListByUser(par: String): String;
begin
  try
    Institution := TControllerInstitution.Create(nil);
    Try
      Institution.Setparametro(par);
      Institution.getlistByUser;
      Result := setReturn( TJson.ObjectToJsonString( Institution.Lista) );
    except
      on E : Exception do
        Geralog('ApiData - ', E.Message);
    End;
  finally
    Institution.DisposeOf;
  end;
end;

end.
