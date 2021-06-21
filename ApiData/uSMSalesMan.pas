unit uSMSalesMan;

interface

uses System.SysUtils, System.Classes, System.Json,
    DataSnap.DSProviderDataModuleAdapter,
    Datasnap.DSServer, Datasnap.DSAuth,REST.json,
    ControllerSalesman, objSalesMan, uSM;

type
  {$METHODINFO ON}
  TSMSalesMan = class(TSM)
  private

  public
    function save(par: string): String;
    function getbyKey(par: string) : String;
    function getSalesman(par: string) : String;
  end;
   {$METHODINFO OFF}
implementation

function TSMSalesMan.getbyKey(par: string): String;
VAr
  LcOBj : TObjSalesMan;
  SalesMan : TControllerSalesman;
begin
  try
    SalesMan := TControllerSalesman.create(nil);
    SalesMan.setParametro(par);
    try
      SalesMan.getByKey;
      LcOBj := TObjSalesMan.Create;
      if SalesMan.exist then
        SalesMan.fillDataObjeto(SalesMan.Registro,LcOBj)
      else
        LcOBj.Vendedor.Codigo := 0;

      Result := setReturn( TJson.ObjectToJsonString(LcOBj) );
    except
      on E : Exception do
        Geralog('ApiData - ', E.Message);
    End;
  finally
    SalesMan.DisposeOf;
  end;
end;

function TSMSalesMan.getSalesman(par: string) : String;
Var
  SalesMan : TControllerSalesman;
BEgin
  try
    SalesMan := TControllerSalesman.Create(nil);
    SalesMan.setParametro(par);
    SalesMan.getByKey;
    if not SalesMan.exist then
      SalesMan.Registro.Codigo := 0;
    Result := setReturn( TJson.ObjectToJsonString(SalesMan.Registro) );
  finally
    SalesMan.DisposeOf;
  end;
end;

function TSMSalesMan.save(par: string): String;
Var
  I,J : Integer;
  SalesMan : TControllerSalesman;
begin
  try
    Try
      SalesMan := TControllerSalesman.Create(nil);
      SalesMan.Obj := TJson.JsonToObject<TObjSalesMan>(par);
      SalesMan.saveDataObjeto(SalesMan.Obj);
      Retorno.Mensagem := 'SAVED';
      Retorno.ID       := 200;
      Retorno.Code     := SalesMan.Registro.Codigo;
    Except
      on E : Exception do
      Begin
        Retorno.Mensagem := E.Message;
        Retorno.ID       := 500;
        Retorno.Code     := 0;
      End;
    End;
  finally
    Result := TJson.ObjectToJsonString( Retorno );
    SalesMan.DisposeOf;
  end;
end;




end.

