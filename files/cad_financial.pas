unit cad_financial;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, base_registry, Vcl.Menus, uniMainMenu,
  uniButton, uniBitBtn, uniSpeedButton, uniGUIBaseClasses, uniGUIClasses,
  uniPanel, uniDateTimePicker, uniLabel, uniEdit, fm_cfop,
  fm_Installment_open, fm_financial, fm_entity_fiscal, Controllerinvoice,
  unMessages, ControllerFinancialBills, MainModule, uniMemo, uniPageControl,
  Data.DB, Datasnap.DBClient;

type
  TCadFinancial = class(TBaseRegistry)
    UniLabel2: TUniLabel;
    Dtp_Emission: TUniDateTimePicker;
    E_Nr_Doc: TUniEdit;
    UniLabel1: TUniLabel;
    UniLabel3: TUniLabel;
    E_Mod_Doc: TUniEdit;
    UniLabel4: TUniLabel;
    E_Doc_Serie: TUniEdit;
    Ctn_Cfop: TUniContainerPanel;
    Ctn_Entity_Fiscal: TUniContainerPanel;
    Lb_VL_Doc: TUniLabel;
    E_VL_Doc: TUniNumberEdit;
    UniPageControl1: TUniPageControl;
    tbs_Parcelamento: TUniTabSheet;
    UniTabSheet2: TUniTabSheet;
    ctn_Financial: TUniContainerPanel;
    m_note: TUniMemo;
    UniLabel5: TUniLabel;
    E_Plots: TUniEdit;
    E_DeadLine: TUniEdit;
    procedure E_VL_DocExit(Sender: TObject);
    procedure E_Doc_SerieExit(Sender: TObject);
    procedure E_DeadLineExit(Sender: TObject);

  protected
    procedure InitVariable;Override;
    procedure formatScreen;Override;
    procedure SetVariable;Override;
    procedure ShowData;Override;
    procedure ShowNoData;Override;
    procedure EditionControl;Override;
    procedure ClearAllFields;Override;
    function ValidateSave():boolean;Override;
    procedure Save;Override;
    procedure SaveOrder;
    procedure SaveInvoice;
    procedure SaveFinancial;
    function ValidateCancel():boolean;Override;
    procedure Cancel;Override;


  private
    { Private declarations }
     FrCfop : TFmCFOP;
     FrEntity : TFmEntityFiscal;
     FrFinancial : TFmFinancial;
     procedure ShowCfop;
     procedure ShowEntity;
     procedure ShowFinancial;
     procedure setInstallment;
     procedure execInstallment;
  public
    Tipo : String;
    NumeroParcela : Integer;
    NotaFiscal : TControllerInvoice;
    { Public declarations }
  end;

var
  CadFinancial: TCadFinancial;

implementation

{$R *.dfm}

{ TBaseRegistry1 }

procedure TCadFinancial.Cancel;
begin
  Close;
end;

procedure TCadFinancial.ClearAllFields;
begin
  inherited;
//
end;

procedure TCadFinancial.EditionControl;
begin
//
end;

procedure TCadFinancial.execInstallment;
begin
  FrFinancial.execInstalment;
end;

procedure TCadFinancial.E_DeadLineExit(Sender: TObject);
begin
  try
    Self.showMask('Aguarde Processamento');
    UniSession.Synchronize();
    setInstallment;
    execInstallment;
    FrFinancial.Totalizer;
  finally
    self.HideMask;
  end;

end;

procedure TCadFinancial.E_Doc_SerieExit(Sender: TObject);
begin
  inherited;
  UniSession.AddJS('setTimeout(function(){'+ FrCfop.DBLCB_Lista.JSName +'.focus()}, 100)');
end;

procedure TCadFinancial.E_VL_DocExit(Sender: TObject);
begin
  setInstallment;
  UniSession.AddJS('setTimeout(function(){'+ E_Plots.JSName +'.focus()}, 100)');
end;

procedure TCadFinancial.formatscreen;
begin
  inherited;
  ShowCfop;
  ShowEntity;
  ShowFinancial;
end;

procedure TCadFinancial.InitVariable;
begin
  inherited;
  NotaFiscal := TControllerinvoice.create(Self);
end;

procedure TCadFinancial.Save;
begin
  SaveOrder;
  SaveInvoice;
  SaveFinancial;
  Close;
end;

procedure TCadFinancial.SaveFinancial;
Var
  LcParcel : Integer;
begin
  with FrFinancial.cds_financial do
  Begin
    First;
    LcParcel := 1;
    while not eof do
    Begin
      with NotaFiscal.Financeiro.Financial.Registro do
      Begin
        ordem               := NotaFiscal.Pedido.Registro.Codigo;
        Estabelecimento     := NotaFiscal.Pedido.Registro.Estabelecimento;
        Terminal            := 0;
        Parcela             := LcParcel;
        DataExpiracao       := FieldByName('dt_expiration').AsDateTime;
        TipoPagamento       := FieldByName('tb_payment_types_id').AsInteger;
        Valor               := FieldByName('tag_value').AsFloat;
      End;
      NotaFiscal.Financeiro.Financial.save;

      with NotaFiscal.Financeiro.Registro do
      Begin
        Ordem               := NotaFiscal.Pedido.Registro.Codigo;
        Estabelecimento     := NotaFiscal.Pedido.Registro.Estabelecimento;
        Terminal            := 0;
        Parcela             := LcParcel;
        PlanoContas         := 0;
        Numero              := Concat(E_Nr_Doc.Text, '/',IntToStr(LcParcel));
        if Self.Tipo = 'R' then
          Tipo                := 'RM'
        else
          Tipo                := 'PM';
        Situacao            := 'N';
        if (Tipo = 'R') then
          Operacao            := 'C'
        else
          Operacao            := 'D';
        Fase                := 'N';
      End;
      NotaFiscal.Financeiro.save;
      inc(LcParcel);
      next;
    End;
  End;
end;

procedure TCadFinancial.SaveInvoice;
begin
//
  with NotaFiscal.Registro do
  Begin
    Codigo              := NotaFiscal.Pedido.Registro.Codigo;
    Estabelecimento     := NotaFiscal.Pedido.Registro.Estabelecimento;
    terminal            := 0;
    if (Tipo = 'R') then
      Emitente          := UMM.GInstitution.registro.Codigo
    else
      Emitente          := FrEntity.DBLCB_Lista.KeyValue;
    TipoEmissao         := 'EM';
    Finalidade          := '1';
    Numero              := E_Nr_Doc.Text;
    Serie               := E_Doc_Serie.Text;
    if FrCfop.DBLCB_Lista.KeyValue <> null then
      Cfop              := FrCfop.DBLCB_Lista.KeyValue
    else
      Cfop              := '0000';
    Destinatario        := FrEntity.DBLCB_Lista.KeyValue;;
    Data_emissao        := Dtp_Emission.DateTime;;
    Valor               := StrToFloatDef(E_VL_Doc.Text,0);
    Modelo              := E_Mod_Doc.Text;
    Observacao          := m_note.Text;
    Status              := 'F';
  End;
  NotaFiscal.save;
end;

procedure TCadFinancial.SaveOrder;
begin
  with NotaFiscal.Pedido.Registro do
  Begin
    Codigo              := 0;
    Estabelecimento     := UMM.GInstitution.registro.Codigo;
    Terminal            := 0;
    Data            := Dtp_Emission.DateTime;
    Observacao      := '';
    Usuario         := UMM.GInstitution.User.Registro.codigo;
    Status          := 'F';
  End;
  NotaFiscal.PEdido.save;
end;

procedure TCadFinancial.setInstallment;
begin
  FrFinancial.DtEmissao := Dtp_Emission.DateTime;
  FrFinancial.Parcela   := 1;
  FrFinancial.ValorNota := E_VL_Doc.Value;
  FrFinancial.PrazoStr  := E_DeadLine.Text;
  FrFinancial.Order     := NotaFiscal.Financeiro.Registro.Ordem;
  FrFinancial.Parcela   := NotaFiscal.Financeiro.Registro.Parcela;
  FrFinancial.TErminal  := NotaFiscal.Financeiro.Registro.Terminal;
end;

procedure TCadFinancial.SetVariable;
begin
  if ( CodigoRegistro > 0 ) then
  Begin
    NotaFiscal.Financeiro.Registro.Ordem := CodigoRegistro;
    NotaFiscal.Financeiro.Registro.Estabelecimento := UMM.GInstitution.registro.Codigo;
    NotaFiscal.Financeiro.Registro.Parcela := NumeroParcela;
    NotaFiscal.Financeiro.getAllbykey;
  End;
  inherited;
end;

procedure TCadFinancial.ShowCfop;
begin
  FrCfop := TFmCFOP.Create(Self);
  FrCfop.Parent := Ctn_Cfop;
  FrCfop.Align := alClient;
  FrCfop.Listar;
  FrCfop.DBLCB_Lista.KeyValue := '5102';
  FrCfop.Show;

end;

procedure TCadFinancial.ShowData;
begin
  with NotaFiscal.Pedido.Registro do
  Begin
    Dtp_Emission.DateTime := Data;
  End;
  with NotaFiscal.Registro do
  Begin
    E_Nr_Doc.Text                 := Numero;
    E_Doc_Serie.Text              := Serie;
    FrCfop.DBLCB_Lista.KeyValue   := Cfop;
    FrEntity.DBLCB_Lista.KeyValue := Destinatario;
    Dtp_Emission.DateTime         := Data_emissao;
    E_VL_Doc.Text                 := FloatToSTrF(Valor,ffFixed,10,2);
    E_Mod_Doc.Text                := Modelo;
    m_note.Text                   := Observacao
  End;
  setInstallment;
  FrFinancial.showDataInstalment;
end;

procedure TCadFinancial.ShowEntity;
begin
  FrEntity := TFmEntityFiscal.Create(Self);
  FrEntity.Parent := Ctn_Entity_Fiscal;
  FrEntity.Align := alClient;
  FrEntity.listar;
  if (tipo = 'R') then
    FrEntity.DBLCB_Lista.FieldLabel := 'Nome do Cliente'
  else
    FrEntity.DBLCB_Lista.FieldLabel := 'Nome do Fornecedor';
  FrEntity.Show;
end;

procedure TCadFinancial.ShowFinancial;
begin
  FrFinancial := TFmFinancial.Create(Self);
  FrFinancial.Parent := ctn_Financial;
  FrFinancial.Align := alClient;
  FrFinancial.listarPayment;
  FrFinancial.Show;
end;


procedure TCadFinancial.ShowNoData;
begin
  ClearAllFields;
end;

function TCadFinancial.ValidateCancel: boolean;
begin
  Result := True;
end;

function TCadFinancial.ValidateSave: boolean;
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

  if (FrEntity.DBLCB_Lista.KeyField = null ) then
  begin
    MensageAlert(['A T E N Ç Ã O!.',
                  '',
                  concat('Campo ', FrEntity.DBLCB_Lista.FieldLabel,' não informado.'),
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

  if ( FrFinancial.cds_financial.RecordCount = 0 ) then
  begin
    MensageAlert(['A T E N Ç Ã O!.',
                  '',
                  'Favor informe o prazo e forma de pagamento.',
                  'Verifique e tente novamente']);
    Result := False;
    exit;
  end;
end;

end.
