unit tas_order_stock_transfer;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, tas_order, Vcl.Menus, uniMainMenu,
  uniButton, uniBitBtn, uniSpeedButton, uniGUIBaseClasses, uniGUIClasses,
  uniPanel, uniDateTimePicker, uniEdit, uniLabel, uniPageControl, fm_customer, fm_situation,
  ControllerOrderStockTransfer, fm_stock_list, uniMemo, Datasnap.DBClient,
  Data.DB,fm_order_items_stock_transfer, openReports, prm_rep_order,
  REST.Json,System.Json,uReportCM, fm_entity, uniRadioGroup, fm_shipping,
  UnFunctions, prm_call_invoice, tas_copy_invoice, tas_nf_55;

type
  TTasOrderStockTransfer = class(TTasOrder)
    L_Codigo: TUniLabel;
    E_Number: TUniEdit;
    L_DtRegistry: TUniLabel;
    Dtp_Registry: TUniDateTimePicker;
    pg_statement: TUniPageControl;
    tbs_inputs: TUniTabSheet;
    UniPanel1: TUniPanel;
    UniTabSheet1: TUniTabSheet;
    UniPanel4: TUniPanel;
    Ctn_Stock_Transfer: TUniContainerPanel;
    Ctn_Stock_Id_Des: TUniContainerPanel;
    Ctn_Stock_Id_Ori: TUniContainerPanel;
    M_note: TUniMemo;
    UniLabel1: TUniLabel;
    Ctn_Situacao: TUniContainerPanel;
    Ctn_Entity: TUniContainerPanel;
    Entrega: TUniTabSheet;
    Ctn_Shipping: TUniContainerPanel;
    NotaFiscal1: TUniMenuItem;
    Copiaritens1: TUniMenuItem;

    procedure InitVariable;Override;
    procedure setVariable; override;
    procedure FormatScreen;Override;
    procedure ShowData;Override;
    procedure ShowDataOrder;
    procedure ShowDataOrderShipping;
    procedure ShowDataTotalizer;
    procedure ShowNoData;Override;
    procedure ClearAllFields;Override;
    procedure EditionControl;Override;
    procedure SB_CancelClick(Sender: TObject);
    procedure NotaFiscal1Click(Sender: TObject);
    procedure Copiaritens1Click(Sender: TObject);
  private
    procedure ShowFreightMode;
    { Private declarations }
  public
    { Public declarations }
    OrderStockTransfer : TControllerOrderStockTransfer;
  protected
    FrOrderItemsStockTransfer : TFmOrderItemsStockTransfer;
    FrStockIdOri    : TFmStockList;
    FrStockIdDes    : TFmStockList;
    procedure ShowOrderStockTransfer;
    procedure ShowStockIdOri;
    procedure ShowStockIdDes;
    procedure ShowEntityFiscal(Parente:TWinControl);Override;
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

  end;

var
  TasOrderStockTransfer: TTasOrderStockTransfer;

implementation

{$R *.dfm}

uses MainModule, unMessages, msg_form, Main, openForms;

{ TTasOrderStockTransfer }

procedure TTasOrderStockTransfer.Change;
begin
  inherited;

end;

procedure TTasOrderStockTransfer.ClearAllFields;
begin
  inherited;
  ClearFields(FrOrderItemsStockTransfer);
  ClearFields(FrStockIdDes);
  ClearFields(FrStockIdOri);
  ClearFields(FrShipping);
  OrderStockTransfer.clear;
end;

procedure TTasOrderStockTransfer.Copiaritens1Click(Sender: TObject);
Var
  Form : TTasCopyInvoice;
begin
  Form := TTasCopyInvoice.Create(UniApplication);
  Form.cds_items := FmOrderItemsStockTransfer.cds_items;
  Form.ShowModal;
end;

procedure TTasOrderStockTransfer.Delete;
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
          OrderStockTransfer.delete;
          ClearAllFields;
        End;
      end
    );
end;

procedure TTasOrderStockTransfer.EditionControl;
begin
  inherited;
  EditionControler(FrOrderItemsStockTransfer);
  EditionControler(FrStockIdOri);
  EditionControler(FrStockIdDes);
  Copiaritens1.Enabled := ( EditionState = 'I' ) or ( EditionState = 'E' );
  Sb_Invoice.Enabled := ( EditionState = 'B' );
  Sb_print.Enabled := ( EditionState = 'B' );
end;

procedure TTasOrderStockTransfer.FormatScreen;
begin
  inherited;
  ShowEntityFiscal(Ctn_Entity);
  ShowOrderStockTransfer;
  ShowStockIdOri;
  ShowStockIdDes;
  ShowSituation(Ctn_Situacao);
  ShowShipping(Ctn_Shipping);
  pg_statement.ActivePageIndex := 0;
end;

procedure TTasOrderStockTransfer.InitVariable;
begin
  inherited;
  OrderStockTransfer := TControllerOrderStockTransfer.Create(self);
end;

procedure TTasOrderStockTransfer.Insert;
begin
  inherited;
//
end;

procedure TTasOrderStockTransfer.NotaFiscal1Click(Sender: TObject);
var
  Form : TTasNf55;
begin
  if ValidatehasInvoice(OrderStockTransfer.Registro.Codigo) then
  Begin
    if Form = nil then
      Form := TTasNf55.Create(Self);
    Form.CodigoRegistro   := 0;
    Form.Terminal         := 0;
    Form.Vendedor         := 0;
    Form.Show(
      Procedure(Sender: TComponent; AResult:Integer)
      begin
        Form := nil;
      end
    );
  End;
end;

procedure TTasOrderStockTransfer.printOrder;
Var
  LcPar: TPrmRepOrder;
  LcJSon : String;
  LcCM : TReportCM;
begin
  try
    ShowMask('Aguarde Processamento');
    LcPar := TPrmRepOrder.Create;
    LcPar.Estabelecimento := UMM.GInstitution.registro.Codigo;
    LcPar.Usuario := UMM.GInstitution.User.Registro.codigo;
    LcPar.Resultado := false;
    LcPar.Codigo := OrderStockTransfer.Registro.Codigo;
    LcPar.URL := '';//'http://www.gestaowebsetes.com.br/institution/07742094000113/2/pedidocompra.pdf';
    LcJSon := TJson.ObjectToJsonString(LcPar);
    LcCM := TReportCM.Create(Self);
    LcJSon := LcCM.SMGeneralClient.GetOrderStockTransfer(LcJSon);
    UniSession.Synchronize;
    LcPar := TJson.JsonToObject<TPrmRepOrder>(LcJson);
    if LcPar.Resultado then
    begin
      openReportViewer('Transferência de Estoques',LcPar.url);
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
    hideMask;
    FreeAndNil(lcPar);
    FreeAndNil(LcCM);
  end;

end;

procedure TTasOrderStockTransfer.Save;
begin
  SaveOrder;
  SaveOrderShipping;
  SaveOrdertotalizer;
  SaveOrderItems(FrOrderItemsStockTransfer.cds_items,OrderStockTransfer.Registro.Codigo);
  //Setando a variavel para controle de botãoe (Alterar/Excluir
  CodigoRegistro := OrderStockTransfer.Registro.Codigo;
end;

procedure TTasOrderStockTransfer.SaveOrder;
begin
  with OrderStockTransfer do
  begin
    with order.registro do
    begin
      Estabelecimento := UMM.GInstitution.registro.Codigo;
      Usuario := UMM.GInstitution.User.Registro.codigo;
	    Data := Dtp_Registry.DateTime ;
      Observacao := M_note.Text ;

    End;
    Order.save;
    //Order Pucrhase
    with registro do
    Begin
      Codigo := Order.Registro.Codigo;
      Estabelecimento := UMM.GInstitution.registro.Codigo;
      Entidade := frEntityFiscal.DBLCB_Lista.KeyValue;
      Numero := StrTOIntDef(E_Number.Text,0) ;
      Situacao := FrSituation.DBLCB_Lista.KeyValue;
      EstoqueOrigem := FrStockIdOri.DBLCB_Lista.KeyValue;
      EstoqueDestino := FrStockIdDes.DBLCB_Lista.KeyValue;
    End;
      OrderStockTransfer.save;
  end;
end;


procedure TTasOrderStockTransfer.SaveOrderShipping;
begin
  with FrShipping, OrderStockTransfer.OrderShipping.Registro do
  begin
    Codigo := OrderStockTransfer.Registro.Codigo;
    Estabelecimento := OrderStockTransfer.Registro.Estabelecimento;

    if FrAddressDelivery.DBLCB_Lista.KeyValue <> null then
      Endereco := FrAddressDelivery.DBLCB_Lista.KeyValue
    else
      Endereco := OrderStockTransfer.Registro.Entidade;

    if FrCarrier.DBLCB_Lista.KeyValue <> null then
      Transportadora := FrCarrier.DBLCB_Lista.KeyValue
    else
      Transportadora := 0;

    if (FrFreightMode.DBLCB_Lista.KeyValue <> Null) then
      ModalidadeFrete := FrFreightMode.DBLCB_Lista.KeyValue
    else
      ModalidadeFrete := '2';

    DiaEntrega := DtpDataDelivery.DateTime;

    Valor := StrToFloatDef(FrOrderItemsStockTransfer.E_VL_Freight.Text,0);
    PontoReferencia := E_Help_Reference.Text;
  end;
  OrderStockTransfer.OrderShipping.save;
end;

procedure TTasOrderStockTransfer.SaveOrdertotalizer;
begin
  with  OrderStockTransfer.OrderTotalizer.Registro do
  begin
    Codigo            := OrderStockTransfer.Order.Registro.Codigo;
    Estabelecimento   := OrderStockTransfer.Order.Registro.Estabelecimento;
    ItemsQuantidade   := FrOrderItemsStockTransfer.E_Nr_Items.Value;
    ProdutoQuantidade := FrOrderItemsStockTransfer.E_total_qtty.Value;
    ValorProduto      := FrOrderItemsStockTransfer.E_total_Product.Value;
    IPIValor          := 0;
    AlíquotaDesconto  := FrOrderItemsStockTransfer.E_Tx_Discount.Value;
    ValorDesconto     := FrOrderItemsStockTransfer.E_VL_Discount.Value;
    ValorDespesas     := FrOrderItemsStockTransfer.E_VL_Expensive.Value;
    ValorTotal        := FrOrderItemsStockTransfer.E_VL_Order.Value;
  end;
  OrderStockTransfer.OrderTotalizer.save;
end;

procedure TTasOrderStockTransfer.SB_CancelClick(Sender: TObject);
begin
  if validatePrintOrder then
    printOrder;
end;

procedure TTasOrderStockTransfer.setVariable;
begin
  with OrderStockTransfer do
  Begin
    with order.Registro do
    begin
      Codigo := CodigoRegistro;
      Estabelecimento := UMM.GInstitution.registro.Codigo;
      order.getByKey;
    end;

    with Registro do
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

    with OrderShipping.Registro do
    begin
      Codigo := Order.Registro.Codigo;
      Estabelecimento := UMM.GInstitution.registro.Codigo;
      OrderShipping.getByKey;
    end;

  End;
  inherited;
end;



procedure TTasOrderStockTransfer.ShowData;
begin
  ShowDataOrder;
  ShowDataOrderShipping;
  ShowDataTotalizer;
  ShowDatalisttItems(FrOrderItemsStockTransfer.cds_items,OrderStockTransfer.Registro.Codigo);
end;

procedure TTasOrderStockTransfer.ShowDataOrder;
begin
 With OrderStockTransfer do
 begin
   with Registro do
    begin
      E_Number.Text                         := numero.ToString;
      frEntityFiscal.DBLCB_Lista.KeyValue   := Entidade;
      FrSituation.DBLCB_Lista.KeyValue      := Situacao;
      FrStockIdOri.DBLCB_Lista.KeyValue     := EstoqueOrigem;
      FrStockIdDes.DBLCB_Lista.KeyValue     := EstoqueDestino;
    end;

   with order do
    begin
     Dtp_Registry.DateTime  := Registro.Data;
     M_note.Text            := Registro.Observacao;
    end;

    with OrderTotalizer.Registro, FrOrderItemsStockTransfer do
    begin
       E_total_qtty.Value := ProdutoQuantidade;
       E_total_Product.Value := ValorProduto;
       E_VL_Expensive.Value := ValorDespesas;
       E_Tx_Discount.Value := AlíquotaDesconto;
       E_vl_Discount.Value := ValorDesconto;
       E_VL_Order.Value := ValorTotal;
    end;

  end;
end;

procedure TTasOrderStockTransfer.ShowDataOrderShipping;
begin
  with FrShipping, OrderStockTransfer.OrderShipping.Registro do
  begin
    frAddressDelivery.DBLCB_Lista.KeyValue :=  Endereco;
    FrCarrier.DBLCB_Lista.KeyValue := Transportadora;
    if Trim(ModalidadeFrete) <> '' then
      FrFreightMode.DBLCB_Lista.KeyValue := ModalidadeFrete
    else
      FrFreightMode.DBLCB_Lista.KeyValue := 0;
    E_Help_Reference.Text := PontoReferencia;
    DtpDataDelivery.DateTime := DiaEntrega;
    FrOrderItemsStockTransfer.E_VL_Freight.text :=  FloatToStrF(Valor,ffFixed,10,2);
    FrOrderItemsStockTransfer.E_VL_Freight.Value := Valor;
  end;

end;

procedure TTasOrderStockTransfer.ShowDataTotalizer;
begin
  with OrderStockTransfer.OrderTotalizer.Registro,FrOrderItemsStockTransfer do
  begin
    E_total_qtty.Value     := ProdutoQuantidade;
    E_total_Product.Value  := ValorProduto;
    E_VL_Expensive.Value   := ValorDespesas;
    E_Tx_Discount.Value    := AlíquotaDesconto;
    E_vl_Discount.Value    := ValorDesconto;
    E_VL_Order.Value       := ValorTotal;
  end;
end;

procedure TTasOrderStockTransfer.ShowEntityFiscal(Parente:TWinControl);
begin
  inherited;
  //Renomeio o Label da Entidade
  frEntityFiscal.DBLCB_Lista.FieldLabel := 'Informe o nome do Destinário';
end;

procedure TTasOrderStockTransfer.ShowFreightMode;
begin

end;

procedure TTasOrderStockTransfer.ShowNoData;
begin
  ClearAllFields;
  inherited;
end;

procedure TTasOrderStockTransfer.ShowOrderStockTransfer;
begin
  FrOrderItemsStockTransfer := TFmOrderItemsStockTransfer.Create(Self);
  FrOrderItemsStockTransfer.Parent := Ctn_Stock_Transfer;
  FrOrderItemsStockTransfer.Align := alClient;
  FrOrderItemsStockTransfer.Show;
end;


procedure TTasOrderStockTransfer.ShowStockIdDes;
begin
  FrStockIdDes := TFmStockList.Create(Self);
  FrStockIdDes.Name := 'FrStockListdes';
  FrStockIdDes.Parent := Ctn_Stock_Id_Des;
  FrStockIdDes.chbx_UpdateStock.Visible := False;
  FrStockIdDes.DBLCB_Lista.FieldLabel := 'Informe o nome do estoque';
  FrStockIdDes.listar;
  FrStockIdDes.Align := alClient;
  FrStockIdDes.Show;
end;

procedure TTasOrderStockTransfer.ShowStockIdOri;
begin
  FrStockIdOri := TFmStockList.Create(Self);
  FrStockIdOri.Name := 'FrStockListori';
  FrStockIdOri.Parent := Ctn_Stock_Id_Ori;
  FrStockIdOri.chbx_UpdateStock.Visible := False;
  FrStockIdOri.DBLCB_Lista.FieldLabel := 'Informe o nome do estoque';
  FrStockIdOri.listar;
  FrStockIdOri.Align := alClient;
  FrStockIdOri.Show;
end;


procedure TTasOrderStockTransfer.toInvoice;
Var
  LcPar : TPrmCallInvoice;
begin
  LcPar := TPrmCallInvoice.Create;
  with LcPar do
  Begin
    ordem           := OrderStockTransfer.Registro.Codigo;
    Estabelecimento := OrderStockTransfer.Registro.Estabelecimento;
    Emitente        := OrderStockTransfer.Registro.Estabelecimento;
    Destinatario    := OrderStockTransfer.Registro.Entidade;
    Sentido         := 'S';
    MostraSentido   := True;
    AutroizaNfe     := True;
    ModeloNFe       := '55';
  End;
  OpenToInvoice(LcPar);
end;

function TTasOrderStockTransfer.ValidaInsert: boolean;
begin
 Result := True;
end;

function TTasOrderStockTransfer.ValidateChange: boolean;
begin
  Result := True;
  if not ValidatehasNotInvoice(OrderStockTransfer.Registro.Codigo) then
  Begin
    Result := False;
    exit;
  End;

end;

function TTasOrderStockTransfer.ValidateDelete: boolean;
begin
  Result := True;
  if not ValidatehasNotInvoice(OrderStockTransfer.Registro.Codigo) then
  Begin
    Result := False;
    exit;
  End;
end;

function TTasOrderStockTransfer.validateInvoice: Boolean;
begin
  result := True;
  if not hasOrderItems(FrOrderItemsStockTransfer.cds_items) then
  Begin
    Result := False;
    exit;
  End;

  Result := True;
  if not ValidatehasNotInvoice(OrderStockTransfer.Registro.Codigo) then
  Begin
    Result := False;
    exit;
  End;

end;

function TTasOrderStockTransfer.validatePrintOrder: Boolean;
begin
  REsult := true;
  if not hasOrderItems(FrOrderItemsStockTransfer.cds_items) then
  Begin
    Result := False;
    exit;
  End;
end;

function TTasOrderStockTransfer.ValidateSave: boolean;
begin
  Result := True;
  FrOrderItemsStockTransfer.totalizerItems;
  if trim(frEntityFiscal.DBLCB_Lista.Text) = '' then
  begin
    MensageAlert(['A T E N Ç Ã O!.',
                  '',
                  'Campo nome do destinatário não informado.',
                  'Preencha o campo para continuar']);
    Result := False;
    exit;
  end;

  if trim(FrStockIdOri.DBLCB_Lista.Text) = '' then
  begin
    MensageAlert(['A T E N Ç Ã O!.',
                  '',
                  'Campo estoque origem não informado.',
                  'Preencha o campo para continuar']);
    Result := False;
    exit;
  end;

  if trim(FrStockIdDes.DBLCB_Lista.Text) = '' then
  begin
    MensageAlert(['A T E N Ç Ã O!.',
                  '',
                  'Campo estoque destino não informado.',
                  'Preencha o campo para continuar']);
    Result := False;
    exit;
  end;

  if trim(FrSituation.DBLCB_Lista.Text) = '' then
  begin
    MensageAlert(['A T E N Ç Ã O!.',
                  '',
                  'Campo situação não informado.',
                  'Preencha o campo para continuar']);
    Result := False;
    exit;
  end;

  if FrOrderItemsStockTransfer.cds_items.RecordCount = 0 then
  begin
    MensageAlert(['A T E N Ç Ã O!.',
                  '',
                  'Não há itens informados para transferir.',
                  'Verifique e tente novamente']);
    Result := False;
    exit;
  end;

end;

end.
