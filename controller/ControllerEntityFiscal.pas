unit ControllerEntityFiscal;

interface

uses
  ControllerEntity,ControllerCompany,ControllerPerson, System.Classes, System.SysUtils,
  objEntityFiscal, ControllerPhone, ControllerSocialMedia, ControllerMailing,rest.json,
  tblPhone, tblAddress, tblMailing, tblSocialMedia, prm_entity, ControllerNoDocNumber,
  tblEntity,tblperson, tblCompany;


Type

  TControllerEntityFiscal = class(TControllerEntity)

  private
    function saveDataEntity( DObj: TObjEntityFiscal ): Boolean;
    function saveDataFiscal( DObj: TObjEntityFiscal ): Boolean;
    function saveDataNaoFiscal( DObj: TObjEntityFiscal ): Boolean;
    procedure Entidadetreat(ent : Tentity);
    procedure Fisicatreat(fis : TPerson);
    procedure Juridicatreat( jus : TCompany);
  public
    kindPerson : String;
    Fisica : TcontrollerPerson;
    Juridica : TControllerCompany;
    NoDocNumber : TControllerNoDocNumber;
    Obj: TObjEntityFiscal;
    Parametro : TPrmEntity;
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure setParametro(par:String);
    function getByKey:boolean;override;
    function getAllByKey:boolean;override;
    function getCRT: String;
    function saveDataObjeto( DObj: TObjEntityFiscal ): Boolean;Virtual;
    procedure fillDataObjeto(entityID:Integer;pObj:TObjEntityFiscal);
    procedure clonarObj(Source,Destiny:TObjEntityFiscal);
  end;
implementation

{ TControllerEntityFiscal }

uses UnFunctions;

procedure TControllerEntityFiscal.clonarObj(Source, Destiny: TObjEntityFiscal);
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

constructor TControllerEntityFiscal.Create(AOwner: TComponent);
begin
  inherited;
  Fisica := TcontrollerPerson.Create(self);
  Juridica := TControllerCompany.Create(self);
  NoDocNumber := TControllerNoDocNumber.Create(self);
  Obj :=  TObjEntityFiscal.Create;
  Parametro := TPrmEntity.Create;
end;

destructor TControllerEntityFiscal.Destroy;
begin
  Parametro.Destroy;
  Obj.Destroy;
  NoDocNumber.DisposeOf;
  Fisica.DisposeOf;
  Juridica.DisposeOf;
  inherited;
end;

procedure TControllerEntityFiscal.Entidadetreat(ent: Tentity);
begin
  if ent.AniversarioFundacao = 0 then
     ent.AniversarioFundacao := Date;

end;

procedure TControllerEntityFiscal.fillDataObjeto(entityID: Integer;pObj:TObjEntityFiscal);
Var
  LcEndereco :TAddress;
  LcFone : TPhone;
  LcEmail : TMailing;
  LcSocial : TSocialMedia;
begin
  Registro.Codigo := entityID;
  getByKey;
  if exist then
  BEgin
    _assign( Registro, pObj.Entidade.Entidade );


    Fisica.Registro.Codigo := Self.Registro.Codigo;
    Fisica.getByKey;
    if Fisica.exist then
    Begin
      _assign(Fisica.Registro, pObj.Fisica);
    End
    else
    Begin
      Juridica.Registro.Codigo := Self.Registro.Codigo;
      Juridica.getByKey;
      if Juridica.exist then
      Begin
        _assign(Juridica.Registro, pObj.Juridica);
      End;
    End;
    //tratar dados para a conversão no JSON
    Entidadetreat(pObj.Entidade.Entidade);
    Fisicatreat(pObj.Fisica);
    Juridicatreat( pObj.Juridica);


    Endereco.Registro.Codigo := entityID;
    Endereco.Registro.Tipo  := 'COMERCIAL';
    Endereco.getbykey;
    if Endereco.exist then
    Begin
      LcEndereco := TAddress.Create;
      _assign( Endereco.Registro, LcEndereco );
      pObj.Entidade.ListaEndereco.Add(LcEndereco);
    End;

    Telefone.Registro.Codigo := entityID;
    Telefone.Registro.Tipo := 'Fone';
    Telefone.getByKey;
    if Telefone.exist then
    BEgin
      LcFone := TPhone.Create;
      _assign(Telefone.Registro, LcFone);
      pObj.Entidade.ListaFones.Add(LcFone);
    End;

    Telefone.Registro.Codigo := entityID;
    Telefone.Registro.Tipo := 'Fax';
    Telefone.getByKey;
    if Telefone.exist then
    BEgin
      LcFone := TPhone.Create;
      _assign(Telefone.Registro, LcFone);
      pObj.Entidade.ListaFones.Add(LcFone);
    End;

    Telefone.Registro.Codigo := entityID;
    Telefone.Registro.Tipo := 'Celular';
    Telefone.getByKey;
    if Telefone.exist then
    BEgin
      LcFone := TPhone.Create;
      _assign(Telefone.Registro, LcFone);
      pObj.Entidade.ListaFones.Add(LcFone);
    End;

    //email
    Email.Registro.Codigo := entityID;
    Email.getbyKind( Self.Registro.Codigo ,'principal');
    if Email.exist then
    Begin
      LcEmail := TMailing.Create;
      _assign(email.Registro, LcEmail );
      pObj.Entidade.Email := LcEmail;
    End;

    //Social Midia
    MidiaSocial.Registro.Codigo :=  entityID;
    MidiaSocial.Registro.Tipo := 'www';
    MidiaSocial.getByKey;
    if MidiaSocial.exist then
    Begin
      LcSocial := TSocialMedia.Create;
      _assign(MidiaSocial.Registro, LcSocial);
      pObj.Entidade.MidiaSocial := LcSocial ;
    End;


  End;

end;

procedure TControllerEntityFiscal.Fisicatreat(fis : TPerson);
begin
  if (fis.DataEmissao = 0) then
    fis.DataEmissao := Date;
  if (fis.Aniversario = 0) then
    fis.Aniversario := Date;
  if (fis.RegistroCriado = 0) then
    fis.RegistroCriado := Now;
  if (fis.RegistroAlterado = 0) then
    fis.RegistroAlterado := Now;

end;

function TControllerEntityFiscal.getAllByKey: boolean;
begin
  inherited;
  Juridica.Registro.Codigo := Registro.Codigo;
  Juridica.getByKey;
  if Juridica.exist then
    kindPerson := 'J'
  else
  Begin
    kindPerson := 'F';
    Fisica.Registro.Codigo := Registro.Codigo;
    Fisica.getByKey;
  End;

end;

function TControllerEntityFiscal.getByKey: boolean;
begin
  try
    inherited;
    Juridica.Registro.Codigo := Registro.Codigo;
    Juridica.getByKey;
    if Juridica.exist then
      kindPerson := 'J'
    else
    Begin
      kindPerson := 'F';
      Fisica.Registro.Codigo := Registro.Codigo;
      Fisica.getByKey;
    End;
    except
      on E : Exception do
        geralog('ControllerEntityFiscal - getByKey - ',E.Message);
    end;

end;


function TControllerEntityFiscal.getCRT: String;
begin
  Juridica.Registro.Codigo := Self.Registro.Codigo;
  Juridica.getByKey;
  if not Juridica.exist then
  Begin
    Fisica.Registro.Codigo := Registro.Codigo;
    Fisica.getByKey;
  End;

end;

procedure TControllerEntityFiscal.Juridicatreat( jus : TCompany);
begin
  if (jus.DataFundacao = 0) then
    jus.DataFundacao := Date;

  if (jus.RegistroCriado = 0) then
    jus.RegistroCriado := Now;

  if (jus.RegistroAlterado = 0) then
    jus.RegistroAlterado := Now

end;

function TControllerEntityFiscal.saveDataEntity(
  DObj: TObjEntityFiscal): Boolean;
Var
  I : Integer;
  Lc_Aux:Integer;
begin
  //Endereço
  for I := 0 to DObj.Entidade.ListaEndereco.Count -1 do
  Begin
    _assign( DObj.Entidade.ListaEndereco[I], Self.Endereco.Registro );
    Self.Endereco.Registro.Codigo := Self.Registro.Codigo;
    if Self.Endereco.Registro.CodigoCidade = 0 then
      Self.Endereco.Registro.CodigoCidade := 4004;
    Self.Endereco.save;
  End;
  //Telefone
  for I := 0 to DObj.Entidade.ListaFones.Count -1 do
  Begin
    _assign( DObj.Entidade.ListaFones[I], Self.Telefone.Registro);
    Self.Telefone.Registro.Codigo := Self.Registro.Codigo;
    Self.Telefone.save;
  End;
  //Email
  //Não deleta o email do mailing, apenas delete o vinculo deste email à Entidade
  self.Email.deleteHasEntity(Self.Registro.Codigo, 1 );

  if DObj.Entidade.Email.Email <> '' then
  Begin
    self.Email.clear;
    self.Email.Registro.Email := DObj.Entidade.Email.Email;
    self.Email.save;
    //Entidade Has Mailin
    self.Email.EntityHas.Registro.Entidade := Self.Registro.Codigo;
    self.Email.EntityHas.Registro.Mailing  := self.Email.Registro.Codigo;
    self.Email.EntityHas.Registro.Grupo    := 1;//Principal
    self.Email.EntityHas.Save;
  End;
  //Repassa o codigo Atual
  DObj.Entidade.Entidade.Codigo := Registro.Codigo;
end;

function TControllerEntityFiscal.saveDataFiscal(
  DObj: TObjEntityFiscal): Boolean;

begin
  //Garantir que a entity tenha zero, para pesquisar por doc fiscal
  Self.Fisica.Registro.Codigo := 0;
  Self.Juridica.Registro.Codigo := 0;
  //Verifica se a busca será feita por CPF ou CNPJ

  if ( Length(DObj.Fisica.CPF) = 11 ) then
    Self.Fisica.Registro.Codigo := Self.Fisica.getIDbyCPF(DObj.Fisica.CPF);

  if ( Length(DObj.Juridica.CNPJ) > 11 ) then
    Self.Juridica.Registro.Codigo := Self.Juridica.getIDbyCNPJ(DObj.Juridica.CNPJ);

  if (Self.Fisica.Registro.Codigo = 0) and (Self.Juridica.Registro.Codigo = 0)  then
  Begin
    //Entidade
    _assign( DObj.Entidade.Entidade,Self.Registro);
    Self.Registro.Codigo := 0;
    Self.insert;
    if (DObj.Fisica.CPF <> '' ) then
    Begin
      //Fisica
      _assign( DObj.Fisica, Self.Fisica.Registro );
      Self.Fisica.Registro.Codigo := Self.Registro.Codigo;
      Self.Fisica.insert;
    End;
    if (DObj.Juridica.CNPJ <> '' ) then
    Begin
      //Juridica
      _assign( DObj.Juridica, Self.Juridica.Registro );
      Self.Juridica.Registro.Codigo := Self.Registro.Codigo;
      Self.Juridica.insert;
    End;
  end
  else
  Begin
    _assign( DObj.Entidade.Entidade,Self.Registro);
    //Altera os dados da entidade que existe
    if ( Self.Fisica.Registro.Codigo > 0 ) then
      Self.Registro.Codigo  := Self.Fisica.Registro.Codigo;

    if ( Self.Juridica.Registro.Codigo > 0 ) then
      Self.Registro.Codigo  := Self.Juridica.Registro.Codigo;
    Self.update;
  End;
  saveDataEntity(DObj);
end;

function TControllerEntityFiscal.saveDataNaoFiscal(
  DObj: TObjEntityFiscal): Boolean;
begin
  //Garantir que a entity tenha zero, para pesquisar por doc não fiscal
  Self.Fisica.Registro.Codigo := 0;
  Self.Juridica.Registro.Codigo := 0;
  //Verifica se a busca será feita por CPF ou CNPJ

  Self.NoDocNumber.Registro.Referencia      := DObj.NoDocNumber.Referencia;
  Self.NoDocNumber.Registro.Estabelecimento := DObj.NoDocNumber.Estabelecimento;
  Self.NoDocNumber.getByReference;

  if not (Self.NoDocNumber.exist) then
  Begin
    //Entidade
    _assign( DObj.Entidade.Entidade,Self.Registro);
    Self.Registro.Codigo := 0;
    Self.insert;
    Self.NoDocNumber.Registro.Codigo          := Self.Registro.Codigo;
    Self.NoDocNumber.Registro.Referencia      := DObj.NoDocNumber.Referencia;
    Self.NoDocNumber.Registro.Estabelecimento := DObj.NoDocNumber.Estabelecimento;
    Self.NoDocNumber.insert;
  end
  else
  begin
    _assign( DObj.Entidade.Entidade,Self.Registro);
    self.Registro.Codigo := Self.NoDocNumber.Registro.Codigo;
    Self.update;
  end;
  saveDataEntity(DObj);
end;

function TControllerEntityFiscal.saveDataObjeto( DObj: TObjEntityFiscal ): Boolean;
begin
  //Esta verificação é para vendas ao consumidor e eventuais CPF e CNPJ Errados
  if ( (not CalculoCpf(DObj.Fisica.CPF) ) and (not CalculoCnpj(DObj.Juridica.CNPJ)) ) then
  Begin
    //Repassa o codigo Atual da Entidade Consumidor Final
    if (pos('CLIENTE',DObj.Entidade.Entidade.NomeRazao) > 0 ) OR (pos('CONSUMIDOR',DObj.Entidade.Entidade.NomeRazao) > 0 ) then
    Begin
      DObj.Entidade.Entidade.Codigo := 2582;
    End
    else
    Begin
      saveDataNaoFiscal(DObj);
    End;
  End
  else
  Begin
    saveDataFiscal(DObj);
  End;
end;

procedure TControllerEntityFiscal.setParametro(par: String);
begin
  Parametro:= TJson.JsonToObject<TPrmEntity>(par);
  //Tratar Data
  Parametro.UltimaAtualizacao := dataMysql(Parametro.UltimaAtualizacao);
end;

end.
