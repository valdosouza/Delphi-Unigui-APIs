unit tas_order_packing;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, tas_order, Vcl.Menus, uniMainMenu,
  uniButton, uniBitBtn, uniSpeedButton, uniGUIBaseClasses, uniGUIClasses,
  uniPanel, uniDateTimePicker, uniEdit, uniLabel, fm_entity, fm_situation,ControllerOrderPacking,
  msg_form, unmessages,uniBasicGrid, uniDBGrid, Data.DB, Datasnap.DBClient, ControllerOrder,tblOrderItem, fm_order_items_packing,
  UnFunctions, uniCheckBox, uniMemo, uniPageControl, prm_call_invoice,
  tas_copy_invoice, ControllerOrderITem, ControllerOrderHasDelivery;

type
  TTasOrderPacking = class(TTasOrder)
    L_Codigo: TUniLabel;
    E_Number: TUniEdit;
    L_DtRegistry: TUniLabel;
    Dtp_Registry: TUniDateTimePicker;
    Ctn_Entity: TUniContainerPanel;
    Ctn_Situation: TUniContainerPanel;
    ListDelivery: TUniMenuItem;
    pg_Items: TUniPageControl;
    tbs_List: TUniTabSheet;
    pnl_Order_Item: TUniPanel;
    Ctn_Order_Items_Packing: TUniContainerPanel;
    tbs_other: TUniTabSheet;
    UniPanel2: TUniPanel;
    M_note: TUniMemo;
    UniLabel13: TUniLabel;
    chbx_approved: TUniCheckBox;
    tbs_delivery: TUniTabSheet;
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
    procedure UniFormDestroy(Sender: TObject);
    procedure ListDeliveryClick(Sender: TObject);
    procedure NotaFiscal1Click(Sender: TObject);
    procedure Copiaritens1Click(Sender: TObject);

  private
    { Private declarations }

  protected
    FrEntity : TFmEntity;
    FrSituation : TFmSituation;
    FrOrderItemsPacking : TFmOrderItemsPacking;
    procedure ShowEntity;
    procedure ShowSituation;
    procedure ShowOrderItemsPacking;

    function  ValidaInsert():boolean;Override;
    procedure Insert;Override;
    function  ValidateSave: boolean;Override;
    procedure Save;Override;
    procedure SaveOrder;
    procedure SaveOrderItems(cds_items : TClientDataSet; order_id:Integer);Override;
    procedure SaveOrderShipping;
    procedure SaveOrdertotalizer;

    procedure DeletedHasDelivery(cds_Items : TClientDataSet; order_id:Integer);

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
  OrderPacking : TControllerOrderPacking;

 end;

var
  TasOrderPacking: TTasOrderPacking;

implementation

{$R *.dfm}

uses MainModule, tas_order_items_job, tas_order_list_to_delivery, openForms,
  Main, openReports, rep_viewer, prm_rep_order, uReportCM, REST.Json;

{ TTasOrderPacking }

procedure TTasOrderPacking.Change;
begin
  inherited;

end;

procedure TTasOrderPacking.ClearAllFields;
begin
  inherited;
  ClearFields(FrEntity);
  ClearFields(FrSituation);
  ClearFields(FrOrderItemsPacking);
  OrderPacking.clear;
end;

procedure TTasOrderPacking.Copiaritens1Click(Sender: TObject);
Var
  Form : TTasCopyInvoice;
begin
  Form := TTasCopyInvoice.Create(UniApplication);
  Form.cds_items := FmOrderItemsPacking.cds_items;
  Form.ShowModal;
end;

procedure TTasOrderPacking.Delete;
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
          OrderPacking.delete;
          ClearAllFields;
        End;
      end
    );
end;

procedure TTasOrderPacking.EditionControl;
begin
  inherited;
  EditionControler(FrEntity);
  EditionControler(FrSituation);
  EditionControler(FrOrderItemsPacking);
  Sb_Invoice.Enabled := ( EditionState = 'B' );
  Sb_print.Enabled := ( EditionState = 'B' );
  Copiaritens1.Enabled := ( EditionState = 'I' ) or ( EditionState = 'E' );
end;

procedure TTasOrderPacking.FormatScreen;
begin
  inherited;
  ShowEntity;
  ShowSituation;
  ShowShipping(Ctn_Shipping);
  ShowOrderItemsPacking;
end;

procedure TTasOrderPacking.InitVariable;
begin
  inherited;
  OrderPacking := TControllerOrderPacking.Create(self);
end;

procedure TTasOrderPacking.Insert;
begin
 inherited;
  ClearAllFields;
end;

procedure TTasOrderPacking.ListDeliveryClick(Sender: TObject);
var
  Form : TTasOrderListToDelivery;
begin
  if Form = nil then
    Form := TTasOrderListToDelivery.Create(UniApplication);
  Form.cds_temp := FrOrderItemsPacking.cds_items;
  Form.Show(
    Procedure(Sender: TComponent; AResult:Integer)
    begin
      FrOrderItemspacking.cds_items := Form.cds_Temp;
      Form := nil;
    end
  );
end;

procedure TTasOrderPacking.NotaFiscal1Click(Sender: TObject);
begin
  if ValidatehasInvoice(OrderPacking.Registro.Codigo) then
  Begin

  End;
end;

procedure TTasOrderPacking.printOrder;
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
    LcPar.Codigo := OrderPacking.Registro.Codigo;
    LcPar.URL := '';//'http://www.gestaowebsetes.com.br/institution/07742094000113/2/pedidocompra.pdf';
    LcJSon := TJson.ObjectToJsonString(LcPar);
    LcCM := TReportCM.Create(Self);
    LcJSon := LcCM.SMGeneralClient.GetOrderPacking(LcJSon);
    UniSession.Synchronize;
    LcPar := TJson.JsonToObject<TPrmRepOrder>(LcJson);
    if LcPar.Resultado then
    begin
      openReportViewer('Romaneio',LcPar.url);
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

procedure TTasOrderPacking.Save;
begin
  SaveOrder;
  SaveOrderItems(FrOrderItemsPacking.cds_items,OrderPacking.Registro.Codigo);
  SaveOrderShipping;
  SaveOrdertotalizer;
  //Setando a variavel para controle de botãoe (Alterar/Excluir
  CodigoRegistro := OrderPacking.Registro.Codigo;
end;

procedure TTasOrderPacking.SaveOrder;
begin
 with OrderPacking.Order.Registro do
  Begin
    Estabelecimento := UMM.GInstitution.registro.Codigo;
    Data            := Dtp_Registry.DateTime;
    Observacao      := '';
    Usuario         := UMM.GInstitution.User.Registro.codigo;
    Status          := 'N';
  End;
  OrderPacking.Order.save;

 with OrderPacking.Registro do
    begin
      Codigo :=  OrderPacking.Order.Registro.Codigo;
      Estabelecimento := UMM.GInstitution.registro.Codigo;
      Numero := StrToIntDef(E_Number.Text,0);
      Entidade := FrEntity.DBLCB_Lista.KeyValue;
      Situacao := FrSituation.DBLCB_Lista.KeyValue;
    End;
  OrderPacking.save;
end;

procedure TTasOrderPacking.DeletedHasDelivery(cds_Items : TClientDataSet; order_id:Integer);
Var
  LcOperacao : String;
  cds_temp : TClientDataSet;
  LcOrderHasDelivery : TControllerOrderHasDelivery;
begin
  if cds_items.ChangeCount > 0 then
  Begin
    LcOrderHasDelivery := TControllerOrderHasDelivery.create(Self);
    cds_temp := TClientDataSet.Create(Self);
    cds_temp.Data := cds_items.Delta;
    cds_temp.First;
    cds_items.First;
    //Trata somente os dados deletados
    while not cds_temp.eof do
    Begin
      if cds_temp.UpdateStatus = usDeleted then
      Begin
        with LcOrderHasDelivery do
        Begin
          //Detalhe
          Registro.Estabelecimento   := cds_temp.FieldByName('tb_institution_id').asInteger;
          Registro.Ordem             := cds_temp.FieldByName('tb_order_id').AsInteger;
          Registro.OrdemItem         := cds_temp.FieldByName('id').AsInteger;
          LcOrderHasDelivery.delete;
        End;
      End;
      cds_temp.Next;
    end;
    cds_temp.Close;
    FreeAndNil(cds_temp);
  End;
end;

procedure TTasOrderPacking.SaveOrderItems(cds_items: TClientDataSet;
  order_id: Integer);
Var
  LcOperacao : String;
  LcOrderItems : TControllerOrderITem;
  LcOrdHasDeliver : TControllerOrderHasDelivery;
begin
  LcOrdHasDeliver := TControllerOrderHasDelivery.Create(self);
  DeletedHasDelivery(cds_items, order_id);
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
      if ( cds_items.FieldByName('tb_order_to_deliver_id').AsInteger > 0 )  then
      Begin
        LcOrdHasDeliver.clear;
        LcOrdHasDeliver.Registro.Estabelecimento    := UMM.GInstitution.registro.Codigo;
        LcOrdHasDeliver.Registro.Ordem              := LcOrderItems.Registro.Ordem;
        LcOrdHasDeliver.Registro.OrdemItem          := LcOrderItems.Registro.Codigo;
        LcOrdHasDeliver.Registro.ItemListadeCompra  := cds_items.fieldbyname('tb_order_to_deliver_id').AsInteger;
        LcOrdHasDeliver.save;
      End;

      cds_items.next;
    End;
    cds_items.MergeChangeLog;
  End;



end;

procedure TTasOrderPacking.SaveOrderShipping;
begin
  with FrShipping, OrderPacking.OrderShipping.Registro do
  begin
    Codigo := OrderPacking.Registro.Codigo;
    Estabelecimento := OrderPacking.Registro.Estabelecimento;

    if FrAddressDelivery.DBLCB_Lista.KeyValue <> null then
      Endereco := FrAddressDelivery.DBLCB_Lista.KeyValue
    else
      Endereco := OrderPacking.Registro.Entidade;

    if FrCarrier.DBLCB_Lista.KeyValue <> null then
      Transportadora := FrCarrier.DBLCB_Lista.KeyValue
    else
      Transportadora := 0;

    if (FrFreightMode.DBLCB_Lista.KeyValue <> Null) then
      ModalidadeFrete := FrFreightMode.DBLCB_Lista.KeyValue
    else
      ModalidadeFrete := '2';

    DiaEntrega := DtpDataDelivery.DateTime;

    Valor := StrToFloatDef(FrOrderItemsPacking.E_VL_Freight.Text,0);
    PontoReferencia := E_Help_Reference.Text;
  end;
  OrderPacking.OrderShipping.save;

end;

procedure TTasOrderPacking.SaveOrdertotalizer;
begin
  with OrderPacking.OrderTotalizer.Registro do
  begin
    Codigo            := OrderPacking.Order.Registro.Codigo;
    Estabelecimento   := OrderPacking.Order.Registro.Estabelecimento;
    ItemsQuantidade   := FrOrderItemsPacking.E_Nr_Items.Value;
    ProdutoQuantidade := FrOrderItemsPacking.E_total_qtty.Value;
    ValorProduto      := FrOrderItemsPacking.E_total_Product.Value;
    IPIValor          := 0;
    AlíquotaDesconto  := FrOrderItemsPacking.E_Tx_Discount.Value;
    ValorDesconto     := FrOrderItemsPacking.E_VL_Discount.Value;
    ValorDespesas     := FrOrderItemsPacking.E_VL_Expensive.Value;
    ValorTotal        := FrOrderItemsPacking.E_VL_Order.Value;
  end;
  OrderPacking.OrderTotalizer.save;

end;

procedure TTasOrderPacking.setVariable;
begin
  //Order Packing
  with OrderPacking do
  Begin
    Registro.Estabelecimento := UMM.GInstitution.registro.Codigo;
    Registro.Codigo := CodigoRegistro;
    getByKey;

    Order.Registro.Estabelecimento := UMM.GInstitution.registro.Codigo;
    Order.Registro.Codigo := CodigoRegistro;
    Order.getByKey;

    with OrderShipping.Registro do
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

  End;
  inherited;
end;

procedure TTasOrderPacking.ShowData;
begin
  ShowDataOrder;
  ShowDataOrderShipping;
  ShowDataTotalizer;
  ShowDatalisttItems(FrOrderItemsPacking.cds_items, OrderPacking.Registro.Codigo);
end;

procedure TTasOrderPacking.ShowDataOrder;
begin
  //Order
  with OrderPacking do
  Begin
    with Order.Registro do
    begin
      Dtp_Registry.DateTime := Data ;
    end;
   //OrderPacking
    with OrderPacking.registro do
    begin
      E_Number.Text := IntToStr(Numero);
      FrEntity.DBLCB_Lista.KeyValue := Entidade;
      FrSituation.DBLCB_Lista.KeyValue := Situacao;
    End;
  End;
end;

procedure TTasOrderPacking.ShowDataOrderShipping;
begin
  with FrShipping, OrderPacking.OrderShipping.Registro do
  begin
    frAddressDelivery.DBLCB_Lista.KeyValue :=  Endereco;
    FrCarrier.DBLCB_Lista.KeyValue := Transportadora;
    if Trim(ModalidadeFrete) <> '' then
      FrFreightMode.DBLCB_Lista.KeyValue := ModalidadeFrete
    else
      FrFreightMode.DBLCB_Lista.KeyValue := 0;
    E_Help_Reference.Text := PontoReferencia;
    DtpDataDelivery.DateTime := DiaEntrega;
    FrOrderItemsPacking.E_VL_Freight.text :=  FloatToStrF(Valor,ffFixed,10,2);
    FrOrderItemsPacking.E_VL_Freight.Value := Valor;
  end;
end;

procedure TTasOrderPacking.ShowDataTotalizer;
begin
  with OrderPacking.OrderTotalizer.Registro,FrOrderItemsPacking do
  begin
    E_total_qtty.Value     := ProdutoQuantidade;
    E_total_Product.Value  := ValorProduto;
    E_VL_Expensive.Value   := ValorDespesas;
    E_Tx_Discount.Value    := AlíquotaDesconto;
    E_vl_Discount.Value    := ValorDesconto;
    E_VL_Order.Value       := ValorTotal;
  end;

end;

procedure TTasOrderPacking.ShowEntity;
begin
  FrEntity := TfmEntity.Create(Self);
  FrEntity.Parent := Ctn_Entity;
  FrEntity.Listar;
  FrEntity.Align := alClient;
  FrEntity.Show;
end;

procedure TTasOrderPacking.ShowNoData;
begin
  ClearAllFields;
  inherited;
end;

procedure TTasOrderPacking.ShowOrderItemsPacking;
begin
  FrOrderItemsPacking := TFmOrderItemsPacking.Create(Self);
  FrOrderItemsPacking.Parent := Ctn_Order_Items_Packing;
  FrOrderItemsPacking.Align := alClient;
  FrOrderItemsPacking.Show;
end;

procedure TTasOrderPacking.ShowSituation;
begin
  FrSituation := TFmSituation.Create(Self);
  FrSituation.Parent := Ctn_Situation;
  FrSituation.Listar;
  FrSituation.Align := alClient;
  FrSituation.Show;
end;

procedure TTasOrderPacking.toInvoice;
Var
  LcPar : TPrmCallInvoice;
begin
  LcPar := TPrmCallInvoice.Create;
  with LcPar do
  Begin
    ordem           := OrderPacking.Registro.Codigo;
    Estabelecimento := OrderPacking.Registro.Estabelecimento;
    Emitente        := OrderPacking.Registro.Estabelecimento;
    Destinatario    := OrderPacking.Registro.Entidade;
    Sentido         := 'S';
    MostraSentido   := False;
    AutroizaNfe     := True;
    ModeloNFe       := '55';
  End;
  OpenToInvoice(LcPar);
end;

procedure TTasOrderPacking.UniFormDestroy(Sender: TObject);
begin
  inherited;
  FreeAndNil( FrEntity );
  FreeAndNil( FrSituation );
  FreeAndNil( FrOrderItemsPacking );
end;

function TTasOrderPacking.ValidaInsert: boolean;
begin
  Result := True;
end;

function TTasOrderPacking.ValidateChange: boolean;
begin
  Result := True;
  if not ValidatehasNotInvoice(OrderPacking.Registro.Codigo) then
  Begin
    Result := False;
    exit;
  End;

end;

function TTasOrderPacking.ValidateDelete: boolean;
begin
  Result := True;
  if not ValidatehasNotInvoice(OrderPacking.Registro.Codigo) then
  Begin
    Result := False;
    exit;
  End;

end;

function TTasOrderPacking.validateInvoice: Boolean;
begin
  REsult := true;
  if not hasOrderItems(FrOrderItemsPacking.cds_items) then
  Begin
    Result := False;
    exit;
  End;

  Result := True;
  if not ValidatehasNotInvoice(OrderPacking.Registro.Codigo) then
  Begin
    Result := False;
    exit;
  End;

end;

function TTasOrderPacking.validatePrintOrder: Boolean;
begin
  REsult := true;
  if not hasOrderItems(FrOrderItemsPacking.cds_items) then
  Begin
    Result := False;
    exit;
  End;
end;

function TTasOrderPacking.ValidateSave: boolean;
begin
 Result := True;
  if trim(Dtp_Registry.Text) = '' then
  begin
    MensageAlert(['A T E N Ç Ã O!.',
                  '',
                  'Campo Data Cadastro não informado.',
                  'Preencha o campo para continuar']);
    Result := False;
    exit;
  end;

  if trim(FrEntity.DBLCB_Lista.Text ) = '' then
  begin
    MensageAlert(['A T E N Ç Ã O!.',
                  '',
                  'Campo Empresa não informado.',
                  'Preencha o campo para continuar']);
    Result := False;
    exit;
  end;

    if trim(FrSituation.DBLCB_Lista.Text) = '' then
  begin
    MensageAlert(['A T E N Ç Ã O!.',
                  '',
                  'Campo Situação não informado.',
                  'Preencha o campo para continuar']);
    Result := False;
    exit;
  end;

     if trim(Dtp_Registry.Text) = '30/12/1899' then
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
