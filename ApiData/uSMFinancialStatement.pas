unit uSMFinancialStatement;

interface

uses System.SysUtils, System.Classes, System.Json,synacode,
    DataSnap.DSProviderDataModuleAdapter,
    Datasnap.DSServer, Datasnap.DSAuth,REST.json,
  TypesCollection, ControllerBankAccount, objFinancialStatement,
  ControllerFinancialStatement, uSM, UnFunctions;

type
  {$METHODINFO ON}
  TSMFinancialStatement = class(TSM)
  private
    MovimFinanceiro : TControllerFinancialStatement;
  public
    function save(par: string): String;
    function getSyncronize(par:String) : String;
  end;
   {$METHODINFO OFF}

implementation

function TSMFinancialStatement.getSyncronize(par:String) : String;
begin
end;

function TSMFinancialStatement.save(par: string): String;
Var
  LcObj: TObjFinancialStatement;
begin
  try
    Try
      MovimFinanceiro := TControllerFinancialStatement.Create(nil);
      LcObj := TObjFinancialStatement.Create;
      LcObj := TJson.JsonToObject<TObjFinancialStatement>( DecodeBase64( par) );
      MovimFinanceiro.saveDataObjeto(LcObj);
      Retorno.Mensagem := 'SAVED';
      Retorno.ID       := 200;
      Retorno.Code     := MovimFinanceiro.Registro.Codigo;
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
    MovimFinanceiro.DisposeOf;
  end;
end;

end.
