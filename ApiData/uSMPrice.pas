unit uSMPrice;


interface

uses System.SysUtils, System.Classes, System.Json,
    DataSnap.DSProviderDataModuleAdapter,
    Datasnap.DSServer, Datasnap.DSAuth,REST.json,
    ControllerPrice, TypesCollection, uSM, tblPrice;

type
  {$METHODINFO ON}
  TSMPrice = class(TSM)
  private

  public
    function save(par: string): String;
    function getSyncronize(par:String) : String;
  end;
   {$METHODINFO OFF}

implementation

{ TSMPrice }


function TSMPrice.getSyncronize(par: String): String;
Var
  Preco : TControllerPrice;
begin
  try
    Try
      Preco := TControllerPrice.Create(nil);
      Preco.setparametro(par);
      Preco.getList;
      Result := setReturn( TJson.ObjectToJsonString(Preco.Lista) );
    except
      on E : Exception do
        Geralog('ApiData - ', E.Message);
    End;
  finally
    Preco.DisposeOf;
  end;
end;

function TSMPrice.save(par: string): String;
Var
  Preco : TControllerPrice;
begin
  try
    Try
      Preco := TControllerPrice.Create(nil);
      Preco.Registro :=  TJson.JsonToObject<TPrice>(par);
      Preco.save;
      Retorno.Mensagem := 'SAVED';
      Retorno.ID       := 200;
      Retorno.Code     := PReco.Registro.Produto;
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
    Preco.DisposeOf;
  end;
end;

end.
