unit cad_financial_baixa;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, base_form, uniEdit, uniLabel,
  uniGUIClasses, uniDateTimePicker, uniButton, uniBitBtn, uniSpeedButton,
  uniGUIBaseClasses, uniPanel, Vcl.Menus, uniMainMenu, Data.DB,
  Datasnap.DBClient,ControllerInvoice,unmessages;

type
  TCadFinancialBaixa = class(TBaseForm)
    pnl_botao: TUniPanel;
    SB_Confirm: TUniSpeedButton;
    SB_Cancel: TUniSpeedButton;
    pnl_fundo: TUniPanel;
    Dtp_Payment: TUniDateTimePicker;
    UniLabel5: TUniLabel;
    UniLabel6: TUniLabel;
    E_Nr_Invoice: TUniEdit;
    cds_Baixa: TClientDataSet;
    cds_Baixaid: TIntegerField;
    cds_Baixatag_value: TBCDField;
    cds_Baixaparcel: TIntegerField;
    procedure SB_CancelClick(Sender: TObject);
    procedure SB_ConfirmClick(Sender: TObject);
  private
    function validadeBaixa:Boolean;
    procedure Baixa;
  protected
    procedure InitVariable;Override;
    procedure SetVariable;Override;
    procedure setImages;Override;
    procedure FormatScreen;Override;


  public
      NotaFiscal : TControllerInvoice;
  end;

var
  CadFinancialBaixa: TCadFinancialBaixa;

implementation

{$R *.dfm}

uses MainModule;

{ TCadFinancialBaixa }

procedure TCadFinancialBaixa.Baixa;
begin
  cds_Baixa.first;
  while not cds_Baixa.Eof do
  Begin
    //Atualiza dados da nota
    with NotaFiscal do
    Begin
      Registro.Codigo            := cds_Baixa.FieldByName('id').Asinteger;
      Registro.Estabelecimento   := UMM.GInstitution.registro.Codigo;
      Registro.Terminal          := 0;
      getByKey;
      Registro.Numero            := E_Nr_Invoice.Text;
      update;
      //Registro baixa de pagamento
      Financeiro.Payment.Registro.Estabelecimento   := UMM.GInstitution.registro.Codigo;
      Financeiro.Payment.Registro.Ordem             := cds_Baixa.FieldByName('id').Asinteger;
      Financeiro.Payment.Registro.Terminal          := 0;
      Financeiro.Payment.Registro.Parcela           := cds_Baixa.FieldByName('parcel').Asinteger;
      Financeiro.Payment.Registro.Juro              := 0;
      Financeiro.Payment.Registro.ValorDeMora       := 0;
      Financeiro.Payment.Registro.AliquotaDesconto  := 0;
      Financeiro.Payment.Registro.ValorPago         := cds_Baixa.FieldByName('tag_value').asfloat;
      Financeiro.Payment.Registro.DataDoPagamento   := Dtp_Payment.DateTime;
      Financeiro.Payment.Registro.DataDaBaixa       := Date;
      Financeiro.Payment.Registro.Baixa             := 'S';
      Financeiro.Payment.Registro.PlanoContas       := 0;
      Financeiro.Payment.Registro.CodigoBaixa       := 0;
      Financeiro.Payment.save;
    End;
    cds_Baixa.Next;
  End;
end;

procedure TCadFinancialBaixa.FormatScreen;
begin
  Dtp_Payment.DateTime := Date;
end;

procedure TCadFinancialBaixa.InitVariable;
begin
  NotaFiscal := TControllerInvoice.create(Self);
end;

procedure TCadFinancialBaixa.SB_CancelClick(Sender: TObject);
begin
  Close;
end;

procedure TCadFinancialBaixa.SB_ConfirmClick(Sender: TObject);
begin
  try
    if validadeBaixa then
    Begin
      Self.showMask('Processando o estorno...Aguarde...');
      UniSession.Synchronize();
      Baixa;
      MensageAlert(['A T E N Ç Ã O!.',
                    '',
                    'Baixas efetuadas com sucesso.',
                    'Clique em OK para continuar']);
      Close;
    End;
  finally
    self.HideMask;
  end;
end;

procedure TCadFinancialBaixa.setImages;
begin
  inherited;
  buttonIcon(SB_Confirm,'confirm.bmp');
  buttonIcon(SB_Cancel,'abort.bmp');
end;

procedure TCadFinancialBaixa.SetVariable;
begin


end;

function TCadFinancialBaixa.validadeBaixa: Boolean;
begin
  Result := True;
  if (Trim(E_Nr_Invoice.Text) = '' ) then
  begin
    MensageAlert(['A T E N Ç Ã O!.',
                  '',
                  'Campo Número da Nota não informada.',
                  'Preencha o campo para continuar']);
    Result := False;
    exit;
  end;

end;

end.
