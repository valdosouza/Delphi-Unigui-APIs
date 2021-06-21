
unit cad_tax_pis;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, base_registry, Vcl.Menus, uniMainMenu,
  uniButton, uniBitBtn, uniSpeedButton, uniGUIBaseClasses, uniGUIClasses,
  uniPanel, uniEdit, uniLabel, unmessages, msg_form, ControllerTaxPIS,
  UnFunctions, Data.DB, Datasnap.DBClient;

type
  TcadTaxPis = class(TBaseRegistry)
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
    TaxPis : TControllerTaxPIS;
  end;

var
  cadTaxPis: TcadTaxPis;

implementation

{$R *.dfm}

{ TcadTaxPis }

procedure TcadTaxPis.Delete;
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
      Self.TaxPis.delete;
      Self.Close;
    End;
  end
  );

end;

procedure TcadTaxPis.InitVariable;
begin
  inherited;
  TaxPis := TControllerTaxPIS.create(Self);
end;

procedure TcadTaxPis.Insert;
begin
  inherited;
  TaxPis.clear;
  ClearAllFields;
  E_Description.SetFocus;
end;

procedure TcadTaxPis.Save;
begin
  inherited;
  with TaxPis.Registro do
  Begin
    Codigo := E_Codigo.Text;
    Descricao := E_Description.Text;

  End;
  TaxPis.save;

  CodigoRegistro := TaxPis.Registro.Codigo;
end;

procedure TcadTaxPis.SetVariable;
begin
  TaxPis.Registro.Codigo := CodigoRegistro;
  TaxPis.getByKey;
  inherited;
end;

procedure TcadTaxPis.ShowData;
begin
  with TaxPis.Registro do
  Begin
    E_Codigo.Text := Codigo;
    E_Description.Text := Descricao;
  End;
  inherited;

end;

procedure TcadTaxPis.ShowNoData;
begin
  inherited;
  ClearAllFields;
end;

function TcadTaxPis.ValidaInsert: boolean;
begin
//
end;

function TcadTaxPis.ValidateDelete: boolean;
begin
  Result := true;
end;

function TcadTaxPis.ValidateSave: boolean;
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
                  'Campo Grupo não informado.',
                  'Preencha o campo para continuar']);
    if E_Codigo.CanFocus then E_Codigo.SetFocus;
    Result := False;
    exit;
  end;
end;

end.
