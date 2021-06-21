unit cad_observation;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, base_registry, uniMultiItem,
  uniComboBox, uniGUIClasses, uniEdit, uniLabel, Vcl.Menus, uniMainMenu,
  uniButton, uniBitBtn, uniSpeedButton, uniGUIBaseClasses, uniPanel, uniMemo,
   unmessages, msg_form, ControllerObservation, MainModule, System.AnsiStrings,
  UnFunctions, Data.DB, Datasnap.DBClient;


type
  TCadObservation = class(TBaseRegistry)
    L_Codigo: TUniLabel;
    E_ID: TUniEdit;
    L_NameCompany: TUniLabel;
    E_Description: TUniEdit;
    M_Note: TUniMemo;
    cb_observation: TUniComboBox;
    UniLabel1: TUniLabel;
    UniLabel2: TUniLabel;

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
    Observation: TControllerObservation;
  end;

var
  CadObservation: TCadObservation;

implementation

{$R *.dfm}

{ TCadObservation }


{ TCadObservation }

procedure TCadObservation.Delete;
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
      Self.Observation.delete;
      Self.Close;
    End;
  end
  );

end;

procedure TCadObservation.InitVariable;
begin
  inherited;
  Observation := TControllerObservation.create(Self);
end;

procedure TCadObservation.Insert;
begin
  inherited;
  Observation.clear;
  ClearAllFields;
  E_Description.SetFocus;
end;

procedure TCadObservation.Save;
begin
  inherited;
  with Observation.Registro do
  Begin
    Estabelecimento := UMM.GInstitution.registro.Codigo;
    Descricao := E_Description.Text;
    Nota      := M_Note.Text;
    Estabelecimento := UMM.GInstitution.registro.Codigo;
    Geral := IntToStr(cb_observation.ItemIndex);
  End;
  Observation.save;
  E_ID.Text := IntToStr(Observation.Registro.codigo);
  //Setando a variavel para controle de botãoe (Alterar/Excluir
  CodigoRegistro := Observation.Registro.Codigo;
end;

procedure TCadObservation.SetVariable;
begin
  Observation.Registro.Codigo := CodigoRegistro;
  Observation.Registro.Estabelecimento := UMM.GInstitution.registro.Codigo;
  Observation.getByKey;
  inherited;
end;

procedure TCadObservation.ShowData;
begin
  with Observation.Registro do
  Begin
    E_ID.Text := IntToStr(Codigo);
    M_Note.Text := Nota;
    E_Description.Text := Descricao;
    cb_observation.ItemIndex := StrToIntDef(Geral,0);
  End;
  inherited;
end;

procedure TCadObservation.ShowNoData;
begin
  inherited;
  ClearAllFields;
end;

function TCadObservation.ValidaInsert: boolean;
begin
 Result := True;
end;

function TCadObservation.ValidateDelete: boolean;
begin
  Result := true;
end;


function TCadObservation.ValidateSave: boolean;
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
