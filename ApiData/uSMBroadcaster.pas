unit uSMBroadcaster;

interface

uses System.SysUtils, System.Classes, System.Json,
    DataSnap.DSProviderDataModuleAdapter,uSM,REST.Json,
    Datasnap.DSServer, Datasnap.DSAuth, tblentity, ControllerBroadcaster,
  ObjBroadcaster,ControllerInstitution;

type
  {$METHODINFO ON}
  TSMBroadcaster = class(TSM)
  private
    Institution : TControllerInstitution;
    Broadcaster : TControllerBroadcaster;

  public
    function get(par: string): String;
    function save(par: string): String;
  end;
  {$METHODINFO OFF}

implementation


{ TSMBroadcaster }


function TSMBroadcaster.get(par: string): String;
begin
  Result := par;
end;

function TSMBroadcaster.save(par: string): String;
Var
  LcObj: TObjBroadcaster;
begin
  try
    Try
      Institution := TControllerInstitution.Create(nil);
      Broadcaster := TControllerBroadcaster.Create(nil);
      LcObj := TObjBroadcaster.Create;
      LcObj := TJson.JsonToObject<TObjBroadcaster>(par);
      Broadcaster.saveDataObjeto(LcObj);
      //Vincula a entidade ao institution
      Institution.InstitutionHasEntity.Registro.Estabelecimento := LcObj.Estabelecimento;
      Institution.InstitutionHasEntity.Registro.Entidade := Broadcaster.Registro.Codigo;
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
    Broadcaster.DisposeOf;
    Institution.DisposeOf;
  end;
end;

end.

