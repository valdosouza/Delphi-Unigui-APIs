unit uSMFinancialPlans;

interface

uses System.SysUtils, System.Classes, System.Json,
    DataSnap.DSProviderDataModuleAdapter,
    Datasnap.DSServer, Datasnap.DSAuth,REST.json,
  TypesCollection, ControllerFinancialPLans, objFinancialPlans, uSM;

type
  {$METHODINFO ON}
  TSMFinancialPLans = class(TSM)
  private
    FinPLans : TControllerFinancialPLans;
  public
    function save(par: string): String;
    function getSyncronize(par:String) : String;
  end;
   {$METHODINFO OFF}

implementation

function TSMFinancialPLans.getSyncronize(par:String) : String;
begin


end;

function TSMFinancialPLans.save(par: string): String;
Var
  LcObj: TObjFinancialPLans;
begin
  try
    Try
      FinPLans := TControllerFinancialPlans.Create(nil);
      LcObj := TObjFinancialPlans.Create;
      LcObj := TJson.JsonToObject<TObjFinancialPlans>(par);
      FinPLans.saveDataObjeto(LcObj);
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
    FinPLans.DisposeOf;
  end;
end;

end.
