unit uSMRestGroup;

interface

uses System.SysUtils, System.Classes, System.Json, System.Generics.Collections,
    DataSnap.DSProviderDataModuleAdapter, ControllerRestGroup, tblRestGroup,
    Datasnap.DSServer, Datasnap.DSAuth,REST.json,zLib, tblRestMenuHasIngredient,
    System.Contnrs, TypesCollection, uSM,ACBrBase, ACBrValidador,
  UnFunctions;

type
  {$METHODINFO ON}

  TSMRestGroup = class(TSM)
  private
    Erro : String;
  public
    function save(par: string): String;

  end;
   {$METHODINFO OFF}

implementation

{ TSMRestGroup }

function TSMRestGroup.save(par: string): String;
var
  RestGRoup : TControllerRestGroup;
begin
  try
    Try
      RestGRoup := TControllerRestGroup.create(nil);
      RestGRoup.ClonarObj(TJson.JsonToObject<TRestGroup>(par),RestGRoup.Registro);
      RestGRoup.save;
      Retorno.Mensagem := 'SAVED';
      Retorno.ID       := 200;
      Retorno.Code     := RestGRoup.Registro.Codigo;
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
    RestGRoup.DisposeOf;
  end;


end;

end.

