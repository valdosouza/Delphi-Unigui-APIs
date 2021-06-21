unit tas_to_invoice;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, base_form, uniPanel, Vcl.StdCtrls,DBXJSON,
  uniMemo, uniMultiItem, uniComboBox, uniCheckBox, uniGroupBox, uniRadioButton,
  uniDateTimePicker, uniRadioGroup, uniButton, uniBitBtn, uniSpeedButton,prm_invoice_shipping,
  uniGUIClasses, uniEdit, uniLabel, uniGUIBaseClasses,ControllerInvoiceSale,prm_invoice_merchandise,
  uniPageControl, fm_state, prm_to_invoice, fm_freight_mode, fm_cfop, fm_carrier,
  tas_msg_process,REST.Json,System.Json,ClientProxy,
  REST.JsonReflect,DBXJSONReflect, UnFunctions, prm_call_invoice, prm_nfe,
  Data.DB, Datasnap.DBClient, Vcl.Menus, uniMainMenu;

type
  TDSCallbackMethod = reference to function(const Args: TJSONValue): TJSONValue;

  TTasToInvoice = class(TBaseForm)
    pnl_Botao: TUniPanel;
    UniPanel1: TUniPanel;
    Sb_Confirm: TUniSpeedButton;
    Sb_Abort: TUniSpeedButton;
    UniRadioGroup1: TUniRadioGroup;
    UniPanel3: TUniPanel;
    UniDateTimePicker2: TUniDateTimePicker;
    UniRadioGroup3: TUniRadioGroup;
    UniRadioButton1: TUniRadioButton;
    UniLabel1: TUniLabel;
    Grp_Parameters: TUniGroupBox;
    chbx_get_NFe_authorization: TUniCheckBox;
    UniPanel4: TUniPanel;
    Dtp_Emission: TUniDateTimePicker;
    Dtp_Exit: TUniDateTimePicker;
    Cb_Exit: TUniCheckBox;
    UniLabel3: TUniLabel;
    RG_Direction_Types: TUniRadioGroup;
    UniPanel5: TUniPanel;
    O: TUniLabel;
    M_Observation: TUniMemo;
    Grp_Info_Carrier: TUniGroupBox;
    Ctn_Carrier: TUniContainerPanel;
    Ctn_Freight_Mode: TUniContainerPanel;
    Grp_Dates: TUniGroupBox;
    Ctn_Cfop: TUniContainerPanel;
    pg_Total: TUniPageControl;
    tbs_Totais: TUniTabSheet;
    UniPanel6: TUniPanel;
    UniLabel23: TUniLabel;
    E_BC_ICMS: TUniFormattedNumberEdit;
    UniLabel28: TUniLabel;
    E_Vl_freight: TUniFormattedNumberEdit;
    E_Vl_Assurance: TUniFormattedNumberEdit;
    E_VL_ICMS: TUniFormattedNumberEdit;
    UniLabel24: TUniLabel;
    UniLabel25: TUniLabel;
    UniLabel26: TUniLabel;
    UniLabel27: TUniLabel;
    E_Vl_Product: TUniFormattedNumberEdit;
    E_VL_ICMS_ST: TUniFormattedNumberEdit;
    E_BC_ICMS_ST: TUniFormattedNumberEdit;
    E_VL_Expenses: TUniFormattedNumberEdit;
    UniLabel30: TUniLabel;
    UniLabel31: TUniLabel;
    E_VL_IPI: TUniFormattedNumberEdit;
    UniLabel29: TUniLabel;
    UniLabel33: TUniLabel;
    E_Vl_Invoice: TUniFormattedNumberEdit;
    tbs_Shipping: TUniTabSheet;
    UniPanel7: TUniPanel;
    UniLabel20: TUniLabel;
    E_Shp_Qtde: TUniFormattedNumberEdit;
    UniLabel35: TUniLabel;
    E_Shp_Kind: TUniFormattedNumberEdit;
    UniLabel36: TUniLabel;
    E_Shp_Brand: TUniFormattedNumberEdit;
    UniLabel37: TUniLabel;
    E_Shp_Number: TUniFormattedNumberEdit;
    UniLabel38: TUniLabel;
    E_Shp_Gross_Weight: TUniFormattedNumberEdit;
    UniLabel39: TUniLabel;
    E_Shp_Net_Weight: TUniFormattedNumberEdit;
    E_Car_Plaque: TUniLabel;
    UniEdit2: TUniFormattedNumberEdit;
    UniLabel6: TUniLabel;
    E_Car_rntc: TUniFormattedNumberEdit;
    Ctn_State: TUniContainerPanel;
    tbs_other: TUniTabSheet;
    UniPanel2: TUniPanel;
    Grp_Ctrl_docs: TUniGroupBox;
    chbx_ctrl_Doc_Return: TUniCheckBox;
    chbx_discharge_doc: TUniCheckBox;
    Grp_Ctrl_docs_kind: TUniRadioGroup;
    UniLabel2: TUniLabel;
    E_Nr_Doc_Return: TUniFormattedNumberEdit;
    Chbx_create_bills_pay: TUniCheckBox;
    Chbx_create_bills_receive: TUniCheckBox;
    Chbx_Ctrl_returns: TUniCheckBox;
    Chbx_Sum_ICMS_NF: TUniCheckBox;
    Chbx_Sum_IPI_ICMS: TUniCheckBox;
    Chbx_Sum_IPI_ICMS_ST: TUniCheckBox;
    Chbx_spread_ICMS: TUniCheckBox;
    Chbx_spread_ICMS_ST: TUniCheckBox;
    Chbx_spread_IPI: TUniCheckBox;
    Chbx_UpdateStock: TUniCheckBox;
    Chbx_Mva_Original: TUniCheckBox;
    Chbx_SumFreight: TUniCheckBox;
    E_VL_Desconto: TUniFormattedNumberEdit;
    UniLabel4: TUniLabel;
    Grp_NF_ByHand: TUniGroupBox;
    E_Nr_Nfe_Manual: TUniEdit;
    UniLabel5: TUniLabel;
    chbx_NF_byHand: TUniCheckBox;
    procedure initVariable;Override;
    procedure FormatScreen;Override;
    procedure setVariable;Override;
    procedure setImages;Override;
    procedure InvoiceTo;Virtual;
    procedure Sb_ConfirmClick(Sender: TObject);
    procedure Sb_AbortClick(Sender: TObject);
    procedure chbx_NF_byHandClick(Sender: TObject);
  private
    { Private declarations }
    FrCfop : TFmCFOP;
    FrCArrier : TFmCarrier;
    FrState : TFmState;
    FrFreightMode : TfmFreightMode;
    procedure ShowCfop;
    procedure ShowCarrier;
    procedure ShowState;
    procedure ShowFreightMode;
    procedure createCallBacks;
  type
    TMessageCallback = class(TDBXCallback)
    private
      FCallBackMethod: TDSCallbackMethod;
    public
      constructor Create(CallBackMethod: TDSCallbackMethod);
      function Execute(const Arg: TJSONValue): TJSONValue; override;
    end;

  protected
    ParameToInvoice :TPrmToInvoicer;
    function validateToInvoice:Boolean;Virtual;
    function ToCalculateInvoice:Boolean;Virtual;
    function ToInvoice:Boolean;Virtual;

    function getparamMerchandise:TPrmInvoiceMerchandise;
    procedure setparamMerchandise(p:TPrmInvoiceMerchandise);
    function getparamShipping:TPrmInvoiceShipping;
    function getparameter: TPrmToInvoicer;
  public
    callInvoice : TPrmCallInvoice;
    totalizador: TMessageCallback;
    Faturamento: TMessageCallback;
  end;

var
  TasToInvoice: TTasToInvoice;

implementation


uses msg_form, unMessages, MainModule, Main, openForms;

{$R *.dfm}
{ TTasMsgProcess.TChatCallback }

constructor TTasToInvoice.TMessageCallback.Create(CallBackMethod: TDSCallbackMethod);
begin
  FCallBackMethod := CallBackMethod;
end;

function TTasToInvoice.TMessageCallback.Execute(const Arg: TJSONValue): TJSONValue;
begin
  Result := FCallbackMethod(Arg);
end;



procedure TTasToInvoice.ShowCarrier;
begin
  FrCArrier := TFmCarrier.Create(Self);
  FrCArrier.Parent := Ctn_Carrier;
  FrCArrier.Align := alClient;
  FrCArrier.Listar;
  FrCArrier.Show;
end;

procedure TTasToInvoice.ShowCfop;
begin
  FrCfop := TFmCFOP.Create(Self);
  FrCfop.Parent := Ctn_Cfop;
  FrCfop.Align := alClient;
  FrCfop.Listar;
  FrCfop.DBLCB_Lista.KeyValue := '5102';
  FrCfop.Show;
end;

procedure TTasToInvoice.ShowFreightMode;
begin
  FrFreightMode := TfmFreightMode.Create(Self);
  FrFreightMode.Parent := Ctn_Freight_Mode;
  FrFreightMode.Align := alClient;
  FrFreightMode.Listar;
  FrFreightMode.DBLCB_Lista.KeyValue := 2;
  FrFreightMode.Show;
end;

procedure TTasToInvoice.ShowState;
begin
  FrState := TFmState.Create(Self);
  FrState.Parent := ctn_state;
  FrState.Align := alClient;
  FrState.Listar(1058);
  FrState.Show;
end;

function TTasToInvoice.ToCalculateInvoice: Boolean;
var
  LcJSon : String;
  M : TJSONMarshal;
  jv : TJSONValue;
  p: TCProxy;
begin
  try
    ShowMask('Calculando valores da Nota Fiscal...');
    createCallBacks;
    ParameToInvoice := self.getparameter;
    p := TCProxy.Create(MainForm.SQLConnect.DBXConnection);
    M := TJSONMarshal.Create(TJSONConverter.Create);
    jv := M.Marshal(ParameToInvoice);
    LcJSon := jv.ToString;
    p.CalculateInvoice(LcJSon,totalizador);
    UniSession.Synchronize;
  finally
    FreeAndNil(M);
    FreeAndNil(jv);
    FreeAndNil(p);
    HideMask;
    MensageYesNo(['C O N F I R M A Ç Ã O!',
                  '',
                  'Favor Conferir os valores totais da nota.',
                  'Confirmar os Valores ?'],mpAlerta);
    FormMsg.ShowModal(
      Procedure(Sender: TComponent; AResult:Integer)
      begin
        if (Sender as TMsgForm).BotaoEscolhido > 0 then
        Begin
          Self.Close;
          FormMsg := Nil;
          ToInvoice;
        End;
      end
    );
  end;
end;

function TTasToInvoice.ToInvoice: Boolean;
Var
  LcJSon : String;
  ParamNfe : TPrmNFe;
  LcSolicita : Boolean;
  M : TJSONMarshal;
  jv : TJSONValue;
  p: TCProxy;
begin
  try
    ShowMask('Efetuando o Faturamento...');
    ParamNfe := TPrmNFe.Create;
    createCallBacks;
    ParameToInvoice := self.getparameter;
    LcSolicita := ParameToInvoice.SolicitaNfe;
    p := TCProxy.Create(MainForm.SQLConnect.DBXConnection);
    M := TJSONMarshal.Create(TJSONConverter.Create);
    jv := M.Marshal(ParameToInvoice);
    LcJSon := jv.ToString;
    p.ToInvoice(LcJSon,Faturamento);
    UniSession.Synchronize;
    ParamNfe.Estabelecimento :=Self.ParameToInvoice.Estabelecimento;
    ParamNfe.Ordem := Self.ParameToInvoice.Ordem;
    ParamNfe.Operacao := '';
    ParamNfe.Motivo := '';
  finally
    FreeAndNil(M);
    FreeAndNil(jv);
    FreeAndNil(p);
    HideMask;
    MensageWaitToProceed(['S U C E S S O !',
                  '',
                  'Faturamento Realizado com Sucesso.',
                  '']);
    FormMsg.ShowModal(
      Procedure(Sender: TComponent; AResult:Integer)
      begin
        if LcSolicita  then
          OpenAuthorizeNfe55(ParamNfe);
      end
    );
  end;
end;

procedure TTasToInvoice.chbx_NF_byHandClick(Sender: TObject);
begin
  if chbx_NF_byHand.checked then
  Begin
    Grp_NF_ByHand.visible := True;
  End
  else
  Begin
    E_Nr_Nfe_Manual.Text := '';
    Grp_NF_ByHand.visible := False;
  End;
end;

procedure TTasToInvoice.createCallBacks;
begin

  Totalizador := TMessageCallback.Create( function(const Args: TJSONValue) : TJSONValue
  var
    LJSONObject: TJSONObject;
    unM:TJSONUnMarshal;
    LcParMerchandise :TPrmInvoiceMerchandise;
    jv: TJSONValue;
  begin
    LJSONObject := TJSONObject.create;
    LJSONObject := TJSONObject(Args);
    jv := LJSONObject. Get(0).JsonValue;
    jv := TJSONObject.ParseJSONValue(
                          JsonMinify( jv.ToString )
                    );
    if assigned(jv) then
    Begin
      unM:=TJSONUnMarshal.Create;
      LcParMerchandise := TPrmInvoiceMerchandise(unm.Unmarshal(jv));
      setparamMerchandise(LcParMerchandise);
    End;
    Result := TJSONTrue.Create;
  end);


  Faturamento := TMessageCallback.Create( function(const Args: TJSONValue) : TJSONValue
  begin
    Result := TJSONTrue.Create;
  end);

end;

procedure TTasToInvoice.FormatScreen;
begin
  inherited;
  RG_Direction_Types.Visible := callInvoice.MostraSentido;
  chbx_get_NFe_authorization.Enabled := callInvoice.AutroizaNfe;
  ShowCfop;
  ShowCarrier;
  ShowFreightMode;
  ShowState;
  pg_total.activepageIndex := 0;
end;

function TTasToInvoice.getparameter:TPrmToInvoicer;
begin
  Result := TPrmToInvoicer.Create;
  with Result do
  Begin
    Estabelecimento := callInvoice.Estabelecimento;
    Emitente      := callInvoice.Emitente;
    Destinatario  := callInvoice.Destinatario;
    Usuario       := UMM.GInstitution.User.Registro.codigo;
    Ordem         := callInvoice.Ordem;
    ModeloNFe     := callInvoice.ModeloNFe;
    if Ctn_Cfop.Visible then
      CFOP := FrCfop.DBLCB_Lista.KeyValue
    else
      CFOP := '0000';
    Tipo          := 'Ajuste';
    NumeroManual := E_Nr_Nfe_Manual.Text;
    if (FrCArrier.DBLCB_Lista.KeyValue <> Null) then
      Transportadora := FrCArrier.DBLCB_Lista.KeyValue
    else
      Transportadora := 0;

    if (FrFreightMode.DBLCB_Lista.KeyValue <> Null) then
      ModalFrete := FrFreightMode.DBLCB_Lista.KeyValue
    else
      Transportadora := 0;

    if RG_Direction_Types.ItemIndex = 0 then
      DirecaoOperacao := 'S'
    else
      DirecaoOperacao := 'E';

    DataEmissao := Dtp_Emission.DateTime;
    DataSaida := Dtp_Exit.DateTime;
    Observacao := M_Observation.Text;
    //Outros Parametros Nota
    SolicitaNfe := chbx_get_NFe_authorization.Checked;
    ContasReceber := Chbx_create_bills_receive.Checked;
    ContasPagar := Chbx_create_bills_pay.Checked;
    SomaICMS := Chbx_Sum_ICMS_NF.Checked;
    SomaIpiBaseIcms := Chbx_Sum_IPI_ICMS.Checked;
    SomaIpiBaseIcmsSt := Chbx_Sum_IPI_ICMS_ST.Checked;
    DistribuirIcms := Chbx_spread_ICMS.Checked;
    DistribuirIcmsSt := Chbx_spread_ICMS_ST.Checked;
    DistribuirIpi := Chbx_spread_IPI.Checked;
    ControlaDevolucao := Chbx_Ctrl_returns.Checked;
    AtualizarEstoque := Chbx_UpdateStock.Checked;
    UsarMvaOriginal := Chbx_Mva_Original.Checked;
    SomarFreteNota := Chbx_SumFreight.Checked;

    //Controle de Retorno de documento
    ControlarRetorno := chbx_ctrl_Doc_Return.Checked;
    BaixarRetorno  := chbx_discharge_doc.Checked;
    if Grp_Ctrl_docs_kind.ItemIndex = 0 then
      TipoControle := 'PE'
    else
      TipoControle := 'NF';
    NumeroControle := E_Nr_Doc_Return.Text;
    NotaMercadoria := getparamMerchandise;
    NotaEntrega     := getparamShipping;
  End;
end;


function TTasToInvoice.getparamMerchandise: TPrmInvoiceMerchandise;
begin
  Result := TPrmInvoiceMerchandise.Create;
  with Result do
  Begin
    DataFaturamento := Dtp_Emission.DateTime;
    DataSaida       := Dtp_Exit.DateTime;
    ValorBaseICMS   := E_BC_ICMS.Value;
    ValorICMS       := E_VL_ICMS.Value;
    ValorBaseIcmsSt := E_BC_ICMS_ST.Value;
    ValorIcmsSt     := E_VL_ICMS_ST.Value;
    ValorProduto    := E_Vl_Product.Value;
    ValorFrete      := E_Vl_freight.Value;
    ValorSeguro     := E_Vl_Assurance.Value;
    ValorDespesas   := E_VL_Expenses.Value;
    ValorIpi        := E_VL_IPI.Value;
  End;
end;

procedure TTasToInvoice.setparamMerchandise(p:TPrmInvoiceMerchandise);
Begin
  with P do
  Begin
    E_BC_ICMS.Text     := FloatToStrF(ValorBaseICMS,ffGeneral,10,2);
    E_VL_ICMS.Text      := FloatToStrF(ValorICMS,ffGeneral,10,2);
    E_BC_ICMS_ST.Text   := FloatToStrF(ValorBaseIcmsSt,ffGeneral,10,2);
    E_VL_ICMS_ST.Text   := FloatToStrF(ValorIcmsSt,ffGeneral,10,2);
    E_Vl_Product.Text   := FloatToStrF(ValorProduto,ffGeneral,10,2);
    E_Vl_freight.Text   := FloatToStrF(ValorFrete,ffGeneral,10,2);
    E_Vl_Assurance.Text := FloatToStrF(ValorSeguro,ffGeneral,10,2);
    E_VL_Expenses.Text  := FloatToStrF(ValorDespesas,ffGeneral,10,2);
    E_VL_IPI.Text       := FloatToStrF(ValorIpi,ffGeneral,10,2);
    E_Vl_Invoice.Text   := FloatToStrF(ValorTotal,ffGeneral,10,2);
  End;
end;

function TTasToInvoice.getparamShipping: TPrmInvoiceShipping;
begin
  Result := TPrmInvoiceShipping.Create;
  with Result do
  Begin
    Quantidade      := StrToFloatDef( E_Shp_Qtde.Text,0);
    Classificacao   := E_Shp_Kind.Text;
    Marca           := E_Shp_Brand.Text;
    PesoBruto       := E_Shp_Gross_Weight.Text;
    NumeroVolume    := E_Shp_Number.Text;
    PlacaVeiculo    := E_Car_Plaque.Text;
    PlacaEstado     := FrState.DBLCB_Lista.Text;
    Placarntc       := E_Car_rntc.Text;
  End;
end;

procedure TTasToInvoice.initVariable;
begin
  Inherited;
  pg_Total.ActivePage := tbs_Totais;
  ParameToInvoice := TPrmToInvoicer.Create;
end;

procedure TTasToInvoice.InvoiceTo;
begin
//
end;

procedure TTasToInvoice.Sb_AbortClick(Sender: TObject);
begin
  inherited;
  Self.Close;
end;

procedure TTasToInvoice.Sb_ConfirmClick(Sender: TObject);
begin
  validateToInvoice;
end;

procedure TTasToInvoice.setImages;
begin
  inherited;
  buttonIcon(SB_Confirm,'confirm.bmp');
  buttonIcon(SB_Abort,'abort.bmp');
end;

procedure TTasToInvoice.setVariable;
begin
  Dtp_Emission.DateTime := Date;
  Dtp_Exit.DateTime := Date;
end;

function TTasToInvoice.validateToInvoice: Boolean;
Var
  LcJSon : String;
  M : TJSONMarshal;
  jv : TJSONValue;
begin
  Result := True;
  if FrFreightMode.DBLCB_Lista.KeyValue = Null then
  begin
    MensageAlert(['A T E N Ç Ã O!.',
                 '',
                 'Campo modalidade de Frete não informado.',
                 'Preencha o campo para continuar']);
    Result:=False;
    Exit;
  end;

  if chbx_NF_byHand.checked then
  begin
    if StrToIntDef( E_Nr_Nfe_Manual.Text,0) = 0 then
    Begin
      MensageAlert(['A T E N Ç Ã O!.',
                   '',
                   'Informe um número nota válido.',
                   '']);
      Result:=False;
      Exit;
    End;
  end;

  ParameToInvoice := self.getparameter;
  try
    M := TJSONMarshal.Create(TJSONConverter.Create);
    jv := M.Marshal(ParameToInvoice);
    LcJSon := jv.ToString;
  finally
    FreeAndNil(M);
    FreeAndNil(jv);
  end;

    MensageProcess('Validação Nota Fiscal Eletrônica',
                   LcJSon
    );
  if not TasMsgProcess.ShowModal(
    )= mrOK then
    BEgin
      Result := False;
      Exit;
    end;

end;

end.
