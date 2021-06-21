unit tas_changepassword;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, base_form, uniButton, uniBitBtn,MainModule,UnFunctions,
  uniSpeedButton, uniLabel, uniGUIBaseClasses, uniGUIClasses, uniEdit,ControllerUser, MD5,
  Data.DB, Datasnap.DBClient, Vcl.Menus, uniMainMenu, uniPanel;

type
  TTasChangepassword = class(TBaseForm)
    E_CurrentPassWord: TUniEdit;
    E_NewPassWord: TUniEdit;
    E_ConfirmNewPassWord: TUniEdit;
    SB_Confirm: TUniSpeedButton;
    Sb_Abort: TUniSpeedButton;
    pnl_body: TUniPanel;
    pnl_button: TUniPanel;
    pnl_body_row_1: TUniPanel;
    pnl_body_row_2: TUniPanel;
    pnl_body_row_3: TUniPanel;
    procedure setImages;Override;
    procedure Sb_AbortClick(Sender: TObject);
    procedure SB_ConfirmClick(Sender: TObject);
  private
    { Private declarations }
    function valida:boolean;
    procedure changepassword;
  public
    { Public declarations }
  end;

var
  TasChangepassword: TTasChangepassword;

implementation

{$R *.dfm}

uses tblBrand, ControllerBrand, msg_form, unMessages;

function TTasChangepassword.valida: boolean;
begin
  Result := True;
  if trim(E_CurrentPassWord.Text) = '' then
  begin
    MensageAlert(['A T E N Ç Ã O!.',
                  '',
                  'Campo Senha Atual não informado.',
                  'Preencha o campo para continuar']);
    if E_CurrentPassWord.CanFocus then E_CurrentPassWord.SetFocus;
    Result := False;
    exit;
  end;

  if trim(E_NewPassWord.Text) = '' then
  begin
    MensageAlert(['A T E N Ç Ã O!.',
                  '',
                  'Campo Nova Senha não informado.',
                  'Preencha o campo para continuar']);
    if E_NewPassWord.CanFocus then E_NewPassWord.SetFocus;
    Result := False;
    exit;
  end;

  if trim(E_ConfirmNewPassWord.Text) = '' then
  begin
    MensageAlert(['A T E N Ç Ã O!.',
                  '',
                  'Campo Confirme a Nova Senha não informado.',
                  'Preencha o campo para continuar']);
    if E_ConfirmNewPassWord.CanFocus then E_ConfirmNewPassWord.SetFocus;
    Result := False;
    exit;
  end;

  if (E_NewPassWord.Text <> E_ConfirmNewPassWord.Text) then
  begin
    MensageAlert(['A T E N Ç Ã O!.',
                  '',
                  'A Confirmação da senha não confere',
                  'Verifique antes de continuar']);
    if E_ConfirmNewPassWord.CanFocus then E_ConfirmNewPassWord.SetFocus;
    Result := False;
    exit;
  end;
  UMM.GInstitution.User.HasInstitution.Registro.Estabelecimento := UMM.GInstitution.Registro.Codigo;
  UMM.GInstitution.User.getbyKey;
  if (UMM.GInstitution.User.Registro.Password <> MD5String(E_CurrentPassWord.Text) ) then
  Begin
    MensageAlert(['A T E N Ç Ã O!.',
                  '',
                  'A Senha atual não confere.',
                  'Verifique antes de continuar']);
    if E_CurrentPassWord.CanFocus then E_CurrentPassWord.SetFocus;
    Result := False;
    exit;
  End;
end;

procedure TTasChangepassword.changepassword;
begin
  UMM.GInstitution.User.Registro.Password := MD5String(E_NewPassWord.Text);
  UMM.GInstitution.User.update;
  MensagePadrao('S U C E S S O!!',
                ['','Senha alterada com Sucesso.'],
                ['OK'],
                [bNormal],
                mpInformacao);
  Self.Close;
end;

procedure TTasChangepassword.Sb_AbortClick(Sender: TObject);
begin
  Self.Close;
end;

procedure TTasChangepassword.SB_ConfirmClick(Sender: TObject);
begin
  if valida then
    ChangePassword;
end;


procedure TTasChangepassword.setImages;
begin
  inherited;
  buttonIcon(SB_Confirm,'confirm.bmp');
  buttonIcon(SB_Abort,'abort.bmp');
end;

end.
