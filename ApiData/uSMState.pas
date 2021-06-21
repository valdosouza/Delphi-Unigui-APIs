unit uSMState;

interface

uses System.SysUtils, System.Classes, System.Json,
    DataSnap.DSProviderDataModuleAdapter,ControllerState,
    Datasnap.DSServer, Datasnap.DSAuth,REST.json, tblentity, uSM;

type
  {$METHODINFO ON}
  TSMState = class(TSM)
  private
    { Private declarations }
    Estado : TControllerState;
  public
    function getList(par:String)  : String;
    function getSyncronize(par:String) : String;
  end;
   {$METHODINFO OFF}
implementation


function TSMState.getList(par:String) : String;
begin
  try
    Try
      Estado := TControllerState.Create(nil);
      Estado.setParametro(par);
      Estado.getList;
      Result := setReturn( TJson.ObjectToJsonString(Estado.Lista) );
    except
      on E : Exception do
        Geralog('ApiData - ', E.Message);
    End;
  finally
    estado.DisposeOf;
  end;
end;



function TSMState.getSyncronize(par: String): String;
begin
  try
    Try
      Estado := TControllerState.Create(nil);
      Estado.setparametro(par);
      Estado.getList;
      Result := setReturn( TJson.ObjectToJsonString(Estado.Lista) );
    except
      on E : Exception do
        Geralog('ApiData - ', E.Message);
    End;
  finally
    estado.DisposeOf;
  end;
end;

end.

