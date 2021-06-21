unit uSMStock;
interface

uses System.SysUtils, System.Classes, System.Json,
    DataSnap.DSProviderDataModuleAdapter,
    Datasnap.DSServer, Datasnap.DSAuth,REST.json,
  TypesCollection, ControllerStock, uSM;

type
  {$METHODINFO ON}
  TSMStock = class(TSM)
  private
    Estoque : TControllerStock;
  public
    function save(par: string): String;
    function getSyncronize(par:String) : String;
  end;
   {$METHODINFO OFF}

implementation

function TSMStock.getSyncronize(par:String) : String;
begin
  try
    Try
      Estoque := TControllerStock.Create(nil);
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

function TSMStock.save(par: string): String;
begin


end;

end.
