unit cad_color;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, base_registry, Vcl.Menus, uniMainMenu,
  uniButton, uniBitBtn, uniSpeedButton, uniGUIBaseClasses, uniGUIClasses,
  uniPanel, ControllerColor, uniCheckBox, uniEdit, uniLabel, UnFunctions,
  Data.DB, Datasnap.DBClient;

type
  TCadColor = class(TBaseRegistry)
    L_Codigo: TUniLabel;
    L_NameCompany: TUniLabel;
    E_Description: TUniEdit;
    E_ID: TUniEdit;
    chbx_cad_active: TUniCheckBox;
    procedure InitVariable;Override;
    procedure SetVariable;Override;
    procedure ShowData;Override;
    procedure ShowNoData;Override;
    procedure ClearAllFields;Override;
    function ValidaInsert():boolean;Override;
    procedure Insert;Override;
    function ValidateSave: boolean;Override;
    procedure Save;Override;
    function ValidateDelete:boolean;Override;
    procedure Delete;Override;
  private
    { Private declarations }
  public
    { Public declarations }
    Color : TControllerColor;
  end;

var
  CadColor: TCadColor;

implementation

{$R *.dfm}

uses MainModule, msg_form, unMessages;

{ TCadColor }

procedure TCadColor.ClearAllFields;
begin
  inherited;
  Color.clear;
  Color.Institution.Estabelecimento := 0;
  Color.Institution.CodigoCor := 0;
  Color.Institution.Ativo := 'N';
end;

procedure TCadColor.Delete;
begin
  MensageYesNo(['C O N F I R M A Ç Ã O!',
                '',
                'Deseja realmente excluir este registro?',
                'clique em SIM para confirmar.'],mpAlerta);
  FormMsg.ShowModal(
  Procedure(Sender: TComponent; AResult:Integer)
  begin
    if (Sender as TMsgForm).BotaoEscolhido > 0 then
    Begin
      Self.Color.desactiveRegiter;
      Self.Close;
    End;
  end
  );

end;

procedure TCadColor.InitVariable;
begin
  inherited;
  Color := TControllerColor.create(Self);
end;

procedure TCadColor.Insert;
begin
  inherited;
  ClearAllFields;
  E_Description.SetFocus;
end;

procedure TCadColor.Save;
begin
  inherited;
  with Color.Registro do
  Begin
    Descricao := E_Description.Text;
  End;
  with Color.Institution do
  Begin
    Estabelecimento := UMM.GInstitution.registro.Codigo;
    if chbx_cad_active.Checked then
      color.Institution.Ativo := 'S'
    else
      color.Institution.Ativo := 'N';
  End;
  color.saveByDescription;
 //Setando a variavel para controle de botãoe (Alterar/Excluir
 CodigoRegistro := Color.Registro.Codigo;
 E_ID.Text := IntToStr(Color.Registro.codigo);
end;

procedure TCadColor.SetVariable;
begin
  CodigoRegistro := Color.Registro.Codigo;
  Color.Institution.Estabelecimento := UMM.GInstitution.registro.Codigo;
  Color.getbyKey;
  inherited;
end;

procedure TCadColor.ShowData;
begin
  if Color.exist then
  Begin
    E_ID.Text := IntToStr(Color.Registro.Codigo);
    E_Description.Text := Color.Registro.Descricao;
    chbx_cad_active.Checked := (Color.Institution.Ativo = 'S');
  End;
  inherited;
end;

procedure TCadColor.ShowNoData;
begin
  inherited;
  ClearAllFields;

end;

function TCadColor.ValidaInsert: boolean;
begin
  inherited;
  //
end;

function TCadColor.ValidateDelete: boolean;
begin
  Result := true;
end;

function TCadColor.ValidateSave: boolean;
begin
  Result := True;
  if trim(E_Description.Text) = '' then
  begin
    MensageAlert(['A T E N Ç Ã O!.',
                  '',
                  'Campo Descrição não informado.',
                  'Preencha o campo para continuar']);
    if E_Description.CanFocus then E_Description.SetFocus;
    Result := False;
    exit;
  end;
end;

end.
