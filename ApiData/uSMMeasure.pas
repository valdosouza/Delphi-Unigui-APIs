unit uSMMeasure;
interface

uses System.SysUtils, System.Classes, System.Json,
    DataSnap.DSProviderDataModuleAdapter,objMeasure,
    Datasnap.DSServer, Datasnap.DSAuth,REST.json,
  TypesCollection, ControllerMeasure, tblMeasure, uSM;

type
  {$METHODINFO ON}
  TSMMeasure = class(TSM)
  private

  public
    function save(par: string): String;
    function getSyncronize(par:String) : String;
  end;
   {$METHODINFO OFF}

implementation

function TSMMeasure.getSyncronize(par:String) : String;
Var
  Medida : TControllerMeasure;
begin
  try
    Try
      Medida := TControllerMeasure.Create(nil);
      Medida.setparametro(par);
      Medida.getList;
      Result := setReturn( TJson.ObjectToJsonString(Medida.Lista) );
    except
      on E : Exception do
        Geralog('ApiData - ', E.Message);
    End;
  finally
    Medida.DisposeOf
  end;
end;

function TSMMeasure.save(par: string): String;
Var
  Medida : TControllerMeasure;
  LcObj : TObjMeasure;
begin
  try
    Try
      Medida := TControllerMeasure.Create(nil);
      LcObj := TJson.JsonToObject<TObjMeasure>(par);
      Medida.clonarObj(LcObj.Medida, Medida.Registro);
      //Colocar zero para que a gravação aconteça pela descrição
      Medida.Registro.Codigo := 0;
      Medida.Institution.Estabelecimento := LcObj.Estabelecimento;
      Medida.Institution.Ativo := 'S';
      Medida.save;
      Retorno.Mensagem := 'SAVED';
      Retorno.ID       := 200;
      Retorno.Code     := Medida.Registro.Codigo;
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
    Medida.DisposeOf;
  end;
end;

end.
