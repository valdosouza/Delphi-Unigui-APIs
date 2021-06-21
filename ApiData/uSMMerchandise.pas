unit uSMMerchandise;

interface

uses System.SysUtils, System.Classes, System.Json, System.Generics.Collections,
    DataSnap.DSProviderDataModuleAdapter,ObjPriceList,ControllerPriceList,
    Datasnap.DSServer, Datasnap.DSAuth,REST.json,zLib,
  ControllerMerchandise, ControllerStockBalance, ControllerPrice, ObjMerchandise,
  System.Contnrs, TypesCollection, ObjStockList, uSM,ACBrBase, ACBrValidador,
  UnFunctions;

type
  {$METHODINFO ON}
  TObjListMerchandise = TObjectList<TObjMerchandise>;
  TSMMerchandise = class(TSM)
  private
    Mercadoria : TControllerMerchandise;
    Erro : String;
  public
    function save(par: string): String;
    function getByKey(par: string) : String;
    function getList(par:String) : String;
    function getListSpl(Par:String) : String;
    function getSyncronize(par:String) : String;
    function getSyncronizeObj(par:String) : String;

  end;
   {$METHODINFO OFF}

implementation

uses tblMerchandise;

function TSMMerchandise.getByKey(par: string): String;
Var
  LcMercadoria : TControllerMerchandise;
  LcStrJson : String;
begin
  try
    LcMercadoria := TControllerMerchandise.create(nil);
    LcMercadoria.setParametro(Par);
    LcMercadoria.Registro.Estabelecimento := LcMercadoria.Parametro.Mercadoria.Estabelecimento;
    LcMercadoria.Registro.Codigo          := LcMercadoria.Parametro.Mercadoria.Codigo;
    LcMercadoria.getByKey;
    LcMercadoria.fillDataObjeto(LcMercadoria.Registro);
    Result := setReturn( TJson.ObjectToJsonString( LcMercadoria.Obj ) );
  finally
    LcMercadoria.DisposeOf;
  end;

end;

function TSMMerchandise.getList(par: String): String;
Var
  LcMercadoria : TControllerMerchandise;
begin
  try
    LcMercadoria := TControllerMerchandise.create(nil);
    LcMercadoria.setParametro(par);
    Try
      LcMercadoria.getList;
      Result := setReturn( TJson.ObjectToJsonString( LcMercadoria.Lista) );
    except
      on E:Exception do
      Begin
        Retorno.Mensagem := E.Message;
        Retorno.ID       := 500;
        Retorno.Code     := 0;
      End;
    End;
  finally
    LcMercadoria.DisposeOf;
  end;
end;

function TSMMerchandise.getListSpl(Par: String): String;
begin
  try
    Mercadoria := TControllerMerchandise.Create(nil);
    Result := setReturn( TJson.ObjectToJsonString(Mercadoria.getListSpl) );
  finally
    Mercadoria.DisposeOf;
  end;
end;

function TSMMerchandise.getSyncronize(par: String): String;
begin
  try
    Mercadoria := TControllerMerchandise.Create(nil);
    Mercadoria.setParametro(par);
    Mercadoria.getList;
    Result := setReturn( TJson.ObjectToJsonString(Mercadoria.Lista) );
  finally
    Mercadoria.DisposeOf;
  end;
end;

function TSMMerchandise.getSyncronizeObj(par: String): String;
Var
  LcMercadoria : TControllerMerchandise;
begin
  try
    LcMercadoria := TControllerMerchandise.Create(nil);
    Mercadoria.setParametro(par);
    LcMercadoria.getList;
    LcMercadoria.getListObj;
    Result := setReturn( TJson.ObjectToJsonString( LcMercadoria.ListaObj) );
  finally
    LcMercadoria.DisposeOf;
  end;
end;

function TSMMerchandise.save(par: string): String;
begin
  try
    Try
      Mercadoria      := TControllerMerchandise.create(nil);
      Mercadoria.Obj  := TJson.JsonToObject<TObjMerchandise>(par);
      Mercadoria.saveDataObjeto( Mercadoria.Obj );
      Retorno.Mensagem := 'SAVED';
      Retorno.ID       := 200;
      Retorno.Code     := Mercadoria.Registro.Codigo;
    except
      on E : Exception do
      Begin
        Retorno.Mensagem := E.Message;
        Retorno.ID       := 500;
        Retorno.Code     := 0;
      End;
    End;
  finally
    Result := TJson.ObjectToJsonString( Retorno );
    Mercadoria.DisposeOf;
  end;
end;






end.

