unit cad_su_user;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cad_user, Vcl.Menus, uniMainMenu,
  uniCheckBox, uniGUIClasses, uniEdit, uniLabel, uniButton, uniBitBtn,
  uniSpeedButton, uniGUIBaseClasses, uniPanel;

type
  TCadSuUser = class(TCadUser)
    procedure SetVariable;Override;
    procedure Save;Override;
    procedure SaveInnerInstitution;override;
  private
    { Private declarations }
  public
    Institution : Integer;
  end;

var
  CadSuUser: TCadSuUser;

implementation

{$R *.dfm}

{ TCadUser1 }

procedure TCadSuUser.Save;
begin
  SaveMailing;
  SaveEntity;
  SaveEntityHasMailing;
  SaveUser;
  SaveInnerInstitution;
  ShowData;
end;

procedure TCadSuUser.SaveInnerInstitution;
begin
  with USer.HasInstitution.Registro do
  Begin
    Estabelecimento := Institution; //Este campo é substituido pelo conteudo da interface
    Usuario := User.Registro.Codigo;
    if chbx_cad_active.Checked then
      Ativo := 'S'
    else
      Ativo := 'N';
  End;
  USer.HasInstitution.save;
end;

procedure TCadSuUser.SetVariable;
begin
  User.Registro.Codigo := CodigoRegistro;
  User.hasInstitution.Registro.Estabelecimento := Institution;
  User.getbyKey;
  //Entidade
  User.Entity.Registro.Codigo := User.Registro.Codigo;
  User.Entity.getbyKey;
  //Mailing
  User.Mailing.getbyKind(User.Entity.Registro.Codigo,'sistema');
  inherited;
end;

end.
