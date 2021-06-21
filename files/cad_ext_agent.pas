unit cad_ext_agent;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, base_registry, uniGUIClasses, uniEdit,
  uniLabel, Vcl.Menus, uniMainMenu, uniButton, uniBitBtn, uniSpeedButton,
  uniGUIBaseClasses, uniPanel, ControllerExtAgent, unMessages, msg_form, MainModule,
  uniCheckBox, UnFunctions, Data.DB, Datasnap.DBClient;

type
  TCadExtAgent = class(TBaseRegistry)
    UniLabel1: TUniLabel;
    E_Id: TUniEdit;
    UniLabel2: TUniLabel;
    E_Description: TUniEdit;
    UniLabel3: TUniLabel;
    E_Class: TUniEdit;
    UniLabel4: TUniLabel;
    E_Dec_INmetro: TUniEdit;
    chbx_cad_active: TUniCheckBox;
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
  private
    { Private declarations }
  public
    { Public declarations }
    ExtAgent : TControllerExtAgent;
  end;

var
  CadExtAgent: TCadExtAgent;

implementation

{$R *.dfm}

{ TCadExtAgent }

procedure TCadExtAgent.ClearAllFields;
begin
  inherited;
  ExtAgent.clear;
  ExtAgent.Institution.Estabelecimento := 0;
  ExtAgent.Institution.AgenteExtintor := 0;
  ExtAgent.Institution.Ativo := 'N';
end;

procedure TCadExtAgent.Delete;
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
      Self.ExtAgent.desactiveRegiter;
      Self.Close;
    End;
  end
  );
end;

procedure TCadExtAgent.InitVariable;
begin
  inherited;
  ExtAgent := TControllerExtAgent.create(Self);
end;

procedure TCadExtAgent.Insert;
begin
  inherited;
  ClearAllFields;
  E_Description.SetFocus;
end;

procedure TCadExtAgent.Save;
begin
  inherited;
  with ExtAgent.Registro do
  Begin
    Descricao := E_Description.Text;
    Classe := E_Class.Text;
    InMetro := E_Dec_INmetro.Text;
  End;
  ExtAgent.save;
  with ExtAgent.Institution do
  Begin
    Estabelecimento := UMM.GInstitution.registro.Codigo;
    AgenteExtintor := ExtAgent.Registro.Codigo;
    if chbx_cad_active.Checked then
      ExtAgent.Institution.Ativo := 'S'
    else
      ExtAgent.Institution.Ativo := 'N';
  End;
  ExtAgent.SaveInstitution;
  //Setando a variavel para controle de botãoe (Alterar/Excluir
  CodigoRegistro := ExtAgent.Registro.Codigo;
  E_ID.Text := IntToStr(ExtAgent.Registro.codigo);
end;

procedure TCadExtAgent.SetVariable;
begin
  ExtAgent.Registro.Codigo := CodigoRegistro ;
  ExtAgent.Institution.Estabelecimento := UMM.GInstitution.registro.Codigo;
  ExtAgent.getbyKey;
  inherited;
end;

procedure TCadExtAgent.ShowData;
begin
 if ExtAgent.exist then
  Begin
    E_ID.Text := IntToStr(ExtAgent.Registro.Codigo);
    E_Description.Text := ExtAgent.Registro.Descricao;
    E_Class.Text := ExtAgent.Registro.Classe;
    E_Dec_INmetro.Text := ExtAgent.Registro.InMetro;
    chbx_cad_active.Checked := (ExtAgent.Institution.Ativo = 'S');
  End;
  inherited;
end;

procedure TCadExtAgent.ShowNoData;
begin
  inherited;
  ClearAllFields;
end;

function TCadExtAgent.ValidaInsert: boolean;
begin
  Result := True;
end;

function TCadExtAgent.ValidateDelete: boolean;
begin
  Result := True;
end;

function TCadExtAgent.ValidateSave: boolean;
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

  if trim(E_Class.Text) = '' then
  begin
    MensageAlert(['A T E N Ç Ã O!.',
                  '',
                  'Campo Classe não informado.',
                  'Preencha o campo para continuar']);
    if E_Class.CanFocus then E_Class.SetFocus;
    Result := False;
    exit;
  end;

  if trim(E_Dec_INmetro.Text) = '' then
  begin
    MensageAlert(['A T E N Ç Ã O!.',
                  '',
                  'Campo Descrição DecINmetro não informado.',
                  'Preencha o campo para continuar']);
    if E_Dec_INmetro.CanFocus then E_Dec_INmetro.SetFocus;
    Result := False;
    exit;
  end;


end;

end.
