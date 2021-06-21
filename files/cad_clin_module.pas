unit cad_clin_module;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, base_registry, uniGUIClasses, uniEdit,
  uniLabel, Vcl.Menus, uniMainMenu, Data.DB, Datasnap.DBClient, uniButton,
  uniBitBtn, uniSpeedButton, uniGUIBaseClasses, uniPanel, ControllerClinModule;

type
  TCadClinModule = class(TBaseRegistry)
    E_Description: TUniEdit;
    E_ID: TUniEdit;
    pnl_row_1: TUniPanel;
    E_Sequencia: TUniEdit;
  private
    { Private declarations }
  protected
    procedure InitVariable;Override;
    procedure SetVariable;Override;
    procedure ShowData;Override;
    procedure ShowNoData;Override;
    procedure ClearAllFields;Override;
    function ValidaInsert():boolean;Override;
    procedure Insert;Override;
    function ValidateSave: boolean;Override;
    procedure Save;Override;
    function ValidateDelete:boolean;Override;
    procedure Delete;Override;

  public
    { Public declarations }
    ClinModule : TControllerClinModule;
  end;

var
  CadClinModule: TCadClinModule;

implementation

{$R *.dfm}

uses MainModule, unMessages, msg_form, UnFunctions;

{ TCadClinModule }

procedure TCadClinModule.ClearAllFields;
begin
  inherited;
  ClinModule.clear;
end;

procedure TCadClinModule.Delete;
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
      Self.ClinModule.delete;
      Self.Close;
    End;
  end
  );

end;

procedure TCadClinModule.InitVariable;
begin
  PInterface := 49;
  inherited;
  ClinModule := TControllerClinModule.create(self);
end;

procedure TCadClinModule.Insert;
begin
  inherited;
  ClearAllFields;
  E_Sequencia.SetFocus;
end;

procedure TCadClinModule.Save;
begin
  inherited;
  with ClinModule.Registro do
  Begin
    Estabelecimento := UMM.GInstitution.registro.Codigo;
    Sequencia := StrtoIntDEf(E_Sequencia.Text,0);
    Descricao := E_Description.Text;
  End;
  ClinModule.save;
  //Setando a variavel para controle de botãoe (Alterar/Excluir
  CodigoRegistro := ClinModule.Registro.Codigo;
  E_ID.Text := IntToStr(ClinModule.Registro.codigo);
end;

procedure TCadClinModule.SetVariable;
begin
  ClinModule.Registro.Codigo := CodigoRegistro ;
  ClinModule.Registro.Estabelecimento := UMM.GInstitution.registro.Codigo;
  ClinModule.getbyKey;
  inherited;
end;

procedure TCadClinModule.ShowData;
begin
  if ClinModule.exist then
  Begin
    E_ID.Text := IntToStr( ClinModule.Registro.Codigo);
    E_Description.Text := ClinModule.Registro.Descricao;
  End;
  inherited;
end;

procedure TCadClinModule.ShowNoData;
begin
  inherited;
  ClearAllFields;
end;

function TCadClinModule.ValidaInsert: boolean;
begin
  Result := True;
end;

function TCadClinModule.ValidateDelete: boolean;
begin
  Result := true;
end;

function TCadClinModule.ValidateSave: boolean;
begin
  Result := True;
  if trim(E_Description.Text) = '' then
  begin
    MensageAlert(['A T E N Ç Ã O!.',
                  '',
                  'Campo Descrição não informado.',
                  'Preencha o campo para continuar']);
    setfocus(E_Description.JSName);
    Result := False;
    exit;
  end;

end;

end.
