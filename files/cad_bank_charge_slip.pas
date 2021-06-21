unit cad_bank_charge_slip;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, base_registry, uniPanel, Vcl.Menus,
  uniMainMenu, uniButton, uniBitBtn, uniSpeedButton, uniGUIBaseClasses,
  uniGUIClasses, uniMultiItem, uniComboBox, uniEdit, uniLabel, uniRadioGroup,
  uniMemo, fm_bank_account, fm_bank_charge_ticket, fm_bank_charge_kind, ControllerBankChargeSlip,
  MainModule, msg_form, unmessages, ACBrBoleto, System.TypInfo, UnFunctions,
  Data.DB, Datasnap.DBClient, ACBrBoletoConversao;

type
  TCadBankChargeSlip = class(TBaseRegistry)
    Ctn_Bank_Account: TUniContainerPanel;
    Ctn_Bank_Charge_Ticket: TUniContainerPanel;
    Ctn_Bank_Charge_Kind: TUniContainerPanel;
    Rg_Accept: TUniRadioGroup;
    E_Agreement: TUniEdit;
    E_Transmission_Code: TUniEdit;
    E_Variacao: TUniEdit;
    Cb_Layout_Shipping: TUniComboBox;
    Cb_protest: TUniComboBox;
    E_Day_Protest: TUniEdit;
    Cb_Layout: TUniComboBox;
    E_Benefic_Post: TUniEdit;
    E_Aliq_Interest: TUniEdit;
    E_Aliq_Late: TUniEdit;
    E_Value_Late_Min: TUniEdit;
    E_Aliq_Discount: TUniEdit;
    E_Values_Rate: TUniEdit;
    E_Payment_Local: TUniEdit;
    E_Instruction_1: TUniEdit;
    E_Instruction_2: TUniEdit;
    M_Instruction: TUniMemo;
    E_Path_Files: TUniEdit;
    UniButton1: TUniButton;
    E_Value_Fine: TUniEdit;
    pnl_row_01: TUniPanel;
    pnl_row_02: TUniPanel;
    pnl_row_03: TUniPanel;
    pnl_row_04: TUniPanel;
    pnl_row_05: TUniPanel;
    pnl_row_06: TUniPanel;
    pnl_row_07: TUniPanel;
    pnl_row_08: TUniPanel;
    pnl_row_09: TUniPanel;
    pnl_row_10: TUniPanel;
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
    procedure ShowBankAccount;
    procedure ShowBankChargeTicket;
    procedure ShowBankChargeKind;
  public
    { Public declarations }
    FrBankAccount : TFmBankAccount;
    FrBankChargeTicket : TFmBankChargeTicket;
    FrBankChargeKind : TFmBankChargeKind;
    BankChargeSlip : TControllerBankChargeSlip;

  end;

var
  CadBankChargeSlip: TCadBankChargeSlip;

implementation

{$R *.dfm}

uses openForms;

{ TCadBankChargeSlip }

procedure TCadBankChargeSlip.ClearAllFields;
begin
  inherited;
  ClearFields(FrBankAccount);
  ClearFields(FrBankChargeTicket);
  ClearFields(FrBankChargeKind);
  BankChargeSlip.clear;
end;

procedure TCadBankChargeSlip.Delete;
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
          BankChargeSlip.delete;
          ClearAllFields;
        End;
      end
    );
end;

procedure TCadBankChargeSlip.EditionControl;
begin
 inherited;
 EditionControler(FrBankAccount);
 EditionControler(FrBankChargeTicket);
 EditionControler(FrBankChargeKind);
end;

procedure TCadBankChargeSlip.FormatScreen;
begin
  inherited;
  ShowBankAccount;
  ShowBankChargeTicket;
  ShowBankChargeKind;
end;

procedure TCadBankChargeSlip.InitVariable;
Var
 Lc_I : TACBrBolLayOut;
begin
  inherited;
  BankChargeSlip := TControllerBankChargeSlip.Create(self);
  //Prenche a combo com os modelos dos boletos Disponiveis
  Cb_Layout.Items.Clear ;
   For Lc_I := Low(TACBrBolLayOut) to High(TACBrBolLayOut) do
      Cb_Layout.Items.Add( GetEnumName(TypeInfo(TACBrBolLayOut), integer(Lc_I) ) ) ;
   Cb_Layout.ItemIndex := 0 ;
end;

procedure TCadBankChargeSlip.Insert;
begin
  inherited;
  ClearAllFields;
end;

procedure TCadBankChargeSlip.Save;
begin
 with BankChargeSlip.Registro do
 Begin
  Estabelecimento := UMM.GInstitution.registro.Codigo;
  ContaCorrente := FrBankAccount.DBLCB_Lista.KeyValue;
  Carteira := FrBankChargeTicket.DBLCB_Lista.KeyValue;
  Especie := FrBankChargeKind.DBLCB_Lista.KeyValue;
  if Rg_Accept.ItemIndex = 0 then
     Aceita := 'S'
    else
     Aceita := 'N';
  Convenio := E_Agreement.Text;
  CodigoTransicao := E_Transmission_Code.Text;
  Variacao := StrToIntDef (E_Variacao.Text,0);
  EnvioModelo := Cb_Layout_Shipping.Text;
  Protesto := Cb_protest.Text;
  DiaProtesto := StrToIntDef (E_Day_Protest.Text,0);
  Modelo := Cb_Layout.ItemIndex;
  Benefica := E_Benefic_Post.Text;
  Juro := StrToFloatDef (E_Aliq_Interest.Text,0);
  AliqAtrasado := StrToFloatDef (E_Aliq_Late.Text,0);
  ValorMoraMin := StrToFloatDef (E_Value_Late_Min.Text,0);
  DescontoAliq :=  StrToFloatDef (E_Aliq_Discount.Text,0);
  Multa := StrToFloatDef (E_Value_Fine.Text,0);
  ValorTaxa := StrToFloatDef (E_Values_Rate.Text,0);
  PgtoLocal := E_Payment_Local.Text;
  Instrucao1 := E_Instruction_1.Text;
  Instrucao2 := E_Instruction_2.Text;
  Instrucao := M_Instruction.Text;
  ArqCaminho := E_Path_Files.Text;
 End;
 BankChargeSlip.save;
 //Setando a variavel para controle de botãoe (Alterar/Excluir
  CodigoRegistro := BankChargeSlip.Registro.Codigo;
end;

procedure TCadBankChargeSlip.setVariable;
begin
  BankChargeSlip.Registro.Codigo := CodigoRegistro ;
  BankChargeSlip.Registro.Estabelecimento := UMM.GInstitution.registro.Codigo;
  BankChargeSlip.getbyKey;
  inherited;
end;

procedure TCadBankChargeSlip.ShowBankAccount;
begin
  FrBankAccount := TFmBankAccount.Create(Self);
  FrBankAccount.Parent := Ctn_Bank_Account;
  FrBankAccount.Listar;
  FrBankAccount.Align := alClient;
  FrBankAccount.Show;
end;

procedure TCadBankChargeSlip.ShowBankChargeKind;
begin
  FrBankChargeKind := TFmBankChargeKind.Create(Self);
  FrBankChargeKind.Parent := Ctn_Bank_Charge_Kind;
  FrBankChargeKind.Listar;
  FrBankChargeKind.Align := alClient;
  FrBankChargeKind.Show;
end;

procedure TCadBankChargeSlip.ShowBankChargeTicket;
begin
  FrBankChargeTicket := TFmBankChargeTicket.Create(Self);
  FrBankChargeTicket.Parent := Ctn_Bank_Charge_Ticket;
  FrBankChargeTicket.Listar;
  FrBankChargeTicket.Align := alClient;
  FrBankChargeTicket.Show;
end;

procedure TCadBankChargeSlip.ShowData;
begin
  with BankChargeSlip.Registro do
 Begin
  FrBankAccount.DBLCB_Lista.KeyValue := ContaCorrente;
  FrBankChargeTicket.DBLCB_Lista.KeyValue := Carteira;
  FrBankChargeKind.DBLCB_Lista.KeyValue := Especie;
  if Aceita = 'S' then
     Rg_Accept.ItemIndex := 0
    else
     Rg_Accept.ItemIndex := 1;
  E_Agreement.Text := Convenio ;
  E_Transmission_Code.Text := CodigoTransicao ;
  E_Variacao.Text := IntToStr (Variacao);
  Cb_Layout_Shipping.Text := EnvioModelo;
  Cb_protest.Text := Protesto;
  E_Day_Protest.Text := IntToStr (DiaProtesto);
  Cb_Layout.ItemIndex := Modelo;
  E_Benefic_Post.Text := Benefica;
  E_Aliq_Interest.Text := FloatToStrF(Juro,ffFixed,10,2);
  E_Aliq_Late.Text := FloatToStrF(AliqAtrasado,ffFixed,10,2);
  E_Value_Late_Min.Text := FloatToStrF(ValorMoraMin,ffFixed,10,2);
  E_Aliq_Discount.Text :=  FloatToStrF(DescontoAliq,ffFixed,10,2);
  E_Value_Fine.Text := FloatToStrF(Multa,ffFixed,10,2);
  E_Values_Rate.Text := FloatToStrF(ValorTaxa,ffFixed,10,2);
  E_Payment_Local.Text := PgtoLocal;
  E_Instruction_1.Text := Instrucao1;
  E_Instruction_2.Text := Instrucao2;
  M_Instruction.Text := Instrucao;
  E_Path_Files.Text := ArqCaminho;
 End;
end;

procedure TCadBankChargeSlip.ShowNoData;
begin
 ClearAllFields;
 inherited;
end;

function TCadBankChargeSlip.ValidaInsert: boolean;
begin
 Result := True;
end;

function TCadBankChargeSlip.ValidateSave: boolean;
 Begin
  Result:= true;

  if trim(FrBankAccount.DBLCB_Lista.Text) = '' then
  begin
    MensageAlert(['A T E N Ç Ã O!.',
                  '',
                  'Campo Conta Corrente não informado.',
                  'Preencha o campo para continuar']);
    Result := False;
    exit;
  end;


 if (trim(FrBankChargeTicket.DBLCB_Lista.Text) = '') then
    begin
     MensageAlert(['A T E N Ç Ã O!.',
                  '',
                  'Campo Carteira de Cobrança não informado.',
                  'Preencha o campo para continuar']);
      Result := False;
      exit;
    end;

 if (trim(Cb_Layout_Shipping.Text) = '') then
    begin
      MensageAlert(['A T E N Ç Ã O!.',
                  '',
                  'Campo Modelo do Boleto não informado.',
                  'Preencha o campo para continuar']);
      Result := False;
      exit;
    end;

    if trim(Cb_protest.Text) = '' then
    begin
      MensageAlert(['A T E N Ç Ã O!.',
                  '',
                  'Campo Protestar Título não informado.',
                  'Preencha o campo para continuar']);
      Result := False;
      exit;
    end;

    if Trim(E_Day_Protest.Text) = '' then
    begin
      MensageAlert(['A T E N Ç Ã O!.',
                  '',
                  'Campo Nr Protesto não informado.',
                  'Preencha o campo para continuar']);
      Result := False;
      exit;
    end;
 End;

end.
