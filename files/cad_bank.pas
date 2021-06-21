unit cad_bank;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, base_registry, uniGUIClasses, uniEdit,
  uniLabel, Vcl.Menus, uniMainMenu, uniButton, uniBitBtn, uniSpeedButton,
  uniGUIBaseClasses, uniPanel, ControllerBank, uniCheckBox, UnFunctions,
  Data.DB, Datasnap.DBClient;

type
  TCadBank = class(TBaseRegistry)
    pnl_row_2: TUniPanel;
    E_Id: TUniEdit;
    E_Number: TUniEdit;
    E_Name_Company: TUniEdit;
    chbx_cad_active: TUniCheckBox;
    pnl_row_1: TUniPanel;

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
    Bank : TControllerBank;
  end;

var
  CadBank: TCadBank;

implementation

{$R *.dfm}

uses MainModule, unMessages, msg_form;

{ TCadBank }

procedure TCadBank.ClearAllFields;
begin
  inherited;
  Bank.clear;
end;

procedure TCadBank.Delete;
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
      Self.Bank.desactiveRegiter;
      Self.Close;
    End;
  end
  );
end;

procedure TCadBank.InitVariable;
begin
  inherited;
  Bank := TControllerBank.create(Self);
end;

procedure TCadBank.Insert;
begin
  inherited;
  ClearAllFields;
  E_Name_Company.SetFocus;
end;

procedure TCadBank.Save;
begin
  inherited;
  Bank.Registro.Numero := E_Number.Text;
  Bank.Entity.Registro.NomeRazao := E_Name_Company.Text;
  Bank.save;

  with Bank.Institution do
  Begin
    Estabelecimento := UMM.GInstitution.registro.Codigo;
    Banco := Bank.Registro.Codigo;
    if chbx_cad_active.Checked then
      Bank.Institution.Ativo := 'S'
    else
      Bank.Institution.Ativo := 'N';
  End;
  Bank.SaveInstitution;
  //Setando a variavel para controle de botãoe (Alterar/Excluir
  CodigoRegistro := Bank.Registro.Codigo;
  E_ID.Text := IntToStr(Bank.Registro.codigo);
end;

procedure TCadBank.SetVariable;
begin
  Bank.Registro.Codigo := CodigoRegistro ;
  Bank.Institution.Estabelecimento := UMM.GInstitution.registro.Codigo;
  Bank.getAllByKey;
  inherited;
end;

procedure TCadBank.ShowData;
begin
  if Bank.exist then
  Begin
    E_ID.Text := IntToStr(Bank.Registro.Codigo);
    E_Name_Company.Text := Bank.Entity.Registro.NomeRazao;
    E_Number.Text := Bank.Registro.Numero;
    chbx_cad_active.Checked := (Bank.Institution.Ativo = 'S');
  End;
  inherited;
end;

procedure TCadBank.ShowNoData;
begin
  inherited;
  ClearAllFields;
end;

function TCadBank.ValidaInsert: boolean;
begin
 Result := True;
end;

function TCadBank.ValidateDelete: boolean;
begin
  Result := True;
end;

function TCadBank.ValidateSave: boolean;
begin
  Result := True;
  if trim(E_Name_Company.Text) = '' then
  begin
    MensageAlert(['A T E N Ç Ã O!.',
                  '',
                  'Campo Nome não informado.',
                  'Preencha o campo para continuar']);
    if E_Name_Company.CanFocus then E_Name_Company.SetFocus;
    Result := False;
    exit;
  end;
end;

end.
