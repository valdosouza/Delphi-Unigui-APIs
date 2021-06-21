unit uSMInvoiceRectification;

interface

uses System.SysUtils, System.Classes, System.Json,ObjOrderSale,synacode,
    DataSnap.DSProviderDataModuleAdapter,uSM,ControllerInvoiceRectification,
    Datasnap.DSServer, Datasnap.DSAuth,REST.json,objInvoiceRectification;

type
  {$METHODINFO ON}
  TSMInvoiceRectification = class(TSM)
  private
    { Private declarations }
  public
    function save(par: string): String;
  end;
  {$METHODINFO OFF}

implementation


{ TSMInvoiceReturnService }

uses UnFunctions;


function TSMInvoiceRectification.save(par: string): String;
Var
  LcOS : TControllerInvoiceRectification;
begin
  try
    TRy
      LcOS  := TControllerInvoiceRectification.Create(nil);
      LcOS.Obj := TJson.JsonToObject<TObjInvoiceRectification>( DecodeBase64( par ));
      LcOS.ClonarObj(LcOS.Obj.CartaCorrecao,LcOS.Registro);
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

