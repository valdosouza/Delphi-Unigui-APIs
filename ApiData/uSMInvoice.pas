unit uSMInvoice;

interface

uses System.SysUtils, System.Classes, System.Json,synacode,
    DataSnap.DSProviderDataModuleAdapter,uSM,
    Datasnap.DSServer, Datasnap.DSAuth,REST.json,
    TypesCollection, objInvoice,Controllerinvoice;

type
  {$METHODINFO ON}
  TSMInvoice = class(TSM)
  private
    Invoice : TControllerInvoice;
  public
    function save(par: string): String;
    function getSyncronize(par:String) : String;
  end;
   {$METHODINFO OFF}

implementation

uses UnFunctions;

function TSMInvoice.getSyncronize(par:String) : String;
begin

end;

function TSMInvoice.save(par: string): String;
Var
  LcObj: TObjInvoice;
begin
  try
    try
      Invoice :=TControllerInvoice.Create(nil);
      LcObj := TObjInvoice.Create;
      LcObj := TJson.JsonToObject<TObjInvoice>( DecodeBase64( par) );
      Invoice.saveDataObjeto(LcObj);
      Retorno.Mensagem := 'SAVED';
      Retorno.ID       := 200;
      Retorno.Code     := LcObj.NF.Estabelecimento;
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
    LcObj.Destroy;
    Invoice.DisposeOf;
  end;
end;

end.
