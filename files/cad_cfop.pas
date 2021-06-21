unit cad_cfop;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, base_registry, Vcl.Menus, uniMainMenu,
  uniButton, uniBitBtn, uniSpeedButton, uniGUIBaseClasses, uniGUIClasses,
  uniPanel,UniEdit,UniLabel,UniRadioGroup,UniMemo,ControllerCfop,MainModule, unMessages,
  msg_form, System.AnsiStrings, UnFunctions, Data.DB, Datasnap.DBClient;

type
  TCadCfop = class(TBaseRegistry)
    E_Consise: TUniEdit;
    E_Register: TUniEdit;
    UniLabel3: TUniLabel;
    c: TUniLabel;
    Rg_way: TUniRadioGroup;
    Rg_Jurisdiction: TUniRadioGroup;
    Rg_Enabled: TUniRadioGroup;
    UniLabel6: TUniLabel;
    M_Note: TUniMemo;
    E_Cfop: TUniEdit;
    UniLabel2: TUniLabel;
    E_Description: TUniEdit;
    UniLabel4: TUniLabel;
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
    Cfop : TControllerCfop
  end;

var
  CadCfop: TCadCfop;

implementation

{$R *.dfm}

{ TCadCfop }

procedure TCadCfop.Delete;
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
      Self.Cfop.delete;
      Self.Close;
    End;
  end
  );

end;

procedure TCadCfop.InitVariable;
begin
  Cfop := TControllerCfop.create(Self);
  inherited;

end;


procedure TCadCfop.Insert;
begin
  inherited;
  Cfop.clear;
  ClearAllFields;
  E_Description.SetFocus;
end;

procedure TCadCfop.Save;
begin
  inherited;
  with Cfop.Registro do
  Begin
    //Codigo cfop pode ser salvo aqui, pois o codigo dele deve ser Setado pelo usuario
    Codigo     := E_Cfop.Text;
    Conciso    := E_Consise.Text;
    Descricao  := E_Description.Text;
    Registro   := StrToIntDef(E_Register.Text,0);
    Observacao := M_Note.Text;
    if Rg_way.ItemIndex = 0 then
      Direcao := 'E'
    else
      Direcao := 'S';
    case Rg_Jurisdiction.ItemIndex of
      0: Alcada := 'E';
      1: Alcada := 'N';
      2: Alcada := 'X';
    end;
    if Rg_Enabled.ItemIndex = 0 then
      Ativo := 'S'
    else
      Ativo := 'N';
    End;
    Cfop.save;

end;

procedure TCadCfop.SetVariable;
begin
  Cfop.Registro.Codigo := IntToStr(CodigoRegistro);
  Cfop.getbyKey;
  inherited;
end;

procedure TCadCfop.ShowData;
begin
  with Cfop.Registro do
  Begin
    E_Cfop.Text := Codigo;
    E_Consise.Text := Conciso;
    E_Description.Text := Descricao;
    E_Register.Text := IntToStr (Registro);
    M_Note.Text := Cfop.Registro.Observacao;
    if Cfop.Registro.Direcao = 'E' then
      Rg_way.ItemIndex := 0
    else
      Rg_way.ItemIndex := 1;

    case AnsiIndexStr(UpperCase(Alcada), ['E', 'N','X']) of
      0 : Rg_Jurisdiction.ItemIndex := 0;
      1 : Rg_Jurisdiction.ItemIndex := 1;
      2 : Rg_Jurisdiction.ItemIndex := 2;
    end;

    if Cfop.Registro.Ativo = 'S' then
      Rg_Enabled.ItemIndex := 0
    else
      Rg_Enabled.ItemIndex := 1;
  End;
  inherited;
End;

procedure TCadCfop.ShowNoData;
begin
  inherited;
  ClearAllFields;
end;

function TCadCfop.ValidaInsert: boolean;
begin
//
end;

function TCadCfop.ValidateDelete: boolean;
begin
  Result := true;
end;

function TCadCfop.ValidateSave: boolean;
begin
  Result := True;
  if trim(E_Description.Text) = '' then
  begin
    MensageAlert(['A T E N Ç Ã O!.',
                  '',
                  'Campo Descrição Completa não informado.',
                  'Preencha o campo para continuar']);
    if E_Description.CanFocus then E_Description.SetFocus;
    Result := False;
    exit;
  end;

  if trim(E_Consise.Text) = '' then
  begin
    MensageAlert(['A T E N Ç Ã O!.',
                  '',
                  'Campo Descrição Resumida não informado.',
                  'Preencha o campo para continuar']);
    if E_Consise.CanFocus then E_Consise.SetFocus;
    Result := False;
    exit;
  end;

  if trim(E_Cfop.Text) = '' then
  begin
    MensageAlert(['A T E N Ç Ã O!.',
                  '',
                  'Campo C.F.O.P não informado.',
                  'Preencha o campo para continuar']);
    if E_Cfop.CanFocus then E_Cfop.SetFocus;
    Result := False;
    exit;
  end;
end;


end.
