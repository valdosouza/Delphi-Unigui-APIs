unit ControllerSalesman;

interface

uses System.Classes, System.SysUtils, BaseController, rest.json, prm_salesman,
  tblSalesman, FireDAC.Comp.Client, Md5, FireDAC.Stan.Param,
  ControllerCompany, ControllerPerson, ControllerEntityFiscal,
  ControllerCollaborator, objSalesMan,tblPhone, tblAddress, tblMailing,
  tblSocialMedia, tblPerson, tblCompany,System.Generics.Collections,TypesObjectsCollection;

Type
  TControllerSalesman = Class(TBaseController)
  private
    TipoPessoa: String;
  public
    Registro: TSalesman;
    Colaborador: TControllerCollaborator;
    Obj : TObjSalesMan;
    Parametro : TPrmSalesman;
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure setParametro(par:String);
    procedure clear;
    function save: boolean;
    function insert: boolean;
    Function delete: boolean;
    function getByKey: boolean;
    function getAllByKey: boolean;

    procedure fillDataObjeto(pSalesman:TSalesman;pObj:TObjSalesMan);
    function saveDataObjeto(DObj:TObjSalesMan): boolean;
  End;

implementation

{ ControllerSalesman }

procedure TControllerSalesman.clear;
begin
  clearObj(Registro);
end;

constructor TControllerSalesman.Create(AOwner: TComponent);
begin
  inherited;
  Registro := TSalesman.Create;
  Colaborador := TControllerCollaborator.Create(nil);
  Obj := TObjSalesMan.create;
end;

function TControllerSalesman.delete: boolean;
begin
  Try
    deleteObj(Registro);
    Result := True;
  Except
    Result := False;
  End;
end;

destructor TControllerSalesman.Destroy;
begin
  Obj.Destroy;
  Colaborador.DisposeOf;
  Registro.DisposeOf;
  inherited;
end;

procedure TControllerSalesman.fillDataObjeto(pSalesman: TSalesman;
  pObj: TObjSalesMan);
Var
  LcPhone : TPhone;
  LcAddress : TAddress;

begin
  pObj.clear;
  pObj.Estabelecimento := pSalesman.Estabelecimento;

  Self.Colaborador.Fiscal.Registro.Codigo := pSalesman.Codigo;
  Self.Colaborador.Fiscal.getByKey;
  if Self.Colaborador.Fiscal.exist then
  BEgin
    _assign( Self.Colaborador.Fiscal.Registro, pObj.Fiscal.Entidade.Entidade);

    if Trim( Self.Colaborador.Fiscal.Fisica.Registro.CPF ) <> '' then
      _assign( Self.Colaborador.Fiscal.Fisica.Registro, pObj.Fiscal.Fisica )
    else
      _assign( Self.Colaborador.Fiscal.Juridica.Registro, pObj.Fiscal.Juridica);


    Self.Colaborador.Fiscal.Endereco.Registro.Codigo := pSalesman.Codigo;
    Self.Colaborador.Fiscal.Endereco.Registro.Tipo  := 'COMERCIAL';
    Self.Colaborador.Fiscal.Endereco.getbykey;
    if Self.Colaborador.Fiscal.Endereco.exist then
    Begin
      LcAddress := TAddress.Create;
      _assign(Self.Colaborador.Fiscal.Endereco.Registro,LcAddress);
      pObj.Fiscal.Entidade.ListaEndereco.Add(LcAddress);
    End;

    Self.Colaborador.Fiscal.Telefone.Registro.Codigo := pSalesman.Codigo;
    Self.Colaborador.Fiscal.Telefone.Registro.Tipo := 'Fone';
    Self.Colaborador.Fiscal.Telefone.getByKey;
    if Self.Colaborador.Fiscal.Telefone.exist then
    BEgin
      LcPhone := TPhone.Create;
      _assign(Self.Colaborador.Fiscal.Telefone.Registro,LcPhone);
      pObj.Fiscal.Entidade.ListaFones.Add(LcPhone);
    End;

    Self.Colaborador.Fiscal.Telefone.Registro.Codigo := pSalesman.Codigo;
    Self.Colaborador.Fiscal.Telefone.Registro.Tipo := 'Fax';
    Self.Colaborador.Fiscal.Telefone.getByKey;
    if Self.Colaborador.Fiscal.Telefone.exist then
    BEgin
      LcPhone := TPhone.Create;
      _assign(Self.Colaborador.Fiscal.Telefone.Registro,LcPhone);
      pObj.Fiscal.Entidade.ListaFones.Add(LcPhone);
    End;

    Self.Colaborador.Fiscal.Telefone.Registro.Codigo := pSalesman.Codigo;
    Self.Colaborador.Fiscal.Telefone.Registro.Tipo := 'Celular';
    Self.Colaborador.Fiscal.Telefone.getByKey;
    if Self.Colaborador.Fiscal.Telefone.exist then
    BEgin
      LcPhone := TPhone.Create;
      _assign(Self.Colaborador.Fiscal.Telefone.Registro,LcPhone);
      pObj.Fiscal.Entidade.ListaFones.Add(LcPhone);
    End;

    //email
    Self.Colaborador.Fiscal.Email.Registro.Codigo := pSalesman.Codigo;
    Self.Colaborador.Fiscal.Email.getbyKind( Self.Registro.Codigo ,'principal');
    if Self.Colaborador.Fiscal.Email.exist then
      _assign(Self.Colaborador.Fiscal.email.Registro, pObj.Fiscal.Entidade.Email) ;

    //Social Midia
    Self.Colaborador.Fiscal.MidiaSocial.Registro.Codigo :=  pSalesman.Codigo;
    Self.Colaborador.Fiscal.MidiaSocial.Registro.Tipo := 'www';
    Self.Colaborador.Fiscal.MidiaSocial.getByKey;
    if Self.Colaborador.Fiscal.MidiaSocial.exist then
      _assign( Self.Colaborador.Fiscal.MidiaSocial.Registro, pObj.Fiscal.Entidade.MidiaSocial );

    _assign( pSalesman, pObj.vendedor) ;
  End;

end;

function TControllerSalesman.insert: boolean;
begin
  try
    SaveObj(Registro);
    Result := True;
  except
    Result := False;
  end;
end;

function TControllerSalesman.save: boolean;
begin
  try
    SaveObj(Registro);
    Result := True;
  except
    Result := False;
  end;
end;

function TControllerSalesman.saveDataObjeto(DObj:TObjSalesMan): boolean;
begin
  Try
    Colaborador.saveDataObjeto(DObj.Fiscal,DObj.Colaborador);
    _assign(DObj.Vendedor, Self.Registro);
    Self.Registro.codigo := DObj.Fiscal.Entidade.Entidade.Codigo;
    Self.save;
    Result := true;
  except
    Result := False;
  end;

end;


procedure TControllerSalesman.setParametro(par: String);
begin
  try
    Parametro := TPrmSalesMan.Create;
    Parametro:= TJson.JsonToObject<TPrmSalesMan>(par);
  //Tratar Data
    Parametro.UltimaAtualizacao := dataMysql(Parametro.UltimaAtualizacao);
  Except
    Parametro.UltimaAtualizacao := '1900-01-01 01:00:00'
  end;
end;

function TControllerSalesman.getAllByKey: boolean;
begin
  getByKey;
  Self.Colaborador.Fiscal.Registro.codigo := Self.Registro.codigo;
  Self.Colaborador.Fiscal.getAllByKey
end;

function TControllerSalesman.getByKey: boolean;
begin
  Registro.Estabelecimento  := Parametro.Vendedor.Estabelecimento;
  Registro.Codigo           := Parametro.Vendedor.Codigo;
  _getByKey(Registro);
end;

end.
