unit uSMFinancial;

interface

uses System.SysUtils, System.Classes, System.Json,
    DataSnap.DSProviderDataModuleAdapter,uSM,
    Datasnap.DSServer, Datasnap.DSAuth,REST.json,
  TypesCollection, ControllerFinancial, objFinancialPlans;

type
  {$METHODINFO ON}
  TSMFinancial = class(TSM)
  private
    Financial : TControllerFinancial;
  public
    function save(par: string): String;
    function getSyncronize(par:String) : String;
  end;
   {$METHODINFO OFF}

implementation

function TSMFinancial.getSyncronize(par:String) : String;
begin

end;

function TSMFinancial.save(par: string): String;
Var
  LcObj: TObjFinancialPLans;
begin
  try
    try
      Financial := TControllerFinancial.Create(nil);
      LcObj := TObjFinancialPlans.Create;
      LcObj := TJson.JsonToObject<TObjFinancialPlans>(par);
      //Financial.saveDataObjeto(LcObj);
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
    Financial.DisposeOf;
  end;
end;

end.
