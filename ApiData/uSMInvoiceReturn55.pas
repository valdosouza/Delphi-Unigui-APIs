unit uSMInvoiceReturn55;

interface

uses System.SysUtils, System.Classes, System.Json,ObjOrderSale,synacode,
    DataSnap.DSProviderDataModuleAdapter,uSM,ObjInvoiceReturn55,
    Datasnap.DSServer, Datasnap.DSAuth,REST.json, prm_order_sale,
    ControllerInvoiceReturn55,objInvoiceMerchandise,tblInvoiceReturn55;

type
  {$METHODINFO ON}
  TSMInvoiceReturn55 = class(TSM)
  private
    { Private declarations }
  public
    function save(par: string): String;
  end;
  {$METHODINFO OFF}

implementation


{ TSMInvoiceReturn55 }

uses UnFunctions;


function TSMInvoiceReturn55.save(par: string): String;
Var
  LcOS : TControllerInvoiceReturn55;
begin
  try
    Try
      LcOS  := TControllerInvoiceReturn55.Create(nil);
      LcOS.Obj := TJson.JsonToObject<TObjInvoiceReturn55>( DecodeBase64( par ));
      LcOS.ClonarObj(LcOS.Obj.Retorno,LcOS.Registro);
      LcOS.save;
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
  end;
end;

end.

