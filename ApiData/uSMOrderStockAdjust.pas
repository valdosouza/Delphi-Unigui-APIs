unit uSMOrderStockAdjust;

interface

uses System.SysUtils, System.Classes, System.Json,synacode,
    DataSnap.DSProviderDataModuleAdapter,
    Datasnap.DSServer, Datasnap.DSAuth,REST.json, ControllerInstitution,
  UnFunctions,uSM,ObjInstitution,ObjOrderStockAdjust,ControllerOrderStockAdjust,
  prm_order_stock_adjust;

type
  {$METHODINFO ON}
  TSMOrderStockAdjust = class(TSM)
  private
    { Private declarations }
  public
    function save(par: string): String;
    function getByKey(par: string) : String;
    function getListSpl(Par:String) : String;
    function getList(par:String) : String;
    function getSyncronize(par: string) : String;
    function getLastOrderID(Par:String) : String;
    function getLastOrder(Par:String) : String;
  end;
  {$METHODINFO OFF}

implementation
{ TSMOrderStockAdjust }

function TSMOrderStockAdjust.getByKey(par : String): String;
Var
  I : Integer;
  LcOS : TControllerOrderStockAdjust;
begin
  try
    LcOS  := TControllerOrderStockAdjust.Create(nil);
    LcOS.setParametro(par);
    LcOS.getByKey;
    LcOS.FillDataObjeto(LcOS.Registro);
    Result := setReturn( TJson.ObjectToJsonString(LcOS.Obj) );
  finally
    LcOS.DisposeOf;
  end;
end;

function TSMOrderStockAdjust.getLastOrder(Par: String): String;
var
  LcOS : TControllerOrderStockAdjust;
  LcLasCodigo : Integer;
begin
  try
    LcOS  := TControllerOrderStockAdjust.Create(nil);
    LcOS.setParametro(par);
    LcOS.getByKey;
    LcOS.FillDataObjeto(LcOS.Registro);
    Result := setReturn( TJson.ObjectToJsonString(LcOS.Obj) );
  finally
    LcOS.DisposeOf;
  end;

end;

function TSMOrderStockAdjust.getLastOrderID(Par: String): String;
var
  LcLasCodigo : Integer;
  LcOS : TControllerOrderStockAdjust;
begin
  try
    LcOS := TControllerOrderStockAdjust.create(nil);
    LcOS.setParametro(par);
    try
      LcOS.getLastOrder;
      LcOS.FillDataObjeto(LcOS.Registro);
      LcOS.Parametro.OrdemAjuste.Numero  := LcOS.Registro.Numero;
      Result := setReturn( TJson.ObjectToJsonString(LcOS.Parametro) );
    except
      Result := TJson.ObjectToJsonString(LcOS.Parametro);
    end;
  finally
    LcOS.DisposeOf;
  end;
end;

function TSMOrderStockAdjust.getList(par: String): String;
Var
  LcOS : TControllerOrderStockAdjust;
begin
  try
    LcOS := TControllerOrderStockAdjust.Create(nil);
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

function TSMOrderStockAdjust.getListSpl(Par: String): String;
var
  LcOS : TControllerOrderStockAdjust;
begin
  try
    LcOS := TControllerOrderStockAdjust.create(nil);
    LcOS.Parametro := TJson.JsonToObject<TPrmOrderStockAdjust>(par);
    Result := setReturn( TJson.ObjectToJsonString(LcOS.getListSpl) );
  finally
    LcOS.DisposeOf;
  end;

end;

function TSMOrderStockAdjust.getSyncronize(par: String): String;
var
  LcOS : TControllerOrderStockAdjust;
begin
  try
    LcOS  := TControllerOrderStockAdjust.Create(nil);
    LcOS.setParametro(par);
    Try
      LcOS.setParametro(par);
      LcOS.orderby := ' updated_at ';
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

function TSMOrderStockAdjust.save(par: string): String;
Var
  LcOS : TControllerOrderStockAdjust;
begin
  try
    Try
      LcOS  := TControllerOrderStockAdjust.Create(nil);
      LcOS.Obj := TJson.JsonToObject<TObjOrderStockAdjust>( DecodeBase64(par) );
      LcOS.saveDataObjeto(LcOS.Obj);
      Retorno.Mensagem := 'Pedido de Estoque registrado com sucesso';
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

