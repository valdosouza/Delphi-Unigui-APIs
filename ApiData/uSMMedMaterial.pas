unit uSMMedMaterial;

interface

uses System.SysUtils, System.Classes, System.Json,
    DataSnap.DSProviderDataModuleAdapter,uSM,
    Datasnap.DSServer, Datasnap.DSAuth,REST.json,ControllerInstitution,
    tblMedMaterial, ControllerMedMaterial;

type
  {$METHODINFO ON}
  TSMMedMaterial = class(TSM)
  private
    Material: TControllerMedMaterial;
  public
    function save(par: string): String;
  end;
  {$METHODINFO OFF}

implementation


{ TSMMedMaterial }


function TSMMedMaterial.save(par: string): String;
begin
  try
    try
      Material := TControllerMedMaterial.Create(nil);
      Material.Registro := TJson.JsonToObject<TMedMaterial>(par);
      Material.save;
      Retorno.Mensagem := 'SAVED';
      Retorno.ID       := 200;
      Retorno.Code     := Material.Registro.Codigo;
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
    Material.DisposeOf;
  end;
end;

end.

