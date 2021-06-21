unit ctrl_mob_entity_fiscal;

interface

uses System.Classes,ctrl_mob_base, System.SysUtils,tblAddress,tblPhone,
    ctrl_mob_entity,ctrl_mob_person,ctrl_mob_company,objEntityFiscal;

Type
  TCtrlMobEntityFiscal = class(TCtrlMobEntity)
    private

    public

      MFisica : TCtrlMobPerson;
      MJuridica : TCtrlMobCompany;
      kindPerson : String;
      function save:Boolean;
      function saveDataObjeto( DObj: TObjEntityFiscal ): Boolean;
      function getByKey:Boolean;
      function getAllByKey:boolean;
      procedure clonarObj(Source,Destiny:TObjEntityFiscal);
      constructor Create(AOwner: TComponent); override;
      destructor Destroy; override;
      procedure Clear;
  end;

implementation

uses MainModule;


procedure TCtrlMobEntityFiscal.Clear;
begin
  clearObj(Registro);
  MFisica.Clear;
  MJuridica.Clear;
end;

procedure TCtrlMobEntityFiscal.clonarObj(Source, Destiny: TObjEntityFiscal);
Var
  I : Integer;
  Lc_Aux:Integer;
  LcEndereco : TAddress;
  LcFone : TPhone;
begin
  _assign(Source.Fisica,    Destiny.Fisica );
  _assign(Source.Juridica,  Destiny.Juridica);
  _assign(Source.Entidade,  Destiny.Entidade);

  //Endereço
  for I := 0 to Source.Entidade.ListaEndereco.Count -1 do
  Begin
    LcEndereco := TAddress.Create;
    _assign( Source.Entidade.ListaEndereco[I], LcEndereco);
    Destiny.Entidade.ListaEndereco.Add(LcEndereco);
  End;
  //Telefone
  for I := 0 to Source.Entidade.ListaFones.Count -1 do
  Begin
    LcFone := TPhone.Create;
    _assign( Source.Entidade.ListaFones[I], LcFone);
    Destiny.Entidade.ListaFones.Add(LcFone);
  End;
  _assign(Source.Entidade.Email, Destiny.Entidade.Email);

end;

constructor TCtrlMobEntityFiscal.Create(AOwner: TComponent);
begin
  inherited;
  MFisica    := TCtrlMobPerson.Create(Self);
  MJuridica  := TCtrlMobCompany.Create(Self);
end;


destructor TCtrlMobEntityFiscal.Destroy;
begin
  {$IFDEF WIN32}
  MFisica.Destroy;
  MJuridica.Destroy;
  inherited;
  {$ENDIF }
end;

function TCtrlMobEntityFiscal.getAllByKey: boolean;
begin
  inherited;
  MJuridica.Registro.Codigo := Registro.Codigo;
  MJuridica.getByKey;
  if MJuridica.exist then
    kindPerson := 'J'
  else
  Begin
    kindPerson := 'F';
    MFisica.Registro.Codigo := Registro.Codigo;
    MFisica.getByKey;
  End;
end;

function TCtrlMobEntityFiscal.getByKey: Boolean;
begin
  try
    inherited;
    MJuridica.Registro.Codigo := Registro.Codigo;
    MJuridica.getByKey;
    if MJuridica.exist then
      kindPerson := 'J';

    MFisica.Registro.Codigo := Registro.Codigo;
    MFisica.getByKey;
    if MFisica.exist then
      kindPerson := 'F';
    except
      on E : Exception do
        geralog('CtrlMobEntityFiscal - getByKey - ',E.Message);
    end;
end;


function TCtrlMobEntityFiscal.save: Boolean;
begin
  try
    SaveObj(Registro);
    Result := true;
  except
    Result := False;
  end;
end;

function TCtrlMobEntityFiscal.saveDataObjeto(DObj: TObjEntityFiscal): Boolean;
Var
  I : Integer;
begin
  {
  //Garantir que a entity tenha zero, para pesquisar por doc fiscal
  Self.MFisica.Registro.Codigo := 0;
  Self.MJuridica.Registro.Codigo := 0;
  o Cadastro do cliente terá que ser online....
  //Verifica se a busca será feita por CPF ou CNPJ
  }
  _assign( DObj.Entidade.Entidade,Self.Registro);
  self.save;

  if ( Length(DObj.Fisica.CPF) = 11 ) then
  Begin
    //Fisica
    _assign( DObj.Fisica, Self.mFisica.Registro );
    Self.mFisica.Registro.Codigo := Self.Registro.Codigo;
    Self.mFisica.save;
  End;

  if ( Length(DObj.Juridica.CNPJ) = 14 ) then
  BEgin
    //Juridica
    _assign( DObj.Juridica, Self.mJuridica.Registro );
    Self.mJuridica.Registro.Codigo := Self.Registro.Codigo;
    Self.mJuridica.save;
  End;
  //Vincula a entidade ao estabelecimento
  //MInstitutionHasEntity.Registro.Estabelecimento := DObj.Estabelecimento;
  //MInstitutionHasEntity.Registro.Entidade        := Self.Registro.Codigo;
  //MInstitutionHasEntity.save;

  //Endereço
  for I := 0 to DObj.Entidade.ListaEndereco.Count -1 do
  Begin
    if Assigned(DObj.Entidade.ListaEndereco[I]) then
    Begin
      _assign( DObj.Entidade.ListaEndereco[I], Self.MEndereco.Registro );
      Self.MEndereco.Registro.Codigo := Self.Registro.Codigo;
      Self.MEndereco.save;
    End;
  End;
  //Telefone
  for I := 0 to DObj.Entidade.ListaFones.Count -1 do
  Begin
    if Assigned(DObj.Entidade.ListaFones[I]) then
    Begin
      _assign( DObj.Entidade.ListaFones[I], Self.MTelefone.Registro);
      Self.MTelefone.Registro.Codigo := Self.Registro.Codigo;
      Self.MTelefone.save;
    End;
  End;
  //Email
  //Não deleta o email do mailing, apenas delete o vinculo deste email à Entidade
  self.MEmail.deleteHasEntity(Self.Registro.Codigo, 1 );

  if DObj.Entidade.Email.Email <> '' then
  Begin
    self.MEmail.Registro.Codigo := Self.Registro.Codigo;
    self.MEmail.Registro.Email  := DObj.Entidade.Email.Email;
    self.MEmail.save;
    //Entidade Has Mailin
//    self.MEmail.EntityHas.Registro.Entidade := Self.Registro.Codigo;
//    self.MEmail.EntityHas.Registro.Mailing  := self.MEmail.Registro.Codigo;
//    self.MEmail.EntityHas.Registro.Grupo    := 1;//Principal
//    self.MEmail.EntityHas.Save;
  End;
  //Repassa o codigo
  DObj.Entidade.Entidade.Codigo := Registro.Codigo;
end;

end.
