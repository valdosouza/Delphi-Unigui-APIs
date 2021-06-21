unit uSMRestGroupHasMeasure;

interface

uses System.SysUtils, System.Classes, System.Json, System.Generics.Collections,
    DataSnap.DSProviderDataModuleAdapter, ControllerRestGroupHasMeasure, tblRestGroup,
    Datasnap.DSServer, Datasnap.DSAuth,REST.json,zLib, tblRestGroupHasMeasure,
    System.Contnrs, TypesCollection, uSM,ACBrBase, ACBrValidador,
  UnFunctions, ObjRestGroupHasMeasure;

type
  {$METHODINFO ON}

  TSMRestGroupHasMeasure = class(TSM)
  private
    Erro : String;
  public
    function save(par: string): String;

  end;
   {$METHODINFO OFF}

implementation

{ TSMRestGroupHasMeasure }

function TSMRestGroupHasMeasure.save(par: string): String;
var
  RestGroup : TControllerRestGroupHasMeasure;
  LcObj : TObjRestGroupHasMeasure;
begin
  try
    Try
      RestGRoup := TControllerRestGroupHasMeasure.create(nil);
      LcObj := TJson.JsonToObject<TObjRestGroupHasMeasure>(par);
      RestGRoup.SaveObject(LcObj);
      RestGRoup.save;
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
