unit cad_tax_ipi;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, base_registry, Vcl.Menus, uniMainMenu,
  uniButton, uniBitBtn, uniSpeedButton, uniGUIBaseClasses, uniGUIClasses,
  uniPanel, uniEdit, uniLabel, ControllerTaxIPI, unmessages, msg_form,
  UnFunctions, Data.DB, Datasnap.DBClient;

type
  TcadTaxIpi = class(TBaseRegistry)
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
    TaxIpi : TControllerTaxIPI;
  end;

var
  cadTaxIpi: TcadTaxIpi;

implementation

{$R *.dfm}

{ TcadTaxIpi }

procedure TcadTaxIpi.Delete;
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
      Self.TaxIpi.delete;
      Self.Close;
    End;
  end
  );

end;

procedure TcadTaxIpi.InitVariable;
begin
  inherited;
  TaxIpi := TControllerTaxIPI.create(Self);
end;

procedure TcadTaxIpi.Insert;
begin
  inherited;
  TaxIpi.clear;
  ClearAllFields;
  E_Description.SetFocus;
end;

procedure TcadTaxIpi.Save;
begin
  inherited;
  with TaxIpi.Registro do
  Begin
    Descricao := E_Description.Text;
    Codigo := E_group.Text;
  End;
  TaxIpi.save;
  CodigoRegistro := TaxIpi.Registro.Codigo;
end;

procedure TcadTaxIpi.SetVariable;
begin
  TaxIpi.Registro.Codigo := CodigoRegistro;
  TaxIpi.getByKey;
  inherited;
end;

procedure TcadTaxIpi.ShowData;
begin
  with TaxIpi.Registro do
  Begin
    E_Group.Text := Codigo;
    E_Description.Text := Descricao;
  End;
  inherited;

end;

procedure TcadTaxIpi.ShowNoData;
begin
  inherited;
  ClearAllFields;
end;

function TcadTaxIpi.ValidaInsert: boolean;
begin
//
end;

function TcadTaxIpi.ValidateDelete: boolean;
begin
  Result := true;
end;

function TcadTaxIpi.ValidateSave: boolean;
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
                  'Campo Código não informado.',
                  'Preencha o campo para continuar']);
    if E_Group.CanFocus then E_Group.SetFocus;
    Result := False;
    exit;
  end;
end;

end.
