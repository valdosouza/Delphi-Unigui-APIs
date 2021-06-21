unit uSMStockBalance;
interface

uses System.SysUtils, System.Classes, System.Json,
    DataSnap.DSProviderDataModuleAdapter,
    Datasnap.DSServer, Datasnap.DSAuth,REST.json,
  TypesCollection, ControllerStockBalance, uSM, tblStockBalance;

type
  {$METHODINFO ON}
  TSMStockBalance = class(TSM)
  private
    Estoque : TControllerStockBalance;
  public
    function save(par: string): String;
    function getSyncronize(par:String) : String;
  end;
   {$METHODINFO OFF}

implementation

function TSMStockBalance.getSyncronize(par:String) : String;
begin
  try
    Try
      Estoque := TControllerStockBalance.Create(nil);
      Estoque.setParametro(par);
      Estoque.getList;
      Result := setReturn( TJson.ObjectToJsonString(Estoque.Lista) );
    except
      on E : Exception do
        Geralog('ApiData - ', E.Message);
    End;
  finally
    Estoque.DisposeOf;
  end;
end;

function TSMStockBalance.save(par: string): String;
begin
  try
    Try
      Estoque := TControllerStockBalance.Create(nil);
      Estoque.Registro :=  TJson.JsonToObject<TStockBalance>(par);
      Estoque.save;
      Retorno.Mensagem := 'SAVED';
      Retorno.ID       := 200;
      Retorno.Code     := Estoque.Registro.Mercadoria;
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
    Estoque.DisposeOf;
  end;
end;

end.
