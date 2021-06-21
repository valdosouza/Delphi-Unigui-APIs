unit tas_order_consignment;

interface

uses
  System.IOUtils, System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  base_form, System.ImageList, FMX.ImgList, FMX.Layouts, FMX.ListView.Types,
  FMX.ListView.Appearances, FMX.ListView.Adapters.Base, FMX.ScrollBox, FMX.Memo,
  FMX.Edit, FMX.EditBox, FMX.SpinBox, FMX.ListBox, FMX.ListView,MD5,FMX.MultiResBitmap,
  FMX.Controls.Presentation, FMX.Objects, FMX.TabControl, System.Actions,
  FMX.ActnList, sea_customer, ctrl_mob_order_consignment, MainModule,
  FMX.DialogService,TypesListCollection,list_spl_order_consignment_items,
  fm_sea_product, ctrl_mob_merchandise, UnFunctions,ctrl_mob_price, FMX.Ani,
  ctrl_mob_order_sale, ctrl_mob_financial,  ctrl_mob_financial_bills, System.Bluetooth, tas_take_picture, FMX.StdActns,
  FMX.MediaLibrary.Actions,ctrl_mob_images, img_general;

type
  TTasOrderConsignment = class(TBaseForm)
    pg_manager: TTabControl;
    tbs_manager: TTabItem;
    Ly_Result_top: TLayout;
    Rc_result_top: TRectangle;
    Ly_list_titlle: TLayout;
    img_top: TImage;
    Lb_title: TLabel;
    Sb_Cancel: TSpeedButton;
    Ly_customer: TLayout;
    Rc_customer: TRectangle;
    Ly_customer_img: TLayout;
    im_customer: TImage;
    Ly_customer_text: TLayout;
    Ly_customer_text_tittle: TLayout;
    lb_Customer: TLabel;
    Ly_customer_text_body: TLayout;
    E_customer_name: TLabel;
    E_customer_nick: TLabel;
    Ly_product: TLayout;
    Rc_product: TRectangle;
    Ly_product_img: TLayout;
    im_Itens: TImage;
    Ly_product_text: TLayout;
    Ly_product_text_tittle: TLayout;
    Lb_Qtde_product: TLabel;
    Ly_product_text_body: TLayout;
    E_Qtde_product: TLabel;
    Ly_pay: TLayout;
    Rc_pay: TRectangle;
    E_Value_product: TLabel;
    tbs_add: TTabItem;
    lsv_Search: TListView;
    tbs_product: TTabItem;
    tbs_rmv: TTabItem;
    ActionList: TActionList;
    ChangeTabAdd: TChangeTabAction;
    ChangeTabRmv: TChangeTabAction;
    ChangeTabProduct: TChangeTabAction;
    ChangeTabManager: TChangeTabAction;
    Ly_rmv: TLayout;
    Rc_rmv: TRectangle;
    Ly_rmv_img: TLayout;
    im_rmv: TImage;
    Ly_rmv_text: TLayout;
    Layout4: TLayout;
    Label1: TLabel;
    Layout5: TLayout;
    E_Qtde_Saida: TLabel;
    Ly_add: TLayout;
    Rc_add: TRectangle;
    Ly_add_img: TLayout;
    im_add: TImage;
    Ly_add_text: TLayout;
    Layout9: TLayout;
    Label3: TLabel;
    Layout10: TLayout;
    E_Qtde_Entrada: TLabel;
    pg_add: TTabControl;
    tbs_add_lista: TTabItem;
    tbs_add_lista_items: TTabItem;
    tbs_add_search_items: TTabItem;
    pg_rmv: TTabControl;
    tbs_rmv_lista: TTabItem;
    tbs_rmv_lista_items: TTabItem;
    tbs_rmv_balance_items: TTabItem;
    tbs_rmv_confirm: TTabItem;
    pg_product: TTabControl;
    tbs_product_balance: TTabItem;
    tbs_product_statement: TTabItem;
    Ly_product_balance: TLayout;
    Ly_product_balance_top: TLayout;
    Rc_product_balance_top: TRectangle;
    Ly_product_balance_Tittle: TLayout;
    Lb_product_balance_tittle: TLabel;
    Sb_product_balance_search: TSpeedButton;
    Ly_product_balance_search: TLayout;
    E_product_balance_search: TEdit;
    Sb_product_balance_search_back: TSpeedButton;
    Sb_product_balance_back: TSpeedButton;
    Ly_product_statement: TLayout;
    Ly_product_statement_top: TLayout;
    Rc_product_statement_top: TRectangle;
    Ly_product_statement_Tittle: TLayout;
    Lb_product_statement_tittle: TLabel;
    Sb_product_statement_search: TSpeedButton;
    Sb_product_statement_back: TSpeedButton;
    Ly_product_statement_search: TLayout;
    E_product_statement_search: TEdit;
    Sb_product_statement_search_back: TSpeedButton;
    ChangeTabProductBalance: TChangeTabAction;
    ChangeTabProductStatement: TChangeTabAction;
    ChangeTabProductManage: TChangeTabAction;
    Ly_add_lista: TLayout;
    Lsv_add_lista: TListView;
    Ly_add_lista_top: TLayout;
    Rc_add_lista_top: TRectangle;
    Ly_add_lista_tittle: TLayout;
    Lb_add_list: TLabel;
    Sb_add_list_search: TSpeedButton;
    Sb_add_list_back: TSpeedButton;
    Ly_add_lista_Search: TLayout;
    E_add_list_search: TEdit;
    Sb_add_list_search_back: TSpeedButton;
    Sb_add_list_new: TSpeedButton;
    Ly_add_items: TLayout;
    Ly_add_items_top: TLayout;
    Rc_add_items_top: TRectangle;
    Ly_add_order_items: TLayout;
    Lb_add_items_tittle: TLabel;
    Sb_add_items_new: TSpeedButton;
    Sb_add_items_back: TSpeedButton;
    Ly_add_items_selected: TLayout;
    Rc_add_items_selected: TRectangle;
    Lb_add_items_subtotal_value: TLabel;
    Lsv_add_items: TListView;
    ChangeTabAddManage: TChangeTabAction;
    ChangeTabAddLista: TChangeTabAction;
    ChangeTabAddListaItems: TChangeTabAction;
    ChangeTabAddSearchItems: TChangeTabAction;
    Ly_rmv_lista: TLayout;
    Lsv_rmv_lista: TListView;
    Ly_rmv_lista_top: TLayout;
    Rc_rmv_lista_top: TRectangle;
    Ly_rmv_lista_tittle: TLayout;
    Lb_rmv_list: TLabel;
    Sb_rmv_list_search: TSpeedButton;
    Sb_rmv_list_back: TSpeedButton;
    Sb_rmv_list_new: TSpeedButton;
    Ly_rmv_lista_Search: TLayout;
    E_rmv_list_search: TEdit;
    Sb_rmv_list_search_back: TSpeedButton;
    Ly_rmv_items: TLayout;
    Ly_rmv_items_top: TLayout;
    Rc_rmv_items_top: TRectangle;
    Ly_rmv_order_items: TLayout;
    Lb_rmv_itens_tittle: TLabel;
    Sb_rmv_itens_new: TSpeedButton;
    Sb_rmv_items_back: TSpeedButton;
    Lsv_rmv_lista_itens_sale: TListView;
    pg_rmv_lista_items: TTabControl;
    tbs_rmv_lista_itens_venda: TTabItem;
    tbs_rmv_lista_itens_dev: TTabItem;
    Lsv_rmv_lista_itens_devo: TListView;
    Ly_rmv_balance_itens: TLayout;
    Rc_rmv_balance_itens: TRectangle;
    Ly_rmv_balance_itens_tittle: TLayout;
    Lb_rmv_balance_items_tittle: TLabel;
    Sb_rmv_balance_items_search: TSpeedButton;
    Sb_rmv_balance_items_back: TSpeedButton;
    Ly_rmv_balance_itens_search: TLayout;
    E_rmv_balance_items_search: TEdit;
    Sb_rmv_balance_items_search_back: TSpeedButton;
    Ly_rmv_confirm_product: TLayout;
    Lb_rmv_confirm_desc_prod: TLabel;
    Rc_rmv_confirm_top: TRectangle;
    Layout8: TLayout;
    Rc_rmv_contagem_local: TRectangle;
    Lb_rmv_contagem_local: TLabel;
    Layout11: TLayout;
    Rc_rmv_saldo_consignado: TRectangle;
    Lb_rmv_saldo_consignado: TLabel;
    Sp_rmv_contagem_local: TSpinBox;
    Layout12: TLayout;
    Rc_rmv_quantidade_devolvida: TRectangle;
    Lb_rmv_quantidade_devolvida: TLabel;
    Sp_rmv_quantidade_devolvida: TSpinBox;
    E_rmv_saldo_consignado: TEdit;
    Layout13: TLayout;
    Sb_rmv_confirm_ok: TButton;
    Sb_rmv_confirm_cancel: TButton;
    ChangeTabRmvManager: TChangeTabAction;
    ChangeTabRmvLista: TChangeTabAction;
    ChangeTabRmvListaItems: TChangeTabAction;
    ChangeTabRmvBalanceItems: TChangeTabAction;
    ChangeTabRmvConfim: TChangeTabAction;
    tbs_add_edit_items: TTabItem;
    Rc_proc_tittle: TRectangle;
    Lb_edit_product_desc: TLabel;
    Ly_botao_edit_product: TLayout;
    Sb_canc_edit_product: TButton;
    Sb_conf_edit_product: TButton;
    GPL_Ins_Product: TGridPanelLayout;
    Lb_vl_unit_product: TLabel;
    Label2: TLabel;
    e_vl_unit_product: TEdit;
    Sp_Qtde_add: TSpinBox;
    ChangeTabEditITems: TChangeTabAction;
    Ly_rmv_items_sale_selected: TLayout;
    Rc_rmv_items_sale_selected: TRectangle;
    Lb_rmv_items_sale_subtotal_value: TLabel;
    Ly_rmv_items_devo_selected: TLayout;
    Rc_rmv_items_devo_selected: TRectangle;
    Lb_rmv_items_devo_subtotal_value: TLabel;
    Lsv_rmv_balance_items: TListView;
    Lb_rmv_confirm_cod_prod: TLabel;
    Lb_rmv_confirm_vl_unit: TLabel;
    Label5: TLabel;
    Rc_product_statement: TRectangle;
    Lb_product_statement_Desc: TLabel;
    Lsv_product_statement: TListView;
    Lb_edit_product_cod: TLabel;
    Layout1: TLayout;
    Rc_rmv_quantidade_venda: TRectangle;
    Lb_rmv_quantidade_venda: TLabel;
    E_rmv_quantidade_venda: TEdit;
    tbs_rmv_fechamento: TTabItem;
    Ly_rmv_fechamento: TLayout;
    Rc_rmv_fechamento: TRectangle;
    Ly_rmv_fechamento_vl_Pedido: TLayout;
    Rc_rmv_fechamento_vl_Pedido: TRectangle;
    Lb_rmv_fechamento_vl_Pedido: TLabel;
    E_rmv_fechamento_vl_pedido: TEdit;
    Ly_rmv_fechamento_vl_troco: TLayout;
    Rc_rmv_fechamento_vl_troco: TRectangle;
    Lb_rmv_fechamento_vl_troco: TLabel;
    E_rmv_fechamento_vl_troco: TEdit;
    Ly_rmv_fechamento_vl_recebido: TLayout;
    Rc_rmv_fechamento_vl_recebido: TRectangle;
    Lb_rmv_fechamento_vl_recebido: TLabel;
    E_rmv_fechamento_vl_recebido: TEdit;
    Layout2: TLayout;
    Sb_rmv_fechamento_confirma: TSpeedButton;
    Ly_rmv_fechamento_vl_falta_pagar: TLayout;
    Rc_rmv_fechamento_vl_falta_pagar: TRectangle;
    Lb_rmv_fechamento_vl_falta_pagar: TLabel;
    E_rmv_fechamento_vl_falta_pagar: TEdit;
    Lsv_product_balance: TListView;
    Sb_imprimir: TSpeedButton;
    Sb_TakePicture: TSpeedButton;
    TakePhotoFromCameraAction1: TTakePhotoFromCameraAction;
    Rc_rmv_confirm_top_linha_1: TLayout;
    Rc_rmv_confirm_top_linha_2: TLayout;
    FmAddSeaProduct: TFmSeaProduct;
    procedure im_ItensClick(Sender: TObject);
    procedure im_rmvClick(Sender: TObject);
    procedure im_addClick(Sender: TObject);
    procedure Lsv_product_balanceClick(Sender: TObject);
    procedure Sb_product_balance_backClick(Sender: TObject);
    procedure Sb_product_statement_backClick(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure Sb_add_items_backClick(Sender: TObject);
    procedure Sb_add_items_newClick(Sender: TObject);
    procedure Sb_add_list_newClick(Sender: TObject);
    procedure Sb_rmv_confirm_okClick(Sender: TObject);
    procedure Sb_rmv_confirm_cancelClick(Sender: TObject);
    procedure Sb_add_list_backClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure im_customerClick(Sender: TObject);
    procedure Lsv_add_listaItemClick(const Sender: TObject;
      const AItem: TListViewItem);
    procedure E_add_list_searchChangeTracking(Sender: TObject);
    procedure FmAddSeaProductlsv_SearchItemClick(const Sender: TObject;
      const AItem: TListViewItem);
    procedure FmAddSeaProductSb_back_product_callbackClick(Sender: TObject);
    procedure FmAddSeaProductSb_searchClick(Sender: TObject);
    procedure FmAddSeaProductE_buscaChangeTracking(Sender: TObject);
    procedure Sb_conf_edit_productClick(Sender: TObject);
    procedure Sb_canc_edit_productClick(Sender: TObject);
    procedure FmAddSeaProductSb_tab_01Click(Sender: TObject);
    procedure Sb_rmv_list_backClick(Sender: TObject);
    procedure Sb_rmv_items_backClick(Sender: TObject);
    procedure Sb_rmv_list_newClick(Sender: TObject);
    procedure Sb_rmv_itens_newClick(Sender: TObject);
    procedure Sb_rmv_balance_items_backClick(Sender: TObject);
    procedure Lsv_rmv_balance_itemsItemClick(const Sender: TObject;
      const AItem: TListViewItem);
    procedure FmAddSeaProductSb_tab_03Click(Sender: TObject);
    procedure FmAddSeaProductSb_tab_04Click(Sender: TObject);
    procedure FmAddSeaProductSb_tab_05Click(Sender: TObject);
    procedure FmAddSeaProductSb_tab_06Click(Sender: TObject);
    procedure FmAddSeaProductSb_tab_07Click(Sender: TObject);
    procedure Sb_CancelClick(Sender: TObject);
    procedure Sp_rmv_contagem_localChange(Sender: TObject);
    procedure Sp_rmv_quantidade_devolvidaChange(Sender: TObject);
    procedure Sb_rmv_fechamento_confirmaClick(Sender: TObject);
    procedure E_rmv_fechamento_vl_recebidoChange(Sender: TObject);
    procedure Sb_imprimirClick(Sender: TObject);
    procedure Sb_TakePictureClick(Sender: TObject);
    procedure TakePhotoFromCameraAction1DidFinishTaking(Image: TBitmap);
    procedure Lsv_product_balanceItemClickEx(const Sender: TObject;
      ItemIndex: Integer; const LocalClickPos: TPointF;
      const ItemObject: TListItemDrawable);
    procedure Lsv_rmv_listaItemClickEx(const Sender: TObject;
      ItemIndex: Integer; const LocalClickPos: TPointF;
      const ItemObject: TListItemDrawable);
    procedure Lsv_add_listaUpdateObjects(const Sender: TObject;
      const AItem: TListViewItem);
    procedure Lsv_add_itemsUpdateObjects(const Sender: TObject;
      const AItem: TListViewItem);
    procedure Lsv_rmv_listaUpdateObjects(const Sender: TObject;
      const AItem: TListViewItem);
    procedure Lsv_rmv_lista_itens_saleUpdateObjects(const Sender: TObject;
      const AItem: TListViewItem);
    procedure Lsv_rmv_lista_itens_devoUpdateObjects(const Sender: TObject;
      const AItem: TListViewItem);
    procedure Lsv_rmv_balance_itemsUpdateObjects(const Sender: TObject;
      const AItem: TListViewItem);
  private
    { Private declarations }
    DataOperation : TDate;
    IndiceItemPRoduct : integer;
    CodigoProduto : Integer;
    procedure LimparTotais;
    procedure getConsignaByCustomer;
    procedure getConsignaIN;
    procedure getConsignaOUT;
    procedure getProductBalance;
    procedure getProductByCustomer;
    //Operações de consignação - Adiciona
    procedure getHeadConsignmentAdd;
    procedure getListConsignaAdd(par: String);
    procedure FillListConsignaAdd(ListObj : TCollSplOrderConsignmentOperation);

    procedure getHeadITemsConsignmentAdd;
    procedure getListITemsConsignmentAdd(AItem: TListViewItem);
    procedure FillListItemsConsignmentAdd(ListObj : TCollSplOrderConsignmentItems);

    procedure getAddItem(AItem: TListViewItem);
    procedure CleanAddItemSelectedProduto;
    procedure SetPriceAddItemSelectedProduto(IdProduct:Integer);

    //Operações de consignação - Remove
    procedure getHeadConsignmentRmv;
    procedure getListConsignaRmv(par: String);
    procedure FillListConsignaRmv(ListObj : TCollSplOrderConsignmentOperation);

    procedure getHeadITemsConsignmentRmvSale;
    procedure getListITemsConsignmentRmvSale(AItem: TListViewItem);
    procedure FillListItemsConsignmentRmvSale(ListObj : TCollSplOrderConsignmentItems);

    procedure getHeadITemsConsignmentRmvDevo;
    procedure getListITemsConsignmentRmvDevo(AItem: TListViewItem);
    procedure FillListItemsConsignmentRmvDevo(ListObj : TCollSplOrderConsignmentItems);

    procedure getHeadITemsConsignmentRmvBalance;
    procedure getListITemsConsignmentRmvBalance(AItem: TListViewItem);
    procedure FillListItemsConsignmentRmvBalance(ListObj : TCollSplOrderConsignmentItems);

    procedure getHeadITemsConsignmentProductBalance;
    procedure getListITemsConsignmentProductBalance(AItem: TListViewItem);
    procedure FillListItemsConsignmentProductBalance(ListObj : TCollSplOrderConsignmentItems);

    procedure getHeadITemsConsignmentProductStatement;
    procedure getListITemsConsignmentProductStatement(AItem: TListViewItem);
    procedure FillListItemsConsignmentProductStatement(ListObj : TCollSplOrderConsignmentItemsStatement);

    function validatecallinsItem(pValor : REal):Boolean;
    function validateaddOrderItem:Boolean;
    procedure callinsItem(sender:TObject);
    procedure addOrderItem;
    procedure ediOrderItem;
    procedure Lsv_remove_balance_itemsClick(Sender: TObject);
    procedure Sb_remove_balance_items_backClick(Sender: TObject);
    procedure Sb_remove_list_backClick(Sender: TObject);
    procedure Sb_remove_list_newClick(Sender: TObject);
    procedure totalizer_Remove;
    procedure totalizer_closure;
    procedure SpeedButton4Click(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure FillListItemsConsignmentBalance(
      ListObj: TCollSplOrderConsignmentItems);
    procedure getHeadITemsConsignmentBalance;
    procedure getListITemsConsignmentBalance(AItem: TListViewItem);

    function validateClosure:Boolean;
    function ValidaImprimeResumo:Boolean;
    procedure ImprimeResumo;

    procedure ShowAttachRMVReceive(Item:Integer);
  protected
    procedure InitVariable;Override;
    procedure SetVariable;Override;
    procedure FormatScreen;Override;
    procedure ShowData;
    procedure ShowNoData;
    function validateCustomer:Boolean;
    function validateRetirada:Boolean;
    function validateSave:Boolean;
    procedure save;
    function validateSaveAdd:Boolean;
    procedure SaveAdd;
    procedure SaveAddITems;
    procedure SaveAddConsignment;
    procedure saveStockStatement;
    function validaRmvConfirm:Boolean;

    procedure ConsignmentToSale;
    procedure RemoveConsignmentToSale;

    procedure CashierPosting;
    procedure KickbackPosting;

    procedure saveAddOrderSale;
    procedure saveAddOrderSaleItems;
    procedure saveAddOrderSaleTotalizer;
    procedure saveAddOrderSaleBilling;

    procedure ConsignmentToStockBalance;

  public
    { Public declarations }
    OrderSale : TCtrlMobOrderSale;
    Bills : TCtrlMobFinancialBills;
    OrderConsignment : TCtrlMobORderConsignment;
  end;

var
  TasOrderConsignment: TTasOrderConsignment;

implementation

{$R *.fmx}
{$R *.LgXhdpiPh.fmx ANDROID}

procedure TTasOrderConsignment.addOrderItem;
Var
  item : TListSplOrderConsignmentItems;
Begin
  item := TListSplOrderConsignmentItems.Create;
  //aqui vai zero por que será assim que identificaremos a inserção
  item.Codigo         := 0; //OrderConsignment.MOperacoes.ListSplItems.Count + 1;
  item.Produto        := StrToIntDef(FmAddSeaProduct.Lb_cod_produto.Text,0);
  item.Descricao      := FmAddSeaProduct.Lb_desc_produto.Text;
  item.Qtde           := Sp_Qtde_add.Value;
  item.ValorUnitario  := StrToFloatDef(e_vl_unit_product.Text,0);
  item.ValorSubTotal  := item.Qtde * item.ValorUnitario;
  OrderConsignment.MOperacoes.ListSplItems.Add(item);
end;

procedure TTasOrderConsignment.Sb_rmv_confirm_cancelClick(Sender: TObject);
begin
  inherited;
  ChangeTabRmvBalanceItems.ExecuteTarget(Self);
end;

procedure TTasOrderConsignment.callinsItem(sender: TObject);
begin
  if validatecallinsItem(StrToFloatDef(TSpeedButton(Sender).Text,0)) then
  BEgin
    Lb_edit_product_cod.Text := FmAddSeaProduct.Lb_cod_produto.Text;
    Lb_edit_product_desc.Text := FmAddSeaProduct.Lb_desc_produto.Text;
    e_vl_unit_product.Text := TSpeedButton(Sender).Text;
    Sp_Qtde_add.Value := 1;
    IndiceItemPRoduct := -1;
    ChangeTabEditITems.ExecuteTarget(Self);
  end;
end;

procedure TTasOrderConsignment.Sb_rmv_confirm_okClick(Sender: TObject);
begin
  if validaRmvConfirm then
  Begin
    RemoveConsignmentToSale;
    ConsignmentToSale;
    ConsignmentToStockBalance;
    getListITemsConsignmentRmvBalance(nil);
    FillListItemsConsignmentRmvBalance( OrderConsignment.MOperacoes.ListSplItemsBalance );
    ChangeTabRmvBalanceItems.ExecuteTarget(Self);
  End;
end;

procedure TTasOrderConsignment.Sb_rmv_fechamento_confirmaClick(Sender: TObject);
begin
  if validateClosure then
  Begin
    CashierPosting;
    KickbackPosting;
    TDialogService.ShowMessage(
            Concat('A T E N Ç Ã O!',
                   Char(10),Char(13),
                   'Operação concluída com Sucesso!!'));
    getListConsignaRmv('');
    ChangeTabRmvLista.ExecuteTarget(Self);
  End;
end;

procedure TTasOrderConsignment.CashierPosting;
begin
  OrderSale.Registro.Estabelecimento  := OrderConsignment.Registro.Estabelecimento;
  OrderSale.Registro.Cliente          := OrderConsignment.Registro.Cliente;
  OrderSale.getbyDataCustomer( OrderConsignment.MOperacoes.Registro.Data);
  if OrderSale.exist then
  Begin
    with Bills.MFinancial.Registro do
    Begin
      Ordem           := OrderSale.Registro.Codigo;
      Estabelecimento := OrderSale.Registro.Estabelecimento;
      Terminal        := GbTerminal;
      Parcela         := 1;
      DataExpiracao   := OrderSale.MOrder.Registro.Data;
      TipoPagamento   := 1;
      Valor           := OrderSale.MTotalizer.Registro.ValorTotal;
      Bills.MFinancial.save;
    End;

    with Bills.Registro do
    Begin
      Ordem           := OrderSale.Registro.Codigo;
      Estabelecimento := OrderSale.Registro.Estabelecimento;
      Terminal        := GbTerminal;
      Parcela         := 1;
      PlanoContas     := 0;
      Numero          := '';
      Tipo            := 'RA';
      Situacao        := 'D';
      Situacao        := 'B';
      Operacao        := 'C';
      Fase            := 'P';
      Bills.save;
    End;

    with Bills.MPayment.Registro do
    Begin
      Ordem             := OrderSale.Registro.Codigo;
      Estabelecimento   := OrderSale.Registro.Estabelecimento;
      Terminal          := GbTerminal;
      Parcela           := 1;
      Bills.MPayment.getByKey;
      if not Bills.MPayment.exist then
      Begin
        Parcela           := 1;
        Juro              := 0;
        ValorDeMora       := 0;
        AliquotaDesconto  := 0;
        ValorPago         := OrderSale.MTotalizer.Registro.ValorTotal;
        DataDoPagamento   := Date;
        DataDaBaixa       := Date;
        Baixa             := 'S';
        PlanoContas       := 0;
        Bills.MPayment.settle;
      End;
    End;

    with Bills.MStatement.Registro do
    Begin
      Codigo            := 0;
      Estabelecimento   := OrderSale.Registro.Estabelecimento;
      Terminal          := OrderSale.Registro.Terminal;
      CodigoQuitacao    := Bills.MPayment.Registro.CodigoBaixa;
      Bills.MStatement.getBySettledCode;

      ContaCorrente     := 0;
      Data              := Date;
      HistoricoBancario := 0;
      ValorCredito      := OrderSale.MTotalizer.Registro.ValorTotal;
      ValorDebito       := 0;
      HistoricoManual   := concat('Pedido: ', OrderSale.Registro.Numero.ToString);
      TipoMovimento     := 'C';
      CodigoQuitacao    := Bills.MPayment.Registro.CodigoBaixa;
      Usuario           := GbUser;
      ValorFuturo       := 'N';
      DataOriginal      := Date;
      DocReferencia     := concat('Consig: ', DateToStr( OrderConsignment.MOperacoes.Registro.Data) );
      Conferido         := 'N';
      FormaPagamento    := OrderSale.mBilling.Registro.FormaPagamento;
      ContaCredito      := 0;
      ContaDebito       := 0;
      Bills.MStatement.SAVE;
    End;
  End;
end;

procedure TTasOrderConsignment.CleanAddItemSelectedProduto;
begin
  try
    with FmAddSeaProduct do
    Begin
      Lb_cod_produto.Text   := '0000';
      Lb_desc_produto.Text  := 'Nenhum produto selecionado';
      Sb_tab_01.Text := '0,00';
      Sb_tab_03.Text := '0,00';
      Sb_tab_04.Text := '0,00';
      Sb_tab_05.Text := '0,00';
      Sb_tab_06.Text := '0,00';
      Sb_tab_07.Text := '0,00';
    End;
  except
    on E : Exception do
          ShowMessage(E.ClassName+' error raised, with message : '+E.Message);
  end;
end;

procedure TTasOrderConsignment.ediOrderItem;
begin
  with OrderConsignment.MOperacoes.ListSplItems[IndiceItemPRoduct] do
  Begin
//    Codigo         := self.ListaOrderItems.Count + 1;
//    Produto        := StrToIntDef(Lb_cod_product_selected.Text,0);
//    Descricao      := Lb_des_product_selected.Text;
    Qtde           := Sp_Qtde_add.Value;
    ValorUnitario  := StrToFloatDef(e_vl_unit_product.Text,0);
    ValorSubTotal  := Qtde * ValorUnitario;
  end;

end;

procedure TTasOrderConsignment.E_add_list_searchChangeTracking(Sender: TObject);
begin
  inherited;
  getListConsignaAdd('');
end;

procedure TTasOrderConsignment.E_rmv_fechamento_vl_recebidoChange(
  Sender: TObject);
begin
  inherited;
  totalizer_closure;
end;

procedure TTasOrderConsignment.FillListConsignaAdd(
  ListObj: TCollSplOrderConsignmentOperation);
Var
  I : Integer;
  LcLVI : TListViewItem;
begin
  //Desabilita o Botão
  Try
    Lsv_add_lista.Items.Clear;
    getHeadConsignmentAdd;
    Lsv_add_lista.BeginUpdate;
    for I := 0 to ( ListObj.Count - 1) do
    Begin
      LcLVI := Lsv_add_lista.Items.Add;
      LcLVI.Text                  := ListObj[I].Data;
      LcLVI.Data['DataOperacao']  := concat('Data : ', ListObj[I].Data);
      LcLVI.Data['quantity']      := concat('Qtde Produtos : ', ListObj[I].Qtde);
      LcLVI.Data['soma']          := concat('Valor Produtos : ', ListObj[I].Valor);
    End;
  Finally
    Lsv_add_lista.EndUpdate;
  End;
end;

procedure TTasOrderConsignment.FillListConsignaRmv(
  ListObj: TCollSplOrderConsignmentOperation);
Var
  I : Integer;
  LcLVI : TListViewItem;
  NomeArquivo : String;
  LcAlbum : String;
  LcPAth : String;
begin
  //Desabilita o Botão
  Try
    Lsv_rmv_lista.Items.Clear;
    getHeadConsignmentRmv;
    Lsv_rmv_lista.BeginUpdate;
    for I := 0 to ( ListObj.Count - 1) do
    Begin
      LcLVI := Lsv_rmv_lista.Items.Add;
      LcLVI.Text                  := ListObj[I].Data;
      LcLVI.Data['DataOperacao']  := concat('Data : ', ListObj[I].Data);
      LcLVI.Data['quantity']      := concat('Qtde Produtos : ', ListObj[I].Qtde);
      LcLVI.Data['soma']          := concat('Valor Produtos : ', ListObj[I].Valor);

      LcAlbum           := 'tb_order_consignment_operation';
      NomeArquivo     :=  concat(
                              MD5String(concat(
                                LcAlbum,
                                ListObj[I].Estabelecimento.ToString,
                                ListObj[I].Terminal.ToString,
                                ListObj[I].Ordem.ToString,
                                ListObj[I].Data
                                )),
                                '.png'
                          );
      LcPAth := System.IOUtils.TPath.Combine(System.IOUtils.tpath.GetPicturesPath,NomeArquivo);
      if FileExists(LcPAth) then
        LcLVI.Data['imgAttachReceive']    := 1
      else
        LcLVI.Data['imgAttachReceive']    := -1
    End;
  Finally
    Lsv_rmv_lista.EndUpdate;
  End;

end;

procedure TTasOrderConsignment.FillListItemsConsignmentAdd(
  ListObj: TCollSplOrderConsignmentItems);
Var
  I : Integer;
  LcLVI : TListViewItem;
  LcStrJSon : String;
  LcValor : Real;
begin
  //Desabilita o Botão
  Try
    Lsv_add_items.Items.Clear;
    getHeadITemsConsignmentAdd;
    Lsv_add_items.BeginUpdate;
    LcValor := 0;
    for I := 0 to ( ListObj.Count - 1) do
    Begin
      LcLVI := Lsv_add_items.Items.Add;
      LcLVI.Text                  := ListObj[I].Codigo.ToString;
      //Cuidar que a sequencia na tela e sequencia no banco são diferentes por que temos um unico pedido com ~sequencia difeentes por data
      LcLVI.Data['codigo']        := StrZero(I + 1,3,0);//StrZero(ListObj[I].Codigo,3,0);
      LcLVI.Data['produto']       := concat(StrZero(ListObj[I].Produto,3,0),' - ', ListObj[I].Descricao);
      LcLVI.Data['quantidade']    := FloatToStrF(ListObj[I].Qtde,ffNumber,10,2);
      LcLVI.Data['vezes']         := 'X';
      LcLVI.Data['valorunitario'] := FloatToStrF(ListObj[I].ValorUnitario,ffNumber,10,2);
      LcLVI.Data['igual']         := '=';
      LcLVI.Data['valortotal']    := FloatToStrF(ListObj[I].ValorSubTotal,ffNumber,10,2);
      LcValor := LcValor + ListObj[I].ValorSubTotal;
    End;
    //Totalizadores
    Lb_add_items_subtotal_value.Text := concat('Valor total dos itens: R$ ',FloatToStrF(LcValor,ffNumber,10,2));

  Finally
    Lsv_add_items.EndUpdate;
  End;
end;

procedure TTasOrderConsignment.FillListItemsConsignmentBalance(
  ListObj: TCollSplOrderConsignmentItems);
begin

end;

procedure TTasOrderConsignment.FillListItemsConsignmentProductBalance(
  ListObj: TCollSplOrderConsignmentItems);
Var
  I : Integer;
  LcLVI : TListViewItem;
  LcStrJSon : String;
  LcValor : Real;
begin
  //Desabilita o Botão
  Try
    Lsv_product_balance.Items.Clear;
    getHeadITemsConsignmentProductBalance;
    Lsv_product_balance.BeginUpdate;
    LcValor := 0;
    for I := 0 to ( ListObj.Count - 1) do
    Begin
      LcLVI := Lsv_product_balance.Items.Add;
      LcLVI.Text                  := ListObj[I].Produto.ToString;
      //Cuidar que a sequencia na tela e sequencia no banco são diferentes por que temos um unico pedido com ~sequencia difeentes por data
      LcLVI.Data['codigo']        := StrZero(I + 1,3,0);//StrZero(ListObj[I].Codigo,3,0);
      LcLVI.Data['produto']       := concat(StrZero(ListObj[I].Produto,3,0),' - ', ListObj[I].Descricao);
      LcLVI.Data['quantidade']    := FloatToStrF(ListObj[I].Qtde,ffNumber,10,2);
      LcLVI.Data['vezes']         := 'X';
      LcLVI.Data['valorunitario'] := FloatToStrF(ListObj[I].ValorUnitario,ffNumber,10,2);
      LcLVI.Data['igual']         := '=';
      LcLVI.Data['valortotal']    := FloatToStrF(ListObj[I].ValorSubTotal,ffNumber,10,2);
      LcValor := LcValor + ListObj[I].ValorSubTotal;
    End;

  Finally
    Lsv_product_balance.EndUpdate;
  End;


end;

procedure TTasOrderConsignment.FillListItemsConsignmentProductStatement(
  ListObj: TCollSplOrderConsignmentItemsStatement);
Var
  I : Integer;
  LcLVI : TListViewItem;
  LcStrJSon : String;
  LcValor : Real;
begin
  //Desabilita o Botão
  Try
    Lsv_product_statement.Items.Clear;
    getHeadITemsConsignmentProductStatement;
    Lsv_product_statement.BeginUpdate;
    LcValor := 0;
    Lb_product_statement_Desc.Text := concat(StrZero(ListObj[0].Produto,3,0),' - ', ListObj[0].Descricao);
    for I := 0 to ( ListObj.Count - 1) do
    Begin
      LcLVI := Lsv_product_statement.Items.Add;
      LcLVI.Text                  := ListObj[I].Produto.ToString;
      //Cuidar que a sequencia na tela e sequencia no banco são diferentes por que temos um unico pedido com ~sequencia difeentes por data
      LcLVI.Data['DataOperacao']  := ListObj[I].Data;
      if ( ListObj[I].Tipo = 'EC' ) then
        LcLVI.Data['Tipo']          := 'Entrada '
      else
        if ( ListObj[I].Tipo = 'SV' ) then
          LcLVI.Data['Tipo']        := 'Saida - Venda '
        else
          LcLVI.Data['Tipo']        := 'Saida - Devolução ';
      LcLVI.Data['quantidade']    := FloatToStrF(ListObj[I].Qtde,ffNumber,10,2);
      LcLVI.Data['vezes']         := 'X';
      LcLVI.Data['valorunitario'] := FloatToStrF(ListObj[I].ValorUnitario,ffNumber,10,2);
      LcLVI.Data['igual']         := '=';
      LcLVI.Data['valortotal']    := FloatToStrF(ListObj[I].ValorSubTotal,ffNumber,10,2);
      LcValor := LcValor + ListObj[I].ValorSubTotal;
    End;

  Finally
    Lsv_product_balance.EndUpdate;
  End;



end;

procedure TTasOrderConsignment.FillListItemsConsignmentRmvBalance(
  ListObj: TCollSplOrderConsignmentItems);
Var
  I : Integer;
  LcLVI : TListViewItem;
  LcStrJSon : String;
  LcValor : Real;
begin
  //Desabilita o Botão
  Try
    Lsv_rmv_balance_items.Items.Clear;
    getHeadITemsConsignmentRmvBalance;
    Lsv_rmv_balance_items.BeginUpdate;
    LcValor := 0;
    for I := 0 to ( ListObj.Count - 1) do
    Begin
      LcLVI := Lsv_rmv_balance_items.Items.Add;
      LcLVI.Text                  := ListObj[I].Produto.ToString;
      //Cuidar que a sequencia na tela e sequencia no banco são diferentes por que temos um unico pedido com ~sequencia difeentes por data
      LcLVI.Data['codigo']        := StrZero(I + 1,3,0);//StrZero(ListObj[I].Codigo,3,0);
      LcLVI.Data['produto']       := concat(StrZero(ListObj[I].Produto,3,0),' - ', ListObj[I].Descricao);
      LcLVI.Data['quantidade']    := FloatToStrF(ListObj[I].Qtde,ffNumber,10,2);
      LcLVI.Data['vezes']         := 'X';
      LcLVI.Data['valorunitario'] := FloatToStrF(ListObj[I].ValorUnitario,ffNumber,10,2);
      LcLVI.Data['igual']         := '=';
      LcLVI.Data['valortotal']    := FloatToStrF(ListObj[I].ValorSubTotal,ffNumber,10,2);
      LcValor := LcValor + ListObj[I].ValorSubTotal;
    End;

  Finally
    Lsv_rmv_balance_items.EndUpdate;
  End;

end;

procedure TTasOrderConsignment.FillListItemsConsignmentRmvDevo(
  ListObj: TCollSplOrderConsignmentItems);
Var
  I : Integer;
  LcLVI : TListViewItem;
  LcStrJSon : String;
  LcValor : Real;
begin
  //Desabilita o Botão
  Try
    Lsv_rmv_lista_itens_devo.Items.Clear;
    getHeadITemsConsignmentRmvDevo;
    Lsv_rmv_lista_itens_devo.BeginUpdate;
    LcValor := 0;
    for I := 0 to ( ListObj.Count - 1) do
    Begin
      LcLVI := Lsv_rmv_lista_itens_devo.Items.Add;
      LcLVI.Text                  := ListObj[I].Codigo.ToString;
      //Cuidar que a sequencia na tela e sequencia no banco são diferentes por que temos um unico pedido com ~sequencia difeentes por data
      LcLVI.Data['codigo']        := StrZero(I + 1,3,0);//StrZero(ListObj[I].Codigo,3,0);
      LcLVI.Data['produto']       := concat(StrZero(ListObj[I].Produto,3,0),' - ', ListObj[I].Descricao);
      LcLVI.Data['quantidade']    := FloatToStrF(ListObj[I].Qtde,ffNumber,10,2);
      LcLVI.Data['vezes']         := 'X';
      LcLVI.Data['valorunitario'] := FloatToStrF(ListObj[I].ValorUnitario,ffNumber,10,2);
      LcLVI.Data['igual']         := '=';
      LcLVI.Data['valortotal']    := FloatToStrF(ListObj[I].ValorSubTotal,ffNumber,10,2);
      LcValor := LcValor + ListObj[I].ValorSubTotal;
    End;
    //Totalizadores
    Lb_rmv_items_devo_subtotal_value.Text := concat('Valor total dos itens: R$ ',FloatToStrF(LcValor,ffNumber,10,2));

  Finally
    Lsv_rmv_lista_itens_devo.EndUpdate;
  End;


end;

procedure TTasOrderConsignment.FillListItemsConsignmentRmvSale(
  ListObj: TCollSplOrderConsignmentItems);
Var
  I : Integer;
  LcLVI : TListViewItem;
  LcStrJSon : String;
  LcValor : Real;
begin
  //Desabilita o Botão
  Try
    Lsv_rmv_lista_itens_sale.Items.Clear;
    getHeadITemsConsignmentRmvSale;
    Lsv_rmv_lista_itens_sale.BeginUpdate;
    LcValor := 0;
    for I := 0 to ( ListObj.Count - 1) do
    Begin
      LcLVI := Lsv_rmv_lista_itens_sale.Items.Add;
      LcLVI.Text                  := ListObj[I].Codigo.ToString;
      //Cuidar que a sequencia na tela e sequencia no banco são diferentes por que temos um unico pedido com ~sequencia difeentes por data
      LcLVI.Data['codigo']        := StrZero(I + 1,3,0);//StrZero(ListObj[I].Codigo,3,0);
      LcLVI.Data['produto']       := concat(StrZero(ListObj[I].Produto,3,0),' - ', ListObj[I].Descricao);
      LcLVI.Data['quantidade']    := FloatToStrF(ListObj[I].Qtde,ffNumber,10,2);
      LcLVI.Data['vezes']         := 'X';
      LcLVI.Data['valorunitario'] := FloatToStrF(ListObj[I].ValorUnitario,ffNumber,10,2);
      LcLVI.Data['igual']         := '=';
      LcLVI.Data['valortotal']    := FloatToStrF(ListObj[I].ValorSubTotal,ffNumber,10,2);
      LcValor := LcValor + ListObj[I].ValorSubTotal;
    End;
    //Totalizadores
    Lb_rmv_items_sale_subtotal_value.Text := concat('Valor total dos itens: R$ ',FloatToStrF(LcValor,ffNumber,10,2));
    E_rmv_fechamento_vl_pedido.Text       := FloatToStrF(LcValor,ffNumber,10,2);

  Finally
    Lsv_rmv_lista_itens_sale.EndUpdate;
  End;

end;

procedure TTasOrderConsignment.FmAddSeaProductE_buscaChangeTracking(
  Sender: TObject);
begin
  inherited;
  FmAddSeaProduct.getlist('');
end;

procedure TTasOrderConsignment.FmAddSeaProductlsv_SearchItemClick(
  const Sender: TObject; const AItem: TListViewItem);
begin
  getAddItem(AItem);
end;

procedure TTasOrderConsignment.FmAddSeaProductSb_back_product_callbackClick(
  Sender: TObject);
begin
  getListITemsConsignmentAdd(nil);
  FillListItemsConsignmentAdd( OrderConsignment.MOperacoes.ListSplItems );
  ChangeTabAddListaItems.ExecuteTarget(Self);
end;

procedure TTasOrderConsignment.FmAddSeaProductSb_searchClick(Sender: TObject);
Var
  I :Integer;
begin
  FmAddSeaProduct.Ly_quick_search.Visible := True;
  FmAddSeaProduct.Ly_list_titlle.Visible := False;
  FmAddSeaProduct.E_busca.SetFocus;
  FmAddSeaProduct.getlist('');
end;

procedure TTasOrderConsignment.FmAddSeaProductSb_tab_01Click(Sender: TObject);
begin
  inherited;
  callinsItem(sender);
end;

procedure TTasOrderConsignment.FmAddSeaProductSb_tab_03Click(Sender: TObject);
begin
  inherited;
  callinsItem(sender);
end;

procedure TTasOrderConsignment.FmAddSeaProductSb_tab_04Click(Sender: TObject);
begin
  inherited;
  callinsItem(sender);
end;

procedure TTasOrderConsignment.FmAddSeaProductSb_tab_05Click(Sender: TObject);
begin
  inherited;
  callinsItem(sender);
end;

procedure TTasOrderConsignment.FmAddSeaProductSb_tab_06Click(Sender: TObject);
begin
  inherited;
  callinsItem(sender);
end;

procedure TTasOrderConsignment.FmAddSeaProductSb_tab_07Click(Sender: TObject);
begin
  inherited;
  callinsItem(sender);
end;

procedure TTasOrderConsignment.FormatScreen;
begin
  inherited;
  pg_manager.TabPosition := TTabPosition.None;
  pg_manager.ActiveTab := tbs_manager;

  pg_add.TabPosition := TTabPosition.None;
  pg_add.ActiveTab := tbs_add_lista;

  pg_Rmv.TabPosition := TTabPosition.None;
  pg_Rmv.ActiveTab := tbs_rmv_lista;

  pg_product.TabPosition := TTabPosition.None;
  pg_product.ActiveTab := tbs_product_balance;

end;

procedure TTasOrderConsignment.FormCreate(Sender: TObject);
begin
  InitVariable;
end;

procedure TTasOrderConsignment.FormShow(Sender: TObject);
begin
  setImages;
  FormatScreen; //- estou ativando apos a criação do form
  SetVariable;
end;

procedure TTasOrderConsignment.getAddItem(AItem: TListViewItem);
Var
  LcLVI : TListViewItem;
  LcCodID : Integer;
begin
  LcLVI := FmAddSeaProduct.lsv_Search.Items[AItem.Index];
  LcCodID := StrToInt(AItem.Text);
  if LcCodID > 0 then
  Begin
    FmAddSeaProduct.Lb_cod_produto.Text   := LcLVI.Data['Codigo'].AsString;
    FmAddSeaProduct.Lb_desc_produto.Text  := LcLVI.Data['Produto'].AsString;
    SetPriceAddItemSelectedProduto(LcCodID);
  end
  else
  Begin
    CleanAddItemSelectedProduto;
  End;

end;

procedure TTasOrderConsignment.getConsignaByCustomer;
begin
  OrderConsignment.GetByCustomer;
  OrderConsignment.MOrder.Registro.Codigo          := OrderConsignment.Registro.Codigo;
  OrderConsignment.MOrder.Registro.Estabelecimento := UMM.GInstitution.Registro.Codigo;
  OrderConsignment.MOrder.Registro.Terminal        := OrderConsignment.Registro.Terminal;
  OrderConsignment.MOrder.getByKey;
end;

procedure TTasOrderConsignment.getConsignaIN;
Var
  LcQtde : Integer;
begin
  OrderConsignment.MOperacoes.Registro.Estabelecimento := UMM.GInstitution.Registro.Codigo;
  OrderConsignment.MOperacoes.Registro.Ordem := OrderConsignment.Registro.Codigo;
  OrderConsignment.MOperacoes.Registro.Data := 0;
  OrderConsignment.MOperacoes.Registro.Tipo := 'EC';//[E][C]  - Entrada Consignação
  LcQtde := OrderConsignment.MOperacoes.getCountByKind;
  E_Qtde_Entrada.Text := concat('Seleciondo(s) : ',IntToStr(LcQtde));
end;

procedure TTasOrderConsignment.getListITemsConsignmentAdd(AItem: TListViewItem);
begin
  //Foram setados em etapa anterior
  //OrderConsignment.MOperacoes.Registro.Ordem :=
  //OrderConsignment.MOperacoes.Registro.Data :=
  OrderConsignment.MOperacoes.Registro.Estabelecimento := UMM.GInstitution.Registro.Codigo;
  OrderConsignment.MOperacoes.Registro.Tipo := 'EC';
  OrderConsignment.MOperacoes.getListSplItems(getParameter(''));

end;

procedure TTasOrderConsignment.getListITemsConsignmentBalance(
  AItem: TListViewItem);
begin

end;

procedure TTasOrderConsignment.getListITemsConsignmentProductBalance(
  AItem: TListViewItem);
begin
  //por se tratar do saldo de produtos não há filtros além do codigo da consignação
  //Foram setados em etapa anterior
  //OrderConsignment.MOperacoes.Registro.Ordem := OrderConsignment.Registro.Codigo;
  //OrderConsignment.MOperacoes.Registro.Data :=
  //OrderConsignment.MOperacoes.Registro.Tipo := '';
  OrderConsignment.MOperacoes.Registro.Estabelecimento := UMM.GInstitution.Registro.Codigo;
  OrderConsignment.MOperacoes.getListSplItemsBalance(getParameter(''));
end;

procedure TTasOrderConsignment.getListITemsConsignmentProductStatement(
  AItem: TListViewItem);
begin
  //por se tratar do saldo de produtos não há filtros além do codigo da consignação
  //Foram setados em etapa anterior
  OrderConsignment.MOperacoes.Registro.Estabelecimento := UMM.GInstitution.Registro.Codigo;
  OrderConsignment.MOperacoes.Registro.Ordem := OrderConsignment.Registro.Codigo;
  //OrderConsignment.MOperacoes.Registro.Data :=
  //OrderConsignment.MOperacoes.Registro.Tipo := '';
  OrderConsignment.MOperacoes.getListSplItemsStatement(StrToIntDef( AItem.Text,0));

end;

procedure TTasOrderConsignment.getListITemsConsignmentRmvBalance(
  AItem: TListViewItem);
begin
  //por se tratar do saldo de produtos não há filtros além do codigo da consignação
  //Foram setados em etapa anterior
  OrderConsignment.MOperacoes.Registro.Estabelecimento := OrderConsignment.Registro.Estabelecimento;
  OrderConsignment.MOperacoes.Registro.Ordem := OrderConsignment.Registro.Codigo;
  OrderConsignment.MOperacoes.Registro.Data := 0;
  OrderConsignment.MOperacoes.Registro.Tipo := '';//para saldo fica
  OrderConsignment.MOperacoes.getListSplItemsBalance(getParameter(''));
end;

procedure TTasOrderConsignment.getListITemsConsignmentRmvDevo(
  AItem: TListViewItem);
begin
  //Foram setados em etapa anterior
  //OrderConsignment.MOperacoes.Registro.Ordem := OrderConsignment.Registro.Codigo;
  //OrderConsignment.MOperacoes.Registro.Data :=
  OrderConsignment.MOperacoes.Registro.Estabelecimento := UMM.GInstitution.Registro.Codigo;
  OrderConsignment.MOperacoes.Registro.Tipo := 'SD';
  OrderConsignment.MOperacoes.getListSplItems(getParameter(''));

end;

procedure TTasOrderConsignment.getListITemsConsignmentRmvSale(AItem: TListViewItem);
begin
  //Foram setados em etapa anterior
  //OrderConsignment.MOperacoes.Registro.Ordem := OrderConsignment.Registro.Codigo;
  //OrderConsignment.MOperacoes.Registro.Data :=
  OrderConsignment.MOperacoes.Registro.Estabelecimento := UMM.GInstitution.Registro.Codigo;
  OrderConsignment.MOperacoes.Registro.Tipo := 'SV';
  OrderConsignment.MOperacoes.getListSplItems(getParameter(''));

end;

procedure TTasOrderConsignment.getConsignaOUT;
Var
  LcQtde : Integer;
begin
  LcQtde := 0;
  OrderConsignment.MOperacoes.Registro.Ordem := OrderConsignment.Registro.Codigo;
  OrderConsignment.MOperacoes.Registro.Data := 0;
  OrderConsignment.MOperacoes.Registro.Tipo := 'S';//[S][V]/[D] - Saida Venda / Saida devolução
  LcQtde := OrderConsignment.MOperacoes.getCountByKind;
  E_Qtde_Saida.Text := concat('Seleciondo(s) : ',IntToStr(LcQtde));

end;

procedure TTasOrderConsignment.getHeadConsignmentAdd;
Var
  I : Integer;
  LcLVI : TListViewItem;
begin
  //Cabeçalho
  Lsv_add_lista.Items.Clear;
  LcLVI := Lsv_add_lista.Items.Add;
  LcLVI.Height := 50;
  LcLVI.Text := concat('Data da consignação',#13,#10,
                       'Totalizadores da consignação'
                );
  LcLVI.Purpose := TListItemPurpose.Header;

end;

procedure TTasOrderConsignment.getHeadConsignmentRmv;
Var
  I : Integer;
  LcLVI : TListViewItem;
begin
  //Cabeçalho
  Lsv_rmv_lista.Items.Clear;
  LcLVI := Lsv_rmv_lista.Items.Add;
  LcLVI.Height := 50;
  LcLVI.Text := concat('Data da consignação',#13,#10,
                       'Totalizadores da consignação'
                );
  LcLVI.Purpose := TListItemPurpose.Header;

end;

procedure TTasOrderConsignment.getHeadITemsConsignmentAdd;
Var
  I : Integer;
  LcLVI : TListViewItem;
begin
  //Cabeçalho
  Lsv_add_items.Items.Clear;
  LcLVI := Lsv_add_items.Items.Add;
  LcLVI.Height := 50;
  LcLVI.Text := concat('Item / Código / Descrição',#13,#10,
                       'Qtde X Valor Unitário = Valor Subtotal'
                );
  LcLVI.Purpose := TListItemPurpose.Header;
end;

procedure TTasOrderConsignment.getHeadITemsConsignmentBalance;
begin

end;

procedure TTasOrderConsignment.getHeadITemsConsignmentProductBalance;
Var
  I : Integer;
  LcLVI : TListViewItem;
begin
  //Cabeçalho
  Lsv_product_balance.items.Clear;
  LcLVI := Lsv_product_balance.Items.Add;
  LcLVI.Height := 50;
  LcLVI.Text := concat('Item / Código / Descrição',#13,#10,
                       'Qtde X Valor Unitário = Valor Subtotal'
  );
  LcLVI.Purpose := TListItemPurpose.Header;
end;

procedure TTasOrderConsignment.getHeadITemsConsignmentProductStatement;
Var
  I : Integer;
  LcLVI : TListViewItem;
begin
  //Cabeçalho
  Lsv_product_statement.items.Clear;
  LcLVI := Lsv_product_statement.Items.Add;
  LcLVI.Height := 50;
  LcLVI.Text := concat('Data da Operação / Tipo de Operação',#13,#10,
                       'Qtde X Valor Unitário = Valor Subtotal'
  );
  LcLVI.Purpose := TListItemPurpose.Header;
end;

procedure TTasOrderConsignment.getHeadITemsConsignmentRmvBalance;
Var
  I : Integer;
  LcLVI : TListViewItem;
begin
  //Cabeçalho
  Lsv_rmv_balance_items.items.Clear;
  LcLVI := Lsv_rmv_balance_items.Items.Add;
  LcLVI.Height := 50;
  LcLVI.Text := concat('Item / Código / Descrição',#13,#10,
                       'Qtde X Valor Unitário = Valor Subtotal'
                );
  LcLVI.Purpose := TListItemPurpose.Header;

end;

procedure TTasOrderConsignment.getHeadITemsConsignmentRmvDevo;
Var
  I : Integer;
  LcLVI : TListViewItem;
begin
  //Cabeçalho
  Lsv_rmv_lista_itens_devo.items.Clear;
  LcLVI := Lsv_rmv_lista_itens_devo.Items.Add;
  LcLVI.Height := 50;
  LcLVI.Text := concat('Item / Código / Descrição',#13,#10,
                       'Qtde X Valor Unitário = Valor Subtotal'
                );
  LcLVI.Purpose := TListItemPurpose.Header;
end;

procedure TTasOrderConsignment.getHeadITemsConsignmentRmvSale;
Var
  I : Integer;
  LcLVI : TListViewItem;
begin
  //Cabeçalho
  Lsv_rmv_lista_itens_sale.Items.Clear;
  LcLVI := Lsv_rmv_lista_itens_sale.Items.Add;
  LcLVI.Height := 50;
  LcLVI.Text := concat('Item / Código / Descrição',#13,#10,
                       'Qtde X Valor Unitário = Valor Subtotal'
                );
  LcLVI.Purpose := TListItemPurpose.Header;

end;

procedure TTasOrderConsignment.getListConsignaAdd(par: String);
begin
  inherited;
  OrderConsignment.orderby := ' order by ord.updated_at desc ';
  OrderConsignment.MOperacoes.Registro.Estabelecimento := UMM.GInstitution.Registro.Codigo;
  OrderConsignment.MOperacoes.Registro.Ordem := OrderConsignment.Registro.Codigo;
  OrderConsignment.MOperacoes.Registro.Tipo := 'EC';
  OrderConsignment.MOperacoes.Registro.Data := 0;
  OrderConsignment.MOperacoes.getListSpl(getParameter(E_add_list_search.Text));
  FillListConsignaAdd( OrderConsignment.MOperacoes.ListSpl );
end;

procedure TTasOrderConsignment.getListConsignaRmv(par: String);
begin
  inherited;
  OrderConsignment.orderby := ' order by ord.updated_at desc ';
  OrderConsignment.MOperacoes.Registro.Estabelecimento := UMM.GInstitution.Registro.Codigo;
  OrderConsignment.MOperacoes.Registro.Ordem := OrderConsignment.Registro.Codigo;
  OrderConsignment.MOperacoes.Registro.Tipo := 'S%';
  OrderConsignment.MOperacoes.Registro.Data := 0;
  OrderConsignment.MOperacoes.getListSpl(getParameter(E_Rmv_list_search.Text));
  FillListConsignaRmv( OrderConsignment.MOperacoes.ListSpl );
end;

procedure TTasOrderConsignment.getProductBalance;
begin

end;

procedure TTasOrderConsignment.getProductByCustomer;
Var
  LcQtde : REal;
  LCValue : Real;
begin
  LcQtde := 0;
  OrderConsignment.MOperacoes.Registro.Ordem := OrderConsignment.Registro.Codigo;
  OrderConsignment.MOperacoes.Registro.Data := 0;
  OrderConsignment.MOperacoes.Registro.Tipo := '';
  LcQtde := OrderConsignment.MOperacoes.getBalance;

  E_Qtde_product.Text := concat('Seleciondo(s) : ',FloatToStr(LcQtde));

  LCValue := OrderConsignment.MOperacoes.getTotalValue;

  E_Value_product.Text := concat('Valor Total Consignado : R$ ',FloatToStrF(LCValue,ffFixed,10,2));
end;


procedure TTasOrderConsignment.ImprimeResumo;
var
  LcSyncThread : TThread;
  lDevice: TBluetoothDevice;
begin
  LcSyncThread :=
  TThread.CreateAnonymousThread (
  procedure begin
    TThread.Synchronize (TThread.CurrentThread,
    procedure
    begin
      UMM.Print.Summaryconsignment(OrderConsignment);
     end);
  end);
  Try
    LcSyncThread.FreeOnTerminate := true;
    LcSyncThread.start;
  except
    on E: Exception do
      ShowMessage(E.ClassName+'Um erro foi encontrado: '+E.Message);
  end;
end;

procedure TTasOrderConsignment.im_addClick(Sender: TObject);
begin
  if validateCustomer then
  Begin
    getListConsignaAdd('');
    ChangeTabAdd.ExecuteTarget(Self);
  End;
end;

procedure TTasOrderConsignment.im_customerClick(Sender: TObject);
var
  Form : TSeaCustomer;
begin
  Form := TSeaCustomer.Create(Self);
  Form.FmSeaCustomer.Sb_back_callback.Visible := tRUE;
  Form.ShowModal(
      procedure(ModalResult : TModalResult)
      begin
        LimparTotais;
        if ModalResult = mrOk then
        Begin
          Self.OrderConsignment.Registro.Cliente := form.CodigoCliente;
          self.E_customer_name.Text := Form.NameCliente;
          self.E_customer_nick.Text := Form.NickCliente;
          Self.getConsignaByCustomer;
          Self.getConsignaIN;
          Self.getConsignaOUT;
          Self.getProductByCustomer;

        End;
        Form := nil;
      end);
end;

procedure TTasOrderConsignment.im_ItensClick(Sender: TObject);
begin
  if validateCustomer then
  Begin
    getListITemsConsignmentProductBalance(nil);
    FillListItemsConsignmentProductBalance( OrderConsignment.MOperacoes.ListSplItemsBalance );
    ChangeTabProduct.ExecuteTarget(Self);
  End;
end;

procedure TTasOrderConsignment.im_rmvClick(Sender: TObject);
begin
  inherited;
  if validateRetirada then
  Begin
    getListConsignaRmv('');
    ChangeTabRmv.ExecuteTarget(Self);
  End;
end;

procedure TTasOrderConsignment.InitVariable;
begin
  inherited;
  OrderConsignment  := TCtrlMobORderConsignment.Create(self);
  OrderSale         := TCtrlMobOrderSale.Create(self);
  Bills             := TCtrlMobFinancialBills.Create(self);
end;

procedure TTasOrderConsignment.KickbackPosting;
Var
  I : Integer;
begin
  OrderSale.Registro.Estabelecimento  := OrderConsignment.Registro.Estabelecimento;
  OrderSale.Registro.Cliente          := OrderConsignment.Registro.Cliente;
  OrderSale.getbyDataCustomer( OrderConsignment.MOperacoes.Registro.Data );
  if OrderSale.exist then
  Begin
    OrderSale.MItems.Registro.Estabelecimento := OrderSale.Registro.Estabelecimento;
    OrderSale.MItems.Registro.Terminal        := OrderSale.Registro.Terminal;
    OrderSale.MItems.Registro.Ordem           := OrderSale.Registro.Codigo;
    OrderSale.MItems.getList;
    for I := 0 to OrderSale.MItems.Lista.Count -1 do
    Begin
      OrderSale.MItems.ClonarObj(OrderSale.MItems.Lista[I],OrderSale.MItems.Registro);
      OrderSale.MItems.getprice;
      if OrderSale.MItems.merchandise.Product.price.Registro.Comissao >0  then
      Begin
        with OrderSale.MKickBack.Registro do
        Begin
          Estabelecimento := OrderSale.MItems.Lista[I].Estabelecimento;
          Terminal        := OrderSale.MItems.Lista[I].Terminal;
          Ordem           := OrderSale.MItems.Lista[I].Ordem;
          ItemOrdem       := OrderSale.MItems.Lista[I].Codigo;
          Parcela         := 0;
          Data            := OrderConsignment.MOperacoes.Registro.Data;
          Cliente         := OrderSale.Registro.Cliente;
          Colaborador     := OrderSale.Registro.Vendedor;
          OrderSale.MItems.getproduct;
          Historico       := concat('Pedido N: ',OrderSale.Registro.Numero.ToString,' item: ', OrderSale.MItems.merchandise.Product.Registro.Descricao);
          ValorBase       := (OrderSale.MItems.Lista[I].ValorUnitario * OrderSale.MItems.Lista[I].Quantidade);
          OrderSale.MItems.getprice;
          Aliquota        := OrderSale.MItems.merchandise.Product.price.Registro.Comissao;
          Valor           := (ValorBase * Aliquota ) / 100;
        End;
        OrderSale.MKickBack.save;
      End;
    End;

  End;
end;

procedure TTasOrderConsignment.LimparTotais;
begin
  OrderConsignment.clear;
  OrderConsignment.MCustomer.clear;
  E_Qtde_Entrada.Text := concat('Seleciondo(s) : 0');
  E_Qtde_Saida.Text   := concat('Seleciondo(s) : 0');
  E_Qtde_product.Text := concat('Seleciondo(s) : 0');
  E_Value_product.Text := concat('Valor Total Consignado : R$ 0,00');
end;

procedure TTasOrderConsignment.Lsv_add_itemsUpdateObjects(const Sender: TObject;
  const AItem: TListViewItem);
Var
  item: TListItemText;
begin
  inherited;
  try
    try
     Lsv_add_items.BeginUpdate;
     item := AItem.Objects.FindObjectT<TListItemText>('produto');
     if item <> nil then
        item.Font.Size:= 12;

     item := AItem.Objects.FindObjectT<TListItemText>('quantidade');
     if item <> nil then
        item.Font.Size:= 12;

     item := AItem.Objects.FindObjectT<TListItemText>('valorunitario');
     if item <> nil then
        item.Font.Size:= 12;

     item := AItem.Objects.FindObjectT<TListItemText>('valortotal');
     if item <> nil then
        item.Font.Size:= 12;

     item := AItem.Objects.FindObjectT<TListItemText>('codigo');
     if item <> nil then
        item.Font.Size:= 12;

     item := AItem.Objects.FindObjectT<TListItemText>('vezes');
     if item <> nil then
        item.Font.Size:= 12;

     item := AItem.Objects.FindObjectT<TListItemText>('igual');
     if item <> nil then
        item.Font.Size:= 12;

    except
      on E : Exception do
            ShowMessage(E.ClassName+' error raised, with message : '+E.Message);
    end;
  finally
    Lsv_add_items.EndUpdate;
  end;

end;

procedure TTasOrderConsignment.Lsv_add_listaItemClick(const Sender: TObject;
  const AItem: TListViewItem);
begin
  inherited;
  OrderConsignment.MOperacoes.Registro.Data := StrToDateDef(AItem.Text,Date);
  if  OrderConsignment.MOperacoes.Registro.Data > 0 then
  Begin
    getListITemsConsignmentAdd(AItem);
    //Lista Visual
    FillListItemsConsignmentAdd( OrderConsignment.MOperacoes.ListSplItems );
    ChangeTabAddListaItems.ExecuteTarget(Self);
  End;

end;

procedure TTasOrderConsignment.Lsv_add_listaUpdateObjects(const Sender: TObject;
  const AItem: TListViewItem);
Var
  item: TListItemText;
begin
  inherited;
  try
    try
     Lsv_add_lista.BeginUpdate;
     item := AItem.Objects.FindObjectT<TListItemText>('DataOperacao');
     if item <> nil then
        item.Font.Size:= 12;

     item := AItem.Objects.FindObjectT<TListItemText>('quantity');
     if item <> nil then
        item.Font.Size:= 12;

     item := AItem.Objects.FindObjectT<TListItemText>('soma');
     if item <> nil then
        item.Font.Size:= 12;

    except
      on E : Exception do
            ShowMessage(E.ClassName+' error raised, with message : '+E.Message);
    end;
  finally
    Lsv_add_lista.EndUpdate;
  end;
end;

procedure TTasOrderConsignment.Lsv_product_balanceClick(Sender: TObject);
begin
  inherited;
  ChangeTabProductStatement.ExecuteTarget(Self);
end;

procedure TTasOrderConsignment.Lsv_product_balanceItemClickEx(
  const Sender: TObject; ItemIndex: Integer; const LocalClickPos: TPointF;
  const ItemObject: TListItemDrawable);
begin
  if ItemObject is TListItemAccessory then
  Begin
    getListITemsConsignmentProductStatement( Lsv_product_balance.Items[ItemIndex]);
    //Lista Visual
    FillListItemsConsignmentProductStatement( OrderConsignment.MOperacoes.ListSplItemsStatement );
    ChangeTabProductStatement.ExecuteTarget(Self);
  End;
end;

procedure TTasOrderConsignment.Lsv_remove_balance_itemsClick(Sender: TObject);
begin
  inherited;
  ChangeTabRmvConfim.ExecuteTarget(Self);
end;

procedure TTasOrderConsignment.Lsv_rmv_balance_itemsItemClick(
  const Sender: TObject; const AItem: TListViewItem);
Var
  LcLVI : TListViewItem;
  LcCodID : Integer;
  LcMax : Integer;
begin
  LcLVI := Lsv_rmv_balance_items.Items[AItem.Index];
  LcCodID := StrToInt(AItem.Text);
  Lb_rmv_confirm_cod_prod.Text := AItem.Text;
  Lb_rmv_confirm_desc_prod.Text := LcLVI.Data['produto'].AsString;
  Lb_rmv_confirm_vl_unit.Text :=  LcLVI.Data['valorunitario'].AsString;
  LcMax := trunc( StrToFloatDef( LcLVI.Data['quantidade'].AsString,0));

  E_rmv_saldo_consignado.Text := LcLVI.Data['quantidade'].AsString;

  Sp_rmv_contagem_local.Min   := 0;
  Sp_rmv_contagem_local.Max   := LcMax;
  Sp_rmv_contagem_local.Value := 0;
  Sp_rmv_contagem_local.Text  := '0';

  E_rmv_quantidade_venda.Text := '0';

  Sp_rmv_quantidade_devolvida.Min   := 0;
  Sp_rmv_quantidade_devolvida.Max   := LcMax ;
  Sp_rmv_quantidade_devolvida.Value := 0;
  Sp_rmv_quantidade_devolvida.Text  :='0';

  totalizer_Remove;
  ChangeTabRmvConfim.ExecuteTarget(Self);

end;

procedure TTasOrderConsignment.Lsv_rmv_balance_itemsUpdateObjects(
  const Sender: TObject; const AItem: TListViewItem);
Var
  item: TListItemText;
begin
  inherited;
  try
    try
     Lsv_rmv_balance_items.BeginUpdate;
     item := AItem.Objects.FindObjectT<TListItemText>('produto');
     if item <> nil then
        item.Font.Size:= 12;

     item := AItem.Objects.FindObjectT<TListItemText>('quantidade');
     if item <> nil then
        item.Font.Size:= 12;

     item := AItem.Objects.FindObjectT<TListItemText>('valorunitario');
     if item <> nil then
        item.Font.Size:= 12;

     item := AItem.Objects.FindObjectT<TListItemText>('valortotal');
     if item <> nil then
        item.Font.Size:= 12;

     item := AItem.Objects.FindObjectT<TListItemText>('codigo');
     if item <> nil then
        item.Font.Size:= 12;

     item := AItem.Objects.FindObjectT<TListItemText>('vezes');
     if item <> nil then
        item.Font.Size:= 12;

     item := AItem.Objects.FindObjectT<TListItemText>('igual');
     if item <> nil then
        item.Font.Size:= 12;

    except
      on E : Exception do
            ShowMessage(E.ClassName+' error raised, with message : '+E.Message);
    end;
  finally
    Lsv_rmv_balance_items.EndUpdate;
  end;

end;

procedure TTasOrderConsignment.Lsv_rmv_listaItemClickEx(const Sender: TObject;
  ItemIndex: Integer; const LocalClickPos: TPointF;
  const ItemObject: TListItemDrawable);
begin
  inherited;
  if ItemObject is TListItemImage then
  Begin
    ShowAttachRMVReceive(ItemIndex)
  End;

  if ItemObject is TListItemAccessory then
  Begin
    OrderConsignment.MOperacoes.Registro.Estabelecimento := UMM.GInstitution.Registro.Codigo;
    OrderConsignment.MOperacoes.Registro.Data := StrToDateDef(Lsv_rmv_lista.Items[ItemIndex].Text,Date);
    if  OrderConsignment.MOperacoes.Registro.Data > 0 then
    Begin
      getListITemsConsignmentRmvSale( Lsv_rmv_lista.Items[ItemIndex]);
      FillListItemsConsignmentRmvSale( OrderConsignment.MOperacoes.ListSplItems );

      getListITemsConsignmentRmvDevo( Lsv_rmv_lista.Items[ItemIndex]);
      FillListItemsConsignmentRmvDevo( OrderConsignment.MOperacoes.ListSplItems );

      ChangeTabRmvListaITems.ExecuteTarget(Self);
    End;

  End;
end;

procedure TTasOrderConsignment.Lsv_rmv_listaUpdateObjects(const Sender: TObject;
  const AItem: TListViewItem);
Var
  item: TListItemText;
begin
  inherited;
  try
    try
     Lsv_rmv_lista.BeginUpdate;
     item := AItem.Objects.FindObjectT<TListItemText>('DataOperacao');
     if item <> nil then
        item.Font.Size:= 12;

     item := AItem.Objects.FindObjectT<TListItemText>('quantity');
     if item <> nil then
        item.Font.Size:= 12;

     item := AItem.Objects.FindObjectT<TListItemText>('soma');
     if item <> nil then
        item.Font.Size:= 12;

    except
      on E : Exception do
            ShowMessage(E.ClassName+' error raised, with message : '+E.Message);
    end;
  finally
    Lsv_rmv_lista.EndUpdate;
  end;
end;

procedure TTasOrderConsignment.Lsv_rmv_lista_itens_devoUpdateObjects(
  const Sender: TObject; const AItem: TListViewItem);
Var
  item: TListItemText;
begin
  inherited;
  try
    try
     Lsv_rmv_lista_itens_devo.BeginUpdate;
     item := AItem.Objects.FindObjectT<TListItemText>('produto');
     if item <> nil then
        item.Font.Size:= 12;

     item := AItem.Objects.FindObjectT<TListItemText>('quantidade');
     if item <> nil then
        item.Font.Size:= 12;

     item := AItem.Objects.FindObjectT<TListItemText>('valorunitario');
     if item <> nil then
        item.Font.Size:= 12;

     item := AItem.Objects.FindObjectT<TListItemText>('valortotal');
     if item <> nil then
        item.Font.Size:= 12;

     item := AItem.Objects.FindObjectT<TListItemText>('codigo');
     if item <> nil then
        item.Font.Size:= 12;

     item := AItem.Objects.FindObjectT<TListItemText>('vezes');
     if item <> nil then
        item.Font.Size:= 12;

     item := AItem.Objects.FindObjectT<TListItemText>('igual');
     if item <> nil then
        item.Font.Size:= 12;

    except
      on E : Exception do
            ShowMessage(E.ClassName+' error raised, with message : '+E.Message);
    end;
  finally
    Lsv_rmv_lista_itens_devo.EndUpdate;
  end;


end;

procedure TTasOrderConsignment.Lsv_rmv_lista_itens_saleUpdateObjects(
  const Sender: TObject; const AItem: TListViewItem);
Var
  item: TListItemText;
begin
  inherited;
  try
    try
     Lsv_rmv_lista_itens_sale.BeginUpdate;
     item := AItem.Objects.FindObjectT<TListItemText>('produto');
     if item <> nil then
        item.Font.Size:= 12;

     item := AItem.Objects.FindObjectT<TListItemText>('quantidade');
     if item <> nil then
        item.Font.Size:= 12;

     item := AItem.Objects.FindObjectT<TListItemText>('valorunitario');
     if item <> nil then
        item.Font.Size:= 12;

     item := AItem.Objects.FindObjectT<TListItemText>('valortotal');
     if item <> nil then
        item.Font.Size:= 12;

     item := AItem.Objects.FindObjectT<TListItemText>('codigo');
     if item <> nil then
        item.Font.Size:= 12;

     item := AItem.Objects.FindObjectT<TListItemText>('vezes');
     if item <> nil then
        item.Font.Size:= 12;

     item := AItem.Objects.FindObjectT<TListItemText>('igual');
     if item <> nil then
        item.Font.Size:= 12;

    except
      on E : Exception do
            ShowMessage(E.ClassName+' error raised, with message : '+E.Message);
    end;
  finally
    Lsv_rmv_lista_itens_sale.EndUpdate;
  end;

end;

procedure TTasOrderConsignment.save;
Var
  I : Integer;
  LcLastID : Integer;
begin
  if OrderConsignment.MOrder.Registro.Codigo = 0 then
  Begin
    With OrderConsignment do
    Begin
      MOrder.Registro.Estabelecimento := UMM.GInstitution.Registro.Codigo;
      MOrder.Registro.Terminal := GbTerminal;
      MOrder.Registro.Data := Date;
      MOrder.Registro.Observacao := '';
      MOrder.Registro.Origem := 'A';
      MOrder.Registro.Status := 'N';
      MOrder.Registro.Usuario  := GbUser;

      MOrder.save;

      Registro.Codigo           :=  MOrder.Registro.Codigo;
      Registro.Estabelecimento  := UMM.GInstitution.Registro.Codigo;
      Registro.Terminal         := GbTerminal;
      //Registro.Cliente          := ja vem preenchido ou é setado na buca
      Registro.Vendedor         := GbSalesMan;
    End;
  End;
  //Salva mesmo sem alterar nada para que a data de alteração acerte a sincronia
  OrderConsignment.save;
end;

procedure TTasOrderConsignment.SaveAdd;
begin
  SaveAddITems;
  SaveAddConsignment;
  saveStockStatement;
end;

procedure TTasOrderConsignment.SaveAddConsignment;
begin
  with OrderConsignment.MOperacoes do
  Begin
    //Insere Registro da operação de Consignação
    Registro.ItemOrdem        := MItem.Registro.Codigo;
    Registro.Estabelecimento  := UMM.GInstitution.Registro.Codigo;
    Registro.Terminal         := GbTerminal;
    Registro.Ordem            := OrderConsignment.Registro.Codigo;
    Registro.Data             := Date;
    Registro.Tipo             := 'EC';
    OrderConsignment.MOperacoes.insert;
  End;
end;

procedure TTasOrderConsignment.SaveAddITems;
begin
  with OrderConsignment.MOperacoes do
  Begin
    //Insere o registro dos itens da consignção
    MItem.Registro.Codigo            := 0;
    MItem.Registro.Estabelecimento   := UMM.GInstitution.Registro.Codigo;
    MItem.Registro.Ordem             := OrderConsignment.Registro.Codigo;
    MItem.Registro.Terminal          := GbTerminal;
    MItem.Registro.Produto           := StrToIntDef( FmAddSeaProduct.Lb_cod_produto.Text,0);
    MItem.Registro.Estoque           := GbStock;
    MItem.Registro.TabelaPreco       := 1;
    MItem.Registro.Quantidade        := Sp_Qtde_add.Value;
    MItem.Registro.ValorUnitario     := StrToFloatDef( e_vl_unit_product.Text,0);
    MItem.Registro.AliquotaDesconto  := 0;
    MItem.Registro.ValorDesconto     := 0;
    MItem.insert;
  End;

end;

procedure TTasOrderConsignment.saveStockStatement;
begin
  with OrderConsignment.MOperacoes do
  Begin
    with MItem.merchandise.StockStatement.Registro do
    Begin
      //Insere o registro dos itens da consignção
      Codigo          := 0;
      Estabelecimento := UMM.GInstitution.Registro.Codigo;
      Terminal        := GbTerminal;
      Ordem           := OrderConsignment.Registro.Codigo;
      OrdemItem       := MItem.Registro.Codigo;
      Estoque         := GbStock;
      Local           := concat('Terminal ', IntToStr(GbTerminal));
      Tipo            := 'Consignacao';
      DataRegistro    := OrderConsignment.MOperacoes.Registro.Data;
      Direcao         := 'S';
      Mercadoria      := MItem.Registro.Produto;
      Quantidade      := MItem.Registro.Quantidade;
      Operacao        := 'inclusão';
    End;
    MItem.merchandise.StockStatement.save;
  End;
end;

procedure TTasOrderConsignment.saveAddOrderSale;
Var
  LcLastID : Integer;
begin
  OrderSale.Registro.Estabelecimento := UMM.GInstitution.Registro.Codigo;
  OrderSale.Registro.Cliente := OrderConsignment.Registro.Cliente;
  OrderSale.getbyDataCustomer( OrderConsignment.MOperacoes.Registro.Data );
  if not OrderSale.exist then
  Begin
    With OrderSale.MOrder do
    Begin
      Registro.Estabelecimento := UMM.GInstitution.Registro.Codigo;
      Registro.Terminal := GbTerminal;
      Registro.Data := OrderConsignment.MOperacoes.Registro.Data;
      Registro.Observacao := '';
      Registro.Origem := 'A';
      Registro.Status := 'N';
      Registro.Usuario  := GbUser;
    End;
    OrderSale.MOrder.save;

    With OrderSale do
    Begin
      Registro.Codigo           :=  OrderSale.MOrder.Registro.Codigo;
      Registro.Terminal         :=  OrderSale.MOrder.Registro.Terminal;
      Registro.Estabelecimento  :=  OrderSale.MOrder.Registro.Estabelecimento;
      Registro.Vendedor         :=  GbSalesMan;
      Registro.Cliente          :=  OrderConsignment.Registro.Cliente;
    End;
    OrderSale.save;
  End;
end;

procedure TTasOrderConsignment.saveAddOrderSaleBilling;
begin
  with OrderSale.MBilling do
  Begin
    Registro.Codigo           := OrderSale.MOrder.Registro.Codigo;
    Registro.Terminal         := OrderSale.MOrder.Registro.Terminal;
    Registro.Estabelecimento  := OrderSale.MOrder.Registro.Estabelecimento;
    OrderSale.MPaymentType.Registro.Descricao := 'DINHEIRO';
    OrderSale.MPaymentType.getByDescripton;
    Registro.FormaPagamento   := OrderSale.MPaymentType.Registro.Codigo;
    Registro.Prazo            := '000 - A VISTA';
    Registro.Responsavel      := GbUser;
  End;
  OrderSale.MBilling.save;

end;

procedure TTasOrderConsignment.saveAddOrderSaleItems;
begin
  with OrderSale.MItems do
  Begin
    //Insere o registro dos itens da consignção
    Registro.Codigo            := 0;
    Registro.Estabelecimento   := UMM.GInstitution.Registro.Codigo;
    Registro.Ordem             := OrderSale.Registro.Codigo;
    Registro.Terminal          := GbTerminal;
    Registro.Produto           := StrToIntDef(Lb_rmv_confirm_cod_prod.Text,0);
    Registro.Estoque           := GbStock;
    Registro.TabelaPreco       := 1;
    Registro.Quantidade        := StrToFloatDef(E_rmv_quantidade_venda.Text,0);;
    Registro.ValorUnitario     := StrToFloatDef(Lb_rmv_confirm_vl_unit.Text,0);
    Registro.AliquotaDesconto  := 0;
    Registro.ValorDesconto     := 0;
    insert;
  End;
  //Baixa simples produto a produto
  with OrderSale.Mitems.StockStatement.Registro do
  Begin
    Codigo           := 0;
    Estabelecimento  := OrderSale.Mitems.Registro.Estabelecimento;
    Terminal         := OrderSale.Mitems.Registro.Terminal;
    Ordem            := OrderSale.Mitems.Registro.Ordem;
    OrdemItem        := OrderSale.Mitems.Registro.Codigo;
    Estoque          := OrderSale.Mitems.Registro.Estoque;
    Local            := concat('Terminal - ',Terminal.ToString);
    Tipo             := 'Venda';
    DataRegistro     := Date;
    Direcao          := 'S';
    Mercadoria       := OrderSale.Mitems.Registro.Produto;
    Quantidade       := OrderSale.Mitems.Registro.Quantidade;
    Operacao         := 'inclusão';
  End;
  OrderSale.Mitems.StockStatement.save;

end;

procedure TTasOrderConsignment.saveAddOrderSaleTotalizer;
Var
  I : Integer;
begin
  //Soma os itens da Nota
  OrderSale.MItems.Registro.Ordem := OrderSale.Registro.Codigo;
  OrderSale.MItems.getListSpl;

  With OrderSale.MTotalizer do
  Begin
    Registro.Codigo             :=   OrderSale.Registro.Codigo;
    Registro.Terminal           :=   OrderSale.Registro.Terminal;
    Registro.Estabelecimento    :=   OrderSale.Registro.Estabelecimento;
    Registro.ProdutoQuantidade  := 0;
    Registro.ValorProduto       := 0;
    Registro.IPIValor           := 0;
    Registro.AlíquotaDesconto   := 0;
    Registro.ValorDesconto      := 0;
    Registro.ValorDespesas      := 0;
    Registro.ItemsQuantidade    := OrderSale.MItems.CollListaSpl.Count;
    for I := 0 to OrderSale.MItems.CollListaSpl.Count - 1 do
    Begin
      Registro.ProdutoQuantidade  := Registro.ProdutoQuantidade + OrderSale.MItems.CollListaSpl[I].Qtde;
      Registro.ValorProduto := Registro.ValorProduto + ( OrderSale.MItems.CollListaSpl[I].Qtde * OrderSale.MItems.CollListaSpl[I].ValorUnitario);
    End;
    Registro.ValorTotal         := Registro.ValorProduto;
  End;
  OrderSale.MTotalizer.save;

end;

procedure TTasOrderConsignment.ConsignmentToStockBalance;
begin
  if Sp_rmv_quantidade_devolvida.Value > 0 then
  Begin
    with OrderConsignment.MOperacoes do
    Begin
      //Insere o registro dos itens da consignção
      MItem.Registro.Codigo            := 0;
      MItem.Registro.Estabelecimento   := UMM.GInstitution.Registro.Codigo;
      MItem.Registro.Ordem             := OrderConsignment.Registro.Codigo;
      MItem.Registro.Terminal          := GbTerminal;
      MItem.Registro.Produto           := StrToIntDef(Lb_rmv_confirm_cod_prod.Text,0);
      MItem.Registro.Estoque           := GbStock;
      MItem.Registro.TabelaPreco       := 1;
      MItem.Registro.Quantidade        := Sp_rmv_quantidade_devolvida.Value;
      MItem.Registro.ValorUnitario     := StrToFloatDef(Lb_rmv_confirm_vl_unit.Text,0);
      MItem.Registro.AliquotaDesconto  := 0;
      MItem.Registro.ValorDesconto     := 0;
      MItem.insert;
      //Insere Registro da operação de Consignação
      Registro.ItemOrdem        := MItem.Registro.Codigo;
      Registro.Estabelecimento  := UMM.GInstitution.Registro.Codigo;
      Registro.Terminal         := GbTerminal;
      Registro.Ordem            := OrderConsignment.Registro.Codigo;
      Registro.Data             := Date;
      Registro.Tipo             := 'SD';
      OrderConsignment.MOperacoes.insert;
    End;
    //REgistra no estoque a devolução do produto
    with OrderConsignment.MOperacoes.MItem.StockStatement.Registro do
    Begin
      Codigo           := 0;
      Estabelecimento  := OrderConsignment.MOperacoes.MItem.Registro.Estabelecimento;
      Terminal         := OrderConsignment.MOperacoes.MItem.Registro.Terminal;
      Ordem            := OrderConsignment.MOperacoes.MItem.Registro.Ordem;
      OrdemItem        := OrderConsignment.MOperacoes.MItem.Registro.Codigo;
      Estoque          := OrderConsignment.MOperacoes.MItem.Registro.Estoque;
      Local            := concat('Terminal - ',Terminal.ToString);
      Tipo             := 'Consignação';
      DataRegistro     := Date;
      Direcao          := 'E';
      Mercadoria       := OrderConsignment.MOperacoes.MItem.Registro.Produto;
      Quantidade       := OrderConsignment.MOperacoes.MItem.Registro.Quantidade;
      Operacao         := 'Devolução';
    End;
    OrderConsignment.MOperacoes.MItem.StockStatement.save;
  End;
end;

procedure TTasOrderConsignment.RemoveConsignmentToSale;
begin
  if StrToFloatDef(E_rmv_quantidade_venda.Text,0) > 0 then
  Begin
    with OrderConsignment.MOperacoes do
    Begin
      //Insere o registro dos itens da consignção
      MItem.Registro.Codigo            := 0;
      MItem.Registro.Estabelecimento   := UMM.GInstitution.Registro.Codigo;
      MItem.Registro.Ordem             := OrderConsignment.Registro.Codigo;
      MItem.Registro.Terminal          := GbTerminal;
      MItem.Registro.Produto           := StrToIntDef(Lb_rmv_confirm_cod_prod.Text,0);
      MItem.Registro.Estoque           := GbStock;
      MItem.Registro.TabelaPreco       := 1;
      MItem.Registro.Quantidade        := StrToFloatDef(E_rmv_quantidade_venda.Text,0);
      MItem.Registro.ValorUnitario     := StrToFloatDef(Lb_rmv_confirm_vl_unit.Text,0);
      MItem.Registro.AliquotaDesconto  := 0;
      MItem.Registro.ValorDesconto     := 0;
      MItem.insert;
      //Insere Registro da operação de Consignação
      Registro.ItemOrdem        := MItem.Registro.Codigo;
      Registro.Estabelecimento  := UMM.GInstitution.Registro.Codigo;
      Registro.Terminal         := GbTerminal;
      Registro.Ordem            := OrderConsignment.Registro.Codigo;
      Registro.Data             := Date;
      Registro.Tipo             := 'SV';
      OrderConsignment.MOperacoes.insert;
    End;
    //REgistra no estoque a devolução do produto
    with OrderConsignment.MOperacoes.MItem.StockStatement.Registro do
    Begin
      Codigo           := 0;
      Estabelecimento  := OrderConsignment.MOperacoes.MItem.Registro.Estabelecimento;
      Terminal         := OrderConsignment.MOperacoes.MItem.Registro.Terminal;
      Ordem            := OrderConsignment.MOperacoes.MItem.Registro.Ordem;
      OrdemItem        := OrderConsignment.MOperacoes.MItem.Registro.Codigo;
      Estoque          := OrderConsignment.MOperacoes.MItem.Registro.Estoque;
      Local            := concat('Terminal - ',Terminal.ToString);
      Tipo             := 'Consignação';
      DataRegistro     := Date;
      Direcao          := 'E';
      Mercadoria       := OrderConsignment.MOperacoes.MItem.Registro.Produto;
      Quantidade       := OrderConsignment.MOperacoes.MItem.Registro.Quantidade;
      Operacao         := 'Venda';
    End;
    OrderConsignment.MOperacoes.MItem.StockStatement.save;
  End;
end;


procedure TTasOrderConsignment.ConsignmentToSale;
begin
  if StrToFloatDef(E_rmv_quantidade_venda.Text,0) > 0 then
  Begin
    saveAddOrderSale;
    saveAddOrderSaleItems;
    saveAddOrderSaleTotalizer;
    saveAddOrderSaleBilling;
  End;
end;

procedure TTasOrderConsignment.Sb_add_items_backClick(Sender: TObject);
begin
  inherited;
  getListConsignaAdd('');
  ChangeTabAddLista.ExecuteTarget(Self);
end;

procedure TTasOrderConsignment.Sb_add_items_newClick(Sender: TObject);
begin
  inherited;
  FmAddSeaProduct.getList('');
  ChangeTabAddSearchItems.ExecuteTarget(Self);
end;

procedure TTasOrderConsignment.Sb_add_list_backClick(Sender: TObject);
begin
  inherited;
  Self.getConsignaIN;
  Self.getProductByCustomer;
  ChangeTabManager.ExecuteTarget(Self);
end;

procedure TTasOrderConsignment.Sb_add_list_newClick(Sender: TObject);
begin
  inherited;
  OrderConsignment.MOperacoes.Registro.Data := Date;
  getListITemsConsignmentAdd(nil);
  FillListItemsConsignmentAdd( OrderConsignment.MOperacoes.ListSplItems );
  ChangeTabAddListaItems.ExecuteTarget(Self);
end;

procedure TTasOrderConsignment.Sb_CancelClick(Sender: TObject);
begin
  inherited;
  Close;
end;

procedure TTasOrderConsignment.Sb_canc_edit_productClick(Sender: TObject);
begin
  inherited;
  ChangeTabAddSearchItems.ExecuteTarget(Self);
end;

procedure TTasOrderConsignment.Sb_conf_edit_productClick(Sender: TObject);
begin
  if validateaddOrderItem then
  BEgin
    save;
    Begin
      if IndiceItemPRoduct = -1 then
      Begin
        if validateSaveAdd then
        SaveAdd;
      end
      else
      Begin

      end;
    end;
    FmAddSeaProduct.getList('');
    ChangeTabAddSearchItems.ExecuteTarget(Self);
  End;
end;

procedure TTasOrderConsignment.Sb_imprimirClick(Sender: TObject);
begin
  if ValidaImprimeResumo then
  BEgin
    ImprimeResumo;
  End;
end;

procedure TTasOrderConsignment.Sb_product_balance_backClick(Sender: TObject);
begin
  ChangeTabProductManage.ExecuteTarget(Self);
end;

procedure TTasOrderConsignment.Sb_product_statement_backClick(Sender: TObject);
begin
  ChangeTabProductBalance.ExecuteTarget(Self);
end;

procedure TTasOrderConsignment.Sb_remove_balance_items_backClick(
  Sender: TObject);
begin
  inherited;
  ChangeTabRmvListaItems.ExecuteTarget(Self);
end;

procedure TTasOrderConsignment.Sb_remove_list_backClick(Sender: TObject);
begin
  inherited;
  ChangeTabManager.ExecuteTarget(Self);
end;

procedure TTasOrderConsignment.Sb_remove_list_newClick(Sender: TObject);
begin
  inherited;
  ChangeTabRmvListaItems.ExecuteTarget(Self);
end;

procedure TTasOrderConsignment.Sb_rmv_balance_items_backClick(Sender: TObject);
begin
  inherited;
  OrderConsignment.MOperacoes.Registro.Data := Date;
  getListITemsConsignmentRmvSale(nil);
  FillListItemsConsignmentRmvSale( OrderConsignment.MOperacoes.ListSplItems );

  getListITemsConsignmentRmvDevo(nil);
  FillListItemsConsignmentRmvDevo( OrderConsignment.MOperacoes.ListSplItems );

  ChangeTabRmvListaITems.ExecuteTarget(Self);
end;

procedure TTasOrderConsignment.Sb_rmv_items_backClick(Sender: TObject);
begin
  inherited;
  getListConsignaRmv('');
  ChangeTabRmvLista.ExecuteTarget(Self);
end;

procedure TTasOrderConsignment.Sb_rmv_itens_newClick(Sender: TObject);
begin
  inherited;
  //Informa data 0(zero) para que traga o saldo de todos os movimentos e
  getListITemsConsignmentRmvBalance(nil);
  FillListItemsConsignmentRmvBalance( OrderConsignment.MOperacoes.ListSplItemsBalance );
  ChangeTabRmvBalanceItems.ExecuteTarget(Self);
end;

procedure TTasOrderConsignment.Sb_rmv_list_backClick(Sender: TObject);
begin
  inherited;
  Self.getConsignaOUT;
  Self.getProductByCustomer;
  ChangeTabManager.ExecuteTarget(Self);
end;

procedure TTasOrderConsignment.Sb_rmv_list_newClick(Sender: TObject);
begin
  inherited;
  OrderConsignment.MOperacoes.Registro.Data := Date;
  OrderConsignment.MOperacoes.ListSplItems.Clear;

  FillListItemsConsignmentRmvSale( OrderConsignment.MOperacoes.ListSplItems );
  FillListItemsConsignmentRmvDevo( OrderConsignment.MOperacoes.ListSplItems );
  ChangeTabRmvListaITems.ExecuteTarget(Self);
end;


procedure TTasOrderConsignment.SetPriceAddItemSelectedProduto(
  IdProduct: Integer);
Var
  LcPrice : TCtrlMobPrice;
begin
  TRy
    LcPrice := TCtrlMobPrice.Create(Self);
    LcPrice.Registro.Estabelecimento := UMM.GInstitution.Registro.Codigo;
    LcPrice.Registro.Produto := IdProduct;

    LcPrice.Registro.Tabela := 1;
    LcPrice.getByKey;
    if LcPrice.exist then
      FmAddSeaProduct.Sb_tab_01.Text :=FloatToStrF(LcPrice.Registro.Preco,ffFixed,10,2)
    else
      FmAddSeaProduct.Sb_tab_01.Text := '0,00';

    //TAbela codigo 2 é de promoção do Sistema Gestão

    LcPrice.Registro.Tabela := 3;
    LcPrice.getByKey;
    if LcPrice.exist then
      FmAddSeaProduct.Sb_tab_03.Text :=FloatToStrF(LcPrice.Registro.Preco,ffFixed,10,2)
    else
      FmAddSeaProduct.Sb_tab_03.Text := '0,00';

    LcPrice.Registro.Tabela := 4;
    LcPrice.getByKey;
    if LcPrice.exist then
      FmAddSeaProduct.Sb_tab_04.Text :=FloatToStrF(LcPrice.Registro.Preco,ffFixed,10,2)
    else
      FmAddSeaProduct.Sb_tab_04.Text := '0,00';

    LcPrice.Registro.Tabela := 5;
    LcPrice.getByKey;
    if LcPrice.exist then
      FmAddSeaProduct.Sb_tab_05.Text :=FloatToStrF(LcPrice.Registro.Preco,ffFixed,10,2)
    else
      FmAddSeaProduct.Sb_tab_05.Text := '0,00';

    LcPrice.Registro.Tabela := 6;
    LcPrice.getByKey;
    if LcPrice.exist then
      FmAddSeaProduct.Sb_tab_06.Text :=FloatToStrF(LcPrice.Registro.Preco,ffFixed,10,2)
    else
      FmAddSeaProduct.Sb_tab_06.Text := '0,00';

    LcPrice.Registro.Tabela := 7;
    LcPrice.getByKey;
    if LcPrice.exist then
      FmAddSeaProduct.Sb_tab_07.Text :=FloatToStrF(LcPrice.Registro.Preco,ffFixed,10,2)
    else
      FmAddSeaProduct.Sb_tab_07.Text := '0,00';
  Finally
    LcPrice.DisposeOf;
  End;

end;

procedure TTasOrderConsignment.SetVariable;
Begin
  if CodigoRegistro > 0 then
  Begin
    OrderConsignment.Registro.Estabelecimento  := UMM.GInstitution.Registro.Codigo;
    OrderConsignment.Registro.Cliente          := CodigoRegistro;
    OrderConsignment.GetByCustomer;

    OrderConsignment.MCustomer.Registro.Codigo := OrderConsignment.Registro.Cliente;
    OrderConsignment.MCustomer.Registro.Estabelecimento := OrderConsignment.Registro.Estabelecimento;
    OrderConsignment.MCustomer.getAllByKey;

    getConsignaByCustomer;
    getConsignaIN;
    getConsignaOUT;
    getProductByCustomer;

    ShowData;
  End
  else
  Begin
    ShowNoData;
  End;
  inherited;

end;

procedure TTasOrderConsignment.ShowAttachRMVReceive(Item: Integer);
Var
  NomeArquivo : String;
  LcAlbum : String;
  LcPath : String;
  Form : TImgGeneral;
begin
  Item := Item  -1;
  LcAlbum           := 'tb_order_consignment_operation';
  NomeArquivo     :=  concat(
                          MD5String(concat(
                            LcAlbum,
                            OrderConsignment.MOperacoes.ListSpl[Item].Estabelecimento.ToString,
                            OrderConsignment.MOperacoes.ListSpl[Item].Terminal.ToString,
                            OrderConsignment.MOperacoes.ListSpl[Item].Ordem.ToString,
                            OrderConsignment.MOperacoes.ListSpl[Item].Data
                            )),
                            '.png'
                      );
  LcPAth := System.IOUtils.TPath.Combine(System.IOUtils.tpath.GetPicturesPath,NomeArquivo);
  if FileExists(LcPAth) then
  Begin
    Form := TimgGeneral.Create(Self);
    Form.PathExe := LcPAth;
    Form.ShowModal(
      procedure(ModalResult : TModalResult)
      begin
        Form := nil;
      end);
  end
  else
  Begin
    TDialogService.ShowMessage(
            Concat('A T E N Ç Ã O!',
                   Char(10),Char(13),
                   'Imagem não encontrada.',
                   Char(10),Char(13),
                   'Anexe a imagem antes de visualiza-la.'));
  end;
end;

procedure TTasOrderConsignment.ShowData;
begin
  inherited;
  with OrderConsignment do
  Begin
    if Trim(MCustomer.MFiscal.Registro.NomeRazao)<> '' then
    Begin
      E_customer_name.Text :=  MCustomer.MFiscal.Registro.NomeRazao;
      E_customer_nick.Text :=  MCustomer.MFiscal.Registro.ApelidoFantasia;
    End
    else
      E_customer_name.Text := 'Selecione o cliente.';
  End;
end;

procedure TTasOrderConsignment.ShowNoData;
begin
  OrderConsignment.clear;
  OrderConsignment.MCustomer.clear;
  OrderConsignment.MOrder.clear;
  OrderConsignment.MOperacoes.clear;
end;

procedure TTasOrderConsignment.Sb_TakePictureClick(Sender: TObject);
begin
  if Lsv_rmv_lista.Selected <> nil then
  Begin
    TakePhotoFromCameraAction1.ExecuteTarget(self);
  End
  else
  Begin
    TDialogService.ShowMessage(
            Concat('A T E N Ç Ã O!',
                   Char(10),Char(13),
                   'Selecione um registro',
                   Char(10),Char(13),
                   'Antes de continuar.'));
  End;
end;

procedure TTasOrderConsignment.SpeedButton2Click(Sender: TObject);
begin
  ChangeTabAddListaItems.ExecuteTarget(Self);
end;

procedure TTasOrderConsignment.SpeedButton4Click(Sender: TObject);
begin
  inherited;
  ChangeTabRmvBalanceItems.ExecuteTarget(Self);
end;

procedure TTasOrderConsignment.SpeedButton5Click(Sender: TObject);
begin
  inherited;
  ChangeTabRmvLista.ExecuteTarget(Self);
end;

procedure TTasOrderConsignment.Sp_rmv_contagem_localChange(Sender: TObject);
begin
  totalizer_Remove;
end;

procedure TTasOrderConsignment.Sp_rmv_quantidade_devolvidaChange(
  Sender: TObject);
begin
  inherited;
  totalizer_Remove;
end;

procedure TTasOrderConsignment.TakePhotoFromCameraAction1DidFinishTaking(
  Image: TBitmap);
Var
  LcCtrl : TCtrlMobImages;
  LcPAth : String;
  LcItem : Integer;
begin
  if not (Image.IsEmpty ) then
  Begin
    try
      LcItem := Lsv_rmv_lista.Selected.Index- 1;
      LcCtrl := TCtrlMobImages.create(Self);
      with LcCtrl.Registro do
      Begin
        Estabelecimento := UMM.GInstitution.Registro.Codigo;
        Album           := 'tb_order_consignment_operation';
        NomeArquivo     :=  concat(
                                MD5String(concat(
                                  Album,
                                  OrderConsignment.MOperacoes.ListSpl[LcItem]. Estabelecimento.ToString,
                                  OrderConsignment.MOperacoes.ListSpl[LcItem].Terminal.ToString,
                                  OrderConsignment.MOperacoes.ListSpl[LcItem].Ordem.ToString,
                                  OrderConsignment.MOperacoes.ListSpl[LcItem].Data
                                  )),
                                  '.png'
                            );

        Entidade        := OrderConsignment.Registro.Cliente;
        Sequencia       := 0;
      End;
      LcCtrl.insert;
      LcPAth := System.IOUtils.TPath.Combine(System.IOUtils.tpath.GetPicturesPath,LcCtrl.Registro.NomeArquivo);
      Image.SaveToFile( LcPAth );
    finally
      LcCtrl.DisposeOf;
    end;
  End;
end;

procedure TTasOrderConsignment.totalizer_closure;
Var
  Lc_Valor:Real;
  Lc_Vl_Recebido :Real;
Begin
  Lc_Vl_Recebido := StrToFloatDef(E_rmv_fechamento_vl_recebido.Text,0);
  E_rmv_fechamento_vl_recebido.Text := FloatToStrF( Lc_Vl_Recebido,ffFixed,10,2);

  Lc_Valor := StrToFloatDef(E_rmv_fechamento_vl_pedido.Text,0);
  Lc_Valor := Lc_Valor - Lc_Vl_Recebido;
  if Lc_Valor > 0 then
    E_rmv_fechamento_vl_falta_pagar.Text := FloatToStrF( Lc_Valor,ffFixed,10,2)
  else
    E_rmv_fechamento_vl_falta_pagar.Text := '0,00';

  Lc_Valor := StrToFloatDef(E_rmv_fechamento_vl_pedido.Text,0);
  Lc_Valor := Lc_Vl_Recebido - Lc_Valor;
  if Lc_Valor > 0 then
    E_rmv_fechamento_vl_troco.Text := FloatToStrF( Lc_Valor,ffFixed,10,2)
  else
    E_rmv_fechamento_vl_troco.Text := '0,00';
end;

procedure TTasOrderConsignment.totalizer_Remove;
Var
  Lc_Qt_Consignada : Real;
  Lc_Qt_Local : Real;
  Lc_Qt_Devolvida : Real;
  Lc_qt_Vendida : Real;
begin
  Lc_Qt_Consignada := StrToFloatDef(E_rmv_saldo_consignado.Text,0);
  Lc_Qt_Local := Sp_rmv_contagem_local.Value;
  Lc_Qt_Devolvida := Sp_rmv_quantidade_devolvida.Value;
  Lc_qt_Vendida := Lc_Qt_Consignada - Lc_Qt_Local - Lc_Qt_Devolvida;
  E_rmv_quantidade_venda.Text := FloatToStr(Lc_qt_Vendida);
end;

function TTasOrderConsignment.ValidaImprimeResumo: Boolean;
begin
  Result := True;
end;

function TTasOrderConsignment.validateRetirada: Boolean;
Var
  LcQtde : REal;
begin
  Result := True;
  if not validateCustomer then
  Begin
    Result := False;
    exit;
  End;
  LcQtde := 0;
  OrderConsignment.MOperacoes.Registro.Ordem := OrderConsignment.Registro.Codigo;
  OrderConsignment.MOperacoes.Registro.Data := 0;
  OrderConsignment.MOperacoes.Registro.Tipo := '';
  LcQtde := OrderConsignment.MOperacoes.getBalance;
  if ( LcQtde = 0) then
  begin
    TDialogService.ShowMessage(
            Concat('A T E N Ç Ã O!',
                   Char(10),Char(13),
                   Char(10),Char(13),
                   'Não há produtos consignados.',
                   Char(10),Char(13),
                   'Verifique as entradas.'));
    Result := False;
    exit;
  end;
end;

function TTasOrderConsignment.validaRmvConfirm: Boolean;
VAr
  LcSaldo,LcSale,LcDevo : Real;
begin
  REsult := True;
  LcSaldo := StrToFloatDef(E_rmv_saldo_consignado.Text,0);
  LcSale  := StrToFloatDef(E_rmv_quantidade_venda.Text,0);
  LcDevo  := StrToFloatDef(Sp_rmv_quantidade_devolvida.Text,0);
  if ( (LcSale + LcDevo) > LcSaldo ) then
  Begin
    TDialogService.ShowMessage(
            Concat('A T E N Ç Ã O!',
                   Char(10),Char(13),
                   'O soma de Venda e Devolução não pode ser maior',
                   Char(10),Char(13),
                   'que o saldo disponível.',
                   Char(10),Char(13),
                   'Verifique e tente novamente.'));
    Result := False;
    exit;
  End;
  if ( ( LcSale = 0 ) and ( LcDevo = 0)  ) then
  Begin
    TDialogService.ShowMessage(
            Concat('A T E N Ç Ã O!',
                   Char(10),Char(13),
                   'Quantidades de Venda e/ou de Devolução ',
                   Char(10),Char(13),
                   'devem ser maior que zero.',
                   Char(10),Char(13),
                   'Verifique e tente novamente.'));
    Result := False;
    exit;
  End;

end;

function TTasOrderConsignment.validateaddOrderItem: Boolean;
Var
  LcValor : REal;
begin
  Result := True;
  LcValor := StrToFloatDef(e_vl_unit_product.Text,0);
  if LcValor <= 0 then
  Begin
    TDialogService.ShowMessage(
            Concat('A T E N Ç Ã O!',
                   Char(10),Char(13),
                   'Campo valor unitário deve ser informado.',
                   Char(10),Char(13),
                   'Verifique e tente novamente.'));
    Result := False;
    exit;
  End;


end;

function TTasOrderConsignment.validatecallinsItem(pValor: REal): Boolean;
begin
  REsult := True;
  if pValor = 0 then
  Begin
    TDialogService.ShowMessage(
            Concat('A T E N Ç Ã O!',
                   Char(10),Char(13),
                   'Valor Zerado, tabela não pode ser usada.',
                   Char(10),Char(13),
                   'Utilize os botões com valores.'));
    REsult := False;
    exit;
  End;
end;

function TTasOrderConsignment.validateClosure: Boolean;
Var
  LcAux : REal;
begin
  REsult := TRue;
  totalizer_closure;
  LcAux := StrToFloatDef( E_rmv_fechamento_vl_recebido.Text,0);
  if LcAux <= 0 then
  begin
    TDialogService.ShowMessage(
            Concat('A T E N Ç Ã O!',
                   Char(10),Char(13),
                   Char(10),Char(13),
                   'Valor Recebido deve ser maior do que zero.',
                   Char(10),Char(13),
                   'Verifique e tente novamente'));
    Result := False;
    exit;
  end;

  LcAux := StrToFloatDef( E_rmv_fechamento_vl_falta_pagar.Text,0);
  if LcAux > 0 then
  begin
    TDialogService.ShowMessage(
            Concat('A T E N Ç Ã O!',
                   Char(10),Char(13),
                   Char(10),Char(13),
                   'O campo falta pagar não pdoe ser maior que zero.',
                   Char(10),Char(13),
                   'Verifique e tente novamente'));
    Result := False;
    exit;
  end;

end;

function TTasOrderConsignment.validateCustomer: Boolean;
begin
  REsult := True;
  if OrderConsignment.Registro.Cliente = 0 then
  begin
    TDialogService.ShowMessage(
            Concat('A T E N Ç Ã O!',
                   Char(10),Char(13),
                   Char(10),Char(13),
                   'Campo Cliente não informado.',
                   Char(10),Char(13),
                   'Preencha o campo para continuar'));
    Result := False;
    exit;
  end;
end;

function TTasOrderConsignment.validateSave: Boolean;
begin
  Result := True;
end;

function TTasOrderConsignment.validateSaveAdd: Boolean;
begin
  REsult := True;
end;

end.

