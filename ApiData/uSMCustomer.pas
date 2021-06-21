unit uSMCustomer;

interface

uses System.SysUtils, System.Classes, System.Json,System.Generics.Collections,
  System.Contnrs, DataSnap.DSProviderDataModuleAdapter,
    Datasnap.DSServer, Datasnap.DSAuth,REST.json, tblentity,
  ControllerEntity, ControllerEntityHasMailing, TypesCollection,
  ControllerCompany, ControllerPerson, ControllerMailing,prm_customer,
  ControllerMailingGroup, ControllerAddress, ControllerPhone,
  ControllerEntityFiscal, ControllerCustomer, tblAddress, objCustomer,
  ControllerInstitution, tblCustomer, tblPhone, uSM,Rtti, ControllerEntitySeq,
  ControllerMailingSeq;

type
  {$METHODINFO ON}

  TSMCustomer = class(TSM)
  private
    Institution : TControllerInstitution;

  public
    function save(par: string): String;
    function getByKey(par: string) : String;
    function getListSpl(Par:String) : String;
    function getList(par:String) : String;
    function getSyncronize(par:String) : String;
    function getEntity(par:String) : String;
    procedure getSequenciaEntity;
    procedure getSequenciaMailing;
  end;
   {$METHODINFO OFF}
implementation


function TSMCustomer.getByKey(par:String): String;
Var
  customer : TControllerCustomer;
begin
  try
    Customer := TControllerCustomer.create(nil);
    Customer.setParametro(par);
    Customer.Registro.Estabelecimento := Customer.Parametro.Cliente.estabelecimento;
    Customer.Registro.Codigo          := Customer.Parametro.Cliente.Codigo;
    Customer.getByKey;
    Customer.fillDataObjeto(Customer.Registro,Customer.OBj);
    Result := setReturn( TJson.ObjectToJsonString(Customer.OBj) );
  finally
    Customer.DisposeOf;
  end;
end;

function TSMCustomer.getEntity(par: String): String;
Var
  I : Integer;
  LcObjLista : TListEntity;
  LcETD : TEntity;
  customer : TControllerCustomer;
begin
  try
    Try
      Customer := TControllerCustomer.Create(nil);
      Customer.setParametro(par);
      Customer.getList;
      LcObjLista := TListEntity.Create;
      LcObjLista.Clear;
      for I := 0 to 2 DO //(Customer.Lista.Count - 1)do
      Begin
        LcETD := TEntity.Create;

        customer.Fiscal.clear;
        customer.Fiscal.Registro.Codigo := Customer.Lista[I].Codigo;
        customer.Fiscal.getByKey;
        //não passar por referencia pois dá erro de invalid point operation
        LcETD.Codigo              := customer.Fiscal.Registro.Codigo;
        LcETD.NomeRazao           := customer.Fiscal.Registro.NomeRazao;
        LcETD.ApelidoFantasia     := customer.Fiscal.Registro.ApelidoFantasia;
        LcETD.AniversarioFundacao := customer.Fiscal.Registro.AniversarioFundacao;
        LcETD.RamoAtividade       := customer.Fiscal.Registro.RamoAtividade;
        LcETD.Observacao          := customer.Fiscal.Registro.Observacao;
        LcETD.RegistroCriado      := customer.Fiscal.Registro.RegistroCriado;
        LcETD.RegistroAlterado    := customer.Fiscal.Registro.RegistroAlterado;

        LcObjLista.Add( LcETD );
      End;

    except
      on E : Exception do
        Geralog('ApiData - ', E.Message);
    End;
  finally
    Result := setReturn( TJson.ObjectToJsonString( LcObjLista) );
    Customer.DisposeOf;
    LcObjLista.DisposeOf;
  end;


end;

procedure TSMCustomer.getSequenciaEntity;
Var
  LcSeq : TControllerEntitySeq;
begin
  Try
    LcSeq := TControllerEntitySeq.Create(Self);
    LcSeq.setSequencia;
  Finally
    LcSeq.DisposeOf;
  End;
end;

procedure TSMCustomer.getSequenciaMailing;
Var
  LcSeq : TControllerMailingSeq;
begin
  Try
    LcSeq := TControllerMailingSeq.Create(Self);
    LcSeq.setSequencia;
  Finally
    LcSeq.DisposeOf;
  End;


end;

function TSMCustomer.getSyncronize(par:String) : String;
Var
  customer : TControllerCustomer;
begin
  try
    Try
      Customer := TControllerCustomer.Create(nil);
      Customer.setParametro(par);
      Customer.getList;
      Customer.getListObjCustomer;
    except
      on E : Exception do
        Geralog('ApiData - ', E.Message);
    End;
  finally
    Result := setReturn( TJson.ObjectToJsonString( customer.ListaObj) );
    Customer.DisposeOf;
  end;
end;

function TSMCustomer.getList(par:String) : String;
Var
  customer : TControllerCustomer;
begin
  try
    Customer := TControllerCustomer.Create(nil);
    Try
      Customer.setParametro(par);
      Customer.getList;

    except
      on E : Exception do
        Geralog('ApiData - ', E.Message);
    End;
  finally
    Result := setReturn( TJson.ObjectToJsonString( customer.Lista) );
    Customer.DisposeOf;
  end;
end;

function TSMCustomer.getListSpl(Par:String): String;
var
  customer : TControllerCustomer;
begin
  try
    Customer := TControllerCustomer.Create(nil);
    Customer.setParametro(par);
    Customer.getListSpl;
    Result := setReturn( TJson.ObjectToJsonString(Customer.ListSpl) );
  finally
    Customer.DisposeOf;
  end;
end;

function TSMCustomer.save(par: string): String;
Var
  customer : TControllerCustomer;
begin
  try
    Try
      Institution := TControllerInstitution.Create(nil);
      customer := TControllerCustomer.Create(nil);
      customer.Obj := TJson.JsonToObject<TObjCustomer>(par);
      customer.saveDataObjeto( customer.Obj );
      //Vincula a entidade ao institution
      Institution.InstitutionHasEntity.Registro.Estabelecimento := customer.Obj.Estabelecimento;
      Institution.InstitutionHasEntity.Registro.Entidade := customer.Registro.Codigo;
      Institution.InstitutionHasEntity.save;
      Retorno.Mensagem := 'SAVED';
      Retorno.ID       := 200;
      Retorno.Code     := customer.Obj.Estabelecimento;
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
    Customer.DisposeOf;
    Institution.DisposeOf;
  end;
end;

end.

