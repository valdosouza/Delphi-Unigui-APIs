unit uSMCashier;

interface

uses System.SysUtils, System.Classes, System.Json,synacode,
    DataSnap.DSProviderDataModuleAdapter,
    Datasnap.DSServer, Datasnap.DSAuth,REST.json,
  TypesCollection, ControllerCashier, uSM, objCashier;


type
  {$METHODINFO ON}
  TSMCashier = class(TSM)
  private

  public
    function save(par: string): String;
    function getSyncronize(par:String) : String;
  end;
   {$METHODINFO OFF}

implementation


{ TSMCashier }

uses UnFunctions;

function TSMCashier.getSyncronize(par: String): String;
var
  Caixa : TControllerCashier;
begin
  Try
    Caixa := TControllerCashier.Create(nil);
    Caixa.setParametro(par);
    Caixa.getList;
    Caixa.getListObjCashier;
    Result := setReturn( TJson.ObjectToJsonString( Caixa.ListaObj) );
  finally
    Caixa.DisposeOf;
  End;
end;

function TSMCashier.save(par: string): String;
var
  Caixa : TControllerCashier;
begin
  try
    TRy
      Caixa := TControllerCashier.Create(nil);
      Caixa.saveDataObjeto( TJson.JsonToObject<TobjCashier>(  DecodeBase64( par )));
      Retorno.Mensagem := 'SAVED';
      Retorno.ID       := 200;
      Retorno.Code     := caixa.Registro.Codigo;
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
    Caixa.DisposeOf;
  end;
end;

end.
