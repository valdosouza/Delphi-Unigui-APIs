unit cad_tax_icms_sn;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, base_registry, Vcl.Menus, uniMainMenu,
  uniButton, uniBitBtn, uniSpeedButton, uniGUIBaseClasses, uniGUIClasses,uniPanel,
  UniEdit,UniLabel,ControllerTaxIcmsSN, MainModule, unMessages, msg_form,
  UnFunctions, Data.DB, Datasnap.DBClient;

type
  TCadTaxIcmsSN = class(TBaseRegistry)
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
    TaxIcmsSN : TControllerTaxIcmsSN;
  end;

var
  CadTaxIcmsSN: TCadTaxIcmsSN;

implementation

{$R *.dfm}

{ TCadTaxIcmsSN }

procedure TCadTaxIcmsSN.Delete;
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
      Self.TaxIcmsSN.delete;
      Self.Close;
    End;
  end
  );

end;

procedure TCadTaxIcmsSN.InitVariable;
begin
  inherited;
  TaxIcmsSN := TControllerTaxIcmsSN.create(Self);
end;

procedure TCadTaxIcmsSN.Insert;
begin
  inherited;
  TaxIcmsSN.clear;
  ClearAllFields;
  E_Description.SetFocus;
end;

procedure TCadTaxIcmsSN.Save;
begin
  inherited;
  with TaxIcmsSN.Registro do
  Begin
    Codigo := E_Codigo.Text;
    Descricao := E_Description.Text;
  End;
  TaxIcmsSN.save;
  CodigoRegistro := TaxIcmsSN.Registro.Codigo;
end;

procedure TCadTaxIcmsSN.SetVariable;
begin
  TaxIcmsSN.Registro.Codigo := CodigoRegistro;
  TaxIcmsSN.getByKey;
  inherited;
end;

procedure TCadTaxIcmsSN.ShowData;
begin
  if TaxIcmsSN.exist then
  Begin
    E_Codigo.Text := TaxIcmsSN.Registro.Codigo;
    E_Description.Text := TaxIcmsSN.Registro.Descricao;
   End;
  inherited;

end;

procedure TCadTaxIcmsSN.ShowNoData;
begin
  inherited;
  ClearAllFields;
end;

function TCadTaxIcmsSN.ValidaInsert: boolean;
begin
 //
end;

function TCadTaxIcmsSN.ValidateDelete: boolean;
begin
  Result := true;
end;

function TCadTaxIcmsSN.ValidateSave: boolean;
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
                  'Campo Grupo Taxa não informado.',
                  'Preencha o campo para continuar']);
    if E_Codigo.CanFocus then E_Codigo.SetFocus;
    Result := False;
    exit;
  end;
end;

end.
