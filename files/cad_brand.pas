unit cad_brand;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, base_registry, Vcl.Menus, uniMainMenu,
  uniButton, uniBitBtn, uniSpeedButton, uniGUIBaseClasses, uniGUIClasses,
  uniPanel, uniCheckBox, uniEdit, uniLabel, ControllerBrand, UnFunctions,
  Data.DB, Datasnap.DBClient;

type
  TCadBrand = class(TBaseRegistry)
    L_Codigo: TUniLabel;
    L_NameCompany: TUniLabel;
    E_Description: TUniEdit;
    E_ID: TUniEdit;
    chbx_cad_active: TUniCheckBox;

  private
    { Private declarations }

  protected
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

  public
    { Public declarations }
    Brand : TControllerBrand;
  end;

var
  CadBrand: TCadBrand;

implementation

{$R *.dfm}

uses MainModule, unMessages, msg_form;

{ TCadBrand }

procedure TCadBrand.ClearAllFields;
begin
  inherited;
  Brand.clear;
  Brand.Institution.Estabelecimento := 0;
  Brand.Institution.CodigoMarca := 0;
  Brand.Institution.Ativo := 'N';
end;

procedure TCadBrand.Delete;
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
      Self.Brand.desactiveRegiter;
      Self.Close;
    End;
  end
  );

end;

procedure TCadBrand.InitVariable;
begin
  inherited;
  Brand := TControllerBrand.create(Self);
end;

procedure TCadBrand.Insert;
begin
  inherited;
  ClearAllFields;
  E_Description.SetFocus;
end;

procedure TCadBrand.Save;
begin
  inherited;
  with Brand.Registro do
  Begin
    Descricao := E_Description.Text;
  End;
  with Brand.Institution do
  Begin
    Estabelecimento := UMM.GInstitution.registro.Codigo;
    if chbx_cad_active.Checked then
      Brand.Institution.Ativo := 'S'
    else
      Brand.Institution.Ativo := 'N';
  End;
  Brand.saveByDescription;
  //Setando a variavel para controle de botãoe (Alterar/Excluir
  CodigoRegistro := Brand.Registro.Codigo;
  E_ID.Text := IntToStr(Brand.Registro.codigo);
end;

procedure TCadBrand.SetVariable;
begin
  Brand.Registro.Codigo := CodigoRegistro ;
  Brand.Institution.Estabelecimento := UMM.GInstitution.registro.Codigo;
  Brand.getbyKey;
  inherited;
end;

procedure TCadBrand.ShowData;
begin
  if Brand.exist then
  Begin
    E_ID.Text := IntToStr(Brand.Registro.Codigo);
    E_Description.Text := Brand.Registro.Descricao;
    chbx_cad_active.Checked := (Brand.Institution.Ativo = 'S');
  End;
  inherited;

end;

procedure TCadBrand.ShowNoData;
begin
  inherited;
  ClearAllFields;
end;

function TCadBrand.ValidaInsert: boolean;
begin
  Result := True;
end;

function TCadBrand.ValidateDelete: boolean;
begin
  Result := true;
end;

function TCadBrand.ValidateSave: boolean;
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
