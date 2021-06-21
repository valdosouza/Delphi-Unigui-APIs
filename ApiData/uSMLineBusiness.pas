unit uSMLineBusiness;

interface

uses System.SysUtils, System.Classes, System.Json,
    DataSnap.DSProviderDataModuleAdapter,uSM,
    Datasnap.DSServer, Datasnap.DSAuth,REST.json,ControllerInstitution,
    ControllerLineBusiness, tblLinebusiness, ObjLineBusiness;

type
  {$METHODINFO ON}
  TSMLineBusiness = class(TSM)
  private
    RamoAtividade: TControllerLineBusiness;
  public
    function save(par: string): String;
  end;
  {$METHODINFO OFF}

implementation


function TSMLineBusiness.save(par: string): String;
Var
  LcObj : TObjLineBusiness;
begin
  try
    TRy
      RamoAtividade := TControllerLineBusiness.Create(nil);
      LcObj  := TJson.JsonToObject<TObjLineBusiness>(par);
      RamoAtividade.saveDataObjeto(LcObj);
      Retorno.Mensagem := 'SAVED';
      Retorno.ID       := 200;
      Retorno.Code     := RamoAtividade.Registro.Codigo;
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
    RamoAtividade.DisposeOf;
  end;
end;

end.
