unit cad_situation;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, base_registry, Vcl.Menus, uniMainMenu,
  uniButton, uniBitBtn, uniSpeedButton, uniGUIBaseClasses, uniGUIClasses,
  uniPanel, Vcl.StdCtrls, uniCheckBox, uniEdit, uniLabel, ControllerSituation,
  uniMultiItem, uniComboBox, UnFunctions, Data.DB, Datasnap.DBClient;

type
  TCadSituation = class(TBaseRegistry)
    L_Codigo: TUniLabel;
    E_ID: TUniEdit;
    E_Description: TUniEdit;
    chbx_cad_active: TUniCheckBox;
    L_NameCompany: TUniLabel;
    UniLabel1: TUniLabel;
    Cb_Modulo: TUniComboBox;
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
    Situation : TControllerSituation;
  end;

var
  CadSituation: TCadSituation;

implementation

{$R *.dfm}

uses MainModule, msg_form, unMessages;

{ TCadSituation }

procedure TCadSituation.Delete;
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
      Self.Situation.delete;
      Self.Close;
    End;
  end
  );

end;

procedure TCadSituation.FormatScreen;
begin
  inherited;

end;

procedure TCadSituation.InitVariable;
begin
  inherited;
  Situation := TControllerSituation.Create(Self);
end;

procedure TCadSituation.Insert;
begin
  inherited;
  Situation.clear;
  ClearAllFields;
  E_Description.SetFocus;
end;

procedure TCadSituation.Save;
begin
  inherited;
  with Situation.Registro do
  Begin
    Descricao := E_Description.Text;
    Estabelecimento := UMM.GInstitution.registro.Codigo;
    Modulo := IntToStr(Cb_Modulo.ItemIndex);
    if chbx_cad_active.Checked then
        Ativo := 'S'
      else
        Ativo := 'N';
  End;
  Situation.save;
  E_ID.Text := IntToStr(Situation.Registro.codigo);

end;

procedure TCadSituation.SetVariable;
begin
  Situation.Registro.Codigo := CodigoRegistro;
  Situation.Registro.Estabelecimento := UMM.GInstitution.registro.Codigo;
  Situation.getByKey;
  inherited;
end;

procedure TCadSituation.ShowData;
begin
  with Situation.Registro do
  Begin
    E_ID.Text := IntToStr(Codigo);
    E_Description.Text := Descricao;
    Cb_Modulo.ItemIndex := StrToIntDef(Modulo,0);
    chbx_cad_active.Checked := (Ativo = 'S');
  end;
  inherited;
  End;

procedure TCadSituation.ShowNoData;
begin
  inherited;
  ClearAllFields;
end;

function TCadSituation.ValidaInsert: boolean;
begin
  //
end;

function TCadSituation.ValidateDelete: boolean;
begin
 Result := true;
end;

function TCadSituation.ValidateSave: boolean;
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
