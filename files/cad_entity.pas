unit cad_entity;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  Data.DB, Datasnap.DBClient,
  uniScrollBox, uniButton, fm_Address, uniBitBtn, uniSpeedButton, uniPanel,
  uniGUIBaseClasses, uniGUIClasses, uniRadioGroup, uniDateTimePicker, uniEdit,
  uniLabel, uniPageControl, Vcl.Menus, uniMainMenu, uniMemo,
  fm_lineBusiness,
  controllerentity,
  controllerAddress,
  ControllerPhone,
  ControllerMailing,
  ControllerCity,
  ControllerState,
  unMessages,
  UnFunctions,
  ControllerSocialMedia,
  ControllerLineBusiness,
  ControllerInstitutionHasEntity,
  ControllerEntityHasMailing,
  ControllerEntityFiscal,
  tblEntity,
  cad_user,
  base_registry ;

type
  TCadEntity = class(TBaseRegistry)
    MnuEnderecos: TUniMenuItem;
    MnuTelefones: TUniMenuItem;
    MnuContatos: TUniMenuItem;
    Pg_Main: TUniPageControl;
    tb_Address: TUniTabSheet;
    Ctn_Address: TUniContainerPanel;
    tb_Obs: TUniTabSheet;
    E_Obs: TUniMemo;
    pnl_fundo_linha_1: TUniPanel;
    E_DateRegistry: TUniDateTimePicker;
    E_ID: TUniEdit;
    pnl_fundo_linha_2: TUniPanel;
    E_NameCompany: TUniEdit;
    E_NickTrade: TUniEdit;
    pnl_fundo_linha_3: TUniPanel;
    Ctn_LineBusiness: TUniContainerPanel;
    E_DtAniversary: TUniDateTimePicker;
    pnl_fundo_linha_4: TUniPanel;
    E_email: TUniEdit;
    E_WebSite: TUniEdit;
    procedure E_emailChange(Sender: TObject);
    procedure SB_SaveClick(Sender: TObject);
    procedure SB_InsertClick(Sender: TObject);
    procedure UniFormShow(Sender: TObject);
    procedure MnuContatosClick(Sender: TObject);

  private
    Entity : TControllerEntity;

    procedure ShowAddress;
    procedure ShowLineBusiness;

  Protected
    FrLineBusiness : TFmLineBusiness;
    procedure initVariable;Override;
    procedure FormatScreen;Override;
    procedure ClearAllFields;Override;
    procedure EditionControl;Override;

    procedure ShowNoData;Override;
    procedure ShowData;Override;
    //Inserir
    procedure Insert;Override;

    //Salvar
    function ValidateSaveEntity: boolean;Virtual;
    procedure Save;Override;


    //Valida o email
    function ValidateEmail(kind:String):Boolean;

    //Salva Entidade
    procedure SaveEntity(Entity:TControllerEntity);
    procedure ShowDataEntity(Entity: TControllerEntity);
    //Endereço
    procedure SaveAddress(ID:Integer;Ad:TControllerAddress);
    procedure ShowDataAddress(Endereco:TControllerAddress);
    //TeleFone
    procedure SavePhone(id:Integer;Ph:TControllerPhone);
    procedure ShowDataPhone(id:Integer;Ph:TControllerPhone);
    //Email
    procedure SaveMailing(id: Integer; kind:String;Mailing:TControllerMailing);
    procedure ShowDataMailing(DM:TControllerMailing);
    //Site do cadastro
    procedure SaveSocialMedia(Id:Integer;SM:TControllerSocialMedia);
    procedure ShowDataSocialMedia(SM:TControllerSocialMedia);

  public
    FrAddress : TFmAddress;


    function ValidateOpenUser:boolean;
    procedure OpenUser;

  end;
var
  CadEntity: TCadEntity;

implementation

{$R *.dfm}

uses
  MainModule,
  msg_form, openForms;

procedure TCadEntity.ShowData;
begin
  with Entity do
  Begin
    ShowDataEntity(Entity);
    ShowDataAddress(Entity.Endereco);
    ShowDataPhone(registro.Codigo, Entity.Telefone);
    ShowDataMailing(Entity.Email);
    ShowDataSocialMedia(Entity.MidiaSocial);
    //Setando a variavel para controle de botãoe (Alterar/Excluir
    CodigoRegistro := Registro.Codigo;
    E_ID.Text := IntToStr(Registro.codigo);
  End;

end;

procedure TCadEntity.ShowDataAddress(Endereco:TControllerAddress);
begin
  //Enderecos
  with FrAddress, Endereco.Registro do
  Begin
    E_Cep.Text := cep;
    MaskCep(E_Cep);
    E_street.Text := logradouro;
    E_Number.Text := NumeroPredial;
    E_Kind.Text := Tipo;
    E_Compl.Text := Complemento;
    E_Neighborhood.Text := bairro;
    E_Region.Text := Regiao;
  end;

  with  FrAddress,Endereco, FrCountryStateCity do
  Begin
    //Pais
    FrCountry.DBLCB_Lista.KeyValue := Pais.Registro.Codigo;
    //estado
    FrState.Listar(Pais.Registro.Codigo);
    FrState.DBLCB_Lista.KeyValue :=  Estado.Registro.Codigo;
    //Cidade
    FrCity.Listar(Estado.Registro.Codigo);
    FrCity.DBLCB_Lista.KeyValue :=  Cidade.Registro.Codigo;
  End;
end;



procedure TCadEntity.ShowDataEntity(Entity: TControllerEntity);
begin
  //Entidade
  with Entity do
  Begin
    with Registro do
    Begin
      E_ID.Text := IntToStr(Registro.Codigo);
      E_DateRegistry.DateTime := RegistroCriado;
      E_NameCompany.Text := NomeRazao;
      E_NickTrade.Text := ApelidoFantasia;
      E_DtAniversary.DateTime := AniversarioFundacao;
      E_Obs.Text := Observacao;
    End;
    //Ramo de Atividade
    with RamoAtividade.Registro do
    Begin
      FrLineBusiness.DBLCB_Lista.KeyValue := Codigo;
      FrLineBusiness.DBLCB_Lista.Text := Descricao
    End;
  End;
end;

procedure TCadEntity.ShowDataMailing(DM: TControllerMailing);
begin
 //Email
  with DM.Registro do
  Begin
    E_email.Text := Email;
    E_email.Tag := Codigo;
  end;
end;

procedure TCadEntity.ShowDataPhone(id: Integer; Ph: TControllerPhone);
begin
  //Fones
  with  FrAddress,Ph, FrCountryStateCity do
  Begin
    Ph.clear;
    Registro.Codigo := id;
    Registro.Tipo := 'Fone';
    getbyKey;
    E_Contact.Text := Registro.Contato;
    E_Phone.Text := Registro.Numero;
    MaskPhone(E_Phone);

    Ph.clear;
    Registro.Codigo := id;
    Registro.Tipo := 'Fax';
    getbyKey;
    E_Fax.Text := Registro.Numero;
    MaskPhone(E_Fax);

    Ph.clear;
    Registro.Codigo := id;
    Registro.Tipo := 'Celular';
    getbyKey;
    E_Celular.Text := Registro.Numero;
    MaskPhone(E_Celular);
  End;
end;

procedure TCadEntity.ShowDataSocialMedia(SM: TControllerSocialMedia);
begin
  //Rede Social - www
  with SM.Registro do
  Begin
    E_WebSite.Tag := Codigo;
    E_WebSite.Text := Link;
  End;
end;

procedure TCadEntity.ClearAllFields;
begin
  inherited;
  ClearFields(FrLineBusiness);
  ClearFields(FrAddress);
  ClearFields(FrAddress.FrCountryStateCity);
end;

procedure TCadEntity.EditionControl;
begin
  inherited;
  EditionControler(FrLineBusiness);
  EditionControler(FrAddress);
  EditionControler(FrAddress.FrCountryStateCity.FrCountry);
  EditionControler(FrAddress.FrCountryStateCity.FrState);
  EditionControler(FrAddress.FrCountryStateCity.FrCity);
end;


procedure TCadEntity.E_emailChange(Sender: TObject);
begin
//  TUniEdit(Sender).Tag := 0;
end;

procedure TCadEntity.ShowNoData;
begin
  ClearAllFields;
  inherited;
end;

procedure TCadEntity.UniFormShow(Sender: TObject);
begin
  inherited;
  PG_Main.ActivePage := tb_address;
  E_ID.SetFocus;
end;

procedure TCadEntity.FormatScreen;
begin
  inherited;
  ShowAddress;
  ShowLineBusiness;
end;

procedure TCadEntity.initVariable;
begin
  inherited;
  Entity := TControllerEntity.Create(self);
end;

procedure TCadEntity.Insert;
begin
  inherited;
  ClearAllFields;
end;

procedure TCadEntity.MnuContatosClick(Sender: TObject);
begin
  if ( EditionState = 'B' ) then
  BEgin
    openSeaContact(nil,StrToIntDef(E_ID.text,0));
  End
  else
  Begin
    MensageAlert(['A T E N Ç Ã O!.',
                  '',
                  '      Finalize a edição deste registro e',
                  'somente depois acesse o cadastro de contatos.']);
  End;

end;

procedure TCadEntity.OpenUser;
Var
  Form : TCadUser;
begin
  Form := TCadUser.Create(UniApplication);
  Form.USer.Registro.Codigo := Self.CodigoRegistro;
  Form.USer.HasInstitution.Registro.Estabelecimento := UMM.GInstitution.registro.Codigo;
  Form.USer.getbyKey;
  if not Form.USer.exist then
  Begin
    //Ususario
    Form.USer.Registro.Codigo := Self.CodigoRegistro;
    Form.USer.Registro.Password:= Form.user.encryptPassword('12345');
    Form.USer.Registro.Ativo := 'S';
    Form.USer.Registro.Tipo:= 'sistema';
    Form.USer.save;
    //Mailing
    if Self.E_email.Text <> '' then
      Form.USer.Mailing.Registro.Email := Self.E_email.Text
    else
      Form.USer.Mailing.Registro.Email := concat(
                                          Copy(E_NickTrade.Text,1,Pos(E_NickTrade.Text,' ',1)),'_',
                                          IntToStr(Self.CodigoRegistro),'_',
                                          IntToStr(UMM.GInstitution.registro.Codigo),'@',
                                          Copy(UMM.GInstitution.Fiscal.Registro.ApelidoFantasia,1,Pos(UMM.GInstitution.Fiscal.Registro.ApelidoFantasia,' ',1)),'.com.br');
    Form.USer.Mailing.save;
    //Entity Has Mailing
    Form.User.Mailing.Grupo.Registro.Descricao := 'sistema';
    Form.User.Mailing.Grupo.getByDescription;
    with Form.User.Mailing.EntityHas.Registro do
    Begin
      Entidade := Form.USer.Registro.Codigo;
      Mailing := Form.USer.Mailing.Registro.Codigo;
      Grupo := Form.User.Mailing.Grupo.Registro.Codigo;
    End;
    Form.User.Mailing.EntityHas.Save;
    //Institution has User
    with Form.USer.HasInstitution.Registro do
    Begin
      Estabelecimento := UMM.GInstitution.registro.Codigo;
      Usuario := Form.User.Registro.Codigo;
      Ativo := 'S';
    End;
    Form.USer.HasInstitution.save;
  End;
  //Repasso o codigo da entidade
  Form.CodigoRegistro := Self.CodigoRegistro;
  Form.Show(
    Procedure(Sender: TComponent; AResult:Integer)
    begin
      Form := nil;
    end
  );
end;

procedure TCadEntity.ShowLineBusiness;
begin
  FrLineBusiness := TFmLineBusiness.Create(Self);
  FrLineBusiness.Parent := Ctn_LineBusiness;
  FrLineBusiness.Align := alClient;
  FrLineBusiness.Listar;
  FrLineBusiness.Show;
end;

function TCadEntity.ValidateEmail(kind:String): Boolean;
Var
  Mailing : TControllerMailing;
begin
  REsult := True;
  if Trim(E_Email.Text) <> '' then
  Begin
    try
      Mailing := TControllerMailing.Create(nil);
      Mailing.Registro.Email := E_email.Text;
      Mailing.Registro.Codigo := E_email.Tag;
      if not Mailing.Valida then
      Begin
        e_email.setFocus;
        Result := False;
        Mailing.DisposeOf;
        Exit;
      End;

      if Mailing.doubleCheck(kind)  then
      Begin
        MensageAlert(['A T E N Ç Ã O!.',
                      '',
                      'Este e-mail já está sendo utilizado.',
                      'Verifique com o Administrador do Sistema']);
        Result := False;
        FreeAndNil(Mailing);
        Exit;
      End;
    Finally
      Mailing.DisposeOf;
    End;
  end;
end;

function  TCadEntity.ValidateOpenUser:boolean;
begin
  Result := True;
  if ( CodigoRegistro = 0 ) then
  begin
    MensageAlert(['A T E N Ç Ã O!.',
                  '',
                  'Para abrir esta tela precisa terminar este um registro principal antes.',
                  'Verifique o cadstro atual para continuar']);
    Result := False;
    exit;
  end;

end;

function TCadEntity.ValidateSaveEntity: boolean;
Begin
  Result := True;
  if trim(E_NameCompany.Text) = '' then
  begin
    MensageAlert(['A T E N Ç Ã O!.',
                  '',
                  'Campo Nome não informado.',
                  'Preencha o campo para continuar']);
    Result := False;
    exit;
  end;

  if trim(E_NickTrade.Text) = '' then
  begin
    MensageAlert(['A T E N Ç Ã O!.',
                  '',
                  'Campo Codnome/Apelido não informado.',
                  'Preencha o campo para continuar']);
    Result := False;
    exit;
  end;

  if not ValidateEmail('principal') then
  Begin
    Result := False;
    exit;
  end;

  if ( Length(unMaskField(FrAddress.E_Cep.Text)) < 8) then
  begin
    MensageAlert(['A T E N Ç Ã O!.',
                  '',
                  'Campo CEP não informado ou incorreto.',
                  'Preencha o campo para continuar.']);
    Result := False;
    exit;
  end;

  if trim(FrAddress.FrCountryStateCity.frcountry.DBLCB_Lista.Text) = '' then
  begin
    MensageAlert(['A T E N Ç Ã O!.',
                  '',
                  'Campo País não informado.',
                  'Preencha o campo para continuar.']);

    Result := False;
    exit;
  end;

  if trim(FrAddress.FrCountryStateCity.FrState.DBLCB_Lista.Text) = '' then
  begin
    MensageAlert(['A T E N Ç Ã O!.',
                  '',
                  'Campo Estado não informado.',
                  'Preencha o campo para continuar.']);
    Result := False;
    exit;
  end;

  if trim(FrAddress.FrCountryStateCity.FrCity.DBLCB_Lista.Text) = '' then
  begin
    MensageAlert(['A T E N Ç Ã O!.',
                  '',
                  'Campo Cidade não informado.',
                  'Preencha o campo para continuar.']);
    Result := False;
    exit;
  end;

  if trim(FrAddress.E_Street.Text) = '' then
  begin
    MensageAlert(['A T E N Ç Ã O!.',
                  '',
                  'Campo logradouro não informado.',
                  'Preencha o campo para continuar.']);
    Result := False;
    exit;
  end;

  if trim(FrAddress.E_Number.Text) = '' then
  begin
    MensageAlert(['A T E N Ç Ã O!.',
                  '',
                   'Campo Número não informado.',
                   'Preencha o campo para continuar.']);
    Result := False;
    exit;
  end;
  if trim(FrAddress.E_Neighborhood.Text) = '' then
  begin
    MensageAlert(['A T E N Ç Ã O!.',
                  '',
                  'Campo Bairro não informado.',
                  'Preencha o campo para continuar.']);
    Result := False;
    exit;
  end;

  if trim(E_DateRegistry.Text) = '30/12/1899' then
  begin
    MensageAlert(['A T E N Ç Ã O!.',
                  '',
                  'Campo Data Cadastro não informado.',
                  'Preencha o campo para continuar']);
    Result := False;
    exit;
  end;


end;

procedure TCadEntity.Save;
begin
  SaveEntity(Entity);
  SaveAddress(Entity.Registro.Codigo,Entity.Endereco);
  SavePhone(Entity.Registro.Codigo,Entity.Telefone);
  SaveMailing(Entity.Registro.Codigo,'principal',Entity.Email);
  SaveSocialMedia(Entity.Registro.Codigo,Entity.MidiaSocial);
  //Setando a variavel para controle de botãoe (Alterar/Excluir
  CodigoRegistro := Entity.Registro.Codigo;
  E_ID.Text := IntToStr(Entity.Registro.codigo);
end;

procedure TCadEntity.SaveAddress(ID: Integer; Ad: TControllerAddress);
begin
  //Enderecos
  with FrAddress, Ad.Registro do
  Begin
    Codigo := ID;
    Principal := 'S';
    cep := unMaskField(E_Cep.Text);
    logradouro := E_street.Text;
    NumeroPredial := E_Number.Text;
    Tipo := E_Kind.Text;
    Complemento := E_Compl.Text;
    bairro := E_Neighborhood.Text;
    Regiao := E_Region.Text;
    RegistroCriado := Now();
    RegistroAlterado := Now();
    CodigoPais := FrAddress.FrCountryStateCity.FrCountry.DBLCB_Lista.KeyValue;
    CodigoEstado := FrAddress.FrCountryStateCity.FrState.DBLCB_Lista.KeyValue;
    CodigoCidade := FrAddress.FrCountryStateCity.FrCity.DBLCB_Lista.KeyValue;
  end;
  Ad.save;
end;

procedure TCadEntity.SaveEntity(Entity: TControllerEntity);
begin
  with Entity do
  Begin
    Registro.RegistroCriado := E_DateRegistry.DateTime;
    Registro.NomeRazao := E_NameCompany.Text;
    Registro.ApelidoFantasia := E_NickTrade.Text;
    if (frLineBusiness.DBLCB_Lista.KeyValue <> null) then
      Registro.RamoAtividade := frLineBusiness.DBLCB_Lista.KeyValue
    else
      Registro.RamoAtividade := 0;
    Registro.AniversarioFundacao := E_DtAniversary.DateTime;
    Registro.Observacao := E_Obs.Text;
  End;
  Entity.save;
  Entity.HadInstitution.Registro.Estabelecimento := UMM.GInstitution.registro.Codigo;
  Entity.HadInstitution.Registro.Entidade := Entity.Registro.Codigo;
  Entity.HadInstitution.Registro.RegistroCriado := Entity.Registro.RegistroCriado;
  Entity.HadInstitution.Registro.RegistroAlterado := Entity.Registro.RegistroAlterado;
  Entity.HadInstitution.save;
end;

procedure TCadEntity.SaveMailing(id: Integer; kind:String; Mailing: TControllerMailing);
begin
  //Verifica o GRupo
  Mailing.Grupo.Registro.Descricao := kind;
  Mailing.Grupo.getByDescription;
  //Não deleta o email do mailing, apenas delete o vinculo deste email à Entidade
  Mailing.deleteHasEntity(id,
                          Mailing.Grupo.Registro.Codigo );
  //Mailing
  if (E_email.Text <> '') then
  Begin
    Mailing.Registro.Email := E_email.Text;
    Mailing.save;
    //Entidade Has Mailin
    Mailing.EntityHas.Registro.Entidade := id;
    Mailing.EntityHas.Registro.Mailing  := Mailing.Registro.Codigo;
    Mailing.EntityHas.Registro.Grupo    := Mailing.Grupo.Registro.Codigo;
    Mailing.EntityHas.Save;
  End;
end;

procedure TCadEntity.SavePhone(id: Integer; Ph: TControllerPhone);
Var
  Lc_Fone:String;
begin
  with FrAddress, Ph, FrCountryStateCity do
  Begin
    Registro.Codigo := id;
    Registro.Tipo := 'Fone';
    Registro.Contato := E_Contact.Text;
    Lc_Fone := unMaskField(E_Phone.Text);
    Registro.Numero := Lc_Fone;
    Registro.TipoEndereco := 'Comercial';
    Registro.RegistroCriado := Now();
    Registro.RegistroAlterado := Now();
    if (Lc_Fone <> '' ) then
      Ph.save
    else
      Ph.delete;

    Ph.clear;
    Registro.Codigo := id;
    Registro.Tipo := 'Fax';
    Registro.Contato := E_Contact.Text;
    Lc_Fone := unMaskField(E_Fax.Text);
    Registro.Numero := Lc_Fone;
    Registro.TipoEndereco := 'Comercial';
    Registro.RegistroCriado := Now();
    Registro.RegistroAlterado := Now();
    if (Lc_Fone <> '' ) then
      Ph.save
    else
      Ph.delete;

    Ph.clear;
    Registro.Codigo := id;
    Registro.Tipo := 'Celular';
    Registro.Contato := E_Contact.Text;
    Lc_Fone := unMaskField(E_Celular.Text);
    Registro.Numero := Lc_Fone;
    Registro.TipoEndereco := 'Comercial';
    Registro.RegistroCriado := Now();
    Registro.RegistroAlterado := Now();
    if (Lc_Fone <> '' ) then
      Ph.save
    else
      Ph.delete
  End;
end;

procedure TCadEntity.SaveSocialMedia(Id:Integer;SM: TControllerSocialMedia);
begin
 //Rede Social - www
  with SM.Registro do
  Begin
    Codigo := Id;
    Tipo := 'www';
    Link := E_WebSite.Text;
    RegistroCriado := Now();
    RegistroAlterado := Now();
  End;
  if (E_WebSite.Text <> '') then
    SM.save
  else
    SM.delete;
end;

procedure TCadEntity.SB_InsertClick(Sender: TObject);
begin
  inherited;
  PG_Main.ActivePage := tb_address;
end;

procedure TCadEntity.SB_SaveClick(Sender: TObject);
begin
  inherited;
//  PG_Main.ActivePage := tb_address;
end;

procedure TCadEntity.ShowAddress;
begin
  PG_Main.ActivePage := tb_address;
  FrAddress := TFmAddress.Create(Self);
  FrAddress.Align := alclient;
  FrAddress.Parent := Ctn_Address;
  FrAddress.Show;
end;

end.
