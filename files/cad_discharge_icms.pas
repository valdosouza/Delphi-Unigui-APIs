unit cad_discharge_icms;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, base_registry, uniLabel, uniGUIClasses,
  uniEdit, Vcl.Menus, uniMainMenu, uniButton, uniBitBtn, uniSpeedButton,
  uniGUIBaseClasses, uniPanel, ControllerDischargeIcms, UnFunctions, Data.DB,
  Datasnap.DBClient;

type
  TCadDischargeIcms = class(TBaseRegistry)
    E_Group: TUniEdit;
    L_Codigo: TUniLabel;
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
    DischargeIcms : TControllerDischargeIcms;
  end;

var
  CadDischargeIcms: TCadDischargeIcms;

implementation

{$R *.dfm}

{ TBaseRegistry1 }

uses MainModule, unMessages, msg_form;

{ TCadDischargeIcms }

procedure TCadDischargeIcms.Delete;
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
      Self.DischargeIcms.delete;
      Self.Close;
    End;
  end
  );

end;

procedure TCadDischargeIcms.InitVariable;
begin
  inherited;
  DischargeIcms := TControllerDischargeIcms.create(Self);
end;

procedure TCadDischargeIcms.Insert;
begin
  inherited;
  DischargeIcms.clear;
  ClearAllFields;
  E_Description.SetFocus;
end;

procedure TCadDischargeIcms.Save;
begin
  inherited;
  with DischargeIcms.Registro do
  Begin
    Descricao := E_Description.Text;
    Codigo    := StrToInt(E_Group.Text);
  End;
  DischargeIcms.save;

  CodigoRegistro := DischargeIcms.Registro.Codigo;
end;

procedure TCadDischargeIcms.SetVariable;
begin
  DischargeIcms.Registro.Codigo := CodigoRegistro;
  DischargeIcms.getbyKey;
  inherited;
end;

procedure TCadDischargeIcms.ShowData;
begin
  with DischargeIcms.Registro do
  Begin
    E_Group.Text := IntToStr(Codigo);
    E_Description.Text := Descricao;
  End;
  inherited;
end;

procedure TCadDischargeIcms.ShowNoData;
begin
  inherited;
  ClearAllFields;
end;

function TCadDischargeIcms.ValidaInsert: boolean;
begin
//
end;

function TCadDischargeIcms.ValidateDelete: boolean;
begin
  Result := true;
end;

function TCadDischargeIcms.ValidateSave: boolean;
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
