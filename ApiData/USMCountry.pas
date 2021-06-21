unit uSMCountry;

interface

uses System.SysUtils, System.Classes, System.Json,
    DataSnap.DSProviderDataModuleAdapter,ControllerCountry,
    Datasnap.DSServer, Datasnap.DSAuth,REST.json, tblentity, uSM;

type
  {$METHODINFO ON}
  TSMCountry = class(TSM)
  private
    { Private declarations }
    pais : TControllerCountry;
  public
    function getList(par:String)  : String;
    function getSyncronize(par:String) : String;
  end;
   {$METHODINFO OFF}
implementation


function TSMCountry.getList(par:String) : String;
begin
  try
    try
      pais := TControllerCountry.Create(nil);
      pais.getList;
      except
        on E : Exception do
          Geralog('ApiData - ', E.Message);
      End;
  finally
    Result := setReturn( TJson.ObjectToJsonString(pais.Lista) );
    pais.DisposeOf;
  end;
end;

function TSMCountry.getSyncronize(par: String): String;
begin
  try
    try
      pais := TControllerCountry.Create(nil);
      pais.setParametro(par);
      pais.getList;
    except
      on E : Exception do
        Geralog('ApiData - ', E.Message);
    End;
  finally
    Result := setReturn( TJson.ObjectToJsonString(pais.Lista) );
    pais.DisposeOf;
  end;
end;

end.

