unit cad_privilege;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, base_registry, uniGUIClasses, uniEdit,
  uniLabel, Vcl.Menus, uniMainMenu, uniButton, uniBitBtn, uniSpeedButton,
  uniGUIBaseClasses, uniPanel, unmessages, msg_form, MainModule, ControllerPrivilege,
  UnFunctions, Data.DB, Datasnap.DBClient;

type
  TCadPrivilege = class(TBaseRegistry)
    E_ID: TUniEdit;
    E_Description: TUniEdit;
    pnl_row_1: TUniPanel;
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
    Privilege : TControllerPrivilege;
  end;

var
  CadPrivilege: TCadPrivilege;

implementation

{$R *.dfm}

{ TCad }

procedure TCadPrivilege.Delete;
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
      Self.Privilege.delete;
      Self.Close;
    End;
  end
  );

end;

procedure TCadPrivilege.InitVariable;
begin
  inherited;
  Privilege := TControllerPrivilege.create(Self);
end;

procedure TCadPrivilege.Insert;
begin
  inherited;
  ClearAllFields;
  E_Description.SetFocus;
end;

procedure TCadPrivilege.Save;
begin
  inherited;
  with Privilege.Registro do
  Begin
    Codigo := StrToIntDef(E_ID.Text,0);
    Descricao := E_Description.Text;
  End;
  Privilege.save;
  E_ID.Text := IntToStr(Privilege.Registro.codigo);
  //Setando a variavel para controle de botãoe (Alterar/Excluir
  CodigoRegistro := Privilege.Registro.Codigo;
end;

procedure TCadPrivilege.SetVariable;
begin
  Privilege.Registro.Codigo := CodigoRegistro;
  Privilege.getByKey;
  inherited;
end;

procedure TCadPrivilege.ShowData;
begin
  if Privilege.exist then
  Begin
    E_ID.Text := IntToStr(Privilege.Registro.Codigo);
    E_Description.Text := Privilege.Registro.Descricao;
  End;
  inherited;
end;

procedure TCadPrivilege.ShowNoData;
begin
  inherited;
  ClearAllFields;
end;

function TCadPrivilege.ValidaInsert: boolean;
begin
  Result := true;
end;

function TCadPrivilege.ValidateDelete: boolean;
begin
//
end;

function TCadPrivilege.ValidateSave: boolean;
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
