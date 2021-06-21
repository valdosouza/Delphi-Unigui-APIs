unit tas_order;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, base_registry, Vcl.Menus, uniMainMenu,
  uniButton, uniBitBtn, uniSpeedButton, uniGUIBaseClasses, uniGUIClasses,
  uniPanel, uniEdit, uniDateTimePicker, uniLabel, unmessages, msg_form, ControllerOrder,
  MainModule, uniMemo, Datasnap.DBClient,ControllerOrderItem,Data.DB,
  tblOrderItem,fm_payment_type,fm_carrier,fm_address_delivery, fm_entity_fiscal,
  fm_situation, fm_installment_open, fm_shipping, ControllerOrderItemdetail;

type
  TTasOrder = class(TBaseRegistry)
    Sb_Invoice: TUniSpeedButton;
    Sb_print: TUniSpeedButton;

    procedure setImages;Override;
    procedure Sb_InvoiceClick(Sender: TObject);
    procedure Sb_printClick(Sender: TObject);
  private
    { Private declarations }

  protected
    OrderItems : TControllerOrderItem;
    FrPaymentType     : TfmPaymentType;
    FrCarrier         : TfmCarrier;
    frAdressDelivery  : TFmAdressDelivery;
    frEntityFiscal    : TFmEntityFiscal;
    FrSituation       : TfmSituation;
    FrInstallmentOpen : TFmInstallmentOpen;
    FrShipping        : TFmShipping;

    procedure InitVariable;Override;
    procedure ShowPaymentType(Parente:TWinControl);
    procedure ShowSituation(Parente:TWinControl);
    procedure ShowShipping(Parente:TWinControl);
    procedure ShowCarrier(Parente:TWinControl);
    procedure ShowAdressDelivery(Parente:TWinControl);
    procedure ShowEntityFiscal(Parente:TWinControl);Virtual;
    procedure ShowInstallmentOpen(Parente:TWinControl);

    procedure ShowDatalisttItems( cds_Items : TClientDataSet; order_id:Integer);Virtual;


    procedure SaveOrderItems(cds_items : TClientDataSet; order_id:Integer);Virtual;

    procedure DeletedItems(cds_Items : TClientDataSet; order_id:Integer);

    //Validações;
    function hasOrderItems(cds_Items : TClientDataSet):Boolean;
    function hasInvoice(ord:Integer): Boolean;
    function validateHasInvoice(ord:Integer): Boolean;
    function validateHasNotInvoice(ord:Integer): Boolean;
    function UpdateStatusItemDetail(Order_Id,Item_Id : Integer; status:String):Boolean;

    function validatePrintOrder:Boolean;Virtual;
    procedure printOrder;Virtual;

    function validateInvoice:Boolean;Virtual;
    procedure toInvoice;Virtual;


  public
    { Public declarations }
  end;

var
  TasOrder: TTasOrder;

implementation


{$R *.dfm}

uses ControllerOrderJobScope;

{ TCadOrder }

procedure TTasOrder.DeletedItems(cds_Items : TClientDataSet; order_id:Integer);
Var
  LcOperacao : String;
  cds_temp : TClientDataSet;
begin
  if cds_items.ChangeCount > 0 then
  Begin
    Try
      cds_temp := TClientDataSet.Create(nil);
      cds_temp.Data := cds_items.Delta;
      cds_temp.First;
      cds_items.First;
      //Trata somente os dados deletados
      while not cds_temp.eof do
      Begin
        with OrderItems do
        Begin
          if cds_temp.UpdateStatus = usDeleted then
          Begin
            //Detalhe
            Detalhes.Registro.Codigo               := cds_Temp.FieldByName('id').AsInteger;
            Detalhes.Registro.Estabelecimento      := UMM.GInstitution.registro.Codigo;
            Detalhes.Registro.Ordem                := order_id;
            Detalhes.delete;

            //Items
            Registro.Codigo              := cds_Temp.FieldByName('id').AsInteger;
            Registro.Estabelecimento     := UMM.GInstitution.registro.Codigo;
            Registro.Ordem               := order_id;
            OrderItems.delete;
          End;


        End;
        cds_temp.Next;
      end;
    Finally
      cds_temp.Close;
      cds_temp.DisposeOf;
    End;
  End;
end;

procedure TTasOrder.setImages;
begin
  inherited;
  buttonIcon(Sb_print,'print.bmp');
  buttonIcon(Sb_Invoice,'confirm.bmp');
end;

function TTasOrder.ValidateInvoice: boolean;
begin
  Result := True;

end;

function TTasOrder.validatePrintOrder: Boolean;
begin
  Result := True;

end;

procedure TTasOrder.ShowAdressDelivery(Parente:TWinControl);
begin
  frAdressDelivery := TFmAdressDelivery.Create(PArente);
  frAdressDelivery.Parent := Parente;
  frAdressDelivery.listar;
  frAdressDelivery.Align := alClient;
  frAdressDelivery.Show;
end;

procedure TTasOrder.ShowCarrier(Parente:TWinControl);
begin
  FrCarrier := TFmCarrier.Create(PArente);
  FrCarrier.Parent := Parente;
  FrCarrier.listar;
  FrCarrier.Align := alClient;
  FrCarrier.Show;
end;

procedure TTasOrder.ShowDatalisttItems( cds_Items : TClientDataSet; order_id:Integer);
Var
  I : Integer;
begin
  TRy
    with cds_items  do
    Begin
      if not Active then CreateDataSet;
      cds_items.LogChanges := False;
      cds_items.EmptyDataSet;
      for I := 0 to OrderItems.Lista.Count - 1 do
      Begin
        Append;
        FieldByName('id').AsInteger                 := OrderItems.Lista[I].Codigo;
        FieldByName('tb_institution_id').AsInteger  := OrderItems.Lista[I].Estabelecimento;
        FieldByName('tb_order_id').AsInteger        := OrderItems.Lista[I].Ordem;
        FieldByName('tb_product_id').AsString       := IntToStr( OrderItems.Lista[I].Produto );
        FieldByName('tb_stock_list_id').AsInteger   := OrderItems.Lista[I].Estoque;
        FieldByName('quantity').AsFloat             := OrderItems.Lista[I].Quantidade;
        FieldByName('unit_value').AsFloat           := OrderItems.Lista[I].ValorUnitario;
        FieldByName('discount_value').AsFloat       := OrderItems.Lista[I].ValorDesconto;
        FieldByName('discount_aliquot').AsFloat     := OrderItems.Lista[I].AliquotaDesconto;
        //dados dos Produtos
        OrderItems.Mercadoria.Produto.Registro.Codigo := OrderItems.Lista[I].Produto;
        OrderItems.Mercadoria.Produto.Registro.Estabelecimento := OrderItems.Lista[I].Estabelecimento;
        OrderItems.Mercadoria.Produto.getByKey;
        FieldByName('codepro').AsInteger := OrderItems.Mercadoria.Produto.Registro.Codigo ;
        FieldByName('identifier').AsString := OrderItems.Mercadoria.Produto.Registro.Identificador;
        FieldByName('description').AsString := concat( Format('%3.3d',[FieldByName('codepro').AsInteger]),
                                                      ' - ' ,
                                                      OrderItems.Mercadoria.Produto.Registro.Descricao);
        //dados da mercadoria
        OrderItems.Mercadoria.Registro.Codigo := OrderItems.Lista[I].Produto;
        OrderItems.Mercadoria.Registro.Estabelecimento := OrderItems.Lista[I].Estabelecimento;
        OrderItems.Mercadoria.getByKey;
        FieldByName('composition').AsString := OrderItems.Mercadoria.Registro.TipoComposicao;
        //Detalhes
        OrderItems.detalhes.Registro.Estabelecimento := OrderItems.Lista[I].Estabelecimento;
        OrderItems.detalhes.Registro.Ordem := OrderItems.Lista[I].Ordem;
        OrderItems.detalhes.Registro.Codigo := OrderItems.Lista[I].Codigo;
        OrderItems.detalhes.getByKey;
//        FieldbyName('work_front').AsString := OrderItems.detalhes.Registro.FrenteTrabalho;
        FieldbyName('note').AsString := OrderItems.detalhes.Registro.Detalhes;
//        FieldbyName('status').AsString := OrderItems.detalhes.Registro.Status;
        Post;
      End;
    End;
  Finally
    cds_items.LogChanges := True;
  End;
end;

procedure TTasOrder.ShowEntityFiscal(Parente:TWinControl);
begin
  frEntityFiscal := TFmEntityFiscal.Create(Parente);
  frEntityFiscal.Parent := Parente;
  frEntityFiscal.Align := alClient;
  frEntityFiscal.Listar;
  frEntityFiscal.Show;
end;

procedure TTasOrder.ShowInstallmentOpen(Parente: TWinControl);
begin
  FrInstallmentOpen := TFmInstallmentOpen.Create(Parente);
  FrInstallmentOpen.Parent := Parente;
  FrInstallmentOpen.Align := alClient;
  FrInstallmentOpen.Show;
end;

procedure TTasOrder.ShowPaymentType(Parente:TWinControl);
begin
  FrPaymentType := TfmPaymentType.Create(Parente);
  FrPaymentType.Parent := Parente;
  FrPaymentType.listar;
  FrPaymentType.Align := alClient;
  FrPaymentType.Show;
end;

procedure TTasOrder.ShowShipping(Parente:TWinControl);
begin
  FrShipping := TFmShipping.Create(Parente);
  FrShipping.Parent := Parente;
  FrShipping.Align := alClient;
  FrShipping.Show;
end;

procedure TTasOrder.ShowSituation(Parente:TWinControl);
begin
  FrSituation := TFmSituation.Create(Parente);
  FrSituation.Parent := Parente;
  FrSituation.Listar;
  FrSituation.Align := alClient;
  FrSituation.Show;
end;

procedure TTasOrder.toInvoice;
begin
//
end;

function TTasOrder.UpdateStatusItemDetail(Order_Id,Item_Id: Integer; status:String): Boolean;
Var
  LCItemDetail : TControllerOrderItemDetail;
begin
  Try
    LCItemDetail := TControllerOrderItemDetail.Create(nil);
    with LCItemDetail do
    Begin
      Registro.Estabelecimento := UMM.GInstitution.registro.Codigo;
      Registro.Codigo := Item_Id;
      Registro.Ordem := Order_Id;
//      Registro.Status:= status;
    End;
//    LCItemDetail.updateStatus;
  Finally
    LCItemDetail.DisposeOf;
  End;
end;

function TTasOrder.hasInvoice(ord:Integer): Boolean;
Var
  LcOrder : TControllerOrder;
begin
  try
    Result := false;
    LcOrder := TControllerOrder.Create(nil);
    LcOrder.Registro.Codigo := ord;
    LcOrder.Registro.Estabelecimento := UMM.GInstitution.registro.Codigo;
    Result := ( LcOrder.getStatus = 'F');
  finally
    LcOrder.DisposeOf;
  end;
end;

function TTasOrder.validateHasInvoice(ord: Integer): Boolean;
begin
  Result := True;
  if not hasInvoice(ord) then
  Begin
    MensageAlert(['A T E N Ç Ã O!.',
                  '',
                  'Este registro ainda não foi baixado.',
                  'Está operação não é permitida.']);
    Result := false;
  End;

end;

function TTasOrder.ValidatehasNotInvoice(ord:Integer): Boolean;
begin
  Result := True;
  if hasInvoice(ord) then
  Begin
    MensageAlert(['A T E N Ç Ã O!.',
                  '',
                  'Este registro já foi baixado.',
                  'Está operação não é permitida.']);
    Result := false;
  End;
end;

function TTasOrder.hasOrderItems(cds_Items : TClientDataSet): Boolean;
begin
  Result := True;
  if (cds_Items.RecordCount = 0 ) then
  Begin
    MensageAlert(['A T E N Ç Ã O!.',
                  '',
                  'Não há items na lista.',
                  'Impossível continuar.']);
    Result := False;
    exit;
  End;
end;

procedure TTasOrder.InitVariable;
begin
  inherited;
  OrderItems := TControllerOrderItem.Create(Self);
end;

procedure TTasOrder.printOrder;
begin
  //
end;

procedure TTasOrder.SaveOrderItems(cds_Items : TClientDataSet; order_id:Integer);
Var
  LcOperacao : String;
begin
  DeletedItems(cds_items, order_id);
  if cds_items.ChangeCount > 0 then
  Begin
    Try
      cds_items.First;
      //Trata somente os dados Inseridos ou Alterados
      while not cds_items.eof do
      Begin
        with OrderItems do
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
            usModified: OrderItems.update;
            usInserted: OrderItems.insert;
          end;
        End;
        with OrderItems.Detalhes do
        Begin
          Registro.Codigo           := OrderItems.Registro.Codigo;
          Registro.Estabelecimento  := UMM.GInstitution.registro.Codigo;
          Registro.Ordem            := order_id;
//          Registro.FrenteTrabalho   := cds_items.FieldByName('work_front').AsString;
          Registro.Detalhes         := cds_items.FieldByName('note').AsString;
//          Registro.DataPrevista     := cds_items.FieldByName('dt_forecast').AsDateTime;
          case cds_items.UpdateStatus of
            usModified: OrderItems.Detalhes.update;
            usInserted: OrderItems.Detalhes.insert;
          end;
        End;
        cds_items.next;
      End;
    Finally
      cds_items.MergeChangeLog;
    End;

  End;
end;


procedure TTasOrder.Sb_InvoiceClick(Sender: TObject);
begin
  if validateInvoice then
    ToInvoice;
end;

procedure TTasOrder.Sb_printClick(Sender: TObject);
begin
  if validatePrintOrder then
    printOrder;

end;

end.
