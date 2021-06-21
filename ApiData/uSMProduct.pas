unit uSMProduct;

interface

uses System.SysUtils, System.Classes, System.Json,
    DataSnap.DSProviderDataModuleAdapter,
    Datasnap.DSServer, Datasnap.DSAuth,REST.json,
  TypesCollection, ControllerProduct, uSM;

type
  {$METHODINFO ON}
  TSMProduct = class(TSM)
  private
    Produto : TControllerProduct;
  public
    function save(par: string): String;
    function getSyncronize(par:String) : String;
  end;
   {$METHODINFO OFF}

implementation

function TSMProduct.getSyncronize(par:String) : String;
begin
  try
    Try
      Produto := TControllerProduct.Create(nil);
      Produto.setParametro(par);
      Produto.getList;
      Result := setReturn( TJson.ObjectToJsonString(Produto.Lista));
    except
      on E : Exception do
        Geralog('ApiData - ', E.Message);
    End;
  finally
    Produto.DisposeOf;
  end;
end;

function TSMProduct.save(par: string): String;
begin

end;

end.
