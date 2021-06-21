unit tas_order_purchase;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, tas_order, Vcl.Menus, uniMainMenu,System.AnsiStrings,
  uniButton, uniBitBtn, uniSpeedButton, uniGUIBaseClasses, uniGUIClasses,
  uniPanel, uniDateTimePicker, uniEdit, uniLabel, uniPageControl, fm_provider,fm_situation,
  fm_payment_type,ControllerOrderPurchase, unmessages, MainModule, msg_form,FireDAC.Stan.Param,
  uniBasicGrid, uniDBGrid, Data.DB, Datasnap.DBClient, tblOrderItem, fm_order_items_Purchase,
  uniCheckBox, uniRadioGroup, uniMemo, fm_entity_fiscal, fm_carrier, fm_address_delivery,
  REST.Json,System.Json,uReportCM, fm_shipping, UnFunctions,
  prm_call_invoice, tas_copy_invoice, ControllerOrderITem,ControllerOrderHasPurchase ;

type
  TTasOrderPurchase = class(TTasOrder)
    pg_Geral: TUniPageControl;
    tbs_List: TUniTabSheet;
    tbs_other: TUniTabSheet;
    L_Codigo: TUniLabel;
    E_Number: TUniEdit;
    E_DateRegistry: TUniDateTimePicker;
    L_DtRegistry: TUniLabel;
    Ctn_Provider: TUniContainerPanel;
    ListBuy: TUniMenuItem;
    UniPanel4: TUniPanel;
    UniLabel13: TUniLabel;
    M_note: TUniMemo;
    chbx_approved: TUniCheckBox;
    tbs_billing: TUniTabSheet;
    UniPanel1: TUniPanel;
    Ctn_Cobranca: TUniContainerPanel;
    Ctn_PaymentType: TUniContainerPanel;
    tbs_Delivery: TUniTabSheet;
    Ctn_Order_itens_Purchase: TUniContainerPanel;
    Ctn_Installment_open: TUniContainerPanel;
    Ctn_Shipping: TUniContainerPanel;
    NotaFiscal1: TUniMenuItem;
    Copiaritens1: TUniMenuItem;
    procedure InitVariable;Override;
    procedure setVariable; override;
    procedure FormatScreen;Override;
    procedure ShowData;Override;
    procedure ShowDataOrder;
    procedure ShowDataBilling;
    procedure ShowDataShipping;
    procedure ShowDataTotalizer;
    procedure ShowNoData;Override;
    procedure ClearAllFields;Override;
    procedure EditionControl;Override;
    procedure ListBuyClick(Sender: TObject);
    procedure NotaFiscal1Click(Sender: TObject);
    procedure Copiaritens1Click(Sender: TObject);
  private
    { Private declarations }
  protected
    FrProvider            : TFmProvider;
    FrOrderItemsPurchase  : TFmOrderItemsPurchase;
    procedure ShowProvider;
    procedure ShowlisttItems;

    function  ValidaInsert():boolean;Override;
    procedure Insert;Override;
    function  ValidateSave: boolean;Override;

    procedure Save;Override;
    procedure SaveOrder;
    procedure SaveOrderPurchase;
    procedure SaveOrderBilling;
    procedure SaveOrderShipping;
    procedure SaveOrdertotalizer;
    procedure SaveOrderItems(cds_items : TClientDataSet; order_id:Integer);Override;

    function  ValidateDelete: boolean;Override;
    procedure Delete;Override;

    function ValidateChange():boolean;Override;
    procedure Change;Override;

    function validatePrintOrder:Boolean;Override;
    procedure printOrder;Override;

    function validateInvoice:Boolean;Override;
    procedure toInvoice;Override;
  public
    { Public declarations }
    OrderPurchase: TControllerOrderPurchase;
  end;

var
  TasOrderPurchase: TTasOrderPurchase;

implementation

{$R *.dfm}

uses openForms, tas_order_list_to_buy, openReports,
  prm_base_report, prm_rep_order, Main;

{ TTasOrderPurchase }

procedure TTasOrderPurchase.Change;
begin
  inherited;

end;

procedure TTasOrderPurchase.ClearAllFields;
begin
  inherited;
  ClearFields(FrProvider);
  ClearFields(FrPaymentType);
  ClearFields(FrInstallmentOpen);
  IF (FrOrderItemsPurchase.cds_items.Active) then
    FrOrderItemsPurchase.cds_items.EmptyDataSet;
  ClearFields(frEntityFiscal);
  ClearFields(FrShipping);
  ClearFields(FrShipping.FrAddressDelivery);
  ClearFields(FrShipping.FrCarrier);
  ClearFields(FrShipping.FrFreightMode);
  ClearFields(Self);
  OrderPurchase.clear;

end;

procedure TTasOrderPurchase.Copiaritens1Click(Sender: TObject);
Var
  Form : TTasCopyInvoice;
begin
  Form := TTasCopyInvoice.Create(UniApplication);
  Form.cds_items := FmOrderItemsPurchase.cds_items;
  Form.ShowModal;
end;

procedure TTasOrderPurchase.Delete;
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
          //Order.delete;
          //OrderTotalizer.delete;
          //Provider.delete;
          //PaymentType.delete;
          OrderPurchase.delete;
          ClearAllFields;
        End;
      end
    );
end;


procedure TTasOrderPurchase.EditionControl;
begin
  inherited;
  EditionControler(FrProvider);
  EditionControler(FrPaymentType);
  Sb_Invoice.Enabled := ( EditionState = 'B' );
  Sb_print.Enabled := ( EditionState = 'B' );
  EditionControler(FrOrderItemsPurchase);
  EditionControler(FrShipping);
  ListBuy.enabled := ( EditionState = 'I' ) or ( EditionState = 'E' );
  Copiaritens1.Enabled := ( EditionState = 'I' ) or ( EditionState = 'E' );
end;

procedure TTasOrderPurchase.FormatScreen;
begin
  inherited;
  pg_Geral.ActivePage := tbs_List;
  ShowProvider;
  ShowlisttItems;
  ShowPaymentType(Ctn_PaymentType);
  ShowInstallmentOpen(Ctn_Installment_open);
  ShowEntityFiscal(Ctn_Cobranca);
  ShowShipping(Ctn_Shipping);
end;

procedure TTasOrderPurchase.InitVariable;
begin
  inherited;
  OrderPurchase := TControllerOrderPurchase.Create(self);
end;

procedure TTasOrderPurchase.Insert;
begin
  inherited;
  ClearAllFields;
end;

procedure TTasOrderPurchase.ListBuyClick(Sender: TObject);
var
  Form : TTasOrderListToBuy;
begin
  if Form = nil then
    Form := TTasOrderListToBuy.Create(UniApplication);
  Form.cds_temp := FrOrderItemsPurchase.cds_items;
  Form.Show(
    Procedure(Sender: TComponent; AResult:Integer)
    begin
      FrOrderItemsPurchase.cds_items := Form.cds_Temp;
      Form := nil;
    end
  );
end;

procedure TTasOrderPurchase.NotaFiscal1Click(Sender: TObject);
begin
  if ValidatehasInvoice(OrderPurchase.Registro.Codigo) then
  Begin

  End;
end;

procedure TTasOrderPurchase.printOrder;
Var
  LcPar: TPrmRepOrder;
  LcJSon : String;
  LcCM : TReportCM;
begin
  try
    LcPar := TPrmRepOrder.Create;
    LcPar.Estabelecimento := UMM.GInstitution.registro.Codigo;
    LcPar.Usuario := UMM.GInstitution.User.Registro.codigo;
    LcPar.Resultado := false;
    LcPar.Codigo := OrderPurchase.Registro.Codigo;
    LcPar.URL := '';//'http://www.gestaowebsetes.com.br/institution/07742094000113/2/pedidocompra.pdf';
    ShowMask('Aguarde Processamento');
    LcJSon := TJson.ObjectToJsonString(LcPar);
    LcCM := TReportCM.Create(Self);
    LcJSon := LcCM.SMGeneralClient.GetOrderPurchase(LcJSon);
    LcPar := TJson.JsonToObject<TPrmRepOrder>(LcJson);
    UniSession.Synchronize;
    if LcPar.Resultado then
    begin
      openReportViewer('Pedido de Compra',LcPar.url);
      UniSession.Synchronize;
    end
    else
    Begin
      MensageAlert(['A T E N Ç Ã O!.',
                   '',
                      'Campo Nome não informado.',
                      'Preencha o campo para continuar']);
    End;
  finally
    HideMask;
    FreeAndNil(lcPar);
    FreeAndNil(LcCM);
  end;
end;

procedure TTasOrderPurchase.Save;
begin
  SaveOrder;
  SaveOrderPurchase;
  SaveOrderBilling;
  SaveOrderShipping;
  SaveOrdertotalizer;
  SaveOrderItems(FrOrderItemsPurchase.cds_items,OrderPurchase.Registro.Codigo);
  //Setando a variavel para controle de botãoe (Alterar/Excluir
  CodigoRegistro := OrderPurchase.Registro.Codigo;
end;

procedure TTasOrderPurchase.SaveOrder;
begin
  with OrderPurchase.order.registro do
  begin
    Estabelecimento := UMM.GInstitution.registro.Codigo;
    Usuario := UMM.GInstitution.User.Registro.codigo;
	  Data := E_DateRegistry.DateTime ;
    Observacao := M_note.Text ;
    Origem := 'M';
    Status := 'P';
  End;
  OrderPurchase.Order.save;
end;


procedure TTasOrderPurchase.SaveOrderBilling;
begin
  with OrderPurchase.OrderBilling.Registro do
  begin
    Codigo := OrderPurchase.Order.Registro.Codigo;
    Estabelecimento := OrderPurchase.Order.Registro.Estabelecimento;
    FormaPagamento    := FrPaymentType.DBLCB_Lista.KeyValue;
    Parcelas          := FrInstallmentOpen.E_Plots.Text;
    Prazo             := FrInstallmentOpen.E_DeadLine.Text;
    if frEntityFiscal.DBLCB_Lista.KeyValue <> null then
      Responsavel       := frEntityFiscal.DBLCB_Lista.KeyValue
    else
      Responsavel       := FrProvider.DBLCB_Lista.KeyValue;

  end;
  OrderPurchase.OrderBilling.save;
end;

procedure TTasOrderPurchase.SaveOrderItems(cds_items: TClientDataSet;
  order_id: Integer);
Var
  LcOperacao : String;
  LcOrderItems : TControllerOrderITem;
  LcOrdHasPurchase : TControllerOrderHasPurchase;
begin
  LcOrdHasPurchase := TControllerOrderHasPurchase.Create(self);

  DeletedItems(cds_items, order_id);

  if cds_items.ChangeCount > 0 then
  Begin
    LcOrderItems := TControllerOrderITem.create(Self);

     cds_items.First;
    //Trata somente os dados Inseridos ou Alterados
    while not cds_items.eof do
    Begin
      with LcOrderItems do
      Begin
        Registro.Codigo              := cds_items.FieldByName('id').AsInteger;
        Registro.Estabelecimento     := UMM.GInstitution.registro.Codigo;
        Registro.Ordem               := order_id;
        Registro.Produto             := cds_items.FieldByName('tb_product_id').AsInteger;
        Registro.Estoque             := cds_items.FieldByName('tb_stock_list_id').AsInteger;
        Registro.Quantidade          := cds_items.FieldByName('quantity').AsFloat;
        Registro.ValorUnitario        := cds_items.FieldByName('unit_value').AsFloat;
        Registro.AliquotaDesconto    := cds_items.FieldByName('discount_aliquot').AsFloat;
        Registro.ValorDesconto       := cds_items.FieldByName('discount_value').AsFloat;
        case cds_items.UpdateStatus of
          usModified: LcOrderItems.update;
          usInserted: LcOrderItems.insert;
        end;
      End;
      with LcOrderItems.Detalhes do
      Begin
        Registro.Codigo           := LcOrderItems.Registro.Codigo;
        Registro.Estabelecimento  := UMM.GInstitution.registro.Codigo;
        Registro.Ordem            := order_id;
//        Registro.FrenteTrabalho   := cds_items.FieldByName('work_front').AsString;
        Registro.Detalhes         := cds_items.FieldByName('note').AsString;
//        Registro.DataPrevista     := cds_items.FieldByName('dt_forecast').AsDateTime;
        case cds_items.UpdateStatus of
          usModified: LcOrderItems.Detalhes.update;
          usInserted: LcOrderItems.Detalhes.insert;
        end;
      End;
      //Caso o pedido tenha um vinculo com outra ordem
      if ( cds_items.FieldByName('tb_order_to_buy_id').AsInteger > 0 )  then
      Begin
        LcOrdHasPurchase.clear;
        LcOrdHasPurchase.Registro.Estabelecimento   := UMM.GInstitution.registro.Codigo;
        LcOrdHasPurchase.Registro.Ordem             := LcOrderItems.Registro.Ordem;
        LcOrdHasPurchase.Registro.Item              := LcOrderItems.Registro.Codigo;
        LcOrdHasPurchase.Registro.ItemListadeCompra := cds_items.fieldbyname('tb_order_to_buy_id').AsInteger;
        LcOrdHasPurchase.save;
      End;

      cds_items.next;
    End;
    cds_items.MergeChangeLog;
  End;

end;

procedure TTasOrderPurchase.SaveOrderPurchase;
begin
  //Order Pucrhase
  with OrderPurchase.registro do
  Begin
    Codigo := OrderPurchase.Order.Registro.Codigo;
    Estabelecimento := OrderPurchase.Order.Registro.Estabelecimento;
    Numero := StrTOIntDef(E_Number.Text,0) ;
    Fornecedor := FrProvider.DBLCB_Lista.KeyValue;
    if chbx_approved.Checked then
      Aprovado := 'S'
    else
      Aprovado := 'N';
  End;
  OrderPurchase.save;

end;

procedure TTasOrderPurchase.SaveOrderShipping;
begin
  with FrShipping, OrderPurchase.OrderShipping.Registro do
  begin
    Codigo := OrderPurchase.Order.Registro.Codigo;
    Estabelecimento := OrderPurchase.Order.Registro.Estabelecimento;

    if FrAddressDelivery.DBLCB_Lista.KeyValue <> null then
      Endereco := FrAddressDelivery.DBLCB_Lista.KeyValue
    else
      Endereco := OrderPurchase.Registro.Fornecedor;

    if FrCarrier.DBLCB_Lista.KeyValue <> null then
      Transportadora := FrCarrier.DBLCB_Lista.KeyValue
    else
      Transportadora := 0;

    if (FrFreightMode.DBLCB_Lista.KeyValue <> Null) then
      ModalidadeFrete := FrFreightMode.DBLCB_Lista.KeyValue
    else
      ModalidadeFrete := '2';

    DiaEntrega := DtpDataDelivery.DateTime;

    Valor := StrToFloatDef(FrOrderItemsPurchase.E_VL_Freight.Text,0);
    PontoReferencia := E_Help_Reference.Text;
  end;
  OrderPurchase.OrderShipping.save;
end;

procedure TTasOrderPurchase.SaveOrdertotalizer;
begin
  with OrderPurchase.OrderTotalizer.Registro do
  begin
    Codigo            := OrderPurchase.Order.Registro.Codigo;
    Estabelecimento   := OrderPurchase.Order.Registro.Estabelecimento;
    ItemsQuantidade   := FrOrderItemsPurchase.E_Nr_Items.Value;
    ProdutoQuantidade := FrOrderItemsPurchase.E_total_qtty.Value;
    ValorProduto      := FrOrderItemsPurchase.E_total_Product.Value;
    IPIValor          := 0;
    AlíquotaDesconto  := FrOrderItemsPurchase.E_Tx_Discount.Value;
    ValorDesconto     := FrOrderItemsPurchase.E_VL_Discount.Value;
    ValorDespesas     := FrOrderItemsPurchase.E_VL_Expensive.Value;
    ValorTotal        := FrOrderItemsPurchase.E_VL_Order.Value;
  end;
  OrderPurchase.OrderTotalizer.save;
end;

procedure TTasOrderPurchase.setVariable;
begin
  //Order Purchase
  if CodigoRegistro > 0 then
  Begin
    with OrderPurchase do
    Begin
      with order do
      begin
        Registro.Codigo := CodigoRegistro;
        Registro.Estabelecimento := UMM.GInstitution.registro.Codigo;
        order.getByKey;
      end;

      with registro do
      begin
        Codigo := Order.Registro.Codigo;
        Estabelecimento := UMM.GInstitution.registro.Codigo;
        getByKey;
      end;

      with OrderTotalizer do
      begin
        registro.Codigo := Order.Registro.Codigo;
        registro.Estabelecimento := UMM.GInstitution.registro.Codigo;
        OrderTotalizer.getByKey;
      end;

      with OrderShipping do
      begin
        Registro.Codigo := Order.Registro.Codigo;
        Registro.Estabelecimento := UMM.GInstitution.registro.Codigo;
        OrderShipping.getByKey;
      end;

      with OrderBilling do
      begin
        Registro.Codigo := Order.Registro.Codigo;
        Registro.Estabelecimento := UMM.GInstitution.registro.Codigo;
        OrderBilling.getByKey;
      end;
    End;
  End;
  inherited;
end;




procedure TTasOrderPurchase.ShowData;
begin
  ShowDataOrder;
  ShowDataBilling;
  ShowDataShipping;
  ShowDataTotalizer;
  ShowDatalisttItems(FrOrderItemsPurchase.cds_items,OrderPurchase.Registro.Codigo);
end;

procedure TTasOrderPurchase.ShowDataBilling;
begin
  with OrderPurchase.OrderBilling.Registro do
  Begin
    FrPaymentType.DBLCB_Lista.KeyValue  := FormaPagamento;
    FrInstallmentOpen.E_Plots.Text      := Parcelas;
    FrInstallmentOpen.E_DeadLine.Text   := Prazo;
    frEntityFiscal.DBLCB_Lista.KeyValue := Responsavel;
  End;
end;

procedure TTasOrderPurchase.ShowDataOrder;
begin
  with OrderPurchase do
  Begin
    with Order.Registro do
    Begin
      E_DateRegistry.DateTime := Data;
      M_note.Text := Observacao;
    End;
    with registro do
    Begin
      E_Number.Text := IntToStr(Numero) ;
      FrProvider.DBLCB_Lista.KeyValue := Fornecedor;
    End;
  End;
end;

procedure TTasOrderPurchase.ShowDataShipping;
begin
  with FrShipping, OrderPurchase.OrderShipping.Registro do
  begin
    frAddressDelivery.DBLCB_Lista.KeyValue :=  Endereco;
    FrCarrier.DBLCB_Lista.KeyValue := Transportadora;
    FrFreightMode.DBLCB_Lista.KeyValue := ModalidadeFrete;
    E_Help_Reference.Text := PontoReferencia;
    DtpDataDelivery.DateTime := DiaEntrega;
    FrOrderItemsPurchase.E_VL_Freight.text :=  FloatToStrF(Valor,ffFixed,10,2);
    FrOrderItemsPurchase.E_VL_Freight.Value := Valor;
  end;
end;

procedure TTasOrderPurchase.ShowDataTotalizer;
begin
  with OrderPurchase.OrderTotalizer.Registro,FrOrderItemsPurchase do
  begin
    E_total_qtty.Value     := ProdutoQuantidade;
    E_total_Product.Value  := ValorProduto;
    E_VL_Expensive.Value   := ValorDespesas;
    E_Tx_Discount.Value    := AlíquotaDesconto;
    E_vl_Discount.Value    := ValorDesconto;
    E_VL_Order.Value       := ValorTotal;
  end;
end;

procedure TTasOrderPurchase.ShowlisttItems;
begin
  FrOrderItemsPurchase := TFmOrderItemsPurchase.Create(Self);
  FrOrderItemsPurchase.Parent := Ctn_Order_itens_Purchase;
  FrOrderItemsPurchase.Align := alClient;
  FrOrderItemsPurchase.Show;
end;

procedure TTasOrderPurchase.ShowNoData;
begin
  ClearAllFields;
  inherited;
end;

procedure TTasOrderPurchase.ShowProvider;
begin
  FrProvider := TFmProvider.Create(Self);
  FrProvider.Parent := Ctn_Provider;
  FrProvider.Align := alClient;
  FrProvider.listar;
  FrProvider.Show;
end;

procedure TTasOrderPurchase.toInvoice;
Var
  LcPar : TPrmCallInvoice;
begin
  LcPar := TPrmCallInvoice.Create;
  with LcPar do
  Begin
    ordem           := OrderPurchase.Registro.Codigo;
    Estabelecimento := OrderPurchase.Registro.Estabelecimento;
    Emitente        := OrderPurchase.Registro.Fornecedor;
    Destinatario    := OrderPurchase.Registro.Estabelecimento;
    Sentido         := 'E';
    MostraSentido   := False;
    AutroizaNfe     := False;
    ModeloNFe       := '55';
  End;
  OpenToInvoice(LcPar);
end;

function TTasOrderPurchase.ValidaInsert: boolean;
begin
  Result := True;
end;

function TTasOrderPurchase.ValidateChange: boolean;
begin
  Result := True;
  if not ValidatehasNotInvoice(Orderpurchase.Registro.Codigo) then
  Begin
    Result := False;
    exit;
  End;

end;

function TTasOrderPurchase.ValidateDelete: boolean;
begin
  Result := True;
  if not ValidatehasNotInvoice(Orderpurchase.Registro.Codigo) then
  Begin
    Result := False;
    exit;
  End;
end;

function TTasOrderPurchase.validateInvoice: Boolean;
begin
  REsult := true;
  if not hasOrderItems(FrOrderItemsPurchase.cds_items) then
  Begin
    Result := False;
    exit;
  End;

  if not ValidatehasNotInvoice(OrderPurchase.Registro.Codigo) then
  Begin
    Result := False;
    exit;
  End;

end;

function TTasOrderPurchase.validatePrintOrder: Boolean;
begin
  REsult := true;
  if not hasOrderItems(FrOrderItemsPurchase.cds_items) then
  Begin
    Result := False;
    exit;
  End;
end;

function TTasOrderPurchase.ValidateSave: boolean;
Begin
  Result := True;
  FrOrderItemsPurchase.totalizerItems;
  if trim(FrPaymentType.DBLCB_Lista.Text) = '' then
  begin
    MensageAlert(['A T E N Ç Ã O!.',
                  '',
                  'Campo Tipo de Pagamento não informado.',
                  'Preencha o campo para continuar']);
    Result := False;
    exit;
  end;

  if trim(FrProvider.DBLCB_Lista.Text) = '' then
  begin
    MensageAlert(['A T E N Ç Ã O!.',
                  '',
                  'Campo Nome de fornecedor não informado.',
                  'Preencha o campo para continuar']);
    Result := False;
    exit;
  end;

  if trim(E_DateRegistry.Text) = '30/12/1899' then
  begin
    MensageAlert(['A T E N Ç Ã O!.',
                  '',
                  'Campo Data Cadastro não informado.',
                  'Preencha o campo para continuar']);
    Result := False;
    exit;
  end;
end;


end.

