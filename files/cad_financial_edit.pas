unit cad_financial_edit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, base_registry, uniEdit, uniGUIClasses,
  uniDateTimePicker, uniLabel, Vcl.Menus, uniMainMenu, Data.DB,unmessages,
  Datasnap.DBClient, uniButton, uniBitBtn, uniSpeedButton, uniGUIBaseClasses,
  uniPanel, uniMemo,ControllerInvoice, MainModule, fm_payment_type;

type
  TCadFinancialEdit = class(TBaseRegistry)
    UniLabel2: TUniLabel;
    Dtp_Emission: TUniDateTimePicker;
    E_Nr_Doc: TUniEdit;
    UniLabel1: TUniLabel;
    UniLabel3: TUniLabel;
    E_Mod_Doc: TUniEdit;
    UniLabel4: TUniLabel;
    E_Doc_Serie: TUniEdit;
    Lb_VL_Doc: TUniLabel;
    E_VL_Doc: TUniNumberEdit;
    Dtp_Expiration: TUniDateTimePicker;
    E_Vl_Parcela: TUniNumberEdit;
    UniLabel5: TUniLabel;
    UniLabel6: TUniLabel;
    E_Nr_Parcela: TUniNumberEdit;
    UniLabel7: TUniLabel;
    Ctn_PaymentType: TUniContainerPanel;
    m_note: TUniMemo;
    UniLabel8: TUniLabel;
    Sair1: TUniMenuItem;
    procedure Sair1Click(Sender: TObject);
  private
    { Private declarations }
    FrPaymentType     : TfmPaymentType;
    procedure ShowPaymentType;
  protected
    //Variaveis
    procedure InitVariable;Override;
    procedure SetVariable;Override;
    procedure setImages;Override;
    procedure FormatScreen;Override;

    procedure ShowData;Override;

    //Salvar
    function ValidateSave():boolean;Override;
    procedure Save;Override;
    //Cancelar
    function ValidateCancel():boolean;Override;
    procedure Cancel;Override;

    procedure EditionControl;Override;

  public
    { Public declarations }
    NotaFiscal : TControllerinvoice;
  end;

var
  CadFinancialEdit: TCadFinancialEdit;

implementation

{$R *.dfm}

procedure TCadFinancialEdit.Cancel;
begin
  Close;
end;

procedure TCadFinancialEdit.EditionControl;
begin

end;

procedure TCadFinancialEdit.FormatScreen;
begin
  inherited;
  ShowPaymentType;
end;

procedure TCadFinancialEdit.InitVariable;
begin
  inherited;
  NotaFiscal := TControllerinvoice.create(Self);
end;

procedure TCadFinancialEdit.Sair1Click(Sender: TObject);
begin
  inherited;
  Close;
end;

procedure TCadFinancialEdit.Save;
begin
  With NotaFiscal do
  Begin
    Financeiro.Financial.Registro.TipoPagamento := FrPaymentType.DBLCB_Lista.KeyValue;
    Financeiro.Financial.Registro.Valor         := E_Vl_Parcela.Value;
    Financeiro.Financial.Registro.DataExpiracao := Dtp_Expiration.DateTime;
    Financeiro.Financial.save;
    Close;
  End;
end;

procedure TCadFinancialEdit.setImages;
begin
  inherited;

end;

procedure TCadFinancialEdit.SetVariable;
begin
  NotaFiscal.Financeiro.getAllbykey;
  inherited;
end;

procedure TCadFinancialEdit.ShowData;
begin
  with NotaFiscal.Registro do
  Begin
    E_Nr_Doc.Text                 := Numero;
    E_Doc_Serie.Text              := Serie;
    Dtp_Emission.DateTime         := Data_emissao;
    E_VL_Doc.Text                 := FloatToSTrF(Valor,ffFixed,10,2);
    E_Mod_Doc.Text                := Modelo;
    m_note.Text                   := Observacao
  End;
  with NotaFiscal.Financeiro.Financial.Registro do
  Begin
    E_Nr_Parcela.Value  :=  Parcela;
    E_Vl_Parcela.Value := Valor;
    Dtp_Expiration.DateTime := DataExpiracao;
    FrPaymentType.DBLCB_Lista.KeyValue := TipoPagamento;
  End;

end;

procedure TCadFinancialEdit.ShowPaymentType;
begin
  FrPaymentType := TfmPaymentType.Create(Self);
  FrPaymentType.Parent := Ctn_PaymentType;
  FrPaymentType.listar;
  FrPaymentType.Align := alClient;
  FrPaymentType.Show;
end;

function TCadFinancialEdit.ValidateCancel: boolean;
begin

end;

function TCadFinancialEdit.ValidateSave: boolean;
begin
  Result := True;
  if trim(FrPaymentType.DBLCB_Lista.Text ) = '' then
  begin
    MensageAlert(['A T E N Ç Ã O!.',
                  '',
                  'Campo forma de pagamento não informado.',
                  'Preencha o campo para continuar']);
    Result := False;
    exit;
  end;

  if not (E_Vl_Parcela.Value > 0 ) then
  begin
    MensageAlert(['A T E N Ç Ã O!.',
                  '',
                  'Campo valor da parcelaa não informado.',
                  'Preencha o campo para continuar']);
    Result := False;
    exit;
  end;

  if trim(Dtp_Expiration.Text) = '30/12/1899' then
  begin
    MensageAlert(['A T E N Ç Ã O!.',
                  '',
                  'Campo Data de Vencimento não informado.',
                  'Preencha o campo para continuar']);
    Result := False;
    exit;
  end;
end;

end.

