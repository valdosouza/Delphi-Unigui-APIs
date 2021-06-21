unit uSMOrderSale;

interface

uses System.SysUtils, System.Classes, System.Json,
    DataSnap.DSProviderDataModuleAdapter,synacode,
    Datasnap.DSServer, Datasnap.DSAuth,REST.json, ControllerInstitution,
  UnFunctions,uSM,ObjInstitution,ObjOrderSale,ControllerOrderSale, prm_order_sale;

type
  {$METHODINFO ON}
  TSMOrderSale = class(TSM)
  private
    { Private declarations }
  public
    function save(par: string)            : String;
    function getByKey(par: string)        : String;
    function getListSpl(Par:String)       : String;
    function getListSplByHour(Par:String) : String;
    function getListSplByDate(Par:String) : String;
    function getList(par:String)          : String;
    function getSyncronize(par: string)   : String;
    function getLastOrderID(Par:String)   : String;
    function getLastOrder(Par:String)     : String;
  end;
  {$METHODINFO OFF}

implementation
{ TSMOrderSale }

function TSMOrderSale.getByKey(par: string): String;
Var
  I : Integer;
  LcOS : TControllerOrderSale;
begin
  try
    LcOS  := TControllerOrderSale.Create(nil);
    LcOS.setParametro(par);
    LcOS.getByKey;
    LcOS.FillDataObjeto(LcOS.Registro);
    Result := setReturn( TJson.ObjectToJsonString(LcOS.Obj) );
  finally
    LcOS.DisposeOf;
  end;
end;

function TSMOrderSale.getLastOrder(Par: String): String;
var
  LcOS : TControllerOrderSale;
  LcLasCodigo : Integer;
begin
  try
    LcOS  := TControllerOrderSale.Create(nil);
    LcOS.setparametro(par);
    LcOS.getLastOrder;
    LcOS.FillDataObjeto(LcOS.Registro);
    Result := setReturn( TJson.ObjectToJsonString(LcOS.Obj) );
  finally
    LcOS.DisposeOf;
  end;
end;

function TSMOrderSale.getLastOrderID(Par: String): String;
var
  LcLasCodigo : Integer;
  LcOS : TControllerOrderSale;
begin
  try
    LcOS := TControllerOrderSale.create(nil);
    LcOS.setParametro(par);
    LcLasCodigo := LcOS.getLastCodigo;
    LcOS.getLastBySalesman;
    LcOS.FillDataObjeto(LcOS.Registro);
    LcOS.parametro.OrdemVenda.Numero  := LcOS.Registro.Numero;
    Result := setReturn( TJson.ObjectToJsonString(LcOS.parametro) );
  finally
    LcOS.DisposeOf;
  end;
end;

function TSMOrderSale.getList(par: String): String;
Var
  LcOS : TControllerOrderSale;
begin
  try
    LcOS := TControllerOrderSale.Create(nil);
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

function TSMOrderSale.getListSpl(Par: String): String;
var
  LcOS : TControllerOrderSale;
begin
  try
    LcOS := TControllerOrderSale.create(nil);
    LcOS.Parametro := TJson.JsonToObject<TPrmOrderSale>(par);
    Result := setReturn( TJson.ObjectToJsonString(LcOS.getListSpl) );
  finally
    LcOS.DisposeOf;
  end;

end;

function TSMOrderSale.getListSplByDate(Par: String): String;
var
  LcOS : TControllerOrderSale;
begin
  try
    LcOS := TControllerOrderSale.create(nil);
    LcOS.Parametro := TJson.JsonToObject<TPrmOrderSale>(par);
    Result := setReturn( TJson.ObjectToJsonString(LcOS.getListSplByDate) );
  finally
    LcOS.DisposeOf;
  end;
end;

function TSMOrderSale.getListSplByHour(Par: String): String;
var
  LcOS : TControllerOrderSale;
begin
  try
    LcOS := TControllerOrderSale.create(nil);
    LcOS.Parametro := TJson.JsonToObject<TPrmOrderSale>(par);
    Result := setReturn( TJson.ObjectToJsonString(LcOS.getListSplByHour) );
  finally
    LcOS.DisposeOf;
  end;

end;

function TSMOrderSale.getSyncronize(par: String): String;
var
  LcOS : TControllerOrderSale;
begin
  try
    LcOS  := TControllerOrderSale.Create(nil);
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

function TSMOrderSale.save(par: string): String;
Var
  LcOS : TControllerOrderSale;
begin
  try
    Try
      LcOS  := TControllerOrderSale.Create(nil);
      par := DecodeBase64( par );
      LcOS.Obj := TJson.JsonToObject<TObjOrderSale>( par );
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
    LcOS.disposeof
  end;
end;

end.

