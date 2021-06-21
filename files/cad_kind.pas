unit cad_kind;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, base_registry, Vcl.Menus, uniMainMenu,
  Data.DB, Datasnap.DBClient, uniButton, uniBitBtn, uniSpeedButton,
  uniGUIBaseClasses, uniGUIClasses, uniPanel, uniEdit, uniLabel, uniMultiItem,
  uniComboBox, uniMemo, Controllerkind, unmessages, UnFunctions, msg_form,
  MainModule;

type
  TCadKind = class(TBaseRegistry)
    L_Codigo: TUniLabel;
    E_ID: TUniEdit;
    L_Description: TUniLabel;
    E_Description: TUniEdit;
    UniLabel1: TUniLabel;
    M_Detail: TUniMemo;
    UniLabel2: TUniLabel;
    Cb_Custo: TUniComboBox;
  private
    { Private declarations }
  protected
    procedure InitVariable;Override;
    procedure SetVariable;Override;
    procedure FormatScreen;Override;
    procedure ShowData;Override;
    procedure ShowNoData;Override;
    function ValidaInsert():boolean;Override;
    procedure Insert;Override;
    function ValidateSave: boolean;Override;
    procedure Save;Override;
    function ValidateDelete:boolean;Override;
    procedure Delete;Override;
  public
    { Public declarations }
    Kind : TTaskKind;
  end;

var
  CadKind: TCadKind;

implementation

{$R *.dfm}

{ TCadKind }

procedure TCadKind.Delete;
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
      Self.Kind.delete;
      Self.Close;
    End;
  end
  );


end;

procedure TCadKind.FormatScreen;
begin
  inherited;
end;

procedure TCadKind.InitVariable;
begin
  inherited;
  Kind := TTaskKind.Create(Self);
end;

procedure TCadKind.Insert;
begin
  inherited;
  Kind.clear;
  ClearAllFields;
  E_Description.SetFocus;
end;

procedure TCadKind.Save;
begin
  inherited;
  with Kind.Registro do
  Begin
    Descricao := E_Description.Text;
    Detalhe := M_Detail.Text;
    Estabelecimento := UMM.GInstitution.registro.Codigo;
    DonoDoCusto := IntToStr(Cb_custo.ItemIndex);
  End;
  Kind.save;
  E_ID.Text := IntToStr(Kind.Registro.codigo);

end;

procedure TCadKind.SetVariable;
begin
  Kind.Registro.Codigo          := CodigoRegistro;
  Kind.Registro.Estabelecimento := UMM.GInstitution.registro.Codigo;
  Kind.getByKey;
  inherited;
end;

procedure TCadKind.ShowData;
begin
  with Kind.Registro do
  Begin
    E_ID.Text           := IntToStr(Codigo);
    E_Description.Text  := Descricao;
    M_Detail.Text       := Detalhe;
    Cb_Custo.ItemIndex  := StrToIntDef(DonoDoCusto,0);
  end;
  inherited;
end;

procedure TCadKind.ShowNoData;
begin
  inherited;
  ClearAllFields;
end;

function TCadKind.ValidaInsert: boolean;
begin

end;

function TCadKind.ValidateDelete: boolean;
begin
 Result := true;
end;

function TCadKind.ValidateSave: boolean;
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
  if trim(M_Detail.Text) = '' then
  begin
    MensageAlert(['A T E N Ç Ã O!.',
                  '',
                  'Campo Detalhe não informado.',
                  'Preencha o campo para continuar']);
    if E_Description.CanFocus then E_Description.SetFocus;
    Result := False;
    exit;
  end;
  if trim(Cb_Custo.Text) = '' then
  begin
    MensageAlert(['A T E N Ç Ã O!.',
                  '',
                  'Campo custo não informado.',
                  'Preencha o campo para continuar']);
    if E_Description.CanFocus then E_Description.SetFocus;
    Result := False;
    exit;
  end;

end;

end.
