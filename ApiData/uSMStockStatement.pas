unit uSMStockStatement;
interface

uses System.SysUtils, System.Classes, System.Json,synacode,
    DataSnap.DSProviderDataModuleAdapter,
    Datasnap.DSServer, Datasnap.DSAuth,REST.json,
  TypesCollection, ControllerStockStatement, objStockStatement,
  tblStockStatement, uSM;

type
  {$METHODINFO ON}
  TSMStockStatement = class(TSM)
  private
    Movimento : TControllerStockStatement;
  public
    function save(par: string): String;
    function getSyncronize(par:String) : String;
  end;
   {$METHODINFO OFF}

implementation

uses UnFunctions;


function TSMStockStatement.getSyncronize(par:String) : String;
begin
  try
    Movimento := TControllerStockStatement.Create(nil);
    Try
      Movimento.SetParametro(par);
      Movimento.getList;
      Result := setReturn( TJson.ObjectToJsonString(Movimento.Lista) );
    except
      on E : Exception do
        Geralog('ApiData - ', E.Message);
    End;
  finally
    Movimento.DisposeOf;
  end;
end;

function TSMStockStatement.save(par: string): String;
begin
  try
    Try
      Movimento := TControllerStockStatement.Create(nil);
      Movimento.Registro :=  TJson.JsonToObject<TStockStatement>( ZDecompressString(par) );
      Movimento.save;
      Retorno.Mensagem := 'SAVED';
      Retorno.ID       := 200;
      Retorno.Code     := Movimento.Registro.Mercadoria;
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
    Movimento.disposeOf;
  end;
end;

end.
