unit cad_linebusiness;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, base_registry, Vcl.Menus, uniMainMenu,
  uniButton, uniBitBtn, uniSpeedButton, uniGUIBaseClasses, uniGUIClasses,
  uniPanel, uniCheckBox, uniEdit, uniLabel, ControllerLineBusiness, UnFunctions,
  Data.DB, Datasnap.DBClient;


type
  TCadLineBusiness = class(TBaseRegistry)
    L_Codigo: TUniLabel;
    E_Description: TUniEdit;
    E_ID: TUniEdit;
    chbx_cad_active: TUniCheckBox;

  private
  protected
    procedure InitVariable;Override;
    procedure SetVariable;Override;
    procedure FormatScreen;Override;

    procedure ShowData;Override;
    procedure ShowNoData;Override;
    procedure ClearAllFields;Override;
    //Inserir
    function ValidaInsert():boolean;Override;
    procedure Insert;Override;
    //Salvar
    function ValidateSave: boolean;Override;
    procedure Save;Override;
    //Deletar
    function ValidateDelete:boolean;Override;
    procedure Delete;Override;

  public
     LineBusiness : TControllerLineBusiness;
  end;

var
  CadLineBusiness: TCadLineBusiness;

implementation

{$R *.dfm}

uses MainModule, unMessages, msg_form;


{ TCadLineBusiness }

procedure TCadLineBusiness.ClearAllFields;
begin
  inherited;
  inherited;
  LineBusiness.clear;
  LineBusiness.Institution.Estabelecimento := 0;
  LineBusiness.Institution.CodigoRamoAtividade := 0;
  LineBusiness.Institution.Ativo := 'N';
end;

procedure TCadLineBusiness.Delete;
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
      Self.LineBusiness.desactiveRegiter;
      Self.Close;
    End;
  end
  );

end;

procedure TCadLineBusiness.FormatScreen;
begin
  inherited;
end;

procedure TCadLineBusiness.InitVariable;
begin
  inherited;
   LineBusiness := TControllerLineBusiness.create(Self);
end;

procedure TCadLineBusiness.Insert;
begin
  inherited;
  ClearAllFields;
  E_Description.SetFocus;
end;

procedure TCadLineBusiness.Save;
begin
  inherited;
  with LineBusiness.Registro do
  Begin
    Descricao := E_Description.Text;
  End;
  with LineBusiness.Institution do
  Begin
    Estabelecimento := UMM.GInstitution.registro.Codigo;
    if chbx_cad_active.Checked then
      LineBusiness.Institution.Ativo := 'S'
    else
      LineBusiness.Institution.Ativo := 'N';
  End;
  LineBusiness.saveByDescription;
  E_ID.Text := IntToStr(LineBusiness.Registro.codigo);
  //Setando a variavel para controle de botãoe (Alterar/Excluir
  CodigoRegistro := LineBusiness.Registro.Codigo;
end;

procedure TCadLineBusiness.SetVariable;
begin
  LineBusiness.Registro.Codigo := CodigoRegistro;
  LineBusiness.Institution.Estabelecimento := UMM.GInstitution.registro.Codigo;
  LineBusiness.getbyKey;
  inherited;
end;

procedure TCadLineBusiness.ShowData;
begin
  if LineBusiness.exist then
  Begin
    E_ID.Text := IntToStr(LineBusiness.Registro.Codigo);
    E_Description.Text := LineBusiness.Registro.Descricao;
    chbx_cad_active.Checked := (LineBusiness.Institution.Ativo = 'S');
  End;
  inherited;

end;

procedure TCadLineBusiness.ShowNoData;
begin
  inherited;
  ClearAllFields;
end;

function TCadLineBusiness.ValidaInsert: boolean;
begin
  Result := true;
end;

function TCadLineBusiness.ValidateDelete: boolean;
begin
  Result := true;
end;

function TCadLineBusiness.ValidateSave: boolean;
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
