unit cad_city;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, base_registry, Vcl.Menus, uniMainMenu,
  uniScrollBox, uniButton, uniBitBtn, uniSpeedButton, uniGUIBaseClasses,
  uniGUIClasses, uniPanel, uniEdit, uniLabel, fm_state, ControllerCity, unmessages, msg_form,
  UnFunctions, Data.DB, Datasnap.DBClient;

type
  TCadCity = class(TBaseRegistry)
    ctn_state: TUniContainerPanel;
    L_Descricao: TUniLabel;
    L_Codigo: TUniLabel;
    E_City: TUniEdit;
    E_ID: TUniEdit;
    L_ibge: TUniLabel;
    E_ibge: TUniEdit;
    L_Aliq_Iss: TUniLabel;
    E_Aliq_Iss: TUniFormattedNumberEdit;
  private
  protected
    procedure InitVariable;Override;
    procedure SetVariable;Override;
    procedure FormatScreen;Override;
    procedure ShowData;Override;
    procedure ShowNoData;Override;
    //Inserir
    function ValidaInsert():boolean;Override;
    procedure Insert;Override;
    //Salvar
    function ValidateSave: boolean;Override;
    procedure Save;Override;
    //Deletar
    function ValidateDelete:boolean;Override;
    procedure Delete;Override;

    procedure EditionControl;Override;
  public
    FrState : TFmState;
    City : TControllerCity;
    procedure ShowState;
  end;

var
  CadCity: TCadCity;

implementation

{$R *.dfm}


procedure TCadCity.Delete;
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
        Self.city.delete;
        Self.Close;
      End;
    end
  );
end;

procedure TCadCity.EditionControl;
begin
  inherited;
  EditionControler(FrState);
end;

procedure TCadCity.FormatScreen;
begin
  inherited;
  ShowState;
end;
procedure TCadCity.InitVariable;
begin
  inherited;
  City := TControllerCity.create(Self);
end;

procedure TCadCity.Insert;
begin
  inherited;
  ClearAllFields;
  E_ID.SetFocus;
end;

procedure TCadCity.Save;
begin
  inherited;
  with City.Registro do
  Begin
    Codigo := StrToIntDef(E_ID.Text,0);
    CodigoEstado:= FrState.DBLCB_Lista.KeyValue;
    Nome := E_City.Text;
    AliquotaISS := StrToFloatDef(E_Aliq_Iss.Text,0);
  End;
  City.save;
  E_ID.Text := IntToStr(City.Registro.codigo);
  //Setando a variavel para controle de botãoe (Alterar/Excluir
  CodigoRegistro := City.Registro.Codigo;
end;

procedure TCadCity.SetVariable;
begin
  City.Registro.Codigo := CodigoRegistro;
  City.getByKey;
  inherited;
end;

procedure TCadCity.ShowData;
Begin
  with City.Registro do
  Begin
    FrState.DBLCB_Lista.KeyValue := City.Registro.CodigoEstado;
    E_ID.Text := IntToStr(City.Registro.Codigo);
    E_City.Text := City.Registro.Nome;
    E_ibge.Text := City.Registro.IBGE;
    E_Aliq_Iss.Text := FloatToStr( City.Registro.AliquotaISS);
  End;
  inherited;
end;

procedure TCadCity.ShowNoData;
begin
  inherited;
  ClearAllFields;
end;

procedure TCadCity.ShowState;
begin
  FrState := TFmState.Create(Self);
  FrState.Parent := ctn_state;
  FrState.Align := alClient;
  FrState.Listar(1058);
  FrState.Show;
end;

function TCadCity.ValidaInsert: boolean;
begin
  Result := True;
end;

function TCadCity.ValidateDelete: boolean;
begin
  Result := True;
end;

function TCadCity.ValidateSave: boolean;
begin
 Result := True;
  if trim(FrState.DBLCB_Lista.Text) = '' then
  begin
    MensageAlert(['A T E N Ç Ã O!.',
                  '',
                  'Campo Estado não informado.',
                  'Preencha o campo para continuar']);
    Result := False;
    exit;
  end;

  if trim(E_ID.Text) = '' then
  begin
    MensageAlert(['A T E N Ç Ã O!.',
                  '',
                  'Campo Código não informado.',
                  'Preencha o campo para continuar']);
    if E_ID.CanFocus then E_ID.SetFocus;
    Result := False;
    exit;
  end;

  if trim(E_City.Text) = '' then
  begin
    MensageAlert(['A T E N Ç Ã O!.',
                  '',
                  'Campo Cidade não informado.',
                  'Preencha o campo para continuar']);
    if E_City.CanFocus then E_City.SetFocus;
    Result := False;
    exit;
  end;

  if trim(E_ibge.Text) = '' then
  begin
    MensageAlert(['A T E N Ç Ã O!.',
                  '',
                  'Campo IBGE não informado.',
                  'Preencha o campo para continuar']);
    if E_ibge.CanFocus then E_ibge.SetFocus;
    Result := False;
    exit;
  end;

end;

end.
