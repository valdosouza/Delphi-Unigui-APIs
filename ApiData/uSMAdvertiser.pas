unit uSMAdvertiser;

interface

uses System.SysUtils, System.Classes, System.Json,
    DataSnap.DSProviderDataModuleAdapter, uSM,
    Datasnap.DSServer, Datasnap.DSAuth,REST.json, tblentity, ControllerAdvertiser,
  ObjAdvertiser, ControllerInstitution;

type
  {$METHODINFO ON}
  TSMAdvertiser = class(TSM)
  private
    Institution : TControllerInstitution;
    Advertiser : TControllerAdvertiser;
  public
    function save(par: string): String;
  end;
  {$METHODINFO OFF}

implementation


{ TSMAdvertiser }


function TSMAdvertiser.save(par: string): String;
Var
  LcObj: TObjAdvertiser;
begin
  try
    Try
      Institution := TControllerInstitution.Create(nil);
      Advertiser := TControllerAdvertiser.Create(nil);
      LcObj := TObjAdvertiser.Create;
      LcObj := TJson.JsonToObject<TObjAdvertiser>(par);
      Advertiser.saveDataObjeto(LcObj);
      //Vincula a entidade ao institution
      Institution.InstitutionHasEntity.Registro.Estabelecimento := LcObj.Estabelecimento;
      Institution.InstitutionHasEntity.Registro.Entidade := Advertiser.Registro.Codigo;
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
    Advertiser.DisposeOf;
    Institution.DisposeOf;
  end;
end;

end.

