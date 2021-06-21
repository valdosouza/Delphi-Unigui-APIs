unit uSMRestMenuHasIngredient;

interface

uses System.SysUtils, System.Classes, System.Json, System.Generics.Collections,
    DataSnap.DSProviderDataModuleAdapter, ControllerRestMenuHasIngredient,
    Datasnap.DSServer, Datasnap.DSAuth,REST.json,zLib, tblRestMenuHasIngredient,
    System.Contnrs, TypesCollection, uSM,ACBrBase, ACBrValidador,
  UnFunctions, ObjRestMenuHasIngredient;

type
  {$METHODINFO ON}

  TSMRestMenuHasIngredient = class(TSM)
  private
    Erro : String;
  public
    function save(par: string): String;

  end;
   {$METHODINFO OFF}

implementation

{ TSMRestMenuHasIngredient }

function TSMRestMenuHasIngredient.save(par: string): String;
var
  RestMenu : TControllerRestMenuHasIngredient;
  Obj : TObjRestMenuHasIngredient;
begin
  try
    Try
      RestMenu := TControllerRestMenuHasIngredient.create(nil);
      Obj := TJson.JsonToObject<TObjRestMenuHasIngredient>(par);
      RestMenu.SaveObject(Obj);
      Retorno.Mensagem := 'SAVED';
      Retorno.ID       := 200;
      Retorno.Code     := RestMenu.Registro.Estabelecimento;
    except
      on E : Exception do
      Begin
        Retorno.Mensagem := E.Message;
        Retorno.ID       := 500;
        Retorno.Code     := 0;
      End;
    End;
  finally
    Result := TJson.ObjectToJsonString( Retorno );
    RestMenu.DisposeOf;
  end;


end;

end.

