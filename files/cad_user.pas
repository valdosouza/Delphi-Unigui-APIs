unit cad_user;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, base_registry, uniGUIClasses, uniEdit,
  uniLabel, Vcl.Menus, uniMainMenu, uniButton, uniBitBtn, uniSpeedButton,
  uniGUIBaseClasses, uniPanel, ControllerUser, uniCheckBox,
  ControllerEntityHasMailing,
  UnFunctions, Data.DB, Datasnap.DBClient, fm_devices, uniMultiItem, uniComboBox,
  uniPageControl, uniMemo;

type
  TCadUser = class(TBaseRegistry)
    E_NameCompany: TUniEdit;
    E_ID: TUniEdit;
    E_email: TUniEdit;
    e_senha_sistema: TUniEdit;
    chbx_cad_active: TUniCheckBox;
    E_Apelido: TUniEdit;
    Ctn_Device: TUniContainerPanel;
    pnl_row_1: TUniPanel;
    pnl_row_2: TUniPanel;
    pnl_row_3: TUniPanel;
    MnuPermissao: TUniMenuItem;
    Cb_Perfil: TUniComboBox;
    UniPageControl1: TUniPageControl;
    UniTabSheet1: TUniTabSheet;
    pnl_config_email: TUniPanel;
    pnl_config_email_row_1: TUniPanel;
    E_Porta: TUniEdit;
    E_Senha_Email: TUniEdit;
    e_smtp: TUniEdit;
    chbx_requer_autenticacao: TUniCheckBox;
    E_Assinatura: TUniMemo;
    chbx_ssl: TUniCheckBox;
    chbx_notifica_acesso: TUniCheckBox;
    sb_testar_email: TUniSpeedButton;
    pnl_config_email_option: TUniPanel;
    procedure MnuPermissaoClick(Sender: TObject);
  private
    { Private declarations }
    procedure InitVariable; Override;
    procedure SetVariable; Override;
    procedure FormatScreen; Override;
    procedure ShowData; Override;
    procedure ShowDataUser;
    procedure ShowDataEnviaEmail;
    procedure ShowNoData; Override;
    function ValidaInsert(): boolean; Override;
    procedure Insert; Override;
    function ValidateSave: boolean; Override;
    procedure Save; Override;
    procedure SaveMailing;
    procedure SaveEntity;
    procedure SaveEntityHasMailing;
    procedure SaveUser;
    procedure SaveUserDevice;
    procedure SaveUserSendEmail;
    procedure SaveInnerInstitution; Virtual;
    procedure Delete; Override;
    procedure EditionControl; Override;

    procedure ShowDevice;
  public
    { Public declarations }
    User: TControllerUser;
    FrDevices: TFmDEvices;
    EntidadeHasMailing: TControllerEntityHasMailing;
  end;

var
  CadUser: TCadUser;

implementation

{$R *.dfm}

uses msg_form, unMessages, MainModule, openForms;

{ TCadUser }

procedure TCadUser.Delete;
begin
  inherited;
  MensageYesNo(['C O N F I R M A Ç Ã O!', '',
    'Deseja realmente excluir este registro?', 'clique em SIM para confirmar.'],
    mpAlerta);
  FormMsg.ShowModal(
    Procedure(Sender: TComponent; AResult: Integer)
    begin
      if (Sender as TMsgForm).BotaoEscolhido > 0 then
      Begin
        //Deleta instittion has USer
        User.HasInstitution.Registro.Estabelecimento := InstitutionID;
        User.HasInstitution.Registro.Usuario := User.Registro.Codigo;
        User.HasInstitution.delete;
        //Mantem o usuario pois ele pode estar sendo usado em outro estabelecimento
      End;
    end);
end;

procedure TCadUser.EditionControl;
begin
  inherited;
  e_senha_sistema.ReadOnly := not(EditionState = 'I');
  EditionControler(FrDevices);
end;

procedure TCadUser.FormatScreen;
begin
  inherited;
  ShowDevice;
end;

procedure TCadUser.InitVariable;
begin
  PInterface := 13;
  inherited;
  User := TControllerUser.Create(self);
  EntidadeHasMailing := TControllerEntityHasMailing.Create(self);
end;

procedure TCadUser.Insert;
begin
  inherited;
  ClearAllFields;
  E_NameCompany.SetFocus;
end;

procedure TCadUser.MnuPermissaoClick(Sender: TObject);
begin
  inherited;
  OpenTasUserHasPrivilege(nil);
end;

procedure TCadUser.Save;
begin
  SaveMailing;
  SaveEntity;
  SaveEntityHasMailing;
  SaveUser;
  SaveInnerInstitution;
  SaveUserSendEmail
end;

procedure TCadUser.SaveEntity;
begin
  // Entidade
  with User.Entity.Registro do
  Begin
    //Caso já exista um email usaremos a mesma entidade do email
    if (User.Entity.Registro.codigo = 0)  then
      Codigo := User.Mailing.Registro.Codigo;
    NomeRazao := E_NameCompany.Text;
    ApelidoFantasia := E_Apelido.Text;
  End;
  User.Entity.Save;
end;

procedure TCadUser.SaveInnerInstitution;
begin
  with User.HasInstitution.Registro do
  Begin
    Estabelecimento := self.InstitutionID;
    Usuario := User.Registro.Codigo;
    Tipo    := Cb_Perfil.Text;
    if chbx_cad_active.Checked then
      Ativo := 'S'
    else
      Ativo := 'N';
  End;
  User.HasInstitution.Save;
end;

procedure TCadUser.SaveMailing;
begin
  // Mailing
  with User do
  Begin
    Mailing.Registro.Email := E_email.Text;
    Mailing.Save;
  End;
end;

procedure TCadUser.SaveEntityHasMailing;
begin
  with EntidadeHasMailing.Registro do
  Begin
    Entidade := User.Entity.Registro.Codigo;
    Mailing := User.Mailing.Registro.Codigo;
    Grupo := 2;// Sistema
  End;
  EntidadeHasMailing.Save;
end;

procedure TCadUser.SaveUser;
begin
  // User
  with User.Registro do
  Begin
    Codigo := User.Entity.Registro.Codigo;
    if e_senha_sistema.ReadOnly then
      Password := e_senha_sistema.Text
    else
      Password := User.encryptPassword(e_senha_sistema.Text);

    if chbx_cad_active.Checked then
      Ativo := 'S'
    else
      Ativo := 'N';
    if FrDEvices.DBLCB_Lista.Text <> '' then
      Dispositivo := FrDEvices.DBLCB_Lista.KeyValue
    else
      Dispositivo := 0;
    Tipo := 'sistema';
  End;
  User.Save;
end;

procedure TCadUser.SaveUserDevice;
begin
  User.device.Registro.Codigo := FrDevices.DBLCB_Lista.KeyValue;
  User.device.Registro.Estabelecimento := UMM.GInstitution.registro.Codigo;
  User.device.getByKey;
  if User.device.exist then
  Begin
    User.device.Registro.Usuario := User.Registro.Codigo;
    User.device.save
  End;

end;

procedure TCadUser.SaveUserSendEmail;
begin
  with user.EnviaEmail do
  BEgin
    Registro.Usuario  := user.Registro.Codigo;
    Registro.SMtp     := e_smtp.Text;
    Registro.Porta    := E_Porta.Text;
    Registro.Senha    := E_Senha_Email.Text;
    if chbx_requer_autenticacao.Checked then
      Registro.RequerAutenticacao := 'S'
    else
      Registro.RequerAutenticacao := 'N';
    if chbx_ssl.Checked then
      Registro.RequerSSL := 'S'
    else
      Registro.RequerSSL := 'N';
    if chbx_notifica_acesso.Checked then
      Registro.NotificarAcesso := 'S'
    else
      Registro.NotificarAcesso := 'N';
    Registro.Assinatura := E_Assinatura.Text;
  End;
  user.EnviaEmail.save;
end;

procedure TCadUser.SetVariable;
begin
  User.Registro.Codigo := CodigoRegistro;
  User.getbyKey;
  User.HasInstitution.Registro.Estabelecimento := self.InstitutionID;
  User.HasInstitution.Registro.Usuario := USer.Registro.Codigo;
  User.HasInstitution.getbyKey;
  // Entidade
  User.Entity.Registro.Codigo := User.Registro.Codigo;
  User.Entity.getbyKey;
  // Mailing
  User.Mailing.getbyKind(User.Registro.Codigo, 'sistema');
  //User Send Email
  User.EnviaEmail.Registro.Usuario := CodigoRegistro;
  User.EnviaEmail.getByKey;
  inherited;
end;

procedure TCadUser.ShowData;
begin
  ShowDataUser;
  ShowDataEnviaEmail;
  inherited;
end;

procedure TCadUser.ShowDataEnviaEmail;
begin
  with user.EnviaEmail do
  BEgin
    e_smtp.Text         := Registro.SMtp;
    E_Porta.Text        := Registro.Porta;
    E_Senha_Email.Text  := Registro.Senha;
    chbx_requer_autenticacao.Checked := (Registro.RequerAutenticacao = 'S');
    chbx_ssl.Checked    := (Registro.RequerSSL = 'S');
    chbx_notifica_acesso.Checked := ( Registro.NotificarAcesso = 'S');
    E_Assinatura.Text   := Registro.Assinatura;
  End;
end;

procedure TCadUser.ShowDataUser;
begin
  // User
  E_ID.Text := IntToStr(User.Registro.Codigo);
  // Entidade
  E_NameCompany.Text := User.Entity.Registro.NomeRazao;
  E_Apelido.Text := User.Entity.Registro.ApelidoFantasia;
  // Email
  E_email.Tag := User.Mailing.Registro.Codigo;
  E_email.Text := User.Mailing.Registro.Email;
  e_senha_sistema.Text := User.Registro.Password;
  Cb_Perfil.Text := User.HasInstitution.Registro.Tipo;
  chbx_cad_active.Checked := (User.HasInstitution.Registro.Ativo = 'S');

  FrDevices.DBLCB_Lista.KeyValue := user.Registro.Dispositivo;

end;

procedure TCadUser.ShowDevice;
begin
  FrDevices := TFmDEvices.Create(self);
  FrDevices.Parent := Ctn_Device;
  FrDevices.Align := alClient;
  FrDevices.Listar(CodigoRegistro);
  FrDevices.Show;
end;

procedure TCadUser.ShowNoData;
begin
  inherited;
  ClearAllFields;
  FrDevices.DBLCB_Lista.KeyValue := null;
end;

function TCadUser.ValidaInsert: boolean;
begin
  inherited;
end;

function TCadUser.ValidateSave: boolean;
begin
  Result := True;
  if trim(E_NameCompany.Text) = '' then
  begin
    MensageAlert(['A T E N Ç Ã O!.', '', 'Campo Nome não informado.',
      'Preencha o campo para continuar']);
    if E_NameCompany.CanFocus then
      E_NameCompany.SetFocus;
    Result := False;
    exit;
  end;

  if trim(E_email.Text) = '' then
  begin
    MensageAlert(['A T E N Ç Ã O!.', '', 'Campo e-mail não informado.',
      'Preencha o campo para continuar']);
    if E_email.CanFocus then
      E_email.SetFocus;
    Result := False;
    exit;
  end;

  User.Mailing.Registro.Email := E_email.Text;
  User.Mailing.Registro.Codigo := E_email.Tag;
  if not User.Mailing.Valida then
  Begin
    E_email.SetFocus;
    Result := False;
    exit;
  End;

  if User.doubleCheck(E_email.tag,E_email.Text,InstitutionID) then
  Begin
    MensageAlert(['A T E N Ç Ã O!.', '',
                  'Este e-mail já está sendo utilizado como usuário.',
                  'Verifique com o Administrador do Sistema']);
    Result := False;
    exit;
  End;

  if (trim(e_senha_sistema.Text) = '') and (EditionState = 'I') then
  begin
    MensageAlert(['A T E N Ç Ã O!.', '', 'Campo Senha não informado.',
      'Preencha o campo para continuar']);
    if e_senha_sistema.CanFocus then
      e_senha_sistema.SetFocus;
    Result := False;
    exit;
  end;
end;

end.
