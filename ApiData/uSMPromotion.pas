unit uSMPromotion;

interface

uses System.SysUtils, System.Classes, System.Json,
    DataSnap.DSProviderDataModuleAdapter,
    Datasnap.DSServer, Datasnap.DSAuth,REST.json, tblPaymentTypes,
     TypesCollection,  uSM,ControllerPromotion,ControllerPromotionItems,
     tblpromotion, tblpromotionItems,tblpromotionlOG,objPromotion;

type
  {$METHODINFO ON}
  TSMPromotion = class(TSM)
  private

  public
    function getList( par:String ):String;
    function save(par : String):String;
    function getByKey(par:String ): String;
    function delete( par:String ):String;
    function getSyncronize( par:String ) : String;
  end;
   {$METHODINFO OFF}

implementation


{ TSMPromotion }

function TSMPromotion.save(par: String): String;
Var
  Promocao : TControllerPromotion;
begin
  try
    Try
      Promocao := TControllerPromotion.Create(nil);
      Promocao.Obj :=  TJson.JsonToObject<TObjPromotion>(par);
      Promocao.saveDataObjeto(Promocao.Obj);
      Retorno.Mensagem := 'SAVED';
      Retorno.ID       := 200;
      Retorno.Code     := Promocao.Registro.Codigo;
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
    Promocao.DisposeOf;
  end;
end;

function TSMPromotion.delete(par:String):String;
Var
  Promocao : TControllerPromotion;
begin
  try
    Try
      Promocao := TControllerPromotion.Create(nil);
      Promocao.Registro :=  TJson.JsonToObject<TPromotion>(par);
      Promocao.delete;
      Retorno.Mensagem := 'DELETED';
      Retorno.ID       := 200;
      Retorno.Code     := Promocao.Registro.Codigo;
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
    Promocao.DisposeOf;
  end;
end;

function TSMPromotion.getByKey(par:String): String;
Var
  Promocao : TControllerPromotion;
begin
  try
    Try
      Promocao := TControllerPromotion.Create(nil);
      Promocao.setParametro(par);
      Promocao.getbyKey;
      Promocao.fillDataObjeto(Promocao.Registro);
      Result := setReturn( TJson.ObjectToJsonString(Promocao.obj) );
    except
      on E : Exception do
        Geralog('ApiData - ', E.Message);
    End;
  finally
    Promocao.DisposeOf;
  end;
end;

function TSMPromotion.getList(par:String): String;
Var
  Promocao : TControllerPromotion;
begin
  try
    Try
      Promocao := TControllerPromotion.Create(nil);
      Promocao.setParametro(par);
      Promocao.getList;
      Result := setReturn( TJson.ObjectToJsonString(Promocao.Lista) );
    except
      on E : Exception do
        Geralog('ApiData - ', E.Message);
    End;
  finally
    Promocao.DisposeOf;
  end;
end;



function TSMPromotion.getSyncronize(par: String): String;
Var
  Promocao : TControllerPromotion;
begin
  try
    Try
      Promocao := TControllerPromotion.Create(nil);
      Promocao.setParametro(par);
      Promocao.getList;
      Result := setReturn( TJson.ObjectToJsonString(Promocao.Lista) );
    except
      on E : Exception do
        Geralog('ApiData - ', E.Message);
    End;
  finally
    Promocao.DisposeOf;
  end;

end;

end.
