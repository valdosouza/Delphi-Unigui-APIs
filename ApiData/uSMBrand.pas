unit uSMBrand;

interface

uses System.SysUtils, System.Classes, System.Json,
    DataSnap.DSProviderDataModuleAdapter,objBrand,
    Datasnap.DSServer, Datasnap.DSAuth,REST.json,
  TypesCollection, ControllerBrand, tblBrand, uSM;

type
  {$METHODINFO ON}
  TSMBrand = class(TSM)
  private

  public
    function getList(par : String):String;
    function save(par : String):String;
    function delete(par:String):String;

    function getSyncronize(par:String) : String;
  end;
   {$METHODINFO OFF}

implementation

function TSMBrand.delete(par:String): String;
begin

end;

function TSMBrand.getList(par : String): String;
begin

end;

function TSMBrand.getSyncronize(par:String) : String;
Var
  Marca : TControllerBrand;
begin
  try
    TRy
      Marca := TControllerBrand.Create(nil);
      Marca.setParametro(par);
      Marca.getList;
      Result := setReturn( TJson.ObjectToJsonString(Marca.Lista) );
    except
      on E : Exception do
        Geralog('ApiData - ', E.Message);
    End;
  finally
    Marca.DisposeOf;
  End;
end;


function TSMBrand.save(par: String): String;
Var
  Marca : TControllerBrand;
begin
  try
    Try
      Marca := TControllerBrand.Create(nil);
      Marca.Obj := TJson.JsonToObject<TObjBrand>(par);
      Marca.saveDataObjeto(Marca.Obj);
      Retorno.Mensagem := 'SAVED';
      Retorno.ID       := 200;
      Retorno.Code     := Marca.Registro.Codigo;
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
    Marca.DisposeOf;
  end;
end;

end.
