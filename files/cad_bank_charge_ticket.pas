unit cad_bank_charge_ticket;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, base_registry, uniRadioGroup,
  uniGUIClasses, uniEdit, uniLabel, uniPanel, Vcl.Menus, uniMainMenu, uniButton,
  uniBitBtn, uniSpeedButton, uniGUIBaseClasses, fm_bank, ControllerBankChargeTicket, MainModule, msg_form,
  unmessages, UnFunctions, Data.DB, Datasnap.DBClient;

type
  TCadBankChargeTicket = class(TBaseRegistry)
    Ctn_Bank: TUniContainerPanel;
    E_Number: TUniEdit;
    Rg_Emission_By: TUniRadioGroup;
    E_Description: TUniEdit;
    pnl_row_1: TUniPanel;
    pnl_row_2: TUniPanel;
    pnl_row_3: TUniPanel;
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
    Bank_id : Integer;
    Charge_id : String;
    FrBank : TFmBank;
    BankChargeTicket : TControllerBankChargeTicket;

  end;

var
  CadBankChargeTicket: TCadBankChargeTicket;

implementation

{$R *.dfm}

uses openForms;

{ TCadBankChargeTicket }

procedure TCadBankChargeTicket.ClearAllFields;
begin
  inherited;
  ClearFields(FrBank);
  BankChargeTicket.clear;
end;

procedure TCadBankChargeTicket.Delete;
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
          BankChargeTicket.delete;
          ClearAllFields;
        End;
      end
    );
end;

procedure TCadBankChargeTicket.EditionControl;
begin
  inherited;
  EditionControler(FrBank);
end;

procedure TCadBankChargeTicket.FormatScreen;
begin
  inherited;
  ShowBank;
end;

procedure TCadBankChargeTicket.InitVariable;
begin
  inherited;
  BankChargeTicket := TControllerBankChargeTicket.Create(self);
end;

procedure TCadBankChargeTicket.Insert;
begin
  inherited;
  ClearAllFields;
end;

procedure TCadBankChargeTicket.Save;
begin
  with BankChargeTicket.Registro do
  Begin
    Descricao := E_Description.Text;
    Numero := E_Number.Text;
    if Rg_Emission_By.ItemIndex = 0 then
     Emissao := 'C'
    else
     Emissao := 'B';
    Banco := FrBank.DBLCB_Lista.KeyValue;
  End;
  BankChargeTicket.save;
end;

procedure TCadBankChargeTicket.setVariable;
begin
  BankChargeTicket.Registro.Codigo := CodigoRegistro;
  BankChargeTicket.Registro.Banco := Bank_id;
  BankChargeTicket.Registro.Numero := Charge_id ;
  BankChargeTicket.getbyKey;
  inherited;
end;

procedure TCadBankChargeTicket.ShowBank;
begin
  FrBank := TfmBank.Create(Self);
  FrBank.Parent := Ctn_Bank;
  FrBank.Listar;
  FrBank.Align := alClient;
  FrBank.Show;
end;

procedure TCadBankChargeTicket.ShowData;
begin
  with BankChargeTicket.Registro do
  Begin
    E_Description.Text := Descricao;
    E_Number.Text := Numero;
    if Emissao = 'C' then
      Rg_Emission_By.ItemIndex := 0
    else
      Rg_Emission_By.ItemIndex := 1;
    FrBank.DBLCB_Lista.KeyValue := Banco;
  End;

end;

procedure TCadBankChargeTicket.ShowNoData;
begin
  ClearAllFields;
  inherited;
end;

function TCadBankChargeTicket.ValidaInsert: boolean;
begin
  Result := True;
end;

function TCadBankChargeTicket.ValidateSave: boolean;
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

   if trim( FrBank.DBLCB_Lista.Text) = '' then
  begin
    MensageAlert(['A T E N Ç Ã O!.',
                  '',
                  'Campo Banco não informado.',
                  'Preencha o campo para continuar']);
    Result := False;
    exit;
  end;

  //   if trim(Rg_Emission_By.Text) = '' then
  begin
  //  MensageAlert(['A T E N Ç Ã O!.',
  //                '',
  //                'Campo Emissão não informado.',
  //                'Preencha o campo para continuar']);
  //  Result := False;
  //  exit;
  end;

    if trim(E_Number.Text) = '' then
  begin
    MensageAlert(['A T E N Ç Ã O!.',
                  '',
                  'Campo Código/Número não informado.',
                  'Preencha o campo para continuar']);
    Result := False;
    exit;
  end;
end;

end.
