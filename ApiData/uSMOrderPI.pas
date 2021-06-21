unit uSMOrderPI;

interface

uses System.SysUtils, System.Classes, System.Json,
    DataSnap.DSProviderDataModuleAdapter,uSM,
    Datasnap.DSServer, Datasnap.DSAuth,REST.json,
  ControllerOrderPi, objOrderPI;

type
  {$METHODINFO ON}
  TSMOrderPI = class(TSM)
  private
    Order: TControllerOrderPi;
  public
    function save(par: string): String;
  end;
  {$METHODINFO OFF}

implementation


{ TSMOrderPI }


function TSMOrderPI.save(par: string): String;
Var
  LcObj: TObjOrderPI;
begin
  try
    try
      Order := TControllerOrderPi.Create(nil);
      LcObj := TObjOrderPI.Create;
      LcObj := TJson.JsonToObject<TObjOrderPI>(par);
      Order.saveDataObjeto(LcObj);
      Retorno.Mensagem := 'SAVED';
      Retorno.ID       := 200;
      Retorno.Code     := LcObj.Estabelecimento;
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
    Order.DisposeOf;
  end;
end;

end.

