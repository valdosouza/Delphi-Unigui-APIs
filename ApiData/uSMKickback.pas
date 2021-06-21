unit uSMKickback;

interface

uses System.SysUtils, System.Classes, System.Json,
    DataSnap.DSProviderDataModuleAdapter,
    Datasnap.DSServer, Datasnap.DSAuth,REST.json,
  TypesCollection, ControllerKickback, uSM, objKickback;


type
  {$METHODINFO ON}
  TSMKickback = class(TSM)
  private
    Comissao : TControllerKickBack;
  public
    function save(par: string): String;
    function getSyncronize(par: string) : String;
  end;
   {$METHODINFO OFF}

implementation


{ TSMKickback }

function TSMKickback.getSyncronize(par: string): String;
begin
  Try
    Comissao := TControllerKickBack.Create(nil);
    Comissao.setParametro(par);
    Comissao.getList;
    Result := setReturn( TJson.ObjectToJsonString( Comissao.Lista) );
  finally
    Comissao.DisposeOf;
  End;
end;

function TSMKickback.save(par: string): String;
begin
  try
    TRy
      Comissao := TControllerKickBack.Create(nil);
      Comissao.saveDataObjeto( TJson.JsonToObject<TObjKickback>(par) );
      Retorno.Mensagem := 'SAVED';
      Retorno.ID       := 200;
      Retorno.Code     := Comissao.Registro.Ordem;
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
    Comissao.DisposeOf;
  end;
end;

end.
