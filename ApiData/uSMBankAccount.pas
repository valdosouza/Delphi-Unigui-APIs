unit uSMBankAccount;

interface

uses System.SysUtils, System.Classes, System.Json,
    DataSnap.DSProviderDataModuleAdapter,
    Datasnap.DSServer, Datasnap.DSAuth,REST.json,
  TypesCollection, ControllerBankAccount, objBankAccount, uSM;

type
  {$METHODINFO ON}
  TSMBankAccount = class(TSM)
  private
    Conta : TControllerBankAccount;
  public
    function save(par: string): String;
    function getSyncronize(par:String) : String;
  end;
   {$METHODINFO OFF}

implementation

function TSMBankAccount.getSyncronize(par:String) : String;
begin

end;

function TSMBankAccount.save(par: string): String;
begin
  try
    Try
      Conta := TControllerBankAccount.Create(nil);
      Conta.Obj := TJson.JsonToObject<TObjBankAccount>(par);
      Conta.saveDataObjeto(Conta.Obj);
      Retorno.Mensagem := 'SAVED';
      Retorno.ID       := 200;
      Retorno.Code     := Conta.Registro.Codigo;
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
    Conta.DisposeOf;
  end;
end;

end.
