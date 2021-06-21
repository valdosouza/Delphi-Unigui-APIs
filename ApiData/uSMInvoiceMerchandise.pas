unit uSMInvoiceMerchandise;

interface

uses System.SysUtils, System.Classes, System.Json,ObjOrderSale,synacode,
    DataSnap.DSProviderDataModuleAdapter,uSM,
    Datasnap.DSServer, Datasnap.DSAuth,REST.json, prm_order_sale,
    ControllerInvoiceMerchandise,objInvoiceMerchandise;

type
  {$METHODINFO ON}
  TSMInvoiceMerchandise = class(TSM)
  private
    { Private declarations }
  public
    function save(par: string): String;
    function getByKey(par:String) : String;
    function getListSpl(Par:String) : String;
    function getSyncronize(par:String) : String;
  end;
  {$METHODINFO OFF}

implementation


{ TSMInvoiceMerchandise }

uses UnFunctions;

function TSMInvoiceMerchandise.getByKey(par:String): String;
begin

end;

function TSMInvoiceMerchandise.getListSpl(Par: String): String;
begin

end;

function TSMInvoiceMerchandise.getSyncronize(par: String): String;
begin

end;

function TSMInvoiceMerchandise.save(par: string): String;
Var
  LcOS : TControllerInvoiceMerchandise;
begin
  try
    TRY
      LcOS  := TControllerInvoiceMerchandise.Create(nil);
      LcOS.saveDataObjeto(TJson.JsonToObject<TObjInvoiceMerchandise>( DecodeBase64(par) ));
      Retorno.Mensagem := 'SAVED';
      Retorno.ID       := 200;
      Retorno.Code     := LcOS.Registro.codigo;
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
  end;
end;

end.

