unit uSMStockList;


interface

uses System.SysUtils, System.Classes, System.Json,
    DataSnap.DSProviderDataModuleAdapter,
    Datasnap.DSServer, Datasnap.DSAuth,REST.json,
    ControllerStockList, TypesCollection, uSM, tblStockList;

type
  {$METHODINFO ON}
  TSMStockList = class(TSM)
  private

  public
    function save(par: string): String;
    function getSyncronize(par:String) : String;
    function getSalesmanStock( par:String) : String;
  end;
   {$METHODINFO OFF}

implementation

{ TSMStockList }

function TSMStockList.getSalesmanStock(par: String): String;
Var
  Tabela : TControllerStockList;
begin
  try
    Tabela := TControllerStockList.Create(nil);
    Try
      Tabela.setParametro(par);
      Result := setReturn( TJson.ObjectToJsonString(Tabela.getbySalesman) );
    except
      on E : Exception do
        Geralog('ApiData - ', E.Message);
    End;
  finally
    Tabela.DisposeOf;
  end;
end;

function TSMStockList.getSyncronize(par: String): String;
var
  Tabela : TControllerStockList;
begin
  try
    Try
      Tabela := TControllerStockList.Create(nil);
      Tabela.setParametro(par);
      Tabela.getList;
      Result := setReturn( TJson.ObjectToJsonString(Tabela.Lista) );
    except
      on E : Exception do
        Geralog('ApiData - TSMStockList.getSyncronize - ', E.Message);
    End;
  finally
    Tabela.DisposeOf;
  end;
end;

function TSMStockList.save(par: string): String;
var
  Tabela : TControllerStockList;
begin
  try
    Try
      Tabela := TControllerStockList.Create(nil);
      Tabela.Registro :=  TJson.JsonToObject<TStockList>(par);
      Tabela.save;
      Retorno.Mensagem := 'SAVED';
      Retorno.ID       := 200;
      Retorno.Code     := Tabela.Registro.Codigo;
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
    Tabela.DisposeOf;
  end;
end;

end.

