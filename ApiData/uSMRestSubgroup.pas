unit uSMRestSubgroup;

interface

uses System.SysUtils, System.Classes, System.Json, System.Generics.Collections,
    DataSnap.DSProviderDataModuleAdapter, ControllerRestSubgroup, tblRestSubgroup,
    Datasnap.DSServer, Datasnap.DSAuth,REST.json,zLib, tblRestMenuHasIngredient,
    System.Contnrs, TypesCollection, uSM,ACBrBase, ACBrValidador,
  UnFunctions;

type
  {$METHODINFO ON}

  TSMRestSubgroup = class(TSM)
  private
    Erro : String;
  public
    function save(par: string): String;

  end;
   {$METHODINFO OFF}

implementation

{ TSMRestSubgroup }

function TSMRestSubgroup.save(par: string): String;
var
  RestSubgoup : TControllerRestSubGroup;
begin
  try
    Try
      RestSubgoup := TControllerRestSubGroup.create(nil);
      RestSubgoup.ClonarObj(TJson.JsonToObject<TRestSubGroup>(par),RestSubgoup.Registro);
      RestSubgoup.save;
      Retorno.Mensagem := 'SAVED';
      Retorno.ID       := 200;
      Retorno.Code     := RestSubgoup.Registro.Codigo;
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
    RestSubgoup.DisposeOf;
  end;
end;

end.

