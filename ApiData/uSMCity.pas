unit uSMCity;

interface

uses System.SysUtils, System.Classes, System.Json,
    DataSnap.DSProviderDataModuleAdapter,ControllerCity,
    Datasnap.DSServer, Datasnap.DSAuth,REST.json, tblcity, uSM;

type
  {$METHODINFO ON}
  TSMCity = class(TSM)
  private
    { Private declarations }
    Cidade : TControllerCity;
  public
    function getList : String;
    function getSyncronize(par:String) : String;
  end;
   {$METHODINFO OFF}
implementation


function TSMCity.getList: String;
begin
  try
    Try
      Cidade := TControllerCity.Create(nil);
      Cidade.getList;
    except
      on E : Exception do
        Geralog('ApiData - ', E.Message);
    End;
  finally
    Result := setReturn( TJson.ObjectToJsonString(Cidade.Lista) );
    Cidade.DisposeOf;
  end;
end;

function TSMCity.getSyncronize(par: String): String;
begin
  try
    Try
      Cidade := TControllerCity.Create(nil);
      Cidade.setParametro(par);
      Cidade.getList;
    except
      on E : Exception do
        Geralog('ApiData - ', E.Message);
    End;
  finally
    Result := setReturn( TJson.ObjectToJsonString(Cidade.Lista) );
    Cidade.DisposeOf;
  end;
end;

end.

