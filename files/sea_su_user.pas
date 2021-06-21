unit sea_su_user;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, sea_user, Datasnap.Provider, Data.DB,
  Datasnap.DBClient, uniButton, uniBitBtn, uniSpeedButton, uniCheckBox, uniEdit,
  uniLabel, uniGUIClasses, uniBasicGrid, uniDBGrid, uniPageControl,
  uniGUIBaseClasses, uniPanel, cad_su_user, MainModule;

type
  TSeaSuUser = class(TSeaUser)
    procedure SetParameters;Override;
    procedure GetView;Override;
  private
    { Private declarations }

  public
    { Public declarations }
    Institution : Integer;
  end;

var
  SeaSuUser: TSeaSuUser;

implementation

{$R *.dfm}

{ TSeaSuUser }

procedure TSeaSuUser.GetView;
Var
  Form : TCadSuUser;
begin
  if Form = nil then
    Form := TCadSuUser.Create(UniApplication);
  Form.Institution := Institution;
  Form.CodigoRegistro := cds_searchid.AsInteger;
  Form.Show(
    Procedure(Sender: TComponent; AResult:Integer)
    begin
      Form := nil;
    end
  );
end;

procedure TSeaSuUser.SetParameters;
begin
  inherited;
  with UMM.Qr_Crud do
  Begin
    ParamByName('tb_institution_id').AsInteger := Institution;

    if E_Name_Company.Text <> '' then
      ParamByName('name_company').AsString := '%' + E_Name_Company.Text + '%';

    if E_Email.Text <> '' then
      ParamByName('email').AsString := '%' + E_Email.Text + '%' ;

    if chbx_cadAtivo.Checked then
      ParamByName('active').AsString := 'S'
    else
      ParamByName('active').AsString := 'N';

  end;
end;

end.
