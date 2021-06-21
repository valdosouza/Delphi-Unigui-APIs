unit cad_perfil;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  base_registry, FMX.Objects, FMX.Controls.Presentation, FMX.Layouts, FMX.Edit,
  FMX.Effects,FMX.DialogService;

type
  TCadPerfil = class(TBaseRegistry)
    Pnl_Perfil: TPanel;
    Lb_Nome: TLabel;
    Rrc_Name: TRoundRect;
    ShadowEffect1: TShadowEffect;
    E_Name: TEdit;
    Lb_Perfil: TLabel;
    Lb_Email: TLabel;
    Rrc_Email: TRoundRect;
    ShadowEffect2: TShadowEffect;
    e_Email: TEdit;
    Pnl_Change_Pass: TPanel;
    Lb_ChangePass: TLabel;
    Lb_Confim_Pass: TLabel;
    Rrc_Confirm_Pass: TRoundRect;
    ShadowEffect5: TShadowEffect;
    E_Confim_Pass: TEdit;
    Lb_Current_pass: TLabel;
    Rrc_Current_Pass: TRoundRect;
    ShadowEffect3: TShadowEffect;
    E_Current_pass: TEdit;
    Lb_New_Pass: TLabel;
    Rrc_New_Pass: TRoundRect;
    ShadowEffect4: TShadowEffect;
    E_New_Pass: TEdit;
  private
    { Private declarations }
  protected
  protected
    procedure InitVariable;Override;
    procedure SetVariable;Override;
    procedure FormatScreen;Override;
    procedure ShowData;Override;
    procedure ShowNoData;Override;
    procedure ClearAllFields;Override;

    function validateSave:Boolean;Override;
    procedure save;Override;
    function ValidateCancel():boolean;Override;
    procedure Cancel;Override;


  public
    { Public declarations }
  end;

var
  CadPerfil: TCadPerfil;

implementation

{$R *.fmx}


{ TCadPerfil }

procedure TCadPerfil.Cancel;
begin
  inherited;

end;

procedure TCadPerfil.ClearAllFields;
begin
  inherited;

end;

procedure TCadPerfil.FormatScreen;
begin
  inherited;

end;

procedure TCadPerfil.InitVariable;
begin
  inherited;

end;

procedure TCadPerfil.save;
begin
  inherited;

end;

procedure TCadPerfil.SetVariable;
begin
  inherited;

end;

procedure TCadPerfil.ShowData;
begin
  inherited;

end;

procedure TCadPerfil.ShowNoData;
begin
  inherited;

end;

function TCadPerfil.ValidateCancel: boolean;
begin

end;

function TCadPerfil.validateSave: Boolean;
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

