unit cad_user;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  base_registry, FMX.Objects, FMX.Controls.Presentation, FMX.Layouts, FMX.Edit,
  FMX.Effects,FMX.DialogService, ctrl_mob_user, MainModule, uAuthCM,
  REST.Json,System.Json, uDataCM, System.ImageList, FMX.ImgList, FMX.Ani,
  FMX.ListView.Types, FMX.ListView.Appearances, FMX.ListView.Adapters.Base,
  FMX.ListView;

type
  TCadUser = class(TBaseRegistry)
    Pnl_Dados: TLayout;
    Lb_Nome: TLabel;
    Lb_Dados: TLabel;
    Lb_Email: TLabel;
    Rrc_Email: TLayout;
    e_Email: TEdit;
    Pnl_Change_Pass: TLayout;
    Lb_ChangePass: TLabel;
    Lb_Current_pass: TLabel;
    Rrc_Current_Pass: TLayout;
    E_Current_pass: TEdit;
    Lb_New_Pass: TLabel;
    Rrc_New_Pass: TLayout;
    E_New_Pass: TEdit;
    Rrc_Name: TLayout;
    E_Name: TEdit;
    Rrc_Confirm_Pass: TLayout;
    E_Confim_Pass: TEdit;
    Lb_Confim_Pass: TLabel;
  private
    { Private declarations }
  protected
  protected
    procedure InitVariable;Override;
    procedure SetVariable;Override;
    procedure ShowData;Override;
    procedure ShowNoData;Override;

    function validateSave:Boolean;Override;
    procedure save;Override;
    function ValidateCancel():boolean;Override;
    procedure Cancel;Override;


  public
    User : TCtrlMobUser;
  end;

var
  CadUser: TCadUser;

implementation

{$R *.fmx}
{$R *.LgXhdpiPh.fmx ANDROID}

{ TCadUser}

procedure TCadUser.Cancel;
begin
  ModalResult := mrCancel
end;



procedure TCadUser.InitVariable;
begin
  inherited;
  User := TCtrlMobUser.Create(Self);
end;

procedure TCadUser.save;
Var
  LcStrJSon : String;
  LcJson : TJSONValue;
  LcCM : TAuthCM;
begin
  inherited;
  USer.Parametro.Estabelecimento    := UMM.GInstitution.Registro.Codigo;
  USer.Parametro.Entidade.NomeRazao := E_Name.Text;
  USer.Parametro.Email.Email        := e_Email.Text;
  USer.Parametro.Senha              := USer.encryptPassword( E_Current_pass.Text);
  USer.Parametro.NovaSenha          := USer.encryptPassword( E_New_Pass.Text);
  LcCM := TAuthCM.Create(Self);
  LcStrJSon := TJson.ObjectToJsonString(User.Registro);
  LcJSon := LcCM.SMClient.update(LcStrJSon);
  ShowMessage(LcJSon.ToString);
end;

procedure TCadUser.SetVariable;
begin
  if CodigoRegistro > 0 then
  Begin
    User.Parametro.Estabelecimento := UMM.GInstitution.Registro.Codigo;
    User.Parametro.Entidade.Codigo := CodigoRegistro;
    User.getbyKey;
  End;
  inherited
end;

procedure TCadUser.ShowData;
begin
  with User.Parametro do
  Begin
    E_Name.Text := Entidade.NomeRazao;
    e_Email.Text := Email.Email;
  End;
end;

procedure TCadUser.ShowNoData;
begin
  inherited;
  ClearAllFields;
end;

function TCadUser.ValidateCancel: boolean;
begin
  REsult := True;
end;

function TCadUser.validateSave: Boolean;
begin
  Result := True;
  TDialogService.PreferredMode := TDialogService.TPreferredMode.Platform;
  if trim(E_Name.Text) = '' then
  begin
    TDialogService.ShowMessage(
            Concat('A T E N Ç Ã O!.',
                   Char(10),Char(13),
                   Char(10),Char(13),
                   'Campo Nome não informado.',
                   Char(10),Char(13),
                   'Preencha o campo para continuar'));
    if E_Name.CanFocus then E_Name.SetFocus;
    Result := False;
    exit;
  end;

  if trim(e_Email.Text) = '' then
  begin
    TDialogService.ShowMessage(
            Concat('A T E N Ç Ã O!.',
                   Char(10),Char(13),
                   Char(10),Char(13),
                   'Campo e-mail não informado.',
                   Char(10),Char(13),
                   'Preencha o campo para continuar'));
    if e_Email.CanFocus then e_Email.SetFocus;
    Result := False;
    exit;
  end;

  if (trim(E_Current_pass.Text) <> '') or (trim(E_New_Pass.Text) <> '') or (trim(E_Confim_Pass.Text) <> '') then
  begin
    if trim(E_Current_pass.Text) = '' then
    begin
      TDialogService.ShowMessage(
              Concat('A T E N Ç Ã O!.',
                     Char(10),Char(13),
                     Char(10),Char(13),
                     'Campo Senha atual não informado.',
                     Char(10),Char(13),
                     'Preencha o campo para continuar'));
      if E_Current_pass.CanFocus then E_Current_pass.SetFocus;
      Result := False;
      exit;
    end;

    if trim(E_New_Pass.Text) = '' then
    begin
      TDialogService.ShowMessage(
              Concat('A T E N Ç Ã O!.',
                     Char(10),Char(13),
                     Char(10),Char(13),
                     'Campo Nova Senha não informado.',
                     Char(10),Char(13),
                     'Preencha o campo para continuar'));
      if E_New_Pass.CanFocus then E_New_Pass.SetFocus;
      Result := False;
      exit;
    end;

    if trim(E_Confim_Pass.Text) = '' then
    begin
      TDialogService.ShowMessage(
              Concat('A T E N Ç Ã O!.',
                     Char(10),Char(13),
                     Char(10),Char(13),
                     'Campo Confirme a Senha não informado.',
                     Char(10),Char(13),
                     'Preencha o campo para continuar'));
      if E_New_Pass.CanFocus then E_New_Pass.SetFocus;
      Result := False;
      exit;
    end;

    if trim(E_New_Pass.Text) <> trim(E_Confim_Pass.Text)  then
    begin
      TDialogService.ShowMessage(
              Concat('A T E N Ç Ã O!.',
                     Char(10),Char(13),
                     Char(10),Char(13),
                     'Campo Nova Senha e Confirme a Senha não estão iguais.',
                     Char(10),Char(13),
                     'Verifique para continuar'));
      Result := False;
      exit;
    end;

  end;

end;

end.

