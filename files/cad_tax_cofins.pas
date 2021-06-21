unit cad_tax_cofins;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, base_registry, uniGUIClasses, uniEdit,
  uniLabel, Vcl.Menus, uniMainMenu, uniButton, uniBitBtn, uniSpeedButton,
  uniGUIBaseClasses, uniPanel,ControllerTaxCofins, MainModule, unMessages, msg_form,
  UnFunctions, Data.DB, Datasnap.DBClient;

type
  TCadTaxCofins = class(TBaseRegistry)
    UniSimplePanel2: TUniSimplePanel;
    L_Codigo: TUniLabel;
    E_Codigo: TUniEdit;
    L_NameCompany: TUniLabel;
    E_Description: TUniEdit;

    procedure InitVariable;Override;
    procedure SetVariable;Override;
    procedure ShowData;Override;
    procedure ShowNoData;Override;
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
    TaxCofins : TControllerTaxCofins;
  end;

var
  CadTaxCofins: TCadTaxCofins;

implementation

{$R *.dfm}


{ TCadTaxCofins }

procedure TCadTaxCofins.Delete;
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
      Self.TaxCofins.delete;
      Self.Close;
    End;
  end
  );

end;
procedure TCadTaxCofins.InitVariable;
begin
  inherited;
  TaxCofins := TControllerTaxCofins.create(Self);
end;


procedure TCadTaxCofins.Insert;
begin
  inherited;
  TaxCofins.clear;
  ClearAllFields;
  E_Description.SetFocus;
end;

procedure TCadTaxCofins.Save;
begin
  inherited;
  with TaxCofins.Registro do
  Begin
    Descricao := E_Description.Text;
    Codigo := E_Codigo.Text;
  End;
  TaxCofins.save;

  CodigoRegistro := TaxCofins.Registro.Codigo;

end;

procedure TCadTaxCofins.SetVariable;
begin
  TaxCofins.Registro.Codigo := CodigoRegistro;
  TaxCofins.getByKey;
  inherited;
end;

procedure TCadTaxCofins.ShowData;
begin
  if TaxCofins.exist then
  Begin
    E_Codigo.Text := TaxCofins.Registro.Codigo;
    E_Description.Text := TaxCofins.Registro.Descricao;

   End;
  inherited;

end;

procedure TCadTaxCofins.ShowNoData;
begin
  inherited;
  ClearAllFields;
end;

function TCadTaxCofins.ValidaInsert: boolean;
begin
 //
end;

function TCadTaxCofins.ValidateDelete: boolean;
begin
  Result := true;
end;

function TCadTaxCofins.ValidateSave: boolean;
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

  if trim(E_Codigo.Text) = '' then
  begin
    MensageAlert(['A T E N Ç Ã O!.',
                  '',
                  'Campo Código não informado.',
                  'Preencha o campo para continuar']);
    if E_Codigo.CanFocus then E_Codigo.SetFocus;
    Result := False;
    exit;
  end;
end;

end.
