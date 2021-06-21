unit edi_financial;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, base_registry, Vcl.Menus, uniMainMenu,
  uniButton, uniBitBtn, uniSpeedButton, uniGUIBaseClasses, uniGUIClasses,
  uniPanel, uniDateTimePicker, uniLabel, uniEdit, fm_cfop,
  fm_Installment_open, fm_financial, fm_entity_fiscal, Controllerinvoice,
  unMessages, ControllerFinancialBills, MainModule, uniMemo, uniPageControl,
  fm_payment_type, uniMultiItem, uniComboBox, uniGroupBox, Data.DB,
  Datasnap.DBClient;

type
  TEdiFinancial = class(TBaseRegistry)
    UniLabel2: TUniLabel;
    Dtp_Expiration: TUniDateTimePicker;
    E_Nr_Doc: TUniEdit;
    UniLabel1: TUniLabel;
    Lb_VL_Doc: TUniLabel;
    E_VL_Doc: TUniNumberEdit;
    Ctn_PaymentType: TUniContainerPanel;
    UniLabel5: TUniLabel;
    cb_Situation: TUniComboBox;
    UniGroupBox1: TUniGroupBox;
    E_Vl_Late: TUniNumberEdit;
    UniLabel4: TUniLabel;
    UniLabel6: TUniLabel;
    E_Aliq_Desc: TUniNumberEdit;
    UniLabel7: TUniLabel;
    E_Vl_Paid: TUniNumberEdit;
    UniLabel8: TUniLabel;
    Dtp_Paid: TUniDateTimePicker;
    E_VL_Total: TUniNumberEdit;
    UniLabel9: TUniLabel;
    UniLabel3: TUniLabel;
    E_Vl_Interest: TUniNumberEdit;
    procedure InitVariable;Override;
    procedure formatScreen;Override;
    procedure SetVariable;Override;
    procedure ShowData;Override;
    procedure ShowDataFinancial;
    procedure ShowDataPayment;
    procedure ShowNoData;Override;
    procedure EditionControl;Override;
    procedure ClearAllFields;Override;
    function ValidateSave():boolean;Override;
    procedure Save;Override;
    procedure SaveFinancial;
    procedure SavePayment;
    function ValidateCancel():boolean;Override;
    procedure Cancel;Override;
    procedure cb_SituationExit(Sender: TObject);
    procedure E_VL_DocExit(Sender: TObject);
    procedure E_Vl_InterestExit(Sender: TObject);
    procedure E_Vl_LateExit(Sender: TObject);
    procedure E_Aliq_DescExit(Sender: TObject);
  private
    { Private declarations }
     FrPaymentType : TfmPaymentType;
     procedure ShowPaymentType;
     procedure totalizer;
  public
    //Complementa Chave do CodigoRegistro
    Parcela : Integer;
    Tipo : String;
    Financeiro : TControllerFinancialBills;
    { Public declarations }
  end;

var
  EdiFinancial: TEdiFinancial;

implementation

{$R *.dfm}

{ TBaseRegistry1 }

procedure TEdiFinancial.Cancel;
begin
  Close;
end;

procedure TEdiFinancial.cb_SituationExit(Sender: TObject);
begin
  inherited;
  UniSession.AddJS('setTimeout(function(){'+ FrPaymentType.DBLCB_Lista.JSName +'.focus()}, 100)');
end;

procedure TEdiFinancial.ClearAllFields;
begin
  inherited;
//
end;

procedure TEdiFinancial.EditionControl;
begin
//
end;

procedure TEdiFinancial.E_Aliq_DescExit(Sender: TObject);
begin
  totalizer;
end;

procedure TEdiFinancial.E_VL_DocExit(Sender: TObject);
begin
  totalizer;
end;

procedure TEdiFinancial.E_Vl_InterestExit(Sender: TObject);
begin
  totalizer;
end;

procedure TEdiFinancial.E_Vl_LateExit(Sender: TObject);
begin
  totalizer;
end;

procedure TEdiFinancial.formatscreen;
begin
  inherited;
  ShowPaymentType
end;

procedure TEdiFinancial.InitVariable;
begin
  inherited;
  Financeiro := TControllerFinancialBills.create(Self);
end;

procedure TEdiFinancial.Save;
begin
  SaveFinancial;
  SavePayment;
  Close;
end;

procedure TEdiFinancial.SaveFinancial;
Var
  LcParcel : Integer;
begin
  with Financeiro.Financial.Registro do
  Begin
    DataExpiracao       := Dtp_Expiration.DateTime;
    TipoPagamento       := FrPaymentType.DBLCB_Lista.KeyValue;
    Valor               := E_VL_Doc.Value;
  End;
  Financeiro.Financial.save;

  with Financeiro.Registro do
  Begin
    if cb_Situation.ItemIndex = 1 then
    Begin
      Situacao            := 'B';
      Fase                := 'D';
    End
    else
    Begin
      Situacao            := 'N';
    End;
  End;
  Financeiro.save;
end;

procedure TEdiFinancial.SavePayment;
begin
  Financeiro.Payment.Registro.Estabelecimento := Financeiro.Registro.Estabelecimento;
  Financeiro.Payment.Registro.Ordem           := Financeiro.Registro.Ordem;
  Financeiro.Payment.Registro.Parcela         := Financeiro.Registro.Parcela;
  if cb_Situation.ItemIndex > 0 then
  Begin
    with Financeiro.Payment.Registro do
    Begin
      Juro                := E_Vl_Interest.Value;
      ValorDeMora        := E_Vl_Late.Value;
      AliquotaDesconto    := E_Aliq_Desc.Value;
      ValorPago           := E_Vl_Paid.Value;
      DataDoPagamento     := Dtp_Paid.DateTime;
      DataDaBaixa         := Date;
      Baixa               := 'S';
    End;
    Financeiro.Payment.save;
  End
  else
  Begin
    Financeiro.Payment.delete;
  End;
end;

procedure TEdiFinancial.SetVariable;
begin
  if ( CodigoRegistro > 0 ) then
  Begin
    Financeiro.Registro.Estabelecimento := UMM.GInstitution.registro.Codigo;
    Financeiro.Registro.Ordem := CodigoRegistro;
    Financeiro.Registro.Parcela := Self.Parcela;
    Financeiro.getAllbykey;
    ShowData;
  End
  else
  Begin
    ShowNoData;
  End;
  EditionState := 'E';
  EditionControl;
end;

procedure TEdiFinancial.ShowData;
begin
  ShowDataFinancial;
  ShowDataPayment;
  totalizer;
end;

procedure TEdiFinancial.ShowDataFinancial;
begin
  Dtp_Expiration.DateTime := Financeiro.Financial.Registro.DataExpiracao;
  E_Nr_Doc.Text := Financeiro.Registro.Numero;
  E_VL_Doc.Value := Financeiro.Financial.Registro.Valor;
  if Financeiro.Registro.Situacao = 'N' then
    cb_Situation.ItemIndex := 0
  else
    cb_Situation.ItemIndex := 1;
  FrPaymentType.DBLCB_Lista.KeyValue := Financeiro.Financial.Registro.TipoPagamento;
end;

procedure TEdiFinancial.ShowDataPayment;
begin
  E_Vl_Interest.Value := Financeiro.Payment.Registro.Juro;
  E_Vl_Late.Value := Financeiro.Payment.Registro.ValorDeMora;
  E_Aliq_Desc.Value := Financeiro.Payment.Registro.AliquotaDesconto;
  E_Vl_Paid.Value := Financeiro.Payment.Registro.ValorPago;
  Dtp_Paid.DateTime := Financeiro.Payment.Registro.DataDoPagamento;
end;

procedure TEdiFinancial.ShowNoData;
begin
//
end;

procedure TEdiFinancial.ShowPaymentType;
begin
  FrPaymentType := TfmPaymentType.Create(Self);
  FrPaymentType.Parent := Ctn_PaymentType;
  FrPaymentType.listar;
  FrPaymentType.Align := alClient;
  FrPaymentType.Show;
end;

procedure TEdiFinancial.totalizer;
Var
  LcValorTotal : REal;
  LcValorDesc : Real;
begin
  LcValorTotal := E_VL_Doc.Value;
  LcValorTotal := LcValorTotal + E_Vl_Interest.Value;
  LcValorTotal := LcValorTotal + E_Vl_Late.Value;
  LcValorDesc := (E_VL_Doc.Value * E_Aliq_Desc.Value)/100;
  LcValorTotal := LcValorTotal - LcValorDesc;
  E_VL_Total.Value := LcValorTotal;
end;

function TEdiFinancial.ValidateCancel: boolean;
begin
  Result := True;
end;

function TEdiFinancial.ValidateSave: boolean;
Var
  LcMsgTipo : String;
begin
  Result := True;
  if trim(E_Nr_Doc.Text) = '' then
  begin
    MensageAlert(['A T E N Ç Ã O!.',
                  '',
                  'Campo número do documento não informado.',
                  'Preencha o campo para continuar']);
    Result := False;
    exit;
  end;

  if (FrPaymentType.DBLCB_Lista.KeyField = null ) then
  begin
    MensageAlert(['A T E N Ç Ã O!.',
                  '',
                  concat('Campo forma de pagamento não informado.'),
                  'Preencha o campo para continuar']);
    Result := False;
    exit;
  end;

  if ( StrToFloatDef(E_VL_Doc.Text,0) = 0 ) then
  begin
    MensageAlert(['A T E N Ç Ã O!.',
                  '',
                  'Campo valor do documento não informado.',
                  'Preencha o campo para continuar']);
    Result := False;
    exit;
  end;

  if ( cb_Situation.ItemIndex > 0 ) then
  Begin
    if (StrToFloatDef(E_Vl_Paid.Text,0) = 0) then
    begin
      MensageAlert(['A T E N Ç Ã O!.',
                    '',
                    'Campo valor pago não informado.',
                    'Preencha o campo para continuar']);
      Result := False;
      exit;
    end;


    if ( Dtp_Paid.Text = '30/12/1899'  ) or ( Dtp_Paid.Text = '') then
    begin
      MensageAlert(['A T E N Ç Ã O!.',
                    '',
                    'Campo Data de Pagamento não informado.',
                    'Preencha o campo para continuar']);
      Result := False;
      exit;
    end;
  End;
end;

end.
