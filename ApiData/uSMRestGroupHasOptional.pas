unit uSMRestGroupHasOptional;

interface

uses System.SysUtils, System.Classes, System.Json, System.Generics.Collections,
    DataSnap.DSProviderDataModuleAdapter, ControllerRestGroupHasOptional,
    Datasnap.DSServer, Datasnap.DSAuth,REST.json,zLib, tblRestGroupHasOptional,
    System.Contnrs, TypesCollection, uSM,ACBrBase, ACBrValidador,
  UnFunctions, ObjRestGroupHasOptional;

type
  {$METHODINFO ON}

  TSMRestGroupHasOptional = class(TSM)
  private
    Erro : String;
  public
    function save(par: string): String;

  end;
   {$METHODINFO OFF}

implementation

{ TSMRestGroupHasOptional }

function TSMRestGroupHasOptional.save(par: string): String;
var
  RestGroup : TControllerRestGroupHasOptional;
  LcObj : TObjRestGroupHasOptional;
begin
  try
    Try
      RestGRoup := TControllerRestGroupHasOptional.create(nil);
      LcObj := TJson.JsonToObject<TObjRestGroupHasOptional>(par);
      RestGRoup.SaveObject(LcObj);
      Retorno.Mensagem := 'SAVED';
      Retorno.ID       := 200;
      Retorno.Code     := RestGRoup.Registro.Estabelecimento;
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
