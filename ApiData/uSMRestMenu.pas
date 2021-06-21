unit uSMRestMenu;

interface

uses System.SysUtils, System.Classes, System.Json, System.Generics.Collections,
    DataSnap.DSProviderDataModuleAdapter,ControllerRestMenu,
    Datasnap.DSServer, Datasnap.DSAuth,REST.json,zLib,ObjRestMenu,
    System.Contnrs, TypesCollection, uSM,ACBrBase, ACBrValidador,
  UnFunctions;

type
  {$METHODINFO ON}

  TSMRestMenu = class(TSM)
  private
    Erro : String;
  public
    function save(par: string): String;

  end;
   {$METHODINFO OFF}

implementation

{ TSMRestMenu }

function TSMRestMenu.save(par: string): String;
var
  RestMenu : TControllerRestMenu;
begin

  try
    Try
      RestMenu := TControllerRestMenu.create(nil);
      RestMenu.Obj  := TJson.JsonToObject<TObjRestMenu>(par);
      RestMenu.saveDataObjeto( RestMenu.Obj );
      Retorno.Mensagem := 'SAVED';
      Retorno.ID       := 201;
      Retorno.Code     := RestMenu.Registro.Codigo;
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
