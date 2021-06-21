unit uSMPriceList;


interface

uses System.SysUtils, System.Classes, System.Json,
    DataSnap.DSProviderDataModuleAdapter,
    Datasnap.DSServer, Datasnap.DSAuth,REST.json,
    ControllerPriceList, TypesCollection, tblPriceList, uSM;

type
  {$METHODINFO ON}
  TSMPriceList = class(TSM)
  private

  public
    function save(par: string): String;
    function getSyncronize( par:String) : String;
  end;
   {$METHODINFO OFF}

implementation

{ TSMPriceList }


function TSMPriceList.getSyncronize(par: String): String;
Var
  Tabela : TControllerPriceList;
begin
  try
    try
      Tabela := TControllerPriceList.Create(nil);
      Tabela.setParametro(par);
      Tabela.getList;
      Result := setReturn( TJson.ObjectToJsonString(Tabela.Lista) );
    except
      on E : Exception do
        Geralog('ApiData - TSMPriceList - ', E.Message);
    End;
  finally
    Tabela.DisposeOf;
  end;
end;

function TSMPriceList.save(par: string): String;
Var
  Tabela : TControllerPriceList;
begin
  try
    Try
      Tabela := TControllerPriceList.Create(nil);
      Tabela.Registro :=  TJson.JsonToObject<TPriceList>(par);
      Tabela.save;
      Retorno.Mensagem := 'SAVED';
      Retorno.ID       := 200;
      Retorno.Code     := Tabela.Registro.Codigo;
    except
      on E:Exception do
      Begin
        Retorno.Mensagem := E.Message;
        Retorno.ID       := 500;
        Retorno.Code     := 0;
      End;
    End;
  finally
    Result := TJson.ObjectToJsonString(Retorno);
    Tabela.DisposeOf;
  end;
end;

end.
