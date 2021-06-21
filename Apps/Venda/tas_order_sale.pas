unit tas_order_sale;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  base_form, FMX.Objects, FMX.Controls.Presentation, FMX.Layouts, FMX.TabControl,
  System.Actions, FMX.ActnList, FMX.Gestures, ctrl_mob_order_sale,TypesListCollection,
  FMX.ListView.Types, FMX.ListView.Appearances, FMX.ListView.Adapters.Base,
  FMX.ListView, FMX.Edit,FMX.DialogService, ctrl_mob_order_item, sea_product,
  UnFunctions,ctrl_mob_payment_type, FMX.ListBox, FMX.EditBox, FMX.SpinBox,
  System.Bluetooth, System.Bluetooth.Components, ctrl_mob_config,
  FMX.ScrollBox, FMX.Memo, ctrl_mob_merchandise, ctrl_mob_price, FMX.Ani,
  System.ImageList, FMX.ImgList,list_spl_order_sale_items, FMX.Memo.Types;

type
  TTasOrderSale = class(TBaseForm)
    TabControl: TTabControl;
    tbs_order: TTabItem;
    Ly_Order: TLayout;
    Rc_order: TRectangle;
    im_order: TImage;
    E_numero_pedido: TLabel;
    lb_Customer: TLabel;
    E_customer_name: TLabel;
    im_Itens: TImage;
    Lb_product: TLabel;
    Lb_selected_products: TLabel;
    im_pay: TImage;
    lb_paymnet: TLabel;
    E_payment_types: TLabel;
    GestureManager1: TGestureManager;
    ActionList: TActionList;
    ChangeTabCustomer: TChangeTabAction;
    ChangeTabItem: TChangeTabAction;
    tbs_item: TTabItem;
    tbs_payment: TTabItem;
    ChangeTabPayment: TChangeTabAction;
    ChangeTabOrder: TChangeTabAction;
    Ly_Result_top: TLayout;
    Rc_result_top: TRectangle;
    Ly_list_titlle: TLayout;
    img_top: TImage;
    Lb_title: TLabel;
    Sb_Cancel: TSpeedButton;
    Ly_order_img: TLayout;
    Ly_order_text: TLayout;
    Ly_order_text_tittle: TLayout;
    Ly_order_text_body: TLayout;
    Ly_customer: TLayout;
    Rc_customer: TRectangle;
    Ly_customer_img: TLayout;
    Ly_customer_text: TLayout;
    Ly_customer_text_tittle: TLayout;
    Ly_customer_text_body: TLayout;
    im_customer: TImage;
    Ly_product: TLayout;
    Rc_product: TRectangle;
    Ly_product_img: TLayout;
    Ly_product_text: TLayout;
    Ly_product_text_tittle: TLayout;
    Ly_product_text_body: TLayout;
    Ly_pay: TLayout;
    Rc_pay: TRectangle;
    Ly_pay_img: TLayout;
    Ly_pay_text: TLayout;
    Ly_pay_text_tittle: TLayout;
    Ly_pay_text_body: TLayout;
    E_valor_pedido: TLabel;
    Ly_top_order_items: TLayout;
    Rectangle1: TRectangle;
    Ly_order_items: TLayout;
    Lb_name_tittle: TLabel;
    Sb_Insert_item: TSpeedButton;
    Sb_items_order_back: TSpeedButton;
    lsv_Search: TListView;
    Ly_selected: TLayout;
    Rc_selected: TRectangle;
    E_valor_sub_total: TLabel;
    Ly_top_payment_types: TLayout;
    Rectangle2: TRectangle;
    Ly_payment_types: TLayout;
    Label1: TLabel;
    Sp_payment_oder_back: TSpeedButton;
    Ly_paymnet_type: TRectangle;
    Lb_payment_type: TLabel;
    Cb_payment_type: TComboBox;
    E_customer_nick: TLabel;
    Ly_plots: TRectangle;
    Lb_Plots: TLabel;
    Sp_plots: TSpinBox;
    Ly_dead_line: TRectangle;
    Grp_dead_line: TGroupBox;
    rb_vista: TRadioButton;
    RB_prazo: TRadioButton;
    Ly_installment: TRectangle;
    E_installment: TEdit;
    Lb_installment: TLabel;
    Sb_imprimir: TSpeedButton;
    tbs_detail: TTabItem;
    Layout1: TLayout;
    Rectangle3: TRectangle;
    Layout2: TLayout;
    Label2: TLabel;
    SpeedButton1: TSpeedButton;
    Ly_Obs: TRectangle;
    Label3: TLabel;
    M_Obs: TMemo;
    ChangeTabDetail: TChangeTabAction;
    tbs_search: TTabItem;
    ChangeTabSearch: TChangeTabAction;
    Ly_search_product: TLayout;
    lsv_search_product: TListView;
    Ly_Result_top_search_product: TLayout;
    Rc_Result_top_search_product: TRectangle;
    Ly_list_titlle_product: TLayout;
    Lb_name_tittle_product: TLabel;
    Sb_search_product: TSpeedButton;
    Sb_back_product_callback: TSpeedButton;
    Ly_quick_search_product: TLayout;
    E_Search_product: TEdit;
    Sb_back_search_product: TSpeedButton;
    Ly_search_product_selected: TLayout;
    Rectangle5: TRectangle;
    Ly_id_produto: TLayout;
    Lb_des_product_selected: TLabel;
    Lb_cod_product_selected: TLabel;
    Ly_vl_preco: TLayout;
    Rc_ins_product: TRectangle;
    Rc_proc_tittle: TRectangle;
    Lb_edit_product: TLabel;
    FA_in: TFloatAnimation;
    Ly_botao_edit_product: TLayout;
    Sb_canc_edit_product: TButton;
    Sb_conf_edit_product: TButton;
    Gpl_botao: TGridPanelLayout;
    Sb_tab_01: TButton;
    Sb_tab_03: TButton;
    Sb_tab_04: TButton;
    Sb_tab_05: TButton;
    Sb_tab_06: TButton;
    Sb_tab_07: TButton;
    Sb_Save: TSpeedButton;
    e_vl_unit_product: TEdit;
    Sp_Qtde: TSpinBox;
    Lb_vl_unit_product: TLabel;
    Lb_qtde_product: TLabel;
    GPL_Ins_Product: TGridPanelLayout;
    procedure btn_cancelTap(Sender: TObject; const Point: TPointF);
    procedure Sb_CancelClick(Sender: TObject);
    procedure Sb_searchClick(Sender: TObject);
    procedure im_ItensClick(Sender: TObject);
    procedure im_payClick(Sender: TObject);
    procedure Rc_customerClick(Sender: TObject);
    procedure Ly_productClick(Sender: TObject);
    procedure im_customerClick(Sender: TObject);
    procedure Sb_Insert_itemClick(Sender: TObject);
    procedure Sp_payment_oder_backClick(Sender: TObject);
    procedure Sb_items_order_backClick(Sender: TObject);
    procedure rb_vistaChange(Sender: TObject);
    procedure RB_prazoChange(Sender: TObject);
    procedure Sb_imprimirClick(Sender: TObject);
    procedure Sb_SaveClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure im_orderClick(Sender: TObject);
    procedure lsv_SearchDeleteItem(Sender: TObject; AIndex: Integer);
    procedure Sb_back_product_callbackClick(Sender: TObject);
    procedure Sb_search_productClick(Sender: TObject);
    procedure lsv_search_productItemClick(const Sender: TObject;
      const AItem: TListViewItem);
    procedure Sb_conf_edit_productClick(Sender: TObject);
    procedure Sb_canc_edit_productClick(Sender: TObject);
    procedure lsv_SearchItemClick(const Sender: TObject;
      const AItem: TListViewItem);
    procedure e_vl_unit_productEnter(Sender: TObject);
    procedure Sp_QtdeEnter(Sender: TObject);
    procedure Sb_back_search_productClick(Sender: TObject);
    procedure lsv_search_productUpdateObjects(const Sender: TObject;
      const AItem: TListViewItem);
    procedure lsv_SearchUpdateObjects(const Sender: TObject;
      const AItem: TListViewItem);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Sb_tab_01Click(Sender: TObject);
    procedure Sb_tab_03Click(Sender: TObject);
    procedure Sb_tab_04Click(Sender: TObject);
    procedure Sb_tab_05Click(Sender: TObject);
    procedure Sb_tab_06Click(Sender: TObject);
    procedure Sb_tab_07Click(Sender: TObject);
    procedure e_vl_unit_productClick(Sender: TObject);
    procedure E_Search_productChangeTracking(Sender: TObject);
  private
    { Private declarations }
    Config : TCtrlMobConfig;
    FActiveForm: TForm;
    Merchandise : TCtrlMobMerchandise;
    IndiceItemPRoduct : integer;
    procedure MontaComboFormaPagamento;
    function getFormaPagamentoPosition(payTypeID:Integer):Integer;
    function ValidaImprimeOrdem:Boolean;
    procedure ImprimeOrdem;
    PROCEDURE ShowFormaPagamento(Descricao:String);

    procedure SetPriceSelectedProduto(IdProduct:Integer);
    procedure getListProduct(par:String);
    function  getParamProduct:TStringList;
    procedure getheadProduct;
    procedure FillListProduct(ListObj : TCollSplMerchandise);
    procedure CleanSelectedProduto;
    function validatecallinsItem(pValor : REal):Boolean;
    procedure callinsItem(sender:TObject);
    procedure calleditItem(Sender:TObject);
    function validateaddOrderItem:Boolean;
    procedure addOrderItem;
    procedure ediOrderItem;
    procedure hidePanelEdit;

  protected
    procedure InitVariable;Override;
    procedure SetVariable;Override;
    procedure FormatScreen;Override;
    procedure ShowData;
    procedure ShowNoData;
    procedure Search;
    function validateFormaPagto:Boolean;
    function validateSave:Boolean;
    procedure save;

    procedure saveOrderSale;
    procedure saveOrderItems;
    procedure saveOrderItem(Item:TListSplOrderSaleItems);
    procedure saveOrderTotalizer;
    procedure saveOrderBilling;
    procedure saveStockStatement;
    //Itens da Ordem
    procedure getHead;
    procedure getListOrderItems;
    procedure FillListOrderItems(ListObj : TCollSplOrderSaleItems);

  public
    OrderSale : TCtrlMobOrderSale;
    { Public declarations }
  end;

var
  TasOrderSale: TTasOrderSale;

implementation

{$R *.fmx}
{$R *.LgXhdpiPh.fmx ANDROID}

uses MainModule, sea_customer;

procedure TTasOrderSale.addOrderItem;
Var
  item : TListSplOrderSaleItems;
Begin
  item := TListSplOrderSaleItems.Create;
  item.Codigo         := OrderSale.Mitems.CollListaSpl.Count + 1;
  item.Produto        := StrToIntDef(Lb_cod_product_selected.Text,0);
  item.Descricao      := Lb_des_product_selected.Text;
  item.Qtde           := Sp_Qtde.Value;
  item.ValorUnitario  := StrToFloatDef(e_vl_unit_product.Text,0);
  item.ValorSubTotal  := item.Qtde * item.ValorUnitario;
  OrderSale.Mitems.CollListaSpl.Add( item );
  saveOrderItem( item );
  saveStockStatement;
end;

procedure TTasOrderSale.btn_cancelTap(Sender: TObject; const Point: TPointF);
begin
  inherited;
  Self.Close;
end;


procedure TTasOrderSale.calleditItem(Sender: TObject);
begin
  Rc_ins_product.Visible := True;
  Rc_ins_product.Align := TAlignLayout.Center;

end;

procedure TTasOrderSale.callinsItem(sender: TObject);
Begin
  if validatecallinsItem(StrToFloatDef(TSpeedButton(Sender).Text,0)) then
  BEgin
    Lb_edit_product.Text := concat(Lb_cod_product_selected.Text, ' - ', Lb_des_product_selected.Text);
    e_vl_unit_product.Text := TSpeedButton(Sender).Text;
    Sp_Qtde.Value := 1;
    IndiceItemPRoduct := -1;
    Rc_ins_product.Visible := True;
    Rc_ins_product.Align := TAlignLayout.Center;
  end;

end;

procedure TTasOrderSale.CleanSelectedProduto;
begin
  Lb_cod_product_selected.Text   := '0000';
  Lb_des_product_selected.Text  := 'Nenhum produto selecionado';
  Sb_tab_01.Text := '0,00';
  Sb_tab_03.Text := '0,00';
  Sb_tab_04.Text := '0,00';
  Sb_tab_05.Text := '0,00';
  Sb_tab_06.Text := '0,00';
  Sb_tab_07.Text := '0,00';
end;

procedure TTasOrderSale.ediOrderItem;
Begin
  with OrderSale.Mitems.CollListaSpl[IndiceItemPRoduct] do
  Begin
    //Codigo         := OrderSale.Mitems.CollListaSpl.Count + 1;
    //Produto        := StrToIntDef(Lb_cod_product_selected.Text,0);
    //Descricao      := Lb_des_product_selected.Text;
    Qtde           := Sp_Qtde.Value;
    ValorUnitario  := StrToFloatDef(e_vl_unit_product.Text,0);
    ValorSubTotal  := Qtde * ValorUnitario;
  end;
  saveOrderItem( OrderSale.Mitems.CollListaSpl[IndiceItemPRoduct] );
  saveStockStatement;
end;

procedure TTasOrderSale.E_Search_productChangeTracking(Sender: TObject);
begin
  getListProduct('');
end;

procedure TTasOrderSale.e_vl_unit_productClick(Sender: TObject);
begin
  inherited;
  e_vl_unit_product.Text := '';
end;

procedure TTasOrderSale.e_vl_unit_productEnter(Sender: TObject);
begin
  TEdit(Sender).SelectAll;
end;

procedure TTasOrderSale.FillListOrderItems(ListObj: TCollSplOrderSaleItems);
Var
  I : Integer;
  LcLVI : TListViewItem;
  LcStrJSon : String;
  LcValor : Real;
begin
  //Desabilita o Botão
  Try
    lsv_Search.Items.Clear;
    getHead;
    lsv_Search.BeginUpdate;
    LcValor := 0;
    for I := 0 to ( ListObj.Count - 1) do
    Begin
      LcLVI := lsv_Search.Items.Add;
      LcLVI.Text := ListObj[I].Codigo.ToString;
      LcLVI.Data['codigo']        := StrZero(ListObj[I].Codigo,3,0);
      LcLVI.Data['produto']       := concat(StrZero(ListObj[I].Produto,3,0),' - ', ListObj[I].Descricao);
      LcLVI.Data['quantidade']    := FloatToStrF(ListObj[I].Qtde,ffNumber,10,2);
      LcLVI.Data['vezes']         := 'X';
      LcLVI.Data['valorunitario'] := FloatToStrF(ListObj[I].ValorUnitario,ffNumber,10,2);
      LcLVI.Data['igual']         := '=';
      LcLVI.Data['valortotal']    := FloatToStrF(ListObj[I].ValorSubTotal,ffNumber,10,2);
      LcValor := LcValor + ListObj[I].ValorSubTotal;
    End;
    //Totalizadores
    E_valor_sub_total.Text := concat('Valor total dos itens: R$ ',FloatToStrF(LcValor,ffNumber,10,2));
    E_valor_pedido.Text    := concat('Valor do Pedido : R$ ',FloatToStrF(LcValor,ffNumber,10,2));
    Lb_selected_products.Text := concat('Selecionado(s) : ',
                                      ListObj.Count.ToString
                               );

  Finally
    lsv_Search.EndUpdate;
  End;
end;

procedure TTasOrderSale.FillListProduct(ListObj: TCollSplMerchandise);
Var
  I : Integer;
  LcLVI : TListViewItem;
  LcStrJSon : String;
begin
  //Desabilita o Botão
  Try
    lsv_search_product.BeginUpdate;
    for I := 0 to ( ListObj.Count - 1) do
    Begin
      LcLVI := lsv_search_product.Items.Add;
      LcLVI.Text := ListObj[I].Codigo.ToString;
      LcLVI.Data['Codigo'] := StrZero(ListObj[I].Codigo,4,0);
      LcLVI.Data['Produto'] := ListObj[I].Descricao;
      LcLVI.Data['Estoque'] := concat('Estoque : ', FloatToStrF(ListObj[I].Estoque,ffNumber,10,2));
      LcLVI.Data['Embalagem'] := concat('Embalagem : ', ListObj[I].Embalagem);
    End;
  Finally
    lsv_search_product.EndUpdate;
  End;

end;

procedure TTasOrderSale.FormatScreen;
begin
  inherited;
  TabControl.ActiveTab := tbs_order;
end;


procedure TTasOrderSale.FormCreate(Sender: TObject);
begin
  InitVariable;
end;

procedure TTasOrderSale.FormShow(Sender: TObject);
begin
  setImages;
  FormatScreen; //- estou ativando apos a criação do form
  SetVariable;
end;

function TTasOrderSale.getFormaPagamentoPosition(payTypeID: Integer): Integer;
Var
  I : Integer;
begin
  Result := -1;
  for I := 0 to OrderSale.MPaymentType.lista.Count -1 do
  Begin
    if OrderSale.MPaymentType.Lista[I].Codigo = payTypeID then
    Begin
      Result := I;
      Break;
    End;
  End;
  if (Result = -1 ) then
    Result := 0;
end;

procedure TTasOrderSale.getHead;
Var
  I : Integer;
  LcLVI : TListViewItem;
begin
  //Cabeçalho
  lsv_Search.Items.Clear;
  LcLVI := lsv_Search.Items.Add;
  LcLVI.Height := 50;
  LcLVI.Text := concat('Item / Código / Descrição',#13,#10,
                       'Qtde X Valor Unitário = Valor Subtotal'
                );
  LcLVI.Purpose := TListItemPurpose.Header;

end;


procedure TTasOrderSale.getheadProduct;
Var
  I : Integer;
  LcLVI : TListViewItem;
begin
  //Cabeçalho
  lsv_search_product.Items.Clear;
  LcLVI := lsv_search_product.Items.Add;
  LcLVI.Height := 35;
  LcLVI.Text := concat('Descrição',#13,#10,
                       'Embalagem/Estoque',#13,#10
                );
  LcLVI.Purpose := TListItemPurpose.Header;
end;

procedure TTasOrderSale.getListOrderItems;
begin
  with OrderSale do
  BEgin
    Mitems := TCtrlMobOrderItem.Create(self);
    Mitems.Registro.Estabelecimento := UMM.GInstitution.Registro.Codigo;
    Mitems.Registro.Ordem := OrderSale.Registro.Codigo;
    Mitems.getListSpl;
  End;
end;

procedure TTasOrderSale.getListProduct(par: String);
begin
  getheadProduct;
  Merchandise.Registro.Estabelecimento := UMM.GInstitution.Registro.Codigo;
  Merchandise.getListSpl(getParamProduct);
  FillListProduct( Merchandise.CollListaSpl );
end;

function TTasOrderSale.getParamProduct: TStringList;
Var
  Lcpos:Integer;
  LCStr : String;
  LcPalavra : String;
begin
  Result := TStringList.create;
  if Length(E_Search_product.Text)>0 then
  Begin
    LcStr := E_Search_product.Text;
    while Length(trim(LcStr))>0 do
    Begin
      Lcpos := Pos(' ',LCStr);
      if (Lcpos > 0) then
      Begin
        LcPalavra := Trim(Copy(LCStr,1,Lcpos));
        if Length(LcPalavra) > 0 then
          Result.Add(LcPalavra);
      End
      else
      Begin
        LcPalavra := Trim(LCStr);
        Result.Add(LcPalavra);
        LCStr := '';
      End;
      if Lcpos = 0 then Lcpos := 1;
      Delete(LCStr,1,Lcpos);
    End;
  End;


end;

procedure TTasOrderSale.hidePanelEdit;
begin
  //Fecha a tela de edicaçõ
  Rc_ins_product.Align := TAlignLayout.None;
  Rc_ins_product.Position.y := -200;
  Rc_ins_product.Visible := False;
end;

procedure TTasOrderSale.im_ItensClick(Sender: TObject);
begin
  inherited;
  getListOrderItems;
  //Lista Visual
  FillListOrderItems( OrderSale.Mitems.CollListaSpl );
  ChangeTabItem.ExecuteTarget(Self);
end;

procedure TTasOrderSale.ImprimeOrdem;
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
      //UMM.Print.imprimir(OrderSale);
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

procedure TTasOrderSale.im_customerClick(Sender: TObject);
var
  Form : TSeaCustomer;
begin
  Form := TSeaCustomer.Create(Self);
  Form.FmSeaCustomer.Sb_back_callback.Visible := tRUE;
  Form.ShowModal(
      procedure(ModalResult : TModalResult)
      begin
        if ModalResult = mrOk then
        Begin
          Self.OrderSale.Registro.Cliente := form.CodigoCliente;
          self.E_customer_name.Text       := Form.NameCliente;
          self.E_customer_nick.Text       := Form.NickCliente;
        End;
        Form := nil;
      end);
end;

procedure TTasOrderSale.im_orderClick(Sender: TObject);
begin
  inherited;
  ChangeTabDetail.ExecuteTarget(Self);
end;

procedure TTasOrderSale.im_payClick(Sender: TObject);
begin
  inherited;
  ChangeTabPayment.ExecuteTarget(Self);
end;

procedure TTasOrderSale.InitVariable;
begin
  inherited;
  SetMainStock;
  Rc_ins_product.Visible := FAlse;
  Rc_ins_product.Position.Y := -200;
  Config := TCtrlMobConfig.Create(Self);
  TabControl.TabPosition := TTabPosition.None;
  TabControl.ActiveTab := tbs_order;
  OrderSale := TCtrlMobOrderSale.Create(self);
  Merchandise := TCtrlMobMerchandise.Create(Self);
  getHead;
end;

procedure TTasOrderSale.lsv_SearchDeleteItem(Sender: TObject; AIndex: Integer);
begin
  IndiceItemPRoduct := AIndex - 1;
  OrderSale.Mitems.CollListaSpl.Delete(IndiceItemPRoduct);
  saveOrderItems;
  saveOrderTotalizer;
  Lb_selected_products.Text := concat('Selecionado(s) : ',
                                  OrderSale.Mitems.CollListaSpl.Count.ToString
                                 );
  FillListOrderItems( OrderSale.Mitems.CollListaSpl );

end;

procedure TTasOrderSale.lsv_SearchItemClick(const Sender: TObject;
  const AItem: TListViewItem);
Var
  LcLVI : TListViewItem;
  LcCodID : Integer;
begin
  LcLVI := lsv_Search.Items[AItem.Index];
  LcCodID := StrToInt(AItem.Text);
  if LcCodID > 0 then
  Begin
    IndiceItemPRoduct := AItem.Index - 1;
    Lb_edit_product.Text    := concat(OrderSale.Mitems.CollListaSpl[IndiceItemPRoduct].Codigo.ToString , ' - ',
                                      OrderSale.Mitems.CollListaSpl[IndiceItemPRoduct].Descricao
                                );
    e_vl_unit_product.Text  := FloatToStrF(OrderSale.Mitems.CollListaSpl[IndiceItemPRoduct].ValorUnitario,ffNumber,10,2);
    Sp_Qtde.Value           := OrderSale.Mitems.CollListaSpl[IndiceItemPRoduct].Qtde;
    Rc_ins_product.Visible  := True;
    Rc_ins_product.Align := TAlignLayout.Center;
  end;

end;

procedure TTasOrderSale.lsv_SearchUpdateObjects(const Sender: TObject;
  const AItem: TListViewItem);
Var
  item: TListItemText;
begin
  inherited;
  try
    try
     lsv_Search.BeginUpdate;
     item := AItem.Objects.FindObjectT<TListItemText>('codigo');
     if item <> nil then
        item.Font.Size:= 12;

     item := AItem.Objects.FindObjectT<TListItemText>('produto');
     if item <> nil then
        item.Font.Size:= 12;

     item := AItem.Objects.FindObjectT<TListItemText>('quantidade');
     if item <> nil then
        item.Font.Size:= 12;

     item := AItem.Objects.FindObjectT<TListItemText>('vezes');
     if item <> nil then
        item.Font.Size:= 12;

     item := AItem.Objects.FindObjectT<TListItemText>('valorunitario');
     if item <> nil then
        item.Font.Size:= 12;

     item := AItem.Objects.FindObjectT<TListItemText>('igual');
     if item <> nil then
        item.Font.Size:= 12;

     item := AItem.Objects.FindObjectT<TListItemText>('valortotal');
     if item <> nil then
        item.Font.Size:= 12;

    except
      on E : Exception do
            ShowMessage(E.ClassName+' error raised, with message : '+E.Message);
    end;
  finally
    lsv_Search.EndUpdate;
  end;

end;

procedure TTasOrderSale.lsv_search_productItemClick(const Sender: TObject;
  const AItem: TListViewItem);
Var
  LcLVI : TListViewItem;
  LcCodID : Integer;
begin
  LcLVI := lsv_search_product.Items[AItem.Index];
  LcCodID := StrToInt(AItem.Text);
  if LcCodID > 0 then
  Begin
    Lb_cod_product_selected.Text   := LcLVI.Data['Codigo'].AsString;
    Lb_des_product_selected.Text  := LcLVI.Data['Produto'].AsString;
    SetPriceSelectedProduto(LcCodID);
  end
  else
  Begin
    CleanSelectedProduto;
  End;


end;

procedure TTasOrderSale.lsv_search_productUpdateObjects(const Sender: TObject;
  const AItem: TListViewItem);
Var
  item: TListItemText;
begin
  inherited;
  try
    try
     lsv_Search.BeginUpdate;
     item := AItem.Objects.FindObjectT<TListItemText>('Codigo');
     if item <> nil then
        item.Font.Size:= 12;

     item := AItem.Objects.FindObjectT<TListItemText>('Produto');
     if item <> nil then
        item.Font.Size:= 12;

     item := AItem.Objects.FindObjectT<TListItemText>('Estoque');
     if item <> nil then
        item.Font.Size:= 12;

     item := AItem.Objects.FindObjectT<TListItemText>('Embalagem');
     if item <> nil then
        item.Font.Size:= 12;

    except
      on E : Exception do
            ShowMessage(E.ClassName+' error raised, with message : '+E.Message);
    end;
  finally
    lsv_Search.EndUpdate;
  end;
end;

procedure TTasOrderSale.Ly_productClick(Sender: TObject);
begin
  inherited;
  ChangeTabItem.ExecuteTarget(Self);
end;

procedure TTasOrderSale.MontaComboFormaPagamento;
Var
  I:Integer;
begin
  OrderSale.MPaymentType.OrderBy := 'description';
  OrderSale.MPaymentType.getList;
  Cb_payment_type.Items.clear;
  for I := 0 to OrderSale.MPaymentType.Lista.count-1 do
    Cb_payment_type.Items.add(OrderSale.MPaymentType.Lista[I].Descricao);

end;

procedure TTasOrderSale.RB_prazoChange(Sender: TObject);
begin
  inherited;
  inherited;
  Sp_plots.ReadOnly := False;
  E_installment.ReadOnly := FALSE;
  if TRadioButton(Sender).IsChecked then
  Begin
    Sp_plots.Min := 1;
    Sp_plots.Max := 6;
    Sp_plots.Value := 1;
  End;
end;

procedure TTasOrderSale.rb_vistaChange(Sender: TObject);
begin
  inherited;
  Sp_plots.ReadOnly := False;
  E_installment.ReadOnly := FALSE;
  if TRadioButton(Sender).IsChecked then
  Begin
    Sp_plots.Min := 0;
    Sp_plots.Max := 0;
    Sp_plots.Value := 0;
    Sp_plots.ReadOnly := true;
    E_installment.Text := '';
    E_installment.ReadOnly := true;
  End;
end;

procedure TTasOrderSale.Rc_customerClick(Sender: TObject);
begin
  inherited;
  ChangeTabCustomer.ExecuteTarget(Self);
end;

procedure TTasOrderSale.save;
begin
  saveOrderSale;
  //8saveOrderItems; Testando pois está sendo salvo no momento da inserção/edição
  saveOrderTotalizer;
  saveOrderBilling;
end;

procedure TTasOrderSale.saveOrderBilling;
begin
  with OrderSale.MBilling do
  Begin
    Registro.Codigo            := OrderSale.MOrder.Registro.Codigo;
    Registro.Terminal         := OrderSale.MOrder.Registro.Terminal;
    Registro.Estabelecimento  := OrderSale.MOrder.Registro.Estabelecimento;
    if (Cb_payment_type.Selected <> nil) and (Cb_payment_type.Selected.Text <> '') then
      Registro.FormaPagamento   := OrderSale.MPaymentType.Lista[Cb_payment_type.ItemIndex].Codigo
    else
    Begin
      OrderSale.MPaymentType.Registro.Descricao := 'CARTEIRA';
      OrderSale.MPaymentType.getByDescripton;
      Registro.FormaPagamento   := OrderSale.MPaymentType.Registro.Codigo;
    End;
    Registro.Parcelas         := Sp_plots.Text;
    if rb_vista.IsChecked then
      Registro.Prazo            := '000 - A VISTA'
    else
      Registro.Prazo            := concat(StrZero(Sp_plots.Value,3,0),' - ',E_installment.Text);
    Registro.Responsavel        := GbUser;
  End;
  OrderSale.MBilling.save;
end;

procedure TTasOrderSale.saveOrderItem(Item: TListSplOrderSaleItems);
begin
  With OrderSale.Mitems do
  Begin
    Registro.Estabelecimento  := OrderSale.MOrder.Registro.Estabelecimento;
    Registro.Ordem            := OrderSale.MOrder.Registro.Codigo;
    Registro.Codigo           := Item.Codigo;
    Registro.Terminal         := OrderSale.MOrder.Registro.Terminal;
    Registro.Estoque          := GbStock;
    Registro.Produto          := Item.Produto;
    Registro.Quantidade       := Item.Qtde;
    Registro.ValorUnitario    := Item.ValorUnitario;
    Registro.Produto          := Item.Produto;
  End;
  OrderSale.Mitems.save;
end;

procedure TTasOrderSale.saveOrderItems;
Var
  I : Integer;
begin
  //Deleta todos os itens para reinserir
  With OrderSale.Mitems do
  Begin
    Registro.Estabelecimento  := OrderSale.MOrder.Registro.Estabelecimento;
    Registro.Ordem            := OrderSale.MOrder.Registro.Codigo;
    Registro.Terminal         := OrderSale.MOrder.Registro.Terminal;
  End;
  OrderSale.Mitems.deletebyOrder;

  for I := 0 to OrderSale.Mitems.CollListaSpl.Count - 1 do
  Begin
    OrderSale.Mitems.CollListaSpl[I].Codigo := I + 1;
    saveOrderItem(OrderSale.Mitems.CollListaSpl[I]);
  End;

end;

procedure TTasOrderSale.saveOrderSale;
begin
  With OrderSale.MOrder do
  Begin
    //OrderSale.Registro.codigo := 1087;
    //OrderSale.Registro.Numero := 1087;
    Registro.Estabelecimento := UMM.GInstitution.Registro.Codigo;
    Registro.Terminal := GbTerminal;
    Registro.Data := Date;
    Registro.Observacao := M_Obs.Text;
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
  End;
  OrderSale.save;
end;

procedure TTasOrderSale.saveOrderTotalizer;
Var
  I : Integer;
begin
  With OrderSale.MTotalizer do
  Begin
    Registro.Codigo             :=  OrderSale.MOrder.Registro.Codigo;
    Registro.Terminal           :=  OrderSale.MOrder.Registro.Terminal;
    Registro.Estabelecimento    :=  OrderSale.MOrder.Registro.Estabelecimento;
    Registro.ItemsQuantidade    :=  OrderSale.Mitems.CollListaSpl.Count;
    Registro.ProdutoQuantidade  := 0;
    Registro.ValorProduto       := 0;
    Registro.IPIValor           := 0;
    Registro.AlíquotaDesconto   := 0;
    Registro.ValorDesconto      := 0;
    Registro.ValorDespesas      := 0;
    for I := 0 to OrderSale.Mitems.CollListaSpl.Count - 1 do
    Begin
      Registro.ProdutoQuantidade := Registro.ProdutoQuantidade + OrderSale.Mitems.CollListaSpl[I].Qtde;
      Registro.ValorProduto := Registro.ValorProduto + (OrderSale.Mitems.CollListaSpl[I].Qtde * OrderSale.Mitems.CollListaSpl[I].ValorUnitario);
    End;
    Registro.ValorTotal         := Registro.ValorProduto;
  End;
  OrderSale.MTotalizer.save;
end;

procedure TTasOrderSale.saveStockStatement;
begin
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

procedure TTasOrderSale.Sb_back_product_callbackClick(Sender: TObject);
begin
  hidePanelEdit;
  ChangeTabItem.ExecuteTarget(Self);
end;

procedure TTasOrderSale.Sb_back_search_productClick(Sender: TObject);
begin
  inherited;
  Ly_quick_search_product.Visible := False;
  Ly_list_titlle_product.Visible := True;

end;

procedure TTasOrderSale.Sb_CancelClick(Sender: TObject);
begin
  inherited;
  ModalResult := mrOk;
end;

procedure TTasOrderSale.Sb_canc_edit_productClick(Sender: TObject);
begin
  hidePanelEdit;
end;

procedure TTasOrderSale.Sb_conf_edit_productClick(Sender: TObject);
begin
  if validateaddOrderItem then
  BEgin
    saveOrderSale;
    if IndiceItemPRoduct = -1 then
      addOrderItem
    else
      ediOrderItem;
    saveOrderTotalizer;
    FillListOrderItems( OrderSale.Mitems.CollListaSpl );
    hidePanelEdit;
  End;
end;

procedure TTasOrderSale.Sb_imprimirClick(Sender: TObject);
begin
  if ValidaImprimeOrdem then
  BEgin
    Save;
    ImprimeOrdem;
  End;
end;

procedure TTasOrderSale.Sb_Insert_itemClick(Sender: TObject);
begin
  getListProduct('');
  ChangeTabSearch.ExecuteTarget(Self);
end;

procedure TTasOrderSale.Sb_items_order_backClick(Sender: TObject);
begin
  inherited;
  hidePanelEdit;
  ChangeTabOrder.ExecuteTarget(Self);
end;

procedure TTasOrderSale.Sb_SaveClick(Sender: TObject);
begin
  if validateSave then
  Begin
    Save;
    ModalResult := mrCancel;
  End;
end;

procedure TTasOrderSale.Sb_searchClick(Sender: TObject);
begin
  inherited;
  Search;
end;

procedure TTasOrderSale.Sb_search_productClick(Sender: TObject);
begin
  Ly_quick_search_product.Visible := True;
  Ly_list_titlle_product.Visible := False;
  E_Search_product.SetFocus;

end;

procedure TTasOrderSale.Sb_tab_01Click(Sender: TObject);
begin
  inherited;
  callinsItem(sender);
end;

procedure TTasOrderSale.Sb_tab_03Click(Sender: TObject);
begin
  inherited;
  callinsItem(sender);
end;

procedure TTasOrderSale.Sb_tab_04Click(Sender: TObject);
begin
  inherited;
  callinsItem(sender);
end;

procedure TTasOrderSale.Sb_tab_05Click(Sender: TObject);
begin
  inherited;
  callinsItem(sender);
end;

procedure TTasOrderSale.Sb_tab_06Click(Sender: TObject);
begin
  inherited;
  callinsItem(sender);
end;

procedure TTasOrderSale.Sb_tab_07Click(Sender: TObject);
begin
  inherited;
  callinsItem(sender);
end;

procedure TTasOrderSale.Search;
begin

end;



procedure TTasOrderSale.SetPriceSelectedProduto(IdProduct: Integer);
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
      Sb_tab_01.Text :=FloatToStrF(LcPrice.Registro.Preco,ffFixed,10,2)
    else
      Sb_tab_01.Text := '0,00';

    //TAbela codigo 2 é de promoção do Sistema Gestão

    LcPrice.Registro.Tabela := 3;
    LcPrice.getByKey;
    if LcPrice.exist then
      Sb_tab_03.Text :=FloatToStrF(LcPrice.Registro.Preco,ffFixed,10,2)
    else
      Sb_tab_03.Text := '0,00';

    LcPrice.Registro.Tabela := 4;
    LcPrice.getByKey;
    if LcPrice.exist then
      Sb_tab_04.Text :=FloatToStrF(LcPrice.Registro.Preco,ffFixed,10,2)
    else
      Sb_tab_04.Text := '0,00';

    LcPrice.Registro.Tabela := 5;
    LcPrice.getByKey;
    if LcPrice.exist then
      Sb_tab_05.Text :=FloatToStrF(LcPrice.Registro.Preco,ffFixed,10,2)
    else
      Sb_tab_05.Text := '0,00';

    LcPrice.Registro.Tabela := 6;
    LcPrice.getByKey;
    if LcPrice.exist then
      Sb_tab_06.Text :=FloatToStrF(LcPrice.Registro.Preco,ffFixed,10,2)
    else
      Sb_tab_06.Text := '0,00';

    LcPrice.Registro.Tabela := 7;
    LcPrice.getByKey;
    if LcPrice.exist then
      Sb_tab_07.Text :=FloatToStrF(LcPrice.Registro.Preco,ffFixed,10,2)
    else
      Sb_tab_07.Text := '0,00';

  Finally
    LcPrice.DisposeOf;
  End;
end;

procedure TTasOrderSale.SetVariable;
begin
  if CodigoRegistro > 0 then
  Begin
    OrderSale.Registro.Estabelecimento  := UMM.GInstitution.Registro.Codigo;
    OrderSale.Registro.Codigo           := CodigoRegistro;
    OrderSale.Registro.Terminal         := GbTerminal;
    OrderSale.Registro.Vendedor         := GbSalesMan;
    OrderSale.getAllLevelOne;

    OrderSale.MCustomer.Registro.Codigo := OrderSale.Registro.Cliente;
    OrderSale.MCustomer.Registro.Estabelecimento := OrderSale.Registro.Estabelecimento;
    OrderSale.MCustomer.getAllByKey;
  End;
  MontaComboFormaPagamento;
  if ( CodigoRegistro > 0 ) then
  Begin
    ShowData;
  End
  else
  Begin
    ShowNoData;
  End;
  inherited;
end;

procedure TTasOrderSale.ShowData;
begin
  inherited;
  with OrderSale do
  Begin
    E_numero_pedido.Text := concat('Número do Pedido: ',Registro.Numero.ToString);
    E_valor_pedido.Text  := concat('Valor  do Pedido: ',
                              FloatToStrF(MTotalizer.Registro.ValorTotal,ffNumber,10,2)
                            );

    if Trim(MCustomer.MFiscal.Registro.NomeRazao)<> '' then
    Begin
      E_customer_name.Text :=  MCustomer.MFiscal.Registro.NomeRazao;
      E_customer_nick.Text :=  MCustomer.MFiscal.Registro.ApelidoFantasia;
    End
    else
      E_customer_name.Text := 'Selecione o cliente.';

    getListOrderItems;
    //Lista Visual
    FillListOrderItems( OrderSale.Mitems.CollListaSpl );

    if OrderSale.Mitems.CollListaSpl.Count > 0 then
      Lb_selected_products.Text := concat('Selecionado(s) : ',
                                              OrderSale.Mitems.CollListaSpl.Count.ToString
                                  )
    else
      Lb_selected_products.Text := 'Selecione os itens do pedido';
    E_installment.Text := Copy(OrderSale.MBilling.Registro.Prazo,7,Length(OrderSale.MBilling.Registro.Prazo)-6);
    if OrderSale.MBilling.Registro.FormaPagamento > 0 then
    Begin
      Cb_payment_type.ItemIndex := getFormaPagamentoPosition(OrderSale.MBilling.Registro.FormaPagamento);
      ShowFormaPagamento(MPaymentType.Lista[Cb_payment_type.ItemIndex].Descricao);
    End;
    if OrderSale.MBilling.Registro.Parcelas ='0' then
      rb_vista.IsChecked := True
    else
      RB_prazo.IsChecked := True;
    Sp_plots.Text := OrderSale.MBilling.Registro.Parcelas;


    M_Obs.Text := MOrder.Registro.Observacao ;
  End;
end;

procedure TTasOrderSale.ShowFormaPagamento(Descricao:String);
Var
  LcPrazo : String;

begin
  if Cb_payment_type.ItemIndex >= 0 then
  BEgin
    if rb_vista.IsChecked then
      LcPrazo := 'À VISTA'
    else
      if E_installment.Text <> '' then
        LcPrazo := E_installment.Text
      else
        LcPrazo := 'À PRAZO';

    E_payment_types.Text := concat('Forma : ',
                                    Descricao,' - ',
                                    LcPrazo)
  End
  else
    E_payment_types.Text := 'Informe os dados de pagamentos';

end;

procedure TTasOrderSale.ShowNoData;
begin
  E_numero_pedido.Text  := 'Número Pedido:';
  E_valor_pedido.Text   := 'Valor do Pedido : 0,00';
  E_customer_name.Text := 'Selecione o cliente.';
  Lb_selected_products.Text := 'Selecione os itens do pedido';
  E_payment_types.Text := 'Informe os dados de pagamentos';
end;

procedure TTasOrderSale.SpeedButton1Click(Sender: TObject);
begin
  inherited;
  ChangeTabOrder.ExecuteTarget(Self);
end;

procedure TTasOrderSale.Sp_payment_oder_backClick(Sender: TObject);
begin
  inherited;
  if validateFormaPagto then
  Begin
    ShowFormaPagamento(Cb_payment_type.Selected.Text);
    ChangeTabOrder.ExecuteTarget(Self);
  End;
end;

procedure TTasOrderSale.Sp_QtdeEnter(Sender: TObject);
begin
  inherited;
  TSpinBox(Sender).SelectAll;
end;

function TTasOrderSale.ValidaImprimeOrdem: Boolean;
begin
  REsult := True;
  if not validateSave then
  BEgin
    Result := False;
    exit;
  End;

  if OrderSale.Registro.Codigo = 0 then
  BEgin
    TDialogService.ShowMessage(
            Concat('A T E N Ç Ã O!',
                   Char(10),Char(13),
                   Char(10),Char(13),
                   'Pedido não encontrado.',
                   Char(10),Char(13),
                   'Verifique e tente novamente.'));
    Result := False;
    exit;

  End;

end;

function TTasOrderSale.validateaddOrderItem: Boolean;
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

function TTasOrderSale.validatecallinsItem(pValor : REal): Boolean;
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

function TTasOrderSale.validateFormaPagto: Boolean;
begin
  Result := True;
  if not ((Cb_payment_type.Selected <> nil) and (Cb_payment_type.Selected.Text <> '')) then
  begin
    TDialogService.ShowMessage(
            Concat('A T E N Ç Ã O!',
                   Char(10),Char(13),
                   Char(10),Char(13),
                   'Campo Forma de pagamento não informado.',
                   Char(10),Char(13),
                   'Preencha o campo para continuar'));
    Result := False;
    exit;
  end;
end;

function TTasOrderSale.validateSave: Boolean;
begin
  Result := True;
  if OrderSale.Registro.Cliente = 0 then
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

  if not validateFormaPagto then
  Begin
    Result := False;
    exit;
  End;

end;

end.





