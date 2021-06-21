unit tas_copy_invoice;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, base_form, uniGUIBaseClasses,
  uniGUIClasses, uniPanel, uniButton, uniBitBtn, uniSpeedButton, uniRadioGroup,
  uniLabel, uniMultiItem, uniComboBox, uniEdit, Controllerinvoice, UnFunctions,
  unMessages, ControllerOrderPurchase, ControllerOrderPacking,
  ControllerOrderJob, ControllerOrderSale, ControllerOrderProduction,
  ControllerOrderStockAdjust, ControllerOrderStockTransfer, Main, MainModule,
  Datasnap.DBClient, ControllerOrderItem, tblOrderItem, Vcl.Menus, uniMainMenu,
  Data.DB;

type
  TTasCopyInvoice = class(TBaseForm)
    UniPanel1: TUniPanel;
    UniPanel2: TUniPanel;
    Sb_Confirm: TUniSpeedButton;
    Sb_Abort: TUniSpeedButton;
    cb_kind_operation: TUniComboBox;
    UniLabel1: TUniLabel;
    Rg_kind_Doc: TUniRadioGroup;
    UniLabel5: TUniLabel;
    E_Nr_Documento: TUniEdit;
    procedure initVariable;Override;
    procedure setImages;Override;

    procedure Rg_kind_DocClick(Sender: TObject);
    procedure Sb_ConfirmClick(Sender: TObject);
    procedure Sb_AbortClick(Sender: TObject);
  private
    { Private declarations }
    //COMPRA
    ord_purchase : TControllerOrderPurchase;
    //VENDA
    ord_sale : TControllerOrderSale;
    //AJUSTES
    ord_stock_adjust : TControllerOrderStockAdjust;
    //ROMANEIO
    ord_packing : TControllerOrderpacking;
    //TRANSFERÊNCIA
    ord_stock_transfer : TControllerOrderStockTransfer;
    //PRODUÇÃO
    ord_production : TControllerOrderProduction;
    //ENGENHARIA
    ord_job : TControllerOrderJob;
    //NOTA FISCAL
    invoice : TControllerInvoice;

    procedure feedKindStatement;
    procedure ordMessage(msg: String);
    procedure copyItems(order_id:Integer);

    //COMPRA
    function validateCopyPurchase:Boolean;
    procedure copyPurchase;
    //VENDA
    function validateCopySale:Boolean;
    procedure copySale;
    //AJUSTES
    function validateCopyStock_adjust:Boolean;
    procedure copyStock_adjust;
    //ROMANEIO
    function validateCopy_packing:Boolean;
    procedure copy_packing;
    //TRANSFERÊNCIA
    function validateCopyStock_transfer:Boolean;
    procedure copyStock_transfer;
    //PRODUÇÃO
    function validateCopyProduction:Boolean;
    procedure copyProduction;
    //ENGENHARIA
    function validateCopyJob:Boolean;
    procedure copyJob;
    //Notas fiscal
    function validateInvoice:Boolean;
    procedure copyInvoice;


    function validateCopy:Boolean;
    procedure setCopy;
  public
    { Public declarations }
    cds_items: TClientDataSet;
  end;

var
  TasCopyInvoice: TTasCopyInvoice;

implementation

{$R *.dfm}

procedure TTasCopyInvoice.copyInvoice;
begin
  copyItems(invoice.Registro.Codigo);
end;

procedure TTasCopyInvoice.copyItems(order_id: Integer);
Var
  LcItems : TControllerOrderItem;
  Registro : TOrderItem;
  I : Integer;
begin
  LcItems := TControllerOrderItem.Create(self);
  LcItems.Registro.Estabelecimento := UMM.GInstitution.registro.Codigo;
  LcItems.Registro.Ordem := order_id;
  LcItems.getList;
  if not cds_items.Active then cds_items.CreateDataSet;
  with cds_items  do
  Begin
    cds_items.EmptyDataSet;
    for I := 0 to LcItems.Lista.Count - 1 do
    Begin
      Registro := LcItems.Lista[I];
      append;
      FieldByName('codepro').AsInteger             := Registro.Produto;
      //busca os dados do produto
        LcItems.Mercadoria.Produto.Registro.Estabelecimento := Registro.Estabelecimento;
        LcItems.Mercadoria.Produto.Registro.Codigo          := Registro.Produto;
        LcItems.Mercadoria.Produto.getByKey;
      FieldByName('identifier').AsString          := LcItems.Mercadoria.Produto.Registro.Identificador;
      FieldByName('description').AsString         := LcItems.Mercadoria.Produto.Registro.Descricao;
      FieldByName('id').AsInteger                 := 0;
      FieldByName('tb_institution_id').AsInteger  := UMM.GInstitution.registro.Codigo;
      FieldByName('tb_order_id').AsInteger        := order_id;
      FieldByName('tb_product_id').AsInteger       := LcItems.Mercadoria.Produto.Registro.Codigo;
      FieldByName('tb_stock_list_id').AsInteger   := Registro.Estoque;
      FieldByName('quantity').AsFloat             := Registro.Quantidade;
      FieldByName('unit_value').AsFloat           := Registro.ValorUnitario;
      FieldByName('discount_aliquot').AsFloat     := Registro.AliquotaDesconto;
      FieldByName('discount_value').AsFloat       := Registro.ValorDesconto;
      Post;
    End;

  End;
  FreeAndNil(LcItems);
end;

procedure TTasCopyInvoice.copyJob;
begin
  copyItems(ord_job.Registro.Codigo);
end;

procedure TTasCopyInvoice.copyProduction;
begin
  copyItems(ord_production.Registro.Codigo);
end;

procedure TTasCopyInvoice.copyPurchase;
begin
  copyItems(ord_purchase.Registro.Codigo);
end;

procedure TTasCopyInvoice.copySale;
begin
  copyItems(ord_sale.Registro.Codigo);
end;

procedure TTasCopyInvoice.copyStock_adjust;
begin
  copyItems(ord_stock_adjust.Registro.Codigo);
end;

procedure TTasCopyInvoice.copy_packing;
begin
  copyItems(ord_packing.Registro.Codigo);
end;

procedure TTasCopyInvoice.copyStock_transfer;
begin
  copyItems(ord_stock_transfer.Registro.Codigo);
end;

procedure TTasCopyInvoice.feedKindStatement;
begin
  cb_kind_operation.Items.Clear;
  if Rg_kind_Doc.ItemIndex = 0 then
  Begin
    cb_kind_operation.Items.Add('COMPRA');
    cb_kind_operation.Items.Add('VENDA');
    cb_kind_operation.Items.Add('AJUSTES');
    cb_kind_operation.Items.Add('ROMANEIO');
    cb_kind_operation.Items.Add('TRANSFERÊNCIA');
    cb_kind_operation.Items.Add('PRODUÇÃO');
    cb_kind_operation.Items.Add('ENGENHARIA');
  End
  else
  Begin
    cb_kind_operation.Items.Add('NOTA FISCAL PRÓPRIA');
    cb_kind_operation.Items.Add('NOTA FISCLA TERCEIRO');
  End;
  cb_kind_operation.ItemIndex := 0;
end;

procedure TTasCopyInvoice.initVariable;
begin
  inherited;
  //
end;

procedure TTasCopyInvoice.ordMessage(msg: String);
begin
  MensageAlert(['A T E N Ç Ã O!.',
                '',
                msg,
                'Não é possível prosseguir com a cópia',
                'Verifique e tente novamente']);
end;

procedure TTasCopyInvoice.Rg_kind_DocClick(Sender: TObject);
begin
  feedKindStatement;
end;

procedure TTasCopyInvoice.Sb_AbortClick(Sender: TObject);
begin
  inherited;
  Close;
end;

procedure TTasCopyInvoice.Sb_ConfirmClick(Sender: TObject);
begin
  if validateCopy then
  Begin
    setCopy;
    Close;
  End;
end;

procedure TTasCopyInvoice.setCopy;
begin
  if Rg_kind_Doc.ItemIndex =0 then
  Begin
    case cb_kind_operation.ItemIndex of
      //COMPRAS
      0:CopyPurchase;
      //VENDA
      1:CopySale;
      //AJUSTES
      2:CopyStock_adjust;
      //ROMANEIO
      3:Copy_packing;
      //TRANSFERÊNCIA
      4:CopyStock_transfer;
      //PRODUÇÃO
      5:CopyProduction;
      //ENGENHARIA
      6:CopyJob;
    end;
  End
  else
  Begin
    copyInvoice;
  End;
end;

procedure TTasCopyInvoice.setImages;
begin
  inherited;
  buttonIcon(SB_Confirm,'confirm.bmp');
  buttonIcon(SB_Abort,'abort.bmp');
end;


function TTasCopyInvoice.validateCopy: Boolean;
Var
  Lc_Texto:String;
begin
  Result:= true;
  if TRIM(E_Nr_Documento.Text) ='' then
  Begin
    MensageAlert(['A T E N Ç Ã O!.',
                 '',
                 'Preencha com número válido.',
                 'para copiar os itens']);
    Result:=False;
    Exit;
  end;

  if Rg_kind_Doc.ItemIndex =0 then
  Begin
    case cb_kind_operation.ItemIndex of
      //COMPRAS
      0:Result := validateCopyPurchase;
      //VENDA
      1:Result := validateCopySale;
      //AJUSTES
      2:Result := validateCopyStock_adjust;
      //ROMANEIO
      3:Result := validateCopy_packing;
      //TRANSFERÊNCIA
      4:Result := validateCopyStock_transfer;
      //PRODUÇÃO
      5:Result := validateCopyProduction;
      //ENGENHARIA
      6:Result := validateCopyJob;
    end;
    //Valida resultado do case
    if not result then
    Begin
      Result:=False;
      Exit;
    End;
  End
  else
  Begin
    validateInvoice;
  End;
end;

function TTasCopyInvoice.validateCopyJob: Boolean;
begin
  Result := true;
  ord_job := TControllerOrderJob.Create(self);
  with ord_job do
  Begin
    Registro.Estabelecimento :=  UMM.GInstitution.registro.Codigo;
    Registro.Numero := StrToIntDef( E_Nr_Documento.Text,0 );
    if not getNumber then
    Begin
      ordMessage('Número do pedido de engenharia não encontrado.');
      Result := False;
    End;
  End;
end;

function TTasCopyInvoice.validateCopyProduction: Boolean;
begin
  Result := true;
  ord_production := TControllerOrderProduction.Create(self);
  with ord_production do
  Begin
    Registro.Estabelecimento :=  UMM.GInstitution.registro.Codigo;
    Registro.Numero := StrToIntDef( E_Nr_Documento.Text,0 );
    if not getNumber then
    Begin
      ordMessage('Número do pedido de produção não encontrado.');
      Result := False;
    End;
  End;

end;

function TTasCopyInvoice.validateCopyPurchase: Boolean;
begin
  Result := true;
  ord_purchase := TControllerOrderPurchase.Create(self);
  with ord_purchase do
  Begin
    Registro.Estabelecimento :=  UMM.GInstitution.registro.Codigo;
    Registro.Numero := StrToIntDef( E_Nr_Documento.Text,0 );
    if not getNumber then
    Begin
      ordMessage('Número do pedido de compra não encontrado.');
      Result := False;
    End;
  End;
end;

function TTasCopyInvoice.validateCopySale: Boolean;
begin
  Result := true;
  ord_sale := TControllerOrderSale.Create(self);
  with ord_sale do
  Begin
    Registro.Estabelecimento :=  UMM.GInstitution.registro.Codigo;
    Registro.Numero := StrToIntDef( E_Nr_Documento.Text,0 );
    if not getNumber then
    Begin
      ordMessage('Número do pedido de compra não encontrado.');
      Result := False;
    End;
  End;

end;

function TTasCopyInvoice.validateCopyStock_adjust: Boolean;
begin
  Result := true;
  ord_stock_adjust := TControllerOrderStockAdjust.Create(self);
  with ord_stock_adjust do
  Begin
    Registro.Estabelecimento :=  UMM.GInstitution.registro.Codigo;
    Registro.Numero := StrToIntDef( E_Nr_Documento.Text,0 );
    if not getNumber then
    Begin
      ordMessage('Número do pedido de ajuste de estoque não encontrado.');
      Result := False;
    End;
  End;
end;

function TTasCopyInvoice.validateCopy_packing: Boolean;
begin
  Result := true;
  ord_packing := TControllerOrderpacking.Create(self);
  with ord_packing do
  Begin
    Registro.Estabelecimento :=  UMM.GInstitution.registro.Codigo;
    Registro.Numero := StrToIntDef( E_Nr_Documento.Text,0 );
    if not getNumber then
    Begin
      ordMessage('Número do romaneio não encontrado.');
      Result := False;
    End;
  End;
end;

function TTasCopyInvoice.validateCopyStock_transfer: Boolean;
begin
  Result := true;
  ord_stock_transfer := TControllerOrderStockTransfer.Create(self);
  with ord_stock_transfer do
  Begin
    Registro.Estabelecimento :=  UMM.GInstitution.registro.Codigo;
    Registro.Numero := StrToIntDef( E_Nr_Documento.Text,0 );
    if not getNumber then
    Begin
      ordMessage('Número do pedido de transferência não encontrado.');
      Result := False;
    End;
  End;

end;

function TTasCopyInvoice.validateInvoice: Boolean;
begin
  Result := true;
  Result := True;
  invoice := TControllerInvoice.Create(Self);
  invoice.Registro.Estabelecimento := UMM.GInstitution.registro.Codigo;
  if cb_kind_operation.ItemIndex = 0 then
    invoice.Registro.Emitente := UMM.GInstitution.registro.Codigo
  else
    invoice.Registro.Emitente := 0;

  invoice.Registro.Numero := E_Nr_Documento.Text;
  if not invoice.getNfeNumber then
  Begin
    ordMessage('Número de nota fical não encontrado.');
    Result := False;
  End;
end;

end.
