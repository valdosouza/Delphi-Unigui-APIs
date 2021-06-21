unit uSMAgency;

interface

uses System.SysUtils, System.Classes, System.Json,
    DataSnap.DSProviderDataModuleAdapter,uSM,
    Datasnap.DSServer, Datasnap.DSAuth,REST.json, tblentity, ControllerAgency,
  ObjAgency,ControllerInstitution;

type
  {$METHODINFO ON}
  TSMAgency = class(TSM)
  private
    Institution : TControllerInstitution;
    Agency : TControllerAgency;

  public
    function getByKey(par: string): String;
    function save(par: string): String;
  end;
  {$METHODINFO OFF}

implementation


{ TSMAgency }


function TSMAgency.getByKey(par: string): String;
begin
    Result := par;
end;

function TSMAgency.save(par: string): String;
Var
  LcObj: TObjAgency;
begin
  try
    Try
      Institution := TControllerInstitution.Create(nil);
      Agency := TControllerAgency.Create(nil);
      LcObj := TObjAgency.Create;
      LcObj := TJson.JsonToObject<TObjAgency>(par);
      Agency.saveDataObjeto(LcObj);
      //Vincula a entidade ao institution
      Institution.InstitutionHasEntity.Registro.Estabelecimento := LcObj.Estabelecimento;
      Institution.InstitutionHasEntity.Registro.Entidade := Agency.Registro.Codigo;
      Institution.InstitutionHasEntity.save;
      Retorno.Mensagem := 'SAVED';
      Retorno.ID       := 200;
      Retorno.Code     := LcObj.Estabelecimento;
    Except
      on E:Exception do
      Begin
        Retorno.Mensagem := E.Message;
        Retorno.ID       := 500;
        Retorno.Code     := 0;
      End;
    End;
  finally
    Result := TJson.ObjectToJsonString(Retorno);
    LcObj.Destroy;
    Agency.DisposeOf;
    Institution.DisposeOf;
  end;


end;

end.

