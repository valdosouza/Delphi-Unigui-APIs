unit uSMPaymentTypes;

interface

uses System.SysUtils, System.Classes, System.Json,
    DataSnap.DSProviderDataModuleAdapter,objPaymentTypes,
    Datasnap.DSServer, Datasnap.DSAuth,REST.json, tblPaymentTypes,
    ControllerPaymentTypes, TypesCollection,  uSM;

type
  {$METHODINFO ON}
  TSMPaymentTypes = class(TSM)
  private

  public
    function getList( par:String ):String;
    function save( par:String ):String;
    function delete( par:String ):String;
    function getSyncronize(par:String) : String;
  end;
   {$METHODINFO OFF}

implementation


{ TSMPaymentTypes }

function TSMPaymentTypes.save(par : String): String;
Var
  FormaPagamento : TControllerPaymentTypes;
begin
  try
    Try
      FormaPagamento := TControllerPaymentTypes.Create(nil);
      FormaPagamento.Obj :=  TJson.JsonToObject<TObjPaymentTypes>( par );
      FormaPagamento.saveDataObjeto(FormaPagamento.Obj);
      Retorno.Mensagem := 'SAVED';
      Retorno.ID       := 200;
      Retorno.Code     := FormaPagamento.Registro.Codigo;
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
    FormaPagamento.DisposeOf;
  end;
end;

function TSMPaymentTypes.delete(par:String): String;
Var
  FormaPagamento : TControllerPaymentTypes;
begin
  try
    Try
      FormaPagamento := TControllerPaymentTypes.Create(nil);
      FormaPagamento.setParametro(par);
      FormaPagamento.Registro.Codigo := FormaPagamento.Parametro.FormaPagamento.Codigo;
      FormaPagamento.Institution.Estabelecimento := FormaPagamento.Parametro.Estabelecimento;
      FormaPagamento.desactiveRegiter;
      Retorno.Mensagem := 'SAVED';
      Retorno.ID       := 200;
      Retorno.Code     := FormaPagamento.Registro.Codigo;
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
    FormaPagamento.DisposeOf;
  end;
end;

function TSMPaymentTypes.getList( par:String ): String;
var
  FormaPagamento : TControllerPaymentTypes;
begin
  try
    Try
      FormaPagamento := TControllerPaymentTypes.Create(nil);
      FormaPagamento.setParametro(par);
      FormaPagamento.getList;
      Result := setReturn( TJson.ObjectToJsonString(FormaPagamento.Lista) );
    except
      on E : Exception do
        Geralog('ApiData - ', E.Message);
    End;
  finally
    FormaPagamento.DisposeOf;
  end;
end;



function TSMPaymentTypes.getSyncronize(par: String): String;
var
  FormaPagamento : TControllerPaymentTypes;
begin
  try
    Try
      FormaPagamento := TControllerPaymentTypes.Create(nil);
      FormaPagamento.setParametro(par);
      FormaPagamento.getList;
      Result := setReturn( TJson.ObjectToJsonString(FormaPagamento.Lista) );
    except
      on E : Exception do
        Geralog('ApiData - ', E.Message);
    End;
  finally
    FormaPagamento.DisposeOf;
  end;
end;

end.
