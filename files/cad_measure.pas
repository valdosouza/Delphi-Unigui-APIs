unit cad_measure;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, base_registry, uniCheckBox,
  uniGUIClasses, uniEdit, uniLabel, Vcl.Menus, uniMainMenu, uniButton,
  uniBitBtn, uniSpeedButton, uniGUIBaseClasses, uniPanel, ControllerMeasure,
  UnFunctions, Data.DB, Datasnap.DBClient;

type
  TCadMeasure = class(TBaseRegistry)
    L_Codigo: TUniLabel;
    L_NameCompany: TUniLabel;
    E_Description: TUniEdit;
    E_ID: TUniEdit;
    chbx_cad_active: TUniCheckBox;
    UniLabel1: TUniLabel;
    E_Abbreviation: TUniEdit;
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
  protected

  public
    { Public declarations }
    Measure : TControllerMeasure;
  end;

var
  CadMeasure: TCadMeasure;

implementation

{$R *.dfm}

uses MainModule, unMessages, msg_form;


{ TCadMeasure }

procedure TCadMeasure.ClearAllFields;
begin
  inherited;
  Measure.clear;
  Measure.Institution.Estabelecimento := 0;
  Measure.Institution.CodigoMedida := 0;
  Measure.Institution.Ativo := 'N';
end;

procedure TCadMeasure.Delete;
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
      Self.Measure.desactiveRegiter;
      Self.Close;
    End;
  end
  );

end;


procedure TCadMeasure.InitVariable;
begin
  inherited;
  Measure := TControllerMeasure.create(Self);
end;


procedure TCadMeasure.Insert;
begin
  inherited;
  ClearAllFields;
  E_Description.SetFocus;
end;

procedure TCadMeasure.Save;
begin
  inherited;
  with Measure.Registro do
  Begin
    Descricao := E_Description.Text;
    Abreviatura := E_Abbreviation.Text;
  End;
  with Measure.Institution do
  Begin
    Estabelecimento := UMM.GInstitution.registro.Codigo;
    if chbx_cad_active.Checked then
     Measure.Institution.Ativo := 'S'
    else
     Measure.Institution.Ativo := 'N';
  End;
  Measure.saveByDescription;
  //Setando a variavel para controle de botãoe (Alterar/Excluir
  CodigoRegistro := Measure.Registro.codigo;
  E_ID.Text := IntToStr(Measure.Registro.codigo);
end;

procedure TCadMeasure.SetVariable;
begin
  Measure.Registro.Codigo := CodigoRegistro;
  Measure.Institution.Estabelecimento := UMM.GInstitution.registro.Codigo;
  Measure.getbyKey;
  inherited;
end;

procedure TCadMeasure.ShowData;
begin
  if Measure.exist then
  Begin
    E_ID.Text := IntToStr(Measure.Registro.Codigo);
    E_Description.Text := Measure.Registro.Descricao;
    E_Abbreviation.Text := Measure.Registro.Abreviatura;
    chbx_cad_active.Checked := (Measure.Institution.Ativo = 'S');
  End;
  inherited;

end;
procedure TCadMeasure.ShowNoData;
begin
  inherited;
  ClearAllFields;
end;

function TCadMeasure.ValidaInsert: boolean;
begin
  //
end;

function TCadMeasure.ValidateDelete: boolean;
begin
                    //
end;

function TCadMeasure.ValidateSave: boolean;
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

  if trim(E_Abbreviation.Text) = '' then
  begin
    MensageAlert(['A T E N Ç Ã O!.',
                  '',
                  'Campo Abreviação não informado.',
                  'Preencha o campo para continuar']);
    if E_Abbreviation.CanFocus then E_Abbreviation.SetFocus;
    Result := False;
    exit;
  end;
end;

end.