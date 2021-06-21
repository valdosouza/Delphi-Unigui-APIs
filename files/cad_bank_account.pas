unit cad_bank_account;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, base_registry, Vcl.Menus, uniMainMenu,
  uniButton, uniBitBtn, uniSpeedButton, uniGUIBaseClasses, uniGUIClasses,
  uniPanel, uniDateTimePicker, uniLabel, uniEdit, fm_bank, ControllerBankAccount,
  MainModule, msg_form, unmessages, UnFunctions, Data.DB, Datasnap.DBClient;

type
  TCadBankAccount = class(TBaseRegistry)
    Ctn_Bank: TUniContainerPanel;
    E_Agency: TUniEdit;
    E_Agency_Dv: TUniEdit;
    E_Number: TUniEdit;
    E_Number_Dv: TUniEdit;
    E_Phone: TUniEdit;
    E_Manager: TUniEdit;
    E_Limit_Value: TUniEdit;
    Dt_Dt_Opening: TUniDateTimePicker;
    Dt_Dt_Contract: TUniDateTimePicker;
    pnl_row_1: TUniPanel;
    pnl_row_2: TUniPanel;
    procedure InitVariable;Override;
    procedure FormatScreen;Override;
    procedure ShowData;Override;
    procedure ShowNoData;Override;
    procedure ClearAllFields;Override;
    procedure EditionControl;Override;
    function ValidaInsert():boolean;Override;
    procedure Insert;Override;
    function ValidateSave: boolean;Override;
    procedure Save;Override;
    procedure Delete;Override;
    procedure setVariable; override;
  private
   { Private declarations }
   procedure ShowBank;
  public
    { Public declarations }
    FrBank : TFmBank;
    BankAccount : TControllerBankAccount;
  end;

var
  CadBankAccount: TCadBankAccount;

implementation

{$R *.dfm}

uses openForms;

{ TCadBankAccount }

procedure TCadBankAccount.ClearAllFields;
begin
  inherited;
  ClearFields(FrBank);
  BankAccount.clear;
end;

procedure TCadBankAccount.Delete;
begin
  inherited;
  MensageYesNo(['C O N F I R M A Ç Ã O!',
                '',
                'Deseja realmente excluir este registro?',
                'clique em SIM para confirmar.'],mpAlerta);
    FormMsg.ShowModal(
      Procedure(Sender: TComponent; AResult:Integer)
      begin
        if (Sender as TMsgForm).BotaoEscolhido > 0 then
        Begin
          BankAccount.delete;
          ClearAllFields;
        End;
      end
    );

end;

procedure TCadBankAccount.EditionControl;
begin
 inherited;
  EditionControler(FrBank);
end;

procedure TCadBankAccount.FormatScreen;
begin
  inherited;
  ShowBank;
end;

procedure TCadBankAccount.InitVariable;
begin
 inherited;
  BankAccount := TControllerBankAccount.Create(self);
end;

procedure TCadBankAccount.Insert;
begin
  inherited;
  ClearAllFields;
end;

procedure TCadBankAccount.Save;
begin
  with BankAccount.Registro do
  Begin
    Estabelecimento := UMM.GInstitution.registro.Codigo;
    Agencia := E_Agency.Text;
    AgenciaDv := E_Agency_Dv.Text;
    Numero := E_Number.Text;
    NumeroDv := E_Number_Dv.Text;
    Fone := E_Phone.Text;
    Gerente := E_Manager.Text;
    ValorLimite := StrToFloatDef (E_Limit_Value.Text,0);
    Banco := FrBank.DBLCB_Lista.KeyValue;
    DataAbertura := Dt_Dt_Opening.DateTime;
    DataContrato := Dt_Dt_Contract.DateTime;
    End;
  BankAccount.save;
end;

procedure TCadBankAccount.setVariable;
begin
  BankAccount.Registro.Codigo := CodigoRegistro ;
  BankAccount.Registro.Estabelecimento := UMM.GInstitution.registro.Codigo;
  BankAccount.getbyKey;
  inherited;
end;

procedure TCadBankAccount.ShowBank;
begin
  FrBank := TfmBank.Create(Self);
  FrBank.Parent := Ctn_Bank;
  FrBank.Listar;
  FrBank.Align := alClient;
  FrBank.Show;
end;

procedure TCadBankAccount.ShowData;
begin
  with BankAccount.Registro do
  Begin
    E_Agency.Text := Agencia;
    E_Agency_Dv.Text := AgenciaDv;
    E_Phone.Text := Fone;
    E_Number.Text := Numero;
    E_Number_Dv.Text := NumeroDv;
    E_Manager.Text := Gerente;
    E_Limit_Value.Text := FloattoStrF (ValorLimite,ffFixed,10,2);
    FrBank.DBLCB_Lista.KeyValue := Banco;
    Dt_Dt_Opening.DateTime := DataAbertura;
    Dt_Dt_Contract.DateTime := DataContrato;
  End;

end;

procedure TCadBankAccount.ShowNoData;
begin
  ClearAllFields;
  inherited;
end;

function TCadBankAccount.ValidaInsert: boolean;
begin
 Result := True;
end;

function TCadBankAccount.ValidateSave: boolean;
begin
  Result := True;

  if trim( E_Agency.Text) = '' then
  begin
    MensageAlert(['A T E N Ç Ã O!.',
                  '',
                  'Campo Agência não informado.',
                  'Preencha o campo para continuar']);
    Result := False;
    exit;
  end;

  if trim( E_Number.Text) = '' then
  begin
    MensageAlert(['A T E N Ç Ã O!.',
                  '',
                  'Campo Conta não informado.',
                  'Preencha o campo para continuar']);
    Result := False;
    exit;
  end;

  if trim( E_Number_Dv.Text) = '' then
  begin
    MensageAlert(['A T E N Ç Ã O!.',
                  '',
                  'Campo D.V. Conta não informado.',
                  'Preencha o campo para continuar']);
    Result := False;
    exit;
  end;

  if trim( FrBank.DBLCB_Lista.Text) = '' then
  begin
    MensageAlert(['A T E N Ç Ã O!.',
                  '',
                  'Campo Banco não informado.',
                  'Preencha o campo para continuar']);
    Result := False;
    exit;
  end;
end;

end.
