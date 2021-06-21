unit tas_order_sale;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, tas_order, Vcl.Menus, uniMainMenu,System.AnsiStrings,
  uniButton, uniBitBtn, uniSpeedButton, uniGUIBaseClasses, uniGUIClasses,
  uniPanel, uniDateTimePicker, uniEdit, uniLabel, uniPageControl, fm_customer,fm_situation,
  ControllerOrderSale, unmessages, MainModule, msg_form,FireDAC.Stan.Param,
  uniBasicGrid, uniDBGrid, Data.DB, Datasnap.DBClient, tblOrderItem, fm_order_items_sale,
  uniCheckBox, uniRadioGroup, uniMemo,fm_payment_type, fm_salesman, UnFunctions,
  tas_copy_invoice;

type
  TTasOrderSale = class(TTasOrder)
    pnl_top: TUniPanel;
    E_DateRegistry: TUniDateTimePicker;
    Ctn_Customer: TUniContainerPanel;
    Ctn_PaymentType: TUniContainerPanel;
    UniPageControl2: TUniPageControl;
    tbs_List: TUniTabSheet;
    tbs_other: TUniTabSheet;
    UniPanel1: TUniPanel;
    UniPanel2: TUniPanel;
    M_note: TUniMemo;
    UniLabel13: TUniLabel;
    UniPanel3: TUniPanel;
    Rg_Freight_Owner: TUniRadioGroup;
    L_DeadLine: TUniLabel;
    E_DeliveryDate: TUniEdit;
    chbx_approved: TUniCheckBox;
    Ctn_SalesMan: TUniContainerPanel;
    Ctn_ItensSale: TUniContainerPanel;
    Ctn_Installment_open: TUniContainerPanel;
    Configurao1: TUniMenuItem;
    Copiaritens1: TUniMenuItem;
    pnl_top_linha_01: TUniPanel;
    E_Number: TUniEdit;
    pnl_top_linha_02: TUniPanel;

    procedure Configurao1Click(Sender: TObject);
    procedure Copiaritens1Click(Sender: TObject);

  private

  protected

    frSalesman        : TFmSalesman;
    FrCustomer        : TFmCustomer;
    FrSituation       : TfmSituation;
    FrOrderItemsSale  : TFmOrderItemsSale;

    procedure InitVariable;Override;
    procedure setVariable; override;
    procedure FormatScreen;Override;

    procedure ShowData;Override;
    procedure ShowNoData;Override;
    procedure ClearAllFields;Override;
    procedure EditionControl;Override;

    function  ValidaInsert():boolean;Override;
    procedure Insert;Override;
    function  ValidateSave: boolean;Override;
    procedure Save;Override;
    function  ValidateDelete: boolean;Override;
    procedure Delete;Override;

    function ValidateChange():boolean;Override;
    procedure Change;Override;

    procedure SaveOrder;
    procedure SaveOrderBilling;

    procedure ShowDataOrder;
    procedure ShowCustomer;
    procedure ShowSituation;
    procedure ShowlistItems;
    procedure ShowSalesman;
    function validatePrintOrder:Boolean;Override;
    procedure printOrder;Override;

    function validateInvoice:Boolean;Override;
    procedure toInvoice;Override;


  public
    OrderSale: TControllerOrderSale;
  end;

var
  TasOrderSale: TTasOrderSale;

implementation

{$R *.dfm}

uses openForms;

{ TTasOrderSale }

procedure TTasOrderSale.Change;
begin
  inherited;
end;

procedure TTasOrderSale.ClearAllFields;
begin
  inherited;
  ClearFields(FrCustomer);
  ClearFields(frSalesman);
  OrderSale.clear;
end;

procedure TTasOrderSale.Configurao1Click(Sender: TObject);
begin
  inherited;
  openTasConfigOrderSale(0);
end;

procedure TTasOrderSale.Copiaritens1Click(Sender: TObject);
Var
  Form : TTasCopyInvoice;
begin
  Form := TTasCopyInvoice.Create(UniApplication);
  Form.cds_items := FmOrderItemsSale.cds_items;
  Form.ShowModal;

end;

procedure TTasOrderSale.Delete;
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
          //Provider.delete;
          //PaymentType.delete;
          OrderSale.deleteAll;
          ClearAllFields;
        End;
      end
    );
end;

procedure TTasOrderSale.EditionControl;
begin
  inherited;
  EditionControler(FrCustomer);
  EditionControler(FrPaymentType);
  EditionControler(frSalesman);
  EditionControler(FrOrderItemsSale);

  Copiaritens1.Enabled := ( EditionState = 'I' ) or ( EditionState = 'E' );
  Sb_Invoice.Enabled := ( EditionState = 'B' );
  Sb_print.Enabled := ( EditionState = 'B' );
end;

procedure TTasOrderSale.FormatScreen;
begin
  inherited;
  ShowCustomer;
  ShowPaymentType(Ctn_PaymentType);
  ShowSalesman;
  ShowlistItems;
  ShowInstallmentOpen(Ctn_Installment_open);
end;

procedure TTasOrderSale.InitVariable;
begin
  inherited;
  OrderSale := TControllerOrderSale.Create(self);
end;

procedure TTasOrderSale.Insert;
begin
  inherited;
  ClearAllFields;
end;

procedure TTasOrderSale.printOrder;
begin
  inherited;

end;

procedure TTasOrderSale.Save;
begin
  SaveOrder;
  SaveOrderBilling;
  SaveOrderItems(FrOrderItemsSale.cds_items,OrderSale.Registro.Codigo);
end;

procedure TTasOrderSale.SaveOrder;
begin
  With OrderSale do
  begin
    with order.registro do
    begin
      Estabelecimento := UMM.GInstitution.registro.Codigo;
      Usuario := UMM.GInstitution.User.Registro.codigo;
      Data := E_DateRegistry.DateTime ;
      Observacao := M_note.Text ;
    End;
    Order.save;

    with registro do
    Begin
      Codigo := Order.Registro.Codigo;
      Estabelecimento := UMM.GInstitution.registro.Codigo;
      Numero := StrTOIntDef(E_Number.Text,0) ;
      Vendedor := frSalesman.DBLCB_Lista.KeyValue;
      Cliente := FrCustomer.DBLCB_Lista.KeyValue;
    End;
    OrderSale.save;

    with Totalizer.Registro do
    begin
      Codigo := OrderSale.order.Registro.Codigo;
      Estabelecimento := UMM.GInstitution.registro.Codigo;
      ProdutoQuantidade := StrToFloatDef(FrOrderItemsSale.E_total_qtty.Text,0);
      ValorProduto := StrToFloatDef(FrOrderItemsSale.E_total_Product.Text,0);
      //IPIValor := StrToFloatDef(E_VL_Ipi.Text,0);

      AlíquotaDesconto := StrToFloatDef(FrOrderItemsSale.E_Tx_Discount.Text,0);
      ValorDesconto := StrToFloatDef(FrOrderItemsSale.E_VL_Discount.Text,0);
      ValorTotal := StrToFloatDef(FrOrderItemsSale.E_VL_Order.Text,0);
      ValorDespesas := StrToFloatDef(FrOrderItemsSale.E_VL_Expensive.Text,0);
    end;
    Totalizer.save;
  end;
end;


procedure TTasOrderSale.SaveOrderBilling;
begin
  with OrderSale.Billing.Registro do
  begin
    Codigo := OrderSale.Order.Registro.Codigo;
    Estabelecimento := OrderSale.Order.Registro.Estabelecimento;
    FormaPagamento    := FrPaymentType.DBLCB_Lista.KeyValue;
    Parcelas          := FrInstallmentOpen.E_Plots.Text;
    Prazo             := FrInstallmentOpen.E_DeadLine.Text;
    Responsavel       := UMM.GInstitution.User.Registro.Codigo;
  end;
  OrderSale.Billing.save;
end;

procedure TTasOrderSale.setVariable;
begin
  with OrderSale do
  Begin
    {São setados os valores para abertura da tela
      Registro.Codigo := CodigoRegistro;
      Registro.Estabelecimento := UMM.GInstitution.registro.Codigo;
      Registro.Terminal :=
      Registro.Vendedor
    }
    getByKey;

    order.Registro.Codigo           := registro.Codigo;
    order.Registro.Estabelecimento  := registro.Estabelecimento;
    order.Registro.Terminal         := registro.Terminal;
    order.getByKey;

    Totalizer.registro.Codigo           := registro.Codigo;
    Totalizer.Registro.Estabelecimento  := registro.Estabelecimento;
    Totalizer.Registro.Terminal         := registro.Terminal;
    Totalizer.getByKey;

    Billing.Registro.Codigo           := registro.Codigo;
    Billing.Registro.Estabelecimento  := registro.Estabelecimento;
    Billing.Registro.Terminal         := registro.Terminal;
    Billing.getByKey;
  End;
  inherited;
end;

procedure TTasOrderSale.ShowCustomer;
begin
  FrCustomer := TFmCustomer.Create(Ctn_Customer);
  FrCustomer.Parent := Ctn_Customer;
  FrCustomer.Align := alClient;
  FrCustomer.listar;
  FrCustomer.Show;
end;

procedure TTasOrderSale.ShowData;
begin
  ShowDataOrder;
  //PEga os Items
  OrderItems.Registro.Estabelecimento := OrderSale.Registro.Estabelecimento;
  OrderItems.Registro.Ordem           := OrderSale.Registro.Codigo;
  OrderItems.Registro.Terminal        := OrderSale.Registro.Terminal;
  OrderItems.getList;
  ShowDatalisttItems(FrOrderItemsSale.cds_items, OrderSale.Registro.Codigo);
end;

procedure TTasOrderSale.ShowDataOrder;
begin
  with OrderSale do
    begin
      E_DateRegistry.DateTime := Order.Registro.Data;
      M_note.Text := Order.Registro.Observacao;
      E_Number.Text := IntToStr(registro.Numero);
      FrSalesman.DBLCB_Lista.KeyValue := Registro.Vendedor;
      FrCustomer.DBLCB_Lista.KeyValue := Registro.Cliente;

      with Totalizer.registro do
      begin
        FrOrderItemsSale.E_total_qtty.Text := FloatToStrF(ProdutoQuantidade,ffFixed,10,2);
        FrOrderItemsSale.E_total_Product.Text := FloatToStrF(ValorProduto,ffFixed,10,2);
        //FrOrderItemsSale.E_VL_Ipi.Text := FloatToStrF(IPIValor,ffFixed,10,2);

        FrOrderItemsSale.E_Tx_Discount.Text := FloatToStrF(AlíquotaDesconto,ffFixed,10,2);
        FrOrderItemsSale.E_VL_Discount.Text := FloatToStrF(ValorDesconto,ffFixed,10,2);
        FrOrderItemsSale.E_VL_Expensive.Text := FloatToStrF(ValorDespesas,ffFixed,10,2);
        FrOrderItemsSale.E_VL_Order.Text := FloatToStrF(ValorTotal,ffFixed,10,2);
      end;

      with Billing do
      Begin
        FrPaymentType.DBLCB_Lista.KeyValue := Registro.FormaPagamento;
        FrInstallmentOpen.E_Plots.Text := Registro.Parcelas;
        FrInstallmentOpen.E_DeadLine.Text := Registro.Prazo;
      End;
    End;

end;

procedure TTasOrderSale.ShowlistItems;
begin
  FrOrderItemsSale := TFmOrderItemsSale.Create(Ctn_ItensSale);
  FrOrderItemsSale.Parent := Ctn_ItensSale;
  FrOrderItemsSale.Align := alClient;
  FrOrderItemsSale.Show;
end;


procedure TTasOrderSale.ShowNoData;
begin
  ClearAllFields;
  inherited;
end;

procedure TTasOrderSale.ShowSalesman;
begin
  frSalesman := TFmSalesman.Create(Ctn_SalesMan);
  frSalesman.Parent := Ctn_SalesMan;
  frSalesman.Align := alClient;
  frSalesman.listar;
  frSalesman.Show;
end;

procedure TTasOrderSale.ShowSituation;
begin

end;

procedure TTasOrderSale.toInvoice;
begin
  inherited;

end;

function TTasOrderSale.ValidaInsert: boolean;
begin
//
end;

function TTasOrderSale.ValidateChange: boolean;
begin
  Result := True;
  if not ValidatehasNotInvoice(OrderSale.Registro.Codigo) then
  Begin
    Result := False;
    exit;
  End;
end;

function TTasOrderSale.ValidateDelete: boolean;
begin
  Result := True;
end;

function TTasOrderSale.validateInvoice: Boolean;
begin

end;

function TTasOrderSale.validatePrintOrder: Boolean;
begin

end;

function TTasOrderSale.ValidateSave: boolean;
Begin
  Result := True;
  if trim(FrPaymentType.DBLCB_Lista.Text) = '' then
  begin
    MensageAlert(['A T E N Ç Ã O!.',
                  '',
                  'Campo Tipo de Pagamento não informado.',
                  'Preencha o campo para continuar']);
    Result := False;
    exit;
  end;

  if trim(frSalesman.DBLCB_Lista.Text) = '' then
  begin
    MensageAlert(['A T E N Ç Ã O!.',
                  '',
                  'Campo Nome do Vendedor não informado.',
                  'Preencha o campo para continuar']);
    Result := False;
    exit;
  end;

  if trim(FrCustomer.DBLCB_Lista.Text) = '' then
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
