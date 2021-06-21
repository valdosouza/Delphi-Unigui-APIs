unit uSMProvider;

interface

uses System.SysUtils, System.Classes, System.Json,System.Generics.Collections,
  System.Contnrs, DataSnap.DSProviderDataModuleAdapter,
    Datasnap.DSServer, Datasnap.DSAuth,REST.json, tblentity,
  ControllerEntity, ControllerEntityHasMailing, TypesCollection,
  ControllerCompany, ControllerPerson, ControllerMailing,prm_provider,
  ControllerMailingGroup, ControllerAddress, ControllerPhone,
  ControllerEntityFiscal, ControllerProvider, tblAddress, objProvider,
  ControllerInstitution, tblprovider, tblPhone, uSM,Rtti, ControllerEntitySeq,
  ControllerMailingSeq;

type
  {$METHODINFO ON}

  TSMProvider = class(TSM)
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


function TSMProvider.getByKey(par:String): String;
Var
  provider : TControllerProvider;
begin
  try
    provider := TControllerprovider.create(nil);
    provider.setParametro(par);
    provider.Registro.Estabelecimento := Provider.Parametro.Fornecedor.estabelecimento;
    provider.Registro.Codigo          := Provider.Parametro.Fornecedor.Codigo;
    provider.getByKey;
    provider.fillDataObjeto(Provider.Registro,provider.OBj);
    Result := setReturn( TJson.ObjectToJsonString(provider.OBj) );
  finally
    provider.DisposeOf;
  end;
end;

function TSMProvider.getEntity(par: String): String;
Var
  I : Integer;
  LcObjLista : TListEntity;
  LcETD : TEntity;
  provider : TControllerProvider;
begin
  try
    Try
      Provider := TControllerProvider.Create(nil);
      Provider.setParametro(par);
      Provider.getList;
      LcObjLista := TListEntity.Create;
      LcObjLista.Clear;
      for I := 0 to 2 DO //(provider.Lista.Count - 1)do
      Begin
        LcETD := TEntity.Create;

        provider.Fiscal.clear;
        provider.Fiscal.Registro.Codigo := provider.Lista[I].Codigo;
        provider.Fiscal.getByKey;
        //não passar por referencia pois dá erro de invalid point operation
        LcETD.Codigo              := provider.Fiscal.Registro.Codigo;
        LcETD.NomeRazao           := provider.Fiscal.Registro.NomeRazao;
        LcETD.ApelidoFantasia     := provider.Fiscal.Registro.ApelidoFantasia;
        LcETD.AniversarioFundacao := provider.Fiscal.Registro.AniversarioFundacao;
        LcETD.RamoAtividade       := provider.Fiscal.Registro.RamoAtividade;
        LcETD.Observacao          := provider.Fiscal.Registro.Observacao;
        LcETD.RegistroCriado      := provider.Fiscal.Registro.RegistroCriado;
        LcETD.RegistroAlterado    := provider.Fiscal.Registro.RegistroAlterado;

        LcObjLista.Add( LcETD );
      End;

    except
      on E : Exception do
        Geralog('ApiData - ', E.Message);
    End;
  finally
    Result := setReturn( TJson.ObjectToJsonString( LcObjLista) );
    provider.DisposeOf;
    LcObjLista.DisposeOf;
  end;


end;

procedure TSMProvider.getSequenciaEntity;
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

procedure TSMProvider.getSequenciaMailing;
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

function TSMProvider.getSyncronize(par:String) : String;
Var
  provider : TControllerProvider;
begin
  try
    Try
      provider := TControllerProvider.Create(nil);
      provider.setParametro(par);
      provider.getList;
      provider.getListObjProvider;
    except
      on E : Exception do
        Geralog('ApiData - ', E.Message);
    End;
  finally
    Result := setReturn( TJson.ObjectToJsonString( provider.ListaObj) );
    provider.DisposeOf;
  end;
end;

function TSMProvider.getList(par:String) : String;
Var
  provider : TControllerProvider;
begin
  try
    provider := TControllerProvider.Create(nil);
    Try
      provider.setParametro(par);
      provider.getList;

    except
      on E : Exception do
        Geralog('ApiData - ', E.Message);
    End;
  finally
    Result := setReturn( TJson.ObjectToJsonString( provider.Lista) );
    provider.DisposeOf;
  end;
end;

function TSMProvider.getListSpl(Par:String): String;
var
  provider : TControllerProvider;
begin
  try
    provider := TControllerProvider.Create(nil);
    provider.setParametro(par);
    provider.getListSpl;
    Result := setReturn( TJson.ObjectToJsonString(provider.ListSpl) );
  finally
    provider.DisposeOf;
  end;
end;

function TSMProvider.save(par: string): String;
Var
  provider : TControllerprovider;
begin
  try
    Try
      Institution := TControllerInstitution.Create(nil);
      provider := TControllerprovider.Create(nil);
      provider.Obj := TJson.JsonToObject<TObjprovider>(par);
      provider.saveDataObjeto( provider.Obj );
      //Vincula a entidade ao institution
      Institution.InstitutionHasEntity.Registro.Estabelecimento := provider.Obj.Estabelecimento;
      Institution.InstitutionHasEntity.Registro.Entidade := provider.Registro.Codigo;
      Institution.InstitutionHasEntity.save;
      Retorno.Mensagem := 'SAVED';
      Retorno.ID       := 200;
      Retorno.Code     := provider.Obj.Estabelecimento;
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
    provider.DisposeOf;
    Institution.DisposeOf;
  end;
end;

end.

