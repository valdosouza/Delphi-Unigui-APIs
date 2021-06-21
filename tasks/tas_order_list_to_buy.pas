unit tas_order_list_to_buy;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, base_list_Registry, Data.DB,
  Datasnap.DBClient, Vcl.Menus, uniMainMenu, uniGUIClasses, uniBasicGrid,
  uniDBGrid, uniButton, uniBitBtn, uniSpeedButton, uniGUIBaseClasses, uniPanel,
  uniEdit, uniLabel, ControllerOrderToBuy, tblOrderToBuy,
  Datasnap.Provider, uniMultiItem, uniComboBox, uniDBComboBox,
  uniDBLookupComboBox,ControllerStockList;

type
  TTasOrderListToBuy = class(TBaseListRegistry)
    cds_Itemstb_order_id: TIntegerField;
    cds_Itemstb_order_item_id: TIntegerField;
    cds_ItemsProductId: TIntegerField;
    cds_Itemsdescription: TStringField;
    cds_Itemsquantity: TFloatField;
    UniHiddenPanel1: TUniHiddenPanel;
    DBLCB_Lista: TUniDBLookupComboBox;
    cds_Itemstb_stock_list_id: TIntegerField;
    cds_Itemsstock_name: TStringField;
    cds_Itemsselected: TStringField;
    cds_Itemsorder_to_buy_id: TIntegerField;
    cds_Itemsunit_value: TFloatField;

    procedure InitVariable;Override;
    procedure SetVariable;Override;
    procedure FormatScreen;Override;
    procedure ShowData;Override;
    procedure InsertItens;
    procedure Execute;
    Function  ValidateExecute:boolean;
    procedure SB_SaveClick(Sender: TObject);
    procedure dbg_listSetCellValue(Sender: TObject; ACol, ARow: Integer;
      AField: TField; var Value: Variant);
  private
    { Private declarations }
    procedure FormatGrid;
  public
    { Public declarations }

    OrderJobToBuy : TControllerOrderToBuy;
    cds_temp: TClientDataSet;
    procedure ShowDataList;
  end;

var
  TasOrderListToBuy: TTasOrderListToBuy;

implementation

{$R *.dfm}

uses MainModule, unMessages, msg_form;

{ TTasOrderListToBuy }

procedure TTasOrderListToBuy.dbg_listSetCellValue(Sender: TObject; ACol,
  ARow: Integer; AField: TField; var Value: Variant);
Var
  LcIn_aux:Integer;
  LcVl_aux : Real;
begin
  if (Acol = 3) then
  BEgin
    //Codigo do Estoque ela DBlooxUp
    if (Length(value) > 0) then
    Begin
      LcIn_aux := pos(' ',Value) - 1;
      cds_Items.Edit;
      cds_Itemstb_stock_list_id.AsString := Copy(Value,1,LcIn_aux);
      cds_Itemsstock_name.AsString := Copy(Value,1,45);
      cds_Items.Post;
    End;
  End;

end;

procedure TTasOrderListToBuy.Execute;
begin
  InsertItens;
  close;
end;

procedure TTasOrderListToBuy.FormatGrid;
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

procedure TTasOrderListToBuy.FormatScreen;
begin
  inherited;
  UMM.StockList;
end;

procedure TTasOrderListToBuy.InitVariable;
begin
  inherited;
  OrderJobToBuy := TControllerOrderToBuy.Create(self);
end;

procedure TTasOrderListToBuy.InsertItens;
begin
  if not cds_temp.active then
  cds_temp.CreateDataSet;

  cds_Items.first;
  while not cds_Items.eof do
  begin
    if cds_Items.FieldByName('selected').AsString = 'S' then
    begin

      cds_temp.Append;
      //campos especificos do itens do ordem purchase
      cds_temp.FieldByName('codepro').AsInteger := cds_ItemsProductId.AsInteger;
      cds_temp.FieldByName('identifier').AsInteger := cds_ItemsProductId.AsInteger;
      cds_temp.FieldByName('description').AsString := cds_Itemsdescription.AsString;
      cds_temp.FieldByName('id').AsInteger := 0;
      cds_temp.FieldByName('tb_institution_id').AsInteger := UMM.GInstitution.registro.Codigo;
      cds_temp.FieldByName('tb_order_id').AsInteger := 0;
      cds_temp.FieldByName('tb_product_id').AsInteger := cds_ItemsProductId.AsInteger;

      cds_temp.FieldByName('tb_stock_list_id').AsInteger := cds_Itemstb_stock_list_id.AsInteger;
      cds_temp.FieldByName('quantity').AsFloat := cds_Itemsquantity.AsFloat;
      cds_temp.FieldByName('unit_value').AsFloat := cds_Itemsunit_value.AsFloat;
      cds_temp.FieldByName('discount_aliquot').AsFloat := 0;
      cds_temp.FieldByName('discount_value').AsFloat := 0;

      //dois campo para controllar o to buy
      cds_temp.fieldbyname('tb_order_to_buy_id').AsInteger := cds_Itemsorder_to_buy_id.AsInteger;


      cds_temp.Post;
    end;
    cds_Items.next
  end;
end;

procedure TTasOrderListToBuy.SB_SaveClick(Sender: TObject);
begin
  if ValidateExecute then
  begin
    Execute;
  end;
end;

procedure TTasOrderListToBuy.SetVariable;
begin
  // Neste set variable não existe herança, metodo diferente
  ShowData;
end;

procedure TTasOrderListToBuy.ShowData;
begin
  inherited;
  ShowDataList;
  FormatGrid;
end;

procedure TTasOrderListToBuy.ShowDataList;
Var
  I : Integer;
  Registro : TOrderJobToBuy;
  LcEstoque : TControllerStockList;
begin
  LcEstoque := TControllerStockList.Create(Self);

  OrderJobToBuy.Registro.Estabelecimento := UMM.GInstitution.registro.Codigo;
  OrderJobToBuy.getList;
  if not cds_Items.Active then cds_Items.CreateDataSet;

  cds_Items.LogChanges := False;
  with self.cds_items  do
  Begin
    Active := True;
    cds_items.EmptyDataSet;
    for I := 0 to OrderJobToBuy.Lista.Count - 1 do
    Begin
      Registro := OrderJobToBuy.Lista[I];
      append;
      FieldByName('tb_order_id').AsInteger       := Registro.Ordem;
      FieldByName('tb_order_item_id').AsInteger  := Registro.OrdemItem;

      FieldByName('productId').AsInteger         := Registro.Mercadoria;
      //dados dos Produtos
      OrderJobToBuy.Merchandise.Produto.Registro.Codigo := Registro.Mercadoria;
      OrderJobToBuy.Merchandise.Produto.Registro.Estabelecimento := Registro.Estabelecimento;
      OrderJobToBuy.Merchandise.Produto.getByKey;
      FieldByName('description').AsString := concat( Format('%3.3d',[Registro.Mercadoria]),
                                                    ' - ' ,
                                                    OrderJobToBuy.Merchandise.Produto.Registro.Descricao);
      //Pega os registro do estoque
      OrderJobToBuy.OrdemItem.Registro.Estabelecimento := Registro.Estabelecimento;
      OrderJobToBuy.OrdemItem.Registro.Ordem := Registro.Ordem;
      OrderJobToBuy.OrdemItem.Registro.Codigo := Registro.OrdemItem;
      OrderJobToBuy.OrdemItem.getByKey;
      FieldByName('tb_stock_list_id').AsInteger  := OrderJobToBuy.OrdemItem.Registro.Estoque;
      FieldByName('unit_value').AsFloat  := OrderJobToBuy.OrdemItem.Registro.ValorUnitario;
      //PEga o nome do Estoque
      LcEstoque.Registro.Estabelecimento := Registro.Estabelecimento;
      LcEstoque.Registro.Codigo := OrderJobToBuy.OrdemItem.Registro.Estoque;
      LcEstoque.getByKey;
      FieldByName('stock_name').AsString := concat( Format('%3.3d',[LcEstoque.Registro.Codigo]),
                                                    ' - ' ,
                                                    LcEstoque.Registro.Descricao);
      FieldByName('quantity').AsFloat  := Registro.Quantidade;

      //dois campo para controllar o to buy
      fieldbyname('order_to_buy_id').AsInteger :=  Registro.Codigo;
      Post;
    End;

  End;
  //totalizer;
//  FreeAndNil(lcItem);
  cds_items.LogChanges := True;
end;

function TTasOrderListToBuy.ValidateExecute:Boolean;
var
marcado: boolean;
begin
  with cds_Items do
  begin
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
