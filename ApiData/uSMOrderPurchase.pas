unit uSMOrderPurchase;


interface

uses System.SysUtils, System.Classes, System.Json,synacode,
    DataSnap.DSProviderDataModuleAdapter,
    Datasnap.DSServer, Datasnap.DSAuth,REST.json, ControllerInstitution,
  UnFunctions,uSM,ObjInstitution,ObjOrderPurchase,ControllerOrderPurchase, prm_order_purchase;

type
  {$METHODINFO ON}
  TSMOrderPurchase = class(TSM)
  private
    { Private declarations }
  public
    function save(par: string)            : String;
    function getByKey(par: string)        : String;
    function getListSpl(Par:String)       : String;
    function getListSplByDate(Par:String) : String;
    function getList(par:String)          : String;
    function getSyncronize(par: string)   : String;
    function getLastOrderID(Par:String)   : String;
    function getLastOrder(Par:String)     : String;
  end;
  {$METHODINFO OFF}

implementation
{ TSMOrderPurchase }

function TSMOrderPurchase.getByKey(par: string): String;
Var
  I : Integer;
  LcOS : TControllerOrderPurchase;
begin
  try
    LcOS  := TControllerOrderPurchase.Create(nil);
    LcOS.setParametro(par);
    LcOS.getByKey;
    LcOS.FillDataObjeto(LcOS.Registro);
    Result := setReturn( TJson.ObjectToJsonString(LcOS.Obj) );
  finally
    LcOS.DisposeOf;
  end;
end;

function TSMOrderPurchase.getLastOrder(Par: String): String;
var
  LcOS : TControllerOrderPurchase;
  LcLasCodigo : Integer;
begin
  try
    LcOS  := TControllerOrderPurchase.Create(nil);
    LcOS.setParametro(par);
    LcOS.getByKey;
    LcOS.FillDataObjeto(LcOS.Registro);
    Result := setReturn( TJson.ObjectToJsonString(LcOS.Obj) );
  finally
    LcOS.DisposeOf;
  end;
end;

function TSMOrderPurchase.getLastOrderID(Par: String): String;
var
  LcLasCodigo : Integer;
  LcOS : TControllerOrderPurchase;
begin
  try
    LcOS := TControllerOrderPurchase.create(nil);
    LcOS.setParametro(par);
    LcLasCodigo := LcOS.getLastCodigo;
    try
      LcOS.getByKey;
      LcOS.FillDataObjeto(LcOS.Registro);
      LcOS.Parametro.OrdemCompra.Numero  := LcOS.Registro.Numero;
      Result := setReturn( TJson.ObjectToJsonString(LcOS.Parametro) );
    except
      Result := TJson.ObjectToJsonString(LcOS.Parametro);
    end;
  finally
    LcOS.DisposeOf;
  end;
end;

function TSMOrderPurchase.getList(par: String): String;
Var
  LcOS : TControllerOrderPurchase;
begin
  try
    LcOS := TControllerOrderPurchase.Create(nil);
    Try
      LcOS.setParametro(par);
      LcOS.getList;
      Result := setReturn( TJson.ObjectToJsonString( LcOS.Lista) );
    except
      on E : Exception do
        Geralog('ApiData - ', E.Message);
    End;
  finally
    LcOS.DisposeOf;
  end;
end;

function TSMOrderPurchase.getListSpl(Par: String): String;
var
  LcOS : TControllerOrderPurchase;
begin
  try
    LcOS := TControllerOrderPurchase.create(nil);
    LcOS.Parametro := TJson.JsonToObject<TPrmOrderPurchase>(par);
    Result := setReturn( TJson.ObjectToJsonString(LcOS.getListSpl) );
  finally
    LcOS.DisposeOf;
  end;

end;

function TSMOrderPurchase.getListSplByDate(Par: String): String;
var
  LcOS : TControllerOrderPurchase;
begin
  try
    LcOS := TControllerOrderPurchase.create(nil);
    LcOS.Parametro := TJson.JsonToObject<TPrmOrderPurchase>(par);
    Result := setReturn( TJson.ObjectToJsonString(LcOS.getListSplByDate) );
  finally
    LcOS.DisposeOf;
  end;
end;

function TSMOrderPurchase.getSyncronize(par: String): String;
var
  LcOS : TControllerOrderPurchase;
begin
  try
    LcOS  := TControllerOrderPurchase.Create(nil);
    Try
      LcOS.setParametro(par);
      LcOS.getList;
      Result := setReturn( TJson.ObjectToJsonString(LcOS.Lista) );
    except
      on E : Exception do
        Geralog('ApiData - ', E.Message);
    End;
  finally
    LcOS.DisposeOf;
  end;
end;

function TSMOrderPurchase.save(par: string): String;
Var
  LcOS : TControllerOrderPurchase;
begin
  try
    Try
      LcOS  := TControllerOrderPurchase.Create(nil);
      LcOS.Obj := TJson.JsonToObject<TObjOrderPurchase>(DecodeBase64(par) );
      LcOS.saveDataObjeto(LcOS.Obj);
      Retorno.Mensagem := 'SAVED';
      Retorno.ID       := 200;
      Retorno.Code     := LcOS.Obj.Order.Codigo;
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
    LcOS.Destroy;
  end;
end;

end.

