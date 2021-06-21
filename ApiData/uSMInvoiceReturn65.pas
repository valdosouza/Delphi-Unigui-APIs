unit uSMInvoiceReturn65;

interface

uses System.SysUtils, System.Classes, System.Json,ObjOrderSale,synacode,
    DataSnap.DSProviderDataModuleAdapter,uSM,ObjInvoiceReturn65,
    Datasnap.DSServer, Datasnap.DSAuth,REST.json, prm_order_sale,
    ControllerInvoiceReturn65;

type
  {$METHODINFO ON}
  TSMInvoiceReturn65 = class(TSM)
  private
    { Private declarations }
  public
    function save(par: string): String;
  end;
  {$METHODINFO OFF}

implementation


{ TSMInvoiceReturn65 }

uses UnFunctions;


function TSMInvoiceReturn65.save(par: string): String;
Var
  LcOS : TControllerInvoiceReturn65;
begin
  try
    Try
      LcOS  := TControllerInvoiceReturn65.Create(nil);
      LcOS.Obj := TJson.JsonToObject<TObjInvoiceReturn65>( DecodeBase64( par ));
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

