unit cad_state;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, base_registry, uniGUIClasses, uniEdit,
  uniLabel, Vcl.Menus, uniMainMenu, uniScrollBox, uniButton, uniBitBtn,
  uniSpeedButton, uniGUIBaseClasses, uniPanel,ControllerState,fm_country,
  unMessages, msg_form, UnFunctions, Data.DB, Datasnap.DBClient;

type
  TCadState = class(TBaseRegistry)
    L_Descricao: TUniLabel;
    L_Codigo: TUniLabel;
    E_Description: TUniEdit;
    E_ID: TUniEdit;
    ctn_country: TUniContainerPanel;
    L_Sigla: TUniLabel;
    E_sigla: TUniEdit;
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
    procedure ShowCountry;

  private
    { Private declarations }
  public
    { Public declarations }
    State : TControllerState;
    FrCountry : TFmCountry;
  end;

var
  CadState: TCadState;

implementation

{$R *.dfm}


procedure TCadState.Delete;
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
        Self.State.delete;
        Self.Close;
      End;
    end
  );
end;

procedure TCadState.FormatScreen;
begin
  inherited;
  ShowCountry;
end;

procedure TCadState.InitVariable;
begin
  inherited;
  State := TControllerState.create(Self);
end;

procedure TCadState.Insert;
begin
  inherited;
  ClearAllFields;
  E_Description.SetFocus;
end;

procedure TCadState.Save;
begin
  inherited;
  with State.Registro do
  Begin
    Codigo := StrToIntDef(E_ID.Text,0);
    CodigoPais:= FrCountry.DBLCB_Lista.KeyValue;
    E_sigla.Text := E_sigla.Text;
    Nome := E_Description.Text;
  End;
  State.save;
  E_ID.Text := IntToStr(State.Registro.codigo);
  //Setando a variavel para controle de botãoe (Alterar/Excluir
  CodigoRegistro := State.Registro.Codigo;
end;

procedure TCadState.SetVariable;
begin
  State.Registro.Codigo := CodigoRegistro;
  State.getByKey;
  inherited;
end;

procedure TCadState.ShowCountry;
begin
  FrCountry := TFmCountry.Create(Self);
  FrCountry.Parent := ctn_Country;
  FrCountry.Show;
end;

procedure TCadState.ShowData;
begin
  //Entidade
  with State.Registro do
  Begin
    FrCountry.DBLCB_Lista.KeyValue := State.Registro.CodigoPais;
    E_ID.Text := IntToStr(State.Registro.Codigo);
    E_sigla.Text := State.Registro.Abreviatura;
    E_Description.Text := State.Registro.Nome;
  End;
  inherited;
end;

procedure TCadState.ShowNoData;
begin
  inherited;
  ClearAllFields;
end;

function TCadState.ValidaInsert: boolean;
begin
//
end;

function TCadState.ValidateDelete: boolean;
begin
  Result := True;
end;

function TCadState.ValidateSave: boolean;
begin
 Result := True;
  if trim(FrCountry.DBLCB_Lista.Text) = '' then
  begin
    MensageAlert(['A T E N Ç Ã O!.',
                  '',
                  'Campo Pais não informado.',
                  'Preencha o campo para continuar']);
    if FrCountry.DBLCB_Lista.CanFocus then FrCountry.DBLCB_Lista.SetFocus;
    Result := False;
    exit;
  end;

  if trim(E_ID.Text) = '' then
  begin
    MensageAlert(['A T E N Ç Ã O!.',
                  '',
                  'Campo código não informado.',
                  'Preencha o campo para continuar']);
    if E_ID.CanFocus then E_ID.SetFocus;
    Result := False;
    exit;
  end;

  if trim(E_sigla.Text) = '' then
  begin
    MensageAlert(['A T E N Ç Ã O!.',
                  '',
                  'Campo sigla não informado.',
                  'Preencha o campo para continuar']);
    if E_sigla.CanFocus then E_sigla.SetFocus;
    Result := False;
    exit;
  end;

  if trim(E_Description.Text) = '' then
  begin
    MensageAlert(['A T E N Ç Ã O!.',
                  '',
                  'Campo Descrição do Estado não informado.',
                  'Preencha o campo para continuar']);
    if E_Description.CanFocus then E_Description.SetFocus;
    Result := False;
    exit;
  end;

end;

end.
