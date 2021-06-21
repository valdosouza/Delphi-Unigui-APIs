unit uSMMedPriceJR;

interface

uses System.SysUtils, System.Classes, System.Json,
    DataSnap.DSProviderDataModuleAdapter,uSM,
    Datasnap.DSServer, Datasnap.DSAuth,REST.json, objMedPriceListJr,
  ControllerMedPriceListJR;

type
  {$METHODINFO ON}
  TSMMedPriceJR = class(TSM)
  private
    Order: TControllerMedPriceListJR;
  public
    function save(par: string): String;
  end;
  {$METHODINFO OFF}

implementation


{ TSMOrderPI }


function TSMMedPriceJR.save(par: string): String;
Var
  LcObj: TobjMedPriceListJr;
begin
  try
    Try
      Order := TControllerMedPriceListJR.Create(nil);
      LcObj := TobjMedPriceListJr.Create;
      LcObj := TJson.JsonToObject<TobjMedPriceListJr>(par);
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

