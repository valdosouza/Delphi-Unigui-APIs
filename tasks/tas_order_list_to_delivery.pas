unit tas_order_list_to_delivery;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, base_list_Registry, Data.DB,
  Datasnap.DBClient, Vcl.Menus, uniMainMenu, uniGUIClasses, uniBasicGrid,
  uniDBGrid, uniButton, uniBitBtn, uniSpeedButton, uniGUIBaseClasses, uniPanel, ControllerOrderToDeliver,
  uniMultiItem, uniComboBox, uniDBComboBox, uniDBLookupComboBox, tblOrderToDeliver,
  uniEdit, ControllerStockList;

type
  TTasOrderListToDelivery = class(TBaseListRegistry)
    UniHiddenPanel1: TUniHiddenPanel;
    DBLCB_Lista: TUniDBLookupComboBox;
    cds_Itemstb_order_id: TIntegerField;
    cds_Itemsdescription: TStringField;
    cds_Itemsquantity: TFloatField;
    cds_ItemsSelected: TStringField;
    cds_Itemstb_stock_list_id: TIntegerField;
    cds_Itemstb_order_item_id: TIntegerField;
    cds_Itemsstock_name: TStringField;
    cds_Itemsorder_to_deliver_id: TIntegerField;
    cds_Itemsunit_value: TFloatField;
    cds_Itemsrefer_doc: TStringField;
    e_refer_doc: TUniEdit;
    cds_Itemstb_product_id: TIntegerField;
    cds_Itemsid: TIntegerField;
    cds_Itemstb_institution_id: TIntegerField;
    cds_Itemsdt_record: TDateField;
    cds_Itemsstatus: TStringField;

    procedure InitVariable;Override;
    procedure SetVariable;Override;
    procedure FormatScreen;Override;
    procedure ShowData;Override;
    procedure UpdateItems;
    procedure InsertItens;
    procedure Execute;
    procedure DeleteItens;
    Function  ValidateExecute:boolean;
    procedure SB_SaveClick(Sender: TObject);
    procedure dbg_listSetCellValue(Sender: TObject; ACol, ARow: Integer;
      AField: TField; var Value: Variant);
    procedure SB_ChangeClick(Sender: TObject);
  private
    { Private declarations }
    procedure FormatGrid;
  public
    { Public declarations }
    OrderToDelivery : TControllerOrderToDeliver;
    cds_temp: TClientDataSet;
    procedure ShowDataList;
  end;

var
  TasOrderListToDelivery: TTasOrderListToDelivery;

implementation

{$R *.dfm}

uses MainModule, unMessages, msg_form;



procedure TTasOrderListToDelivery.dbg_listSetCellValue(Sender: TObject; ACol,
  ARow: Integer; AField: TField; var Value: Variant);
Var
  LcIn_aux:Integer;
  LcVl_aux : Real;
begin
  if (Acol = 4) then
  BEgin
    //Codigo do Estoque ela DBlooxUp
    if (Length(value) > 0) then
    Begin
      LcIn_aux := pos(' ',Value) - 1;
      cds_Items.Edit;
      cds_Itemstb_stock_list_id.AsString := Copy(Value,1,LcIn_aux);
      //LcIn_aux := LcIn_aux + 2;
      //cds_cfopintCfop.AsString := Copy(Value,LcIn_aux,(Length(Value) -LcIn_aux));
      cds_Itemsstock_name.AsString := Copy(Value,1,45);
      cds_Items.Post;
    End;
  End;
  if (Acol = 8) then
  BEgin
    //Codigo do Estoque ela DBlooxUp
    if (Length(value) > 0) then
    Begin
      cds_Items.Edit;
      cds_Itemsrefer_doc.AsString := Value;
      cds_Items.Post;
    End;
  End;
end;

procedure TTasOrderListToDelivery.DeleteItens;
begin


  cds_Items.first;
  while not cds_Items.eof do
  begin
    if cds_Items.FieldByName('selected').AsString = 'S' then
    begin
      cds_items.Delete;
    end;
    cds_Items.next
  end;

    cds_Items.Active := False;

    if not cds_Items.Active then
     cds_Items.CreateDataSet;

    cds_items.Active := True;

end;

procedure TTasOrderListToDelivery.Execute;
begin
 UpdateItems;
 InsertItens;
 DeleteItens;
end;

procedure TTasOrderListToDelivery.FormatGrid;
begin
  dbg_list.Columns[0].Width := 22;
  dbg_list.Columns[1].Width := 64;
  dbg_list.Columns[2].Width := 345;
  dbg_list.Columns[3].Width := 64;
  dbg_list.Columns[4].Width := 220;
  dbg_list.Columns[5].Width := 70;
  dbg_list.Columns[6].Width := 64;
  dbg_list.Columns[7].Width := 64;

end;

procedure TTasOrderListToDelivery.FormatScreen;
begin
  inherited;
  UMM.StockList;
end;

procedure TTasOrderListToDelivery.InitVariable;
begin
  inherited;
  OrderToDelivery := TControllerOrderToDeliver.Create(Self);
end;

procedure TTasOrderListToDelivery.InsertItens;
begin
  if not cds_Items.Active then cds_Items.CreateDataSet;
  if not cds_temp.Active  then cds_temp.CreateDataSet;
  cds_Items.first;
  while not cds_Items.eof do
  begin
    if cds_Items.FieldByName('selected').AsString = 'S' then
    begin
      cds_temp.Append;
      //Estes dois campos serão preencidos na tela do romaneio.
      cds_temp.FieldByName('id').AsInteger := 0;
      cds_temp.FieldByName('tb_order_id').AsInteger := 0;
      //Este campos serão preenchidos para automatizar o processo do romaneio
      cds_temp.FieldByName('codepro').AsInteger := cds_Itemstb_product_id.AsInteger;
      cds_temp.FieldByName('identifier').AsInteger := cds_Itemstb_product_id.AsInteger;
      cds_temp.FieldByName('description').AsString := cds_Itemsdescription.AsString;
      cds_temp.FieldByName('tb_institution_id').AsInteger := UMM.GInstitution.registro.Codigo;
      cds_temp.FieldByName('tb_product_id').AsInteger := cds_Itemstb_product_id.AsInteger;
      cds_temp.FieldByName('tb_stock_list_id').AsInteger := cds_Itemstb_stock_list_id.AsInteger;
      cds_temp.FieldByName('quantity').AsFloat := cds_Itemsquantity.AsFloat;
      cds_temp.FieldByName('unit_value').AsFloat := cds_Itemsunit_value.AsFloat;
      cds_temp.FieldByName('discount_aliquot').AsFloat := 0;
      cds_temp.FieldByName('discount_value').AsFloat := 0;
      //Este camp fara com que a ordem Has tenha uma algo para entregar...
      cds_temp.FieldByName('tb_order_to_deliver_id').AsInteger := cds_Itemsorder_to_deliver_id.AsInteger;
      cds_temp.Post;
    end;
    cds_Items.next
  end;
end;

procedure TTasOrderListToDelivery.SB_ChangeClick(Sender: TObject);
begin
  UpdateItems;
end;

procedure TTasOrderListToDelivery.SB_SaveClick(Sender: TObject);
begin
  if ValidateExecute then
  begin
    Execute;
  end;
end;

procedure TTasOrderListToDelivery.SetVariable;
begin
 // Neste set variable não existe herança, metodo diferente
  ShowData;
end;

procedure TTasOrderListToDelivery.ShowData;
begin
  inherited;
  ShowDataList;
  FormatGrid
end;

procedure TTasOrderListToDelivery.ShowDataList;
Var
  I : Integer;
  Registro : TOrderToDeliver;
  LcDeliver : TControllerOrderToDeliver;
  LcEstoque : TControllerStockList;
begin
  LcEstoque := TControllerStockList.Create(Self);
  LcDeliver := TControllerOrderToDeliver.Create(Self);

  OrderToDelivery.Registro.Estabelecimento := UMM.GInstitution.registro.Codigo;
  OrderToDelivery.getList;
  if not cds_Items.Active then cds_Items.CreateDataSet;

  cds_Items.LogChanges := False;
  with self.cds_items  do
  Begin
    cds_items.EmptyDataSet;
    for I := 0 to OrderToDelivery.Lista.Count - 1 do
    Begin
      Registro := OrderToDelivery.Lista[I];
      append;
      FieldByName('id').AsInteger                 := Registro.Codigo;
      FieldByName('tb_institution_id').AsInteger  := Registro.Estabelecimento;
      FieldByName('tb_order_id').AsInteger        := Registro.Ordem;
      FieldByName('tb_order_item_id').AsInteger   := Registro.OrdemItem;
      FieldByName('dt_record').AsDateTime         := Registro.DataRegistro;
      FieldByName('refer_doc').AsString           := Registro.DocumentoReferencia;
      FieldByName('status').AsString              := Registro.Status;
      //dois campo para controllar o to buy
      fieldbyname('order_to_deliver_id').AsInteger :=  Registro.Codigo;

      FieldByName('tb_product_id').AsInteger         := Registro.Mercadoria;
      //dados dos Produtos
      OrderToDelivery.Merchandise.Produto.Registro.Codigo := Registro.Mercadoria;
      OrderToDelivery.Merchandise.Produto.Registro.Estabelecimento := Registro.Estabelecimento;
      OrderToDelivery.Merchandise.Produto.getByKey;
      FieldByName('description').AsString := concat( Format('%3.3d',[Registro.Mercadoria]),
                                                    ' - ' ,
                                                    OrderToDelivery.Merchandise.Produto.Registro.Descricao);
      //Pega os registro do estoque
      OrderToDelivery.OrdemItem.Registro.Estabelecimento  := Registro.Estabelecimento;
      OrderToDelivery.OrdemItem.Registro.Ordem            := Registro.Ordem;
      OrderToDelivery.OrdemItem.Registro.Codigo           := Registro.OrdemItem;
      OrderToDelivery.OrdemItem.getByKey;
      FieldByName('unit_value').AsFloat                   := OrderToDelivery.OrdemItem.Registro.ValorUnitario;
      FieldByName('tb_stock_list_id').AsInteger           := OrderToDelivery.OrdemItem.Registro.Estoque;
      //PEga o nome do Estoque
      LcEstoque.Registro.Estabelecimento := Registro.Estabelecimento;
      LcEstoque.Registro.Codigo := Registro.Estoque;
      LcEstoque.getByKey;
      FieldByName('stock_name').AsString := concat( Format('%3.3d',[LcEstoque.Registro.Codigo]),
                                                    ' - ' ,
                                                    LcEstoque.Registro.Descricao);
      FieldByName('quantity').AsFloat  := Registro.Quantidade;

      Post;
    End;

  End;
  //totalizer;
//  FreeAndNil(lcItem);
  cds_items.LogChanges := True;
end;

procedure TTasOrderListToDelivery.UpdateItems;
Var
  LcToDeliver : TControllerOrderToDeliver;
begin
  if cds_items.ChangeCount > 0 then
  Begin
    LcToDeliver := TControllerOrderToDeliver.Create(Self);
    cds_Items.first;
    while not cds_Items.eof do
    begin
      with LcToDeliver.Registro do
      Begin
        Estabelecimento     := cds_Items.FieldByName('tb_institution_id').AsInteger;
        Codigo              := cds_Items.FieldByName('id').AsInteger;
        Ordem               := cds_Items.FieldByName('tb_order_id').AsInteger;
        OrdemItem           := cds_Items.FieldByName('tb_order_item_id').AsInteger;
        Mercadoria          := cds_Items.FieldByName('tb_product_id').AsInteger;
        DataRegistro        := cds_Items.FieldByName('dt_record').AsDateTime;
        Quantidade          := cds_Items.FieldByName('quantity').AsFloat;
        Estoque             := cds_Items.FieldByName('tb_stock_list_id').AsInteger;
        DocumentoReferencia := cds_Items.FieldByName('refer_doc').AsString;
        Status              := cds_Items.FieldByName('status').AsString;
      End;
      case cds_items.UpdateStatus of
        usModified: LcToDeliver.update;
        usInserted: LcToDeliver.insert;
      end;
      cds_Items.next
    end;
  End;

end;

function TTasOrderListToDelivery.ValidateExecute: boolean;
var
marcado: boolean;
begin
  with cds_Items do
  begin
    if not cds_Items.Active then
    CreateDataSet;

    first;
    marcado := false;
    while not eof do
    begin
      if FieldByName('selected').AsString = 'S' then
      begin
        marcado := True;
        break
      end;

      next
    end;
  end;
    if not marcado then
  begin
    begin
    MensageAlert(['A T E N Ç Ã O!.',
                  '',
                  'Nenhum Registro Selecionado.',
                  'Preencha o campo para continuar'
                  ]);
     exit;
     end;
  end;
end;

end.
