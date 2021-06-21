unit tas_order_stock_adjust;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, tas_order, Vcl.Menus, uniMainMenu,
  uniButton, uniBitBtn, uniSpeedButton, uniGUIBaseClasses, uniGUIClasses,
  uniPanel, uniCheckBox, uniRadioGroup, uniMemo, uniPageControl,
  uniDateTimePicker, uniEdit, uniLabel, fm_entity_fiscal, fm_order_items_stock_adjust,
  ControllerOrderStockAdjust, Datasnap.DBClient, Data.DB, UnFunctions,
  fm_shipping, prm_call_invoice, tas_copy_invoice ;

type
  TTasOrderStockAdjust = class(TTasOrder)
    UniPanel1: TUniPanel;
    L_Codigo: TUniLabel;
    E_Number: TUniEdit;
    E_DateRegistry: TUniDateTimePicker;
    L_DtRegistry: TUniLabel;
    Ctn_Entity_Fiscal: TUniContainerPanel;
    pg_Items: TUniPageControl;
    tbs_List: TUniTabSheet;
    pnl_Order_Item: TUniPanel;
    Ctn_Order_itens_StockAdjust: TUniContainerPanel;
    tbs_other: TUniTabSheet;
    tbs_delivery: TUniTabSheet;
    Ctn_Shipping: TUniContainerPanel;
    UniPanel2: TUniPanel;
    M_note: TUniMemo;
    UniLabel13: TUniLabel;
    chbx_approved: TUniCheckBox;
    NotaFiscal1: TUniMenuItem;
    Copiaritens1: TUniMenuItem;

    procedure NotaFiscal1Click(Sender: TObject);
    procedure Copiaritens1Click(Sender: TObject);
  private
    { Private declarations }

  protected
    FrEntity                : TFmEntityFiscal;
    FrOrderItemsStockAdjust : TFmOrderItemsStockAdjust;

    procedure InitVariable;Override;
    procedure setVariable; override;
    procedure FormatScreen;Override;

    procedure ShowData;Override;
    procedure ShowDataOrder;
    procedure ShowDataShipping;
    procedure ShowDataTotalizer;
    procedure ShowNoData;Override;
    procedure ClearAllFields;Override;
    procedure EditionControl;Override;

    procedure ShowEntity;
    procedure ShowlisttItems;
    function  ValidaInsert():boolean;Override;
    procedure Insert;Override;
    function  ValidateSave: boolean;Override;
    procedure Save;Override;
    procedure SaveOrder;
    procedure SaveOrderShipping;
    procedure SaveOrdertotalizer;
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
    OrderStockAdjust : TControllerOrderStockAdjust ;
  end;

var
  TasOrderStockAdjust: TTasOrderStockAdjust;

implementation

{$R *.dfm}

uses MainModule, unMessages, msg_form, openForms;

{ TTasOrderStockAdjust }

procedure TTasOrderStockAdjust.Change;
begin
  inherited;

end;

procedure TTasOrderStockAdjust.ClearAllFields;
begin
  inherited;
  ClearFields(FrEntity);
  ClearFields(FrOrderItemsStockAdjust);
  OrderStockAdjust.clear;
end;

procedure TTasOrderStockAdjust.Copiaritens1Click(Sender: TObject);
Var
  Form : TTasCopyInvoice;
begin
  Form := TTasCopyInvoice.Create(UniApplication);
  Form.cds_items := self.FrOrderItemsStockAdjust.cds_items;
  Form.Show(
    Procedure(Sender: TComponent; AResult:Integer)
    begin
      self.FrOrderItemsStockAdjust.totalizerItems;
      self.FrOrderItemsStockAdjust.totalizer;
      Form := nil;
    end
  );
end;

procedure TTasOrderStockAdjust.Delete;
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
          //OrderStockAdjust.delete;
          //ClearAllFields;
        End;
      end
    );
end;

procedure TTasOrderStockAdjust.EditionControl;
begin
  inherited;
  EditionControler(FrEntity);
  EditionControler(FrOrderItemsStockAdjust);
  Copiaritens1.Enabled := ( EditionState = 'I' ) or ( EditionState = 'E' );
  Sb_Invoice.Enabled := ( EditionState = 'B' );
  Sb_print.Enabled := ( EditionState = 'B' );
end;

procedure TTasOrderStockAdjust.FormatScreen;
begin
  inherited;
  ShowEntity;
  ShowlisttItems;
  ShowShipping(Ctn_Shipping);
end;

procedure TTasOrderStockAdjust.InitVariable;
begin
  inherited;
  OrderStockAdjust := TControllerOrderStockAdjust.Create(self);
end;

procedure TTasOrderStockAdjust.Insert;
begin
  inherited;
  ClearAllFields;
end;

procedure TTasOrderStockAdjust.NotaFiscal1Click(Sender: TObject);
begin
  if ValidatehasInvoice(OrderStockAdjust.Registro.Codigo) then
  Begin

  End;
end;

procedure TTasOrderStockAdjust.printOrder;
begin
  inherited;

end;

procedure TTasOrderStockAdjust.Save;
begin
  SaveOrder;
  SaveOrderShipping;
  SaveOrdertotalizer;
  SaveOrderItems(FrOrderItemsStockAdjust.cds_items,OrderStockAdjust.Registro.Codigo);
  //Setando a variavel para controle de botãoe (Alterar/Excluir
  CodigoRegistro := OrderStockAdjust.Registro.Codigo;
end;

procedure TTasOrderStockAdjust.SaveOrder;
begin
  with OrderStockAdjust do
  begin
    with order.registro do
    begin
      Estabelecimento := UMM.GInstitution.registro.Codigo;
      Usuario := UMM.GInstitution.User.Registro.codigo;
	    Data := E_DateRegistry.DateTime ;
      Observacao := M_note.Text ;
    End;
    order.save;
    //Order Pucrhase
    with registro do
    Begin
      Codigo          := order.Registro.Codigo;
      Estabelecimento := UMM.GInstitution.registro.Codigo;
      Numero          := StrTOIntDef(E_Number.Text,0) ;
      Destinatario    := FrEntity.DBLCB_Lista.KeyValue;
    End;
      OrderStockAdjust.save;
  end;
end;

procedure TTasOrderStockAdjust.SaveOrderShipping;
begin
  with FrShipping, OrderStockAdjust.Shipping.Registro do
  begin
    Codigo := OrderStockAdjust.Registro.Codigo;
    Estabelecimento := OrderStockAdjust.Registro.Estabelecimento;

    if FrAddressDelivery.DBLCB_Lista.KeyValue <> null then
      Endereco := FrAddressDelivery.DBLCB_Lista.KeyValue
    else
      Endereco := OrderStockAdjust.Registro.Destinatario;

    if FrCarrier.DBLCB_Lista.KeyValue <> null then
      Transportadora := FrCarrier.DBLCB_Lista.KeyValue
    else
      Transportadora := 0;

    if (FrFreightMode.DBLCB_Lista.KeyValue <> Null) then
      ModalidadeFrete := FrFreightMode.DBLCB_Lista.KeyValue
    else
      ModalidadeFrete := '2';

    DiaEntrega := DtpDataDelivery.DateTime;

    Valor := StrToFloatDef(FrOrderItemsStockAdjust.E_VL_Freight.Text,0);
    PontoReferencia := E_Help_Reference.Text;
  end;
  OrderStockAdjust.Shipping.save;
end;

procedure TTasOrderStockAdjust.SaveOrdertotalizer;
begin
  with OrderStockAdjust.Totalizer.Registro do
  begin
    Codigo            := OrderStockAdjust.Order.Registro.Codigo;
    Estabelecimento   := OrderStockAdjust.Order.Registro.Estabelecimento;
    ItemsQuantidade   := FrOrderItemsStockAdjust.E_Nr_Items.Value;
    ProdutoQuantidade := FrOrderItemsStockAdjust.E_total_qtty.Value;
    ValorProduto      := FrOrderItemsStockAdjust.E_total_Product.Value;
    IPIValor          := 0;
    AlíquotaDesconto  := FrOrderItemsStockAdjust.E_Tx_Discount.Value;
    ValorDesconto     := FrOrderItemsStockAdjust.E_VL_Discount.Value;
    ValorDespesas     := FrOrderItemsStockAdjust.E_VL_Expensive.Value;
    ValorTotal        := FrOrderItemsStockAdjust.E_VL_Order.Value;
  end;
  OrderStockAdjust.Totalizer.save;
end;

procedure TTasOrderStockAdjust.setVariable;
begin
  //Order Purchase
  with OrderStockAdjust do
  Begin
    with order do
    begin
      Registro.Codigo := CodigoRegistro;
      Registro.Estabelecimento := UMM.GInstitution.registro.Codigo;
      order.getByKey;
    end;

    with registro do
    begin
      Codigo := order.Registro.Codigo;
      Estabelecimento := UMM.GInstitution.registro.Codigo;
      getByKey;
    end;

    with Totalizer do
    begin
      registro.Codigo := Order.Registro.Codigo;
      registro.Estabelecimento := UMM.GInstitution.registro.Codigo;
      Totalizer.getByKey;
    end;

    with Shipping do
    begin
      Registro.Codigo := OrderStockAdjust.Registro.Codigo;
      Registro.Estabelecimento := UMM.GInstitution.registro.Codigo;
      Shipping.getByKey;
    end;

  End;
  inherited;
end;

procedure TTasOrderStockAdjust.ShowData;
begin
  ShowDataOrder;
  ShowDataShipping;
  ShowDataTotalizer;
  ShowDatalisttItems(FrOrderItemsStockAdjust.cds_items, OrderStockAdjust.Registro.Codigo);
end;

procedure TTasOrderStockAdjust.ShowDataOrder;
begin
  with OrderStockAdjust do
  Begin
    with order.Registro do
    Begin
      E_DateRegistry.DateTime := Data;
      M_note.Text := Observacao;
    End;

    with registro do
    Begin
      E_Number.Text := IntToStr(Numero) ;
      FrEntity.DBLCB_Lista.KeyValue := Destinatario;
    End;
  End;
end;

procedure TTasOrderStockAdjust.ShowDataShipping;
begin
  with FrShipping, OrderStockAdjust.Shipping.Registro do
  begin
    frAddressDelivery.DBLCB_Lista.KeyValue :=  Endereco;
    FrCarrier.DBLCB_Lista.KeyValue := Transportadora;
    if Trim(ModalidadeFrete) <> '' then
      FrFreightMode.DBLCB_Lista.KeyValue := ModalidadeFrete
    else
      FrFreightMode.DBLCB_Lista.KeyValue := 0;
    E_Help_Reference.Text := PontoReferencia;
    DtpDataDelivery.DateTime := DiaEntrega;
    FrOrderItemsStockAdjust.E_VL_Freight.text :=  FloatToStrF(Valor,ffFixed,10,2);
    FrOrderItemsStockAdjust.E_VL_Freight.Value := Valor;
  end;
end;

procedure TTasOrderStockAdjust.ShowDataTotalizer;
begin
  with OrderStockAdjust.Totalizer.Registro,FrOrderItemsStockAdjust do
  begin
    E_total_qtty.Value     := ProdutoQuantidade;
    E_total_Product.Value  := ValorProduto;
    E_VL_Expensive.Value   := ValorDespesas;
    E_Tx_Discount.Value    := AlíquotaDesconto;
    E_vl_Discount.Value    := ValorDesconto;
    E_VL_Order.Value       := ValorTotal;
  end;
end;

procedure TTasOrderStockAdjust.ShowEntity;
begin

  FrEntity := TFmEntityFiscal.Create(Self);
  FrEntity.Parent := Ctn_Entity_Fiscal;
  FrEntity.Align := alClient;
  FrEntity.listar;
  FrEntity.Show;

end;

procedure TTasOrderStockAdjust.ShowlisttItems;
begin
  FrOrderItemsStockAdjust := TFmOrderItemsStockAdjust.Create(Self);
  FrOrderItemsStockAdjust.Parent := Ctn_Order_itens_StockAdjust;
  FrOrderItemsStockAdjust.Align := alClient;
  FrOrderItemsStockAdjust.Show;

end;

procedure TTasOrderStockAdjust.ShowNoData;
begin
  ClearAllFields;
  inherited;
end;


procedure TTasOrderStockAdjust.ToInvoice;
Var
  LcPar : TPrmCallInvoice;
begin
  LcPar := TPrmCallInvoice.Create;
  with LcPar do
  Begin
    ordem           := OrderStockAdjust.Registro.Codigo;
    Estabelecimento := OrderStockAdjust.Registro.Estabelecimento;
    Emitente        := OrderStockAdjust.Registro.Estabelecimento;
    Destinatario    := OrderStockAdjust.Registro.Destinatario;
    Sentido         := 'S';
    MostraSentido   := true;
    AutroizaNfe     := True;
    ModeloNFe       := '55';
  End;
  OpenToInvoice(LcPar);
end;

function TTasOrderStockAdjust.ValidaInsert: boolean;
begin
//
end;

function TTasOrderStockAdjust.ValidateChange: boolean;
begin
  Result := True;
  if not ValidatehasNotInvoice(OrderStockAdjust.Registro.Codigo) then
  Begin
    Result := False;
    exit;
  End;
end;

function TTasOrderStockAdjust.ValidateDelete: boolean;
begin
  Result := True;
  if not ValidatehasNotInvoice(OrderStockAdjust.Registro.Codigo) then
  Begin
    Result := False;
    exit;
  End;
end;

function TTasOrderStockAdjust.validateInvoice: Boolean;
begin
  REsult := true;
  if not hasOrderItems(FrOrderItemsStockAdjust.cds_items) then
  Begin
    Result := False;
    exit;
  End;

  if not ValidatehasNotInvoice(OrderStockAdjust.Registro.Codigo) then
  Begin
    Result := False;
    exit;
  End;

end;

function TTasOrderStockAdjust.validatePrintOrder: Boolean;
begin
  REsult := true;
  if not hasOrderItems(FrOrderItemsStockAdjust.cds_items) then
  Begin
    Result := False;
    exit;
  End;
end;

function TTasOrderStockAdjust.ValidateSave: boolean;
Begin
  Result := True;
  if trim(FrEntity.DBLCB_Lista.Text) = '' then
  begin
    MensageAlert(['A T E N Ç Ã O!.',
                  '',
                  'Campo Tipo de Pagamento não informado.',
                  'Preencha o campo para continuar']);
    Result := False;
    exit;
  end;

end;

end.
