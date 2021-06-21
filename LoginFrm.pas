unit LoginFrm;

interface

uses
  uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIRegClasses, uniGUIForm, uniLabel, uniEdit,
  uniGUIBaseClasses, uniCheckBox, uniButton,
  uniGUIVars, MainModule, uniGUIApplication,REST.Json,System.Json,
  UnFunctions, unMessages, System.IniFiles, uniPanel, uniImage, uniHTMLFrame,
  uniBitBtn, System.Classes, Vcl.Controls, Vcl.Forms, System.SysUtils,
  ControllerInstitution,prm_auth_login,uAuthCM;

type
  TUniLogin = class(TUniLoginForm)
    pnl_login: TUniPanel;
    chbx_keep_conected: TUniCheckBox;
    email: TUniEdit;
    senha: TUniEdit;
    UniLabel1: TUniLabel;
    UniLabel2: TUniLabel;
    btn_login_ok: TUniButton;
    btn_Login_Cancela: TUniButton;
    img_logo: TUniImage;
    pnl_topo: TUniPanel;
    pnl_geral: TUniPanel;
    pnl_login_rodape: TUniPanel;
    procedure btn_login_okClick(Sender: TObject);
    procedure UniLoginFormAfterShow(Sender: TObject);
    procedure UniLoginFormShow(Sender: TObject);
    procedure senhaKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure emailKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    { Private declarations }
    user_dev : Boolean;
    Function  ValidateLogin:Boolean;
    Function setAuthentication:Boolean;
    procedure setVariables(LcPar: TPrmAuthLogin);
    procedure configs;
    procedure Resize;
  public
  end;

function UniLogin: TUniLogin;

implementation

{$R *.dfm}

uses
  UnitConstantes,
  ClasseUtil, cad_entity_fiscal;


function UniLogin: TUniLogin;
begin
  Result := TUniLogin(UMM.GetFormInstance(TUniLogin));
end;

procedure TUniLogin.configs;
var
   ArquivoIni: TIniFile;
   sArqConfig,
   sDriver,
   sDriverBanco,
   sNomeBanco,
   sServer,
   sUsername,
   sPassword,
   sPublic,
   sPrivate,
   sUrl  : String;
begin
  try
    sDriver := TUtil.LeIni(STRNG_ARQUIVO_CONFIGURACAO,'Configuracao','DriverBanco');
    if sDriver = '' then begin
      sDriver := 'MySql';
      TUtil.GravaIni(STRNG_ARQUIVO_CONFIGURACAO, 'Configuracao', 'DriverBanco', sDriver);
    end;

    sServer := TUtil.LeIni(STRNG_ARQUIVO_CONFIGURACAO, sDriver,'Server');
    if sServer = '' then begin
      sServer := 'localhost';
      TUtil.GravaIni(STRNG_ARQUIVO_CONFIGURACAO, sDriver, 'Server', sServer);
    end;

    sNomeBanco := TUtil.LeIni(STRNG_ARQUIVO_CONFIGURACAO, sDriver,'Database');
    if sNomeBanco = '' then begin
      sNomeBanco := 'gestao_setes';
      TUtil.GravaIni(STRNG_ARQUIVO_CONFIGURACAO, sDriver, 'Database', sNomeBanco);
    end;

    sUsername := TUtil.LeIni(STRNG_ARQUIVO_CONFIGURACAO, sDriver,'User_Name');
    if sUsername = '' then begin
      sUsername := 'gestao_setes';
      TUtil.GravaIni(STRNG_ARQUIVO_CONFIGURACAO, sDriver, 'User_Name', sUsername);
    end;

    sPassword := TUtil.LeIni(STRNG_ARQUIVO_CONFIGURACAO, sDriver,'Password');
    if sPassword = '' then begin
      sPassword := '12345';
      TUtil.GravaIni(STRNG_ARQUIVO_CONFIGURACAO, sDriver, 'Password', sPassword);
    end;

    sDriverBanco := TUtil.LeIni(STRNG_ARQUIVO_CONFIGURACAO, sDriver,'DriverID');
    if sDriverBanco = '' then begin
      sDriverBanco := 'MySql';
      TUtil.GravaIni(STRNG_ARQUIVO_CONFIGURACAO, sDriver, 'DriverID', sDriverBanco);
    end;

    sPublic := TUtil.LeIni(STRNG_ARQUIVO_CONFIGURACAO, 'Diretorios','Publico');
    if sPublic = '' then begin
      sPublic := STRNG_CAMINHO_PUBLICO;
      TUtil.GravaIni(STRNG_ARQUIVO_CONFIGURACAO, 'Diretorios', 'Publico', sPublic);
    end;

    sPrivate := TUtil.LeIni(STRNG_ARQUIVO_CONFIGURACAO, 'Diretorios','Privado');
    if sPrivate = '' then begin
      sPrivate := STRNG_CAMINHO_PRIVADO;
      TUtil.GravaIni(STRNG_ARQUIVO_CONFIGURACAO, 'Diretorios', 'Privado', sPrivate);
    end;

    sUrl := TUtil.LeIni(STRNG_ARQUIVO_CONFIGURACAO, 'Diretorios','URL');
    if sUrl = '' then begin
      sUrl := STRNG_CAMINHO_URL;
      TUtil.GravaIni(STRNG_ARQUIVO_CONFIGURACAO, 'Diretorios', 'URL', sUrl);
    end;
    UMM.DB.Close;
    UMM.DB.Params.Clear;
    UMM.DB.Params.Add('Server='+sServer);
    UMM.DB.Params.Add('Database='+sNomeBanco);
    UMM.DB.Params.Add('User_Name='+sUsername);
    UMM.DB.Params.Add('Password='+sPassword);
    UMM.DB.Params.Add('DriverID=MySQL');
  finally
    ArquivoIni.Free;
  end;
end;

procedure TUniLogin.emailKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = 13 then
    UniSession.AddJS('setTimeout(function(){'+ UniLogin.senha.JSName +'.focus()}, 100)');
end;

procedure TUniLogin.Resize;
begin
  pnl_login.top := trunc( (Screen.Height / 2 ) - pnl_login.Height );
  pnl_login.Left := trunc( (Screen.Width - pnl_login.Width ) / 2 );
end;

procedure TUniLogin.senhaKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = 13 then
    btn_login_okClick(Self);

end;

function TUniLogin.setAuthentication: Boolean;
Var
  LcPar: TPrmAuthLogin;
  LcJSon : String;
  LcCM : TAuthCM;
  msg : String;
begin
  Try
    Result := False;
    //Desabilita o Botão
    LcPar := TPrmAuthLogin.Create;
    LcPar.Estabelecimento := UMM.GInstitution.registro.Codigo;
    LcPar.email := email.Text;
    LcPar.password := senha.Text;
    LcPar.NomeUsuario := '';
    LcPar.NomeEmpresa := '';
    LcPar.Usuario := 0;

    LcJSon := TJson.ObjectToJsonString(LcPar);
    LcCM := TAuthCM.Create(nil);
    LcJSon := LcCM.SMClient.GetAuthentication(LcJSon);
    LcPar := TJson.JsonToObject<TPrmAuthLogin>(LcJson);
    if LcPar.Resultado then
    begin
      Result := True;
      setVariables(LcPar);
    end
    else
    BEgin
      msg := 'A T E N Ç Ã O!' + #13 + #13 +
             'Usuário ou senha inválidos.'+ #13 +
             'Verifique e tente novamente.';
      Pnl_login.Visible := True;
      MessageDlg(msg, mtWarning, [mbOK],
          procedure(Sender: TComponent; Res: Integer)
          begin
            Senha.setFocus;
            exit;
          end
          );
    End;
  Finally
    LcCM.disposeOf;
  End;

end;

procedure TUniLogin.setVariables(LcPar: TPrmAuthLogin);
begin
  UMM.GInstitution.registro.Codigo        := LcPar.Estabelecimento;
  UMM.GInstitution.Fiscal.Registro.Codigo := UMM.GInstitution.registro.Codigo;
  UMM.GInstitution.Fiscal.getByKey;

  UMM.GInstitution.User.Registro.Codigo := LcPar.Usuario;

  UMM.GInstitution.Estoque := 1;

  UniApplication.Cookies.SetCookie('_email', email.Text, Date + 1.0); // Expires 1 day from now
  UniApplication.Cookies.SetCookie('_empresa', UMM.GInstitution.Fiscal.Registro.ApelidoFantasia, Date + 1.0);
  if chbx_keep_conected.Checked then
  begin
    UniApplication.Cookies.SetCookie('_loginname', email.Text, Date + 7.0); // Expires 7 days from now
    UniApplication.Cookies.SetCookie('_pwd', senha.Text, Date + 7.0);
    UniApplication.Cookies.SetCookie('_institution_id', IntToStr( UMM.GInstitution.registro.Codigo), Date + 7.0);
    UniApplication.Cookies.SetCookie('_user_id', IntToStr(UMM.GInstitution.User.Registro.codigo), Date + 7.0);
  End;

end;

procedure TUniLogin.UniLoginFormAfterShow(Sender: TObject);
var
  S1, S2 : string;
begin
  S1 := UniApplication.Cookies.GetCookie('_loginname');
  S2 := UniApplication.Cookies.GetCookie('_pwd');
  if ( Trim(S1) <> '' ) and ( Trim(S2) <> '') then
  Begin
    email.Text := S1;
    senha.Text := S2;
    btn_login_okClick(Sender);
  End
  else
  Begin
    pnl_login.Visible := True;
    {$IFDEF DEBUG}
      //email.Text := 'atagir@yahoo.com.br';
      email.Text := 'contato@ggescapamentos.com.br';
      //email.Text := 'viterley@hotmail.com';
      //email.Text := 'rodrigodoces@yahoo.com.br';
      senha.text := '12345';
    {$ENDIF}
    UniSession.AddJS('setTimeout(function(){'+ UniLogin.email.JSName +'.focus()}, 100)');
  End;

end;

procedure TUniLogin.UniLoginFormShow(Sender: TObject);
begin
  Configs;
end;

procedure TUniLogin.btn_login_okClick(Sender: TObject);
var
  msg : String;
begin
  if ValidateLogin then
  Begin
    if setAuthentication then
    //if GInstitution.User.autenticacao(email.Text,senha.Text) then
    Begin
      ModalResult := mrOK;
    End;
  End;
end;

function TUniLogin.ValidateLogin: Boolean;
Var
  msg : String;
begin
  Result := True;
  //Valida o conteudo do campo email
  if (email.Text = '') then
  begin
    msg := 'A T E N Ç Ã O!' + #13 + #13 +
           'Campo e-mail não informado.'#13 +
           'Verifique e tente novamente.';
    MessageDlg(msg, mtWarning, [mbOK],
      procedure(Sender: TComponent; Res: Integer)
      begin
        email.setFocus;
        Exit;
      end
    );
  end
  else
  //Valida o conteudo do campo Senha
  if (senha.Text = '') then
  Begin
    msg := 'A T E N Ç Ã O!' + #13 + #13 +
           'Campo senha não informado.'+ #13 +
           'Verifique e tente novamente.';
    MessageDlg(msg, mtWarning, [mbOK],
      procedure(Sender: TComponent; Res: Integer)
      begin
        Senha.setFocus;
        exit;
      end
    );
  end;
  //Valida se o email digitado está correto
  UMM.GInstitution.User.Mailing.Registro.Email := email.Text;
  if not UMM.GInstitution.User.Mailing.Valida then
  Begin
    email.setFocus;
    Exit;
  End
end;

initialization
  RegisterAppFormClass(TUniLogin);

end.
