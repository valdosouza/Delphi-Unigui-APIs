unit uSMPackage;

interface

uses System.SysUtils, System.Classes, System.Json,
    DataSnap.DSProviderDataModuleAdapter,objPackage,REST.json,
    Datasnap.DSServer, Datasnap.DSAuth,
  TypesCollection, ControllerPackage, tblPackage, uSM;

type
  {$METHODINFO ON}
  TSMPackage = class(TSM)
  private

  public
    function save(par: string): String;
    function getSyncronize(par:String) : String;
  end;
   {$METHODINFO OFF}

implementation

function TSMPackage.getSyncronize(par:String) : String;
Var
  Embalagem : TControllerPackage;
begin
  try
    Try
      Embalagem := TControllerPackage.Create(nil);
      Embalagem.setParametro(par);
      Embalagem.getList;
      Result := setReturn( TJson.ObjectToJsonString(Embalagem.Lista) );
    except
      on E : Exception do
        Geralog('ApiData - ', E.Message);
    End;
  finally
    Embalagem.DisposeOf;
  end;
end;

function TSMPackage.save(par: string): String;
Var
  Embalagem : TControllerPackage;
  LcObj : TObjPackage;
begin
  try
    Try
      Embalagem := TControllerPackage.Create(nil);
      LcObj     := TJson.JsonToObject<TObjPackage>(par);
      Embalagem.ClonarObj(LcObj.Embalagem, Embalagem.Registro);
      //Colocar zero para que a gravação aconteça pela descrição
      Embalagem.Institution.Estabelecimento := LcObj.Estabelecimento;
      Embalagem.Institution.CodigoEmbalagem := 0;
      Embalagem.Institution.Ativo := 'S';
      Embalagem.save;
      Retorno.Mensagem := 'SAVED';
      Retorno.ID       := 200;
      Retorno.Code     := Embalagem.Registro.Codigo;
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
    Embalagem.DisposeOf;
  end;

end;

end.
