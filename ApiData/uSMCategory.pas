unit uSMCategory;

interface

uses System.SysUtils, System.Classes, System.Json,
    DataSnap.DSProviderDataModuleAdapter,
    Datasnap.DSServer, Datasnap.DSAuth,REST.json, ControllerCategory,
  TypesCollection, uSM, tblCategory;

type
  {$METHODINFO ON}
  TSMCAtegory = class(TSM)
  private

  public
    function save(par : String):String;
    function delete(par:String):String;
    function getList(par:String) : String;
    function getSyncronize(par:String) : String;
  end;
   {$METHODINFO OFF}

implementation

{ TSMCAtegory }

function TSMCAtegory.delete(par:STring): String;
Var
  Categoria : TControllerCategory;
begin
  try
    Try
      Categoria := TControllerCategory.Create(nil);
      Categoria.setParametro(par);
      Categoria.deleteByLevel;
      Retorno.Mensagem := 'DELETED';
      Retorno.ID       := 200;
      Retorno.Code     := Categoria.Registro.Codigo;
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
    Categoria.DisposeOf;
  end;
end;

function TSMCAtegory.getList(par:STring): String;
Var
  Categoria : TControllerCategory;
begin
  try
    Try
      Categoria := TControllerCategory.Create(nil);
      Categoria.setParametro(par);
      Categoria.getList;
    except
      on E : Exception do
        Geralog('ApiData - ', E.Message);
    End;
  finally
    Result := setReturn( TJson.ObjectToJsonString(Categoria.Lista) );
    Categoria.DisposeOf;
  end;
end;

function TSMCAtegory.getSyncronize(par:String): String;
Var
  Categoria : TControllerCategory;
begin
  try
    Try
      Categoria := TControllerCategory.Create(nil);
      Categoria.setParametro(par);
      Categoria.getList;
    except
      on E : Exception do
        Geralog('ApiData - ', E.Message);
    End;
  finally
    Result := setReturn( TJson.ObjectToJsonString(Categoria.Lista) );
    Categoria.DisposeOf;
  end;
end;

function TSMCAtegory.save(par: String): String;
Var
  Categoria : TControllerCategory;
begin
  try
    Try
      Categoria := TControllerCategory.Create(nil);
      Categoria.Registro :=  TJson.JsonToObject<TCategory>(par);
      Categoria.save;
      Retorno.Mensagem := 'SAVED';
      Retorno.ID       := 200;
      Retorno.Code     := Categoria.Registro.Codigo;
    Except
      on E:Exception do
      Begin
        Retorno.Mensagem := E.Message;
        Retorno.ID       := 500;
        Retorno.Code     := 0;
      End;
    End;
  finally
    Categoria.DisposeOf;
  end;
end;

end.
