unit cad_deter_base_tax_icms;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, base_registry, Vcl.Menus, uniMainMenu,
  uniButton, uniBitBtn, uniSpeedButton, uniGUIBaseClasses, uniGUIClasses,
  uniPanel, uniEdit, uniLabel, unmessages, msg_form, ControllerDeterBaseTaxIcms,
  UnFunctions, Data.DB, Datasnap.DBClient;

type
  TCadDeterBaseTaxIcms = class(TBaseRegistry)
    L_Codigo: TUniLabel;
    E_Group: TUniEdit;
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
    DeterBaseTaxIcms : TControllerDeterBaseTaxIcms;
  end;

var
  CadDeterBaseTaxIcms: TCadDeterBaseTaxIcms;

implementation

{$R *.dfm}

{ TCadDeterBaseTaxIcms }

procedure TCadDeterBaseTaxIcms.Delete;
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
      Self.DeterBaseTaxIcms.delete;
      Self.Close;
    End;
  end
  );

end;

procedure TCadDeterBaseTaxIcms.InitVariable;
begin
  inherited;
  DeterBaseTaxIcms := TControllerDeterBaseTaxIcms.create(Self);
end;

procedure TCadDeterBaseTaxIcms.Insert;
begin
  inherited;
  DeterBaseTaxIcms.clear;
  ClearAllFields;
  E_Description.SetFocus;
end;

procedure TCadDeterBaseTaxIcms.Save;
begin
  inherited;
  with DeterBaseTaxIcms.Registro do
  Begin
    Descricao := E_Description.Text;
    codigo := E_group.Text;
  End;
  DeterBaseTaxIcms.save;
  //Setando a variavel para controle de botãoe (Alterar/Excluir
  CodigoRegistro := DeterBaseTaxIcms.Registro.Codigo;
end;

procedure TCadDeterBaseTaxIcms.SetVariable;
begin
  DeterBaseTaxIcms.Registro.Codigo := CodigoRegistro;
  DeterBaseTaxIcms.getByKey;
  inherited;
end;

procedure TCadDeterBaseTaxIcms.ShowData;
begin
  with DeterBaseTaxIcms.Registro do
  Begin
    E_Group.Text := Codigo;
    E_Description.Text := Descricao;
  End;
  inherited;

end;

procedure TCadDeterBaseTaxIcms.ShowNoData;
begin
  inherited;
  ClearAllFields;
end;

function TCadDeterBaseTaxIcms.ValidaInsert: boolean;
begin
//
end;

function TCadDeterBaseTaxIcms.ValidateDelete: boolean;
begin
  Result := true;
end;

function TCadDeterBaseTaxIcms.ValidateSave: boolean;
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
