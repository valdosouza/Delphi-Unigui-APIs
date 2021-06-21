unit uSMOrderConsignment;

interface

uses System.SysUtils, System.Classes, System.Json,objOrderConsignment,
    DataSnap.DSProviderDataModuleAdapter,uSM,
    Datasnap.DSServer, Datasnap.DSAuth,REST.json, prm_order_consignment,
    ControllerOrderConsignment;

type
  {$METHODINFO ON}
  TSMOrderConsignment = class(TSM)
  private
    { Private declarations }
  public
    function save(par: string): String;
    function getByKey(Par: String) : String;
    function getListSpl(Par:String) : String;
    function getList(par:String) : String;
    function getSyncronize(par:String) : String;
    function getLastOrderID(Par:String) : String;
  end;
  {$METHODINFO OFF}

implementation


{ TSMOrderConsignment }

function TSMOrderConsignment.getByKey(Par: String): String;
Var
  LcOS : TControllerOrderConsignment;
  LcPar : TPrmOrderConsignmet;
begin
  try
    LcOS  := TControllerOrderConsignment.Create(nil);
    LcPar := TJson.JsonToObject<TPrmOrderConsignmet>(par);
    try
      LcOS.Registro.Estabelecimento  := LcPar.Consignacao.Estabelecimento;
      LcOS.Registro.Codigo           := LcPar.Consignacao.Codigo;
      LcOS.Registro.Terminal         := LcPar.Consignacao.Terminal;
      LcOS.Registro.Cliente          := LcPar.Consignacao.Cliente;
      LcOS.getByKey;
      if LcOS.exist then
      Begin
        LcOS.FillDataObjeto(LcOS.Registro);
        Result := setReturn( TJson.ObjectToJsonString(LcOS.Obj) );
      End;
    except
      Result := TJson.ObjectToJsonString(LcOS.Parametro);
    end;
  finally
    LcOS.DisposeOf;
  end;
end;

function TSMOrderConsignment.getLastOrderID(Par: String): String;
var
  LcLasCodigo : Integer;
  LcOS : TControllerOrderConsignment;
begin
  try
    LcOS := TControllerOrderConsignment.create(nil);
    LcOS.Parametro := TJson.JsonToObject<TPrmOrderConsignmet>(par);
    LcOS.Parametro.Consignacao.Codigo := LcOS.getLastCodigo;
    try
      LcOS.getLastBySalesman;
      LcOS.FillDataObjeto(LcOS.Registro);
      LcOS.Parametro.Consignacao.Codigo := LcOS.Registro.Codigo;
      Result := TJson.ObjectToJsonString(LcOS.Parametro);
    except
      Result := TJson.ObjectToJsonString(LcOS.Parametro);
    end;
  finally
    LcOS.DisposeOf;
  end;
end;

function TSMOrderConsignment.getList(par: String): String;
Var
  LcOS : TControllerOrderConsignment;
begin
  try
    LcOS := TControllerOrderConsignment.Create(nil);
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

function TSMOrderConsignment.getListSpl(Par: String): String;
var
  LcOS : TControllerOrderConsignment;
begin
  try
    LcOS := TControllerOrderConsignment.create(nil);
    LcOS.Parametro := TJson.JsonToObject<TPrmOrderConsignmet>(par);
    Result := setReturn( TJson.ObjectToJsonString(LcOS.getListSpl) );
  finally
    LcOS.DisposeOf;
  end;

end;

function TSMOrderConsignment.getSyncronize(par:String) : String;
var
  LcOS : TControllerOrderConsignment;
begin
  try
    LcOS  := TControllerOrderConsignment.Create(nil);
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

function TSMOrderConsignment.save(par: string): String;
Var
  LcOS : TControllerOrderConsignment;
begin
  if par <> '' then
  Begin
    try
      Try
        LcOS  := TControllerOrderConsignment.Create(nil);
        LcOS.saveDataObjeto(TJson.JsonToObject<TObjOrderConsignment>(par));
        Retorno.Mensagem := 'SAVED';
        Retorno.ID       := 200;
        Retorno.Code     := LcOS.Registro.Codigo;
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
      LcOS.DisposeOf;
    End;
  End;
end;

end.

