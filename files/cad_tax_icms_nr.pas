unit cad_tax_icms_nr;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, base_registry, uniGUIClasses, uniEdit,
  uniLabel, Vcl.Menus, uniMainMenu, uniButton, uniBitBtn, uniSpeedButton,
  uniGUIBaseClasses, uniPanel, ControllerTaxIcmsNR, unmessages, msg_form,
  UnFunctions, Data.DB, Datasnap.DBClient ;

type
  TCadTaxIcmsNr = class(TBaseRegistry)
    E_Group: TUniEdit;
    L_NameCompany: TUniLabel;
    E_Description: TUniEdit;
    L_Codigo: TUniLabel;
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
    TaxIcmsNr : TControllerTaxIcmsNR;
  end;

var
  CadTaxIcmsNr: TCadTaxIcmsNr;

implementation

{$R *.dfm}

{ TCadTaxIcmsNr }

procedure TCadTaxIcmsNr.Delete;
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
      Self.TaxIcmsNr.delete;
      Self.Close;
    End;
  end
  );

end;

procedure TCadTaxIcmsNr.InitVariable;
begin
  inherited;
  TaxIcmsNr := TControllerTaxIcmsNR.create(Self);
end;

procedure TCadTaxIcmsNr.Insert;
begin
  inherited;
  TaxIcmsNr.clear;
  ClearAllFields;
  E_Description.SetFocus;
end;

procedure TCadTaxIcmsNr.Save;
begin
  inherited;
  with TaxIcmsNr.Registro do
  Begin
    Descricao := E_Description.Text;
    Codigo := E_group.Text;
  End;
  TaxIcmsNR.save;

  CodigoRegistro := TaxIcmsNr.Registro.Codigo;
end;

procedure TCadTaxIcmsNr.SetVariable;
begin
  TaxIcmsNR.Registro.Codigo := CodigoRegistro;
  TaxIcmsNr.getByKey;
  inherited;
end;

procedure TCadTaxIcmsNr.ShowData;
begin
  with TaxIcmsNr.Registro do
  Begin
    E_Group.Text := Codigo;
    E_Description.Text := Descricao;
  End;
  inherited;

end;

procedure TCadTaxIcmsNr.ShowNoData;
begin
  inherited;
  ClearAllFields;
end;

function TCadTaxIcmsNr.ValidaInsert: boolean;
begin
//
end;

function TCadTaxIcmsNr.ValidateDelete: boolean;
begin
  Result := true;
end;

function TCadTaxIcmsNr.ValidateSave: boolean;
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

  if trim(E_Group.Text) = '' then
  begin
   MensageAlert(['A T E N Ç Ã O!.',
                  '',
                  'Campo Grupo não informado.',
                  'Preencha o campo para continuar']);
    if E_Group.CanFocus then E_Group.SetFocus;
    Result := False;
    exit;
  end;
end;

end.
