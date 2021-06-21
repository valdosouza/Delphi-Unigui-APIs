unit cad_priority;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, base_registry, Vcl.Menus, uniMainMenu,
  Data.DB, Datasnap.DBClient, uniButton, uniBitBtn, uniSpeedButton,
  uniGUIBaseClasses, uniGUIClasses, uniPanel, uniEdit, uniLabel ,Controllerpriority,
  unmessages, UnFunctions, msg_form, MainModule, uniMemo;

type
  TCadPriority = class(TBaseRegistry)
    L_Codigo: TUniLabel;
    E_ID: TUniEdit;
    L_Description: TUniLabel;
    E_Description: TUniEdit;
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
    Priority : TControllerPriority;
  end;

var
  CadPriority: TCadPriority;

implementation

{$R *.dfm}

{ TCadPriority }

procedure TCadPriority.Delete;
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
      Self.Priority.delete;
      Self.Close;
    End;
  end
  );

end;

procedure TCadPriority.FormatScreen;
begin
  inherited;

end;

procedure TCadPriority.InitVariable;
begin
  inherited;
  Priority := TControllerPriority.Create(Self);
end;

procedure TCadPriority.Insert;
begin
  inherited;
  Priority.clear;
  ClearAllFields;
  E_Description.SetFocus;
end;

procedure TCadPriority.Save;
begin
  inherited;
  with Priority.Registro do
  Begin
    Descricao := E_Description.Text;
    Estabelecimento := UMM.GInstitution.registro.Codigo;
  End;
  Priority.save;
  E_ID.Text := IntToStr(Priority.Registro.codigo);
end;

procedure TCadPriority.SetVariable;
begin
  Priority.Registro.Codigo := CodigoRegistro;
  Priority.Registro.Estabelecimento := UMM.GInstitution.registro.Codigo;
  Priority.getByKey;
  inherited;
end;

procedure TCadPriority.ShowData;
begin
  with Priority.Registro do
  Begin
    E_ID.Text := IntToStr(Codigo);
    E_Description.Text := Descricao;
  end;
  inherited;
end;

procedure TCadPriority.ShowNoData;
begin
  inherited;
  ClearAllFields;
end;

function TCadPriority.ValidaInsert: boolean;
begin

end;

function TCadPriority.ValidateDelete: boolean;
begin
 Result := true;
end;

function TCadPriority.ValidateSave: boolean;
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
