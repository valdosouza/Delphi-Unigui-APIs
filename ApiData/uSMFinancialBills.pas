unit uSMFinancialBills;

interface

uses System.SysUtils, System.Classes, System.Json,synacode,
    DataSnap.DSProviderDataModuleAdapter,
    Datasnap.DSServer, Datasnap.DSAuth,REST.json,uSM,
  TypesCollection, ControllerFinancialBills, objFinancialBills,
  prm_financial;

type
  {$METHODINFO ON}
  TSMFinancialBills = class(TSM)
  private
    Financial : TControllerFinancialBills;
  public
    function save(par: string): String;
    function getSyncronize(par:String) : String;
    function getByKey(Par: String) : String;
    function getList(par:String) : String;
  end;
   {$METHODINFO OFF}

implementation

uses UnFunctions;

function TSMFinancialBills.getByKey(Par: String): String;
Var
  LcOS : TControllerFinancialBills;
begin
  try
    LcOS  := TControllerFinancialBills.Create(nil);
    LcOS.Parametro := TJson.JsonToObject<TPrmFinancial>(par);
    LcOS.Registro.Estabelecimento   := LcOS.Parametro.Finaceiro.Estabelecimento;
    LcOS.Registro.Ordem             := LcOS.Parametro.Finaceiro.Ordem;
    LcOS.Registro.Terminal          := LcOS.Parametro.Finaceiro.Terminal;
    LcOS.Registro.Parcela           := LcOS.Parametro.Finaceiro.Parcela;
    LcOS.getByKey;
    LcOS.FillDataObjeto(LcOS.Registro,LcOS.Obj);
    Result := setReturn( TJson.ObjectToJsonString(LcOS.Obj) );
  finally
    LcOS.DisposeOf;
  end;
end;

function TSMFinancialBills.getList(par: String): String;
Var
  LcOS : TControllerFinancialBills;
begin
  try
    LcOS := TControllerFinancialBills.Create(nil);
    Try
      LcOS.setparametro(par);
      LcOS.getList;
    except
      on E : Exception do
        Geralog('ApiData - ', E.Message);
    End;
  finally
    Result := setReturn( TJson.ObjectToJsonString( LcOS.Lista) );
    LcOS.DisposeOf;
  end;
end;

function TSMFinancialBills.getSyncronize(par:String) : String;
begin

end;

function TSMFinancialBills.save(par: string): String;
Var
  LcObj: TObjFinancialBills;
begin
  try
    Try
      Financial := TControllerFinancialBills.Create(nil);
      LcObj := TObjFinancialBills.Create;
      LcObj := TJson.JsonToObject<TObjFinancialBills>( DecodeBase64( par) );
      Financial.saveDataObjeto(LcObj);
      Retorno.Mensagem := 'SAVED';
      Retorno.ID       := 200;
      Retorno.Code     := LcObj.Estabelecimento;
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
    LcObj.Destroy;
    Financial.DisposeOf;
  end;
end;

end.
