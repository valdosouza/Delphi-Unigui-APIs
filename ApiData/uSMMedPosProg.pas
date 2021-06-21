unit uSMMedPosProg;

interface

uses System.SysUtils, System.Classes, System.Json,
    DataSnap.DSProviderDataModuleAdapter,uSM,
    Datasnap.DSServer, Datasnap.DSAuth,REST.json,ControllerInstitution,
    tblMedPosProg, ControllerMedPosProg;

type
  {$METHODINFO ON}
  TSMMedPosProg = class(TSM)
  private
    PosicaoProg: TControllerMedPosProg;
  public
    function save(par: string): String;
  end;
  {$METHODINFO OFF}

implementation


{ TSMMedPosProg }


function TSMMedPosProg.save(par: string): String;
begin
  try
    try
      PosicaoProg := TControllerMedPosProg.Create(nil);
      PosicaoProg.Registro := TJson.JsonToObject<TMedPosProg>(par);
      PosicaoProg.save;
      Retorno.Mensagem := 'SAVED';
      Retorno.ID       := 200;
      Retorno.Code     := PosicaoProg.Registro.Codigo;
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
    PosicaoProg.DisposeOf;
  end;
end;

end.

