unit uSMInvoiceReturnService;

interface

uses System.SysUtils, System.Classes, System.Json,ObjOrderSale,synacode,
    DataSnap.DSProviderDataModuleAdapter,uSM,ObjInvoiceReturnService,
    Datasnap.DSServer, Datasnap.DSAuth,REST.json,
    ControllerInvoiceReturnService,Controllerinvoicemerchandise;

type
  {$METHODINFO ON}
  TSMInvoiceReturnService = class(TSM)
  private
    { Private declarations }
  public
    function save(par: string): String;
  end;
  {$METHODINFO OFF}

implementation


{ TSMInvoiceReturnService }

uses UnFunctions;


function TSMInvoiceReturnService.save(par: string): String;
Var
  LcOS : TControllerInvoiceReturnService;
begin
  try
    TRy
      LcOS  := TControllerInvoiceReturnService.Create(nil);
      LcOS.Obj := TJson.JsonToObject<TObjInvoiceReturnService>( ZDecompressString(par) );
      LcOS.saveDataObjeto(LcOS.Obj);
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

