unit cad_package;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, base_registry, Vcl.Menus, uniMainMenu,
  uniButton, uniBitBtn, uniSpeedButton, uniGUIBaseClasses, uniGUIClasses,
  uniPanel, ControllerPackage, uniCheckBox, uniEdit, uniLabel, UnFunctions,
  Data.DB, Datasnap.DBClient;

type
  TCadPackage = class(TBaseRegistry)
    L_Codigo: TUniLabel;
    L_NameCompany: TUniLabel;
    E_Description: TUniEdit;
    E_ID: TUniEdit;
    chbx_cad_active: TUniCheckBox;
    UniLabel1: TUniLabel;
    E_Abbreviation: TUniEdit;
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
    Package: TControllerPackage;
  end;

var
  CadPackage: TCadPackage;

implementation

{$R *.dfm}

uses MainModule, unMessages, msg_form;

{ TCadPackage }

procedure TCadPackage.ClearAllFields;
begin
  inherited;
  Package.clear;
  Package.Institution.Estabelecimento := 0;
  Package.Institution.CodigoEmbalagem := 0;
  Package.Institution.Ativo := 'N';

end;

procedure TCadPackage.Delete;
Var
  lPackage :TControllerPackage;
begin
  lPackage := TControllerPackage.Create(Self);
  lPackage := Package;
  MensageYesNo(['C O N F I R M A Ç Ã O!',
                '',
                'Deseja realmente excluir este registro?',
                'clique em SIM para confirmar.'],mpAlerta);
    FormMsg.ShowModal(
      Procedure(Sender: TComponent; AResult:Integer)
      begin
        if (Sender as TMsgForm).BotaoEscolhido > 0 then
        Begin
          lPackage.desactiveRegiter;
          FreeAndNil(lPackage);
          Self.Close;
        End;
      end
    );
end;


procedure TCadPackage.InitVariable;
begin
  inherited;
  Package := TControllerPackage.create(Self);

end;

procedure TCadPackage.Insert;
begin
  inherited;
  ClearAllFields;
  E_Description.SetFocus;
end;

procedure TCadPackage.Save;
begin
  inherited;
  with Package.Registro do
  Begin
    Descricao := E_Description.Text;
    Abreviatura := E_Abbreviation.Text;
  End;
  with Package.Institution do
  Begin
    Estabelecimento := UMM.GInstitution.registro.Codigo;
    if chbx_cad_active.Checked then
     Package.Institution.Ativo := 'S'
    else
      Package.Institution.Ativo := 'N';
  End;
  Package.saveByDescription;
  //Setando a variavel para controle de botãoe (Alterar/Excluir
  CodigoRegistro := Package.Registro.codigo;
  E_ID.Text := IntToStr(Package.Registro.codigo);
end;

procedure TCadPackage.SetVariable;
begin
  Package.Registro.Codigo := CodigoRegistro;
  Package.Institution.Estabelecimento := UMM.GInstitution.registro.Codigo;
  Package.getbyKey;
  inherited;
end;

procedure TCadPackage.ShowData;
begin
  if Package.exist then
  Begin
    E_ID.Text := IntToStr(Package.Registro.Codigo);
    E_Description.Text := Package.Registro.Descricao;
    E_Abbreviation.Text := Package.Registro.Abreviatura;
    chbx_cad_active.Checked := (Package.Institution.Ativo = 'S');
  End;
  inherited;
end;

procedure TCadPackage.ShowNoData;
begin
  inherited;
  ClearAllFields;
end;

function TCadPackage.ValidaInsert: boolean;
begin
  inherited;
  //
end;

function TCadPackage.ValidateDelete: boolean;
begin
  Result := true;
end;

function TCadPackage.ValidateSave: boolean;
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

  if trim(E_Abbreviation.Text) = '' then
  begin
    MensageAlert(['A T E N Ç Ã O!.',
                  '',
                  'Campo Abreviação não informado.',
                  'Preencha o campo para continuar']);
    if E_Abbreviation.CanFocus then E_Abbreviation.SetFocus;
    Result := False;
    exit;
  end;
end;

end.
