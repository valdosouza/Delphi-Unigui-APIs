unit ctrl_mob_order_item;

interface

uses System.SysUtils,System.Classes,ctrl_mob_base,FireDAC.Comp.Client, FireDAC.Stan.Param,
     tblOrderItem, TypesListCollection,TypesCollection,ctrl_mob_merchandise,
     list_spl_order_sale_items,ctrl_mob_stock_statement;

Type
  TCtrlMobOrderItem = class(TCtrlMobBase)

    private
      function getNext:Integer;
    public
      Registro : TOrderItem;
      Lista: TListOrdemItem;
      CollListaSpl : TCollSplOrderSaleItems;
      merchandise : TCtrlMobMerchandise;
      StockStatement : TCtrlMobStockStatement;
      constructor Create(AOwner: TComponent); override;
      destructor Destroy; override;
      procedure createTable;
      procedure AlterTable;
      procedure getListSpl;
      function deletebyOrder:boolean;
      function insert:boolean;
      function save:boolean;
      function delete:boolean;
      procedure getList;
      function getproduct:Boolean;
      function getprice:Boolean;
      procedure Clear;
  end;

implementation

uses MainModule;


procedure TCtrlMobOrderItem.AlterTable;
Var
  Lc_Qry : TFdquery;
begin
  Try
    Lc_Qry := createQuery;
    with Lc_Qry do
    Begin
      Active := False;
      sql.Clear;
      sql.Add(concat(
                'SELECT sql FROM sqlite_master ',
                '    where (sql like ''%tb_order_item%'') and  (sql like ''%tb_price_list_id%'')'
      ));
      Active := True;
      if RecordCount = 0 then
      BEgin
        Active := False;
        sql.Clear;
        sql.Add(concat(
                  'ALTER TABLE tb_order_item ADD tb_price_list_id;'
        ));
        ExecSQL;
      End;
    End;
  Finally
    FinalizaQuery(Lc_Qry);
  End;
end;

procedure TCtrlMobOrderItem.Clear;
begin
  clearObj(Registro);
  Lista.Clear;
end;

constructor TCtrlMobOrderItem.Create(AOwner: TComponent);
begin
  Registro        := TORderItem.create;
  Lista           :=  TListOrdemItem.Create;
  CollListaSpl    := TCollSplOrderSaleItems.Create;
  merchandise     := TCtrlMobMerchandise.create(Self);
  StockStatement  := TCtrlMobStockStatement.create(Self);
  createTable;
  AlterTable;
end;

procedure TCtrlMobOrderItem.createTable;
begin
  execcmd(concat(
                'CREATE TABLE if not exists tb_order_item ( ',
                '  id int(11) , ',
                '  tb_institution_id int(11) , ',
                '  terminal int(11) , ',
                '  tb_order_id int(11) , ',
                '  tb_product_id int(11) , ',
                '  tb_stock_list_id int(11) , ',
                '  quantity decimal(10,4) , ',
                '  unit_value decimal(10,6) , ',
                '  discount_aliquot decimal(10,2) , ',
                '  discount_value decimal(10,6) , ',
                '  created_at datetime , ',
                '  updated_at datetime ) ; '
      ));
end;

function TCtrlMobOrderItem.delete: boolean;
begin
  try
    DeleteObj(Registro);
    Result := true;
  except
    Result := False;
  end;

end;

function TCtrlMobOrderItem.deletebyOrder: boolean;
var
  Lc_Qry : TFDQuery;
  LITem : TOrderItem;
begin
  Try
    Lc_Qry := createQuery;
    with Lc_Qry do
    Begin
      sql.add(concat('DELETE ',
                      'FROM tb_order_item ',
                      'WHERE tb_institution_id =:institution_id ',
                      ' AND tb_order_id =:order_id '
                      ));
      ParamByName('institution_id').AsInteger := Registro.Estabelecimento;
      ParamByName('order_id').AsInteger := Registro.Ordem;
      ExecSQL;
    End;
  Finally
    FinalizaQuery(Lc_Qry);
  End;
end;

destructor TCtrlMobOrderItem.Destroy;
begin
  {$IFDEF WIN32}
  Registro.disposeOf;
  Lista.disposeOf;
  CollListaSpl.disposeOf;
  merchandise.disposeOf;
  StockStatement.disposeOf;
  inherited;

  {$ENDIF }
end;

procedure TCtrlMobOrderItem.getList;
var
  Lc_Qry : TFDQuery;
  LITem : TOrderItem;
begin
  Try
    Lc_Qry := createQuery;
    with Lc_Qry do
    Begin
      sql.add(concat('SELECT * ',
                      'FROM tb_order_item oi ',
                      'WHERE tb_institution_id =:tb_institution_id ',
                      ' AND tb_order_id =:tb_order_id ',
                      ' ORDER BY id '));

      ParamByName('tb_institution_id').AsInteger := Registro.Estabelecimento;
      ParamByName('tb_order_id').AsInteger := Registro.Ordem;
      Active := True;
      FetchAll;
      First;
      Lista.Clear;
      while not eof do
      Begin
        LITem := TOrderItem.Create;
        get(Lc_Qry,LITem);
        Lista.add(LITem);
        next;
      end;
    end;
  Finally
    FinalizaQuery(Lc_Qry);
  End;

end;

procedure TCtrlMobOrderItem.getListSpl;
Var
  Lc_Qry :TFDQuery;
  item : TListSplOrderSaleItems;
  I:Integer;
  LcSqlStr : String;
Begin
  Try
    Lc_Qry := createQuery;
    with Lc_Qry do
    Begin
      sql.Clear;
      sql.Add(concat(
            'select ',
            'oi.id, ',
            'oi.tb_institution_id, ',
            'oi.terminal, ',
            'oi.tb_order_id, ',
            'oi.tb_product_id, ',
            'pd.description,',
            'oi.quantity, ',
            'oi.unit_value, ',
            'oi.discount_aliquot, ',
            'oi.discount_value, ',
            '( ( oi.quantity * oi.unit_value) - oi.discount_value ) subtotal ',
            'from tb_order_item oi ',
            ' inner join tb_product pd ',
            ' on (oi.tb_product_id = pd.id) ',
            '    and ( oi.tb_institution_id = pd.tb_institution_id ) ',
            'where (oi.tb_order_id =:tb_order_id) ',
            '  and (oi.tb_institution_id =:tb_institution_id) '
          ));
      //sql.Add(concat('Limit ', InttoStr( (Page * 20 ) - 20 ),',', InttoStr( (Page * 20 ) ) ));
      //Passagem parametros
      ParamByName('tb_institution_id').AsInteger := Registro.Estabelecimento;
      ParamByName('tb_order_id').AsInteger := Registro.Ordem;
      Active := True;
      FetchAll;
      First;
      CollListaSpl.clear;
      while not eof do
      Begin
        item := TListSplOrderSaleItems.Create;
        item.Estabelecimento  := FieldByName('tb_institution_id').AsInteger;
        item.Codigo           := FieldByName('id').AsInteger;
        item.Terminal         := FieldByName('terminal').AsInteger;
        item.Ordem            := FieldByName('tb_order_id').AsInteger;
        item.Produto          := FieldByName('tb_product_id').AsInteger;
        item.Descricao        := FieldByName('description').AsString;
        item.Qtde             := FieldByName('quantity').AsFloat;
        item.ValorUnitario    := FieldByName('unit_value').AsFloat;
        item.ValorSubTotal    := FieldByName('quantity').AsFloat * FieldByName('unit_value').AsFloat;
        //add lista
        CollListaSpl.Add( item );
        Next;
      End;
    End;
  Finally
    FinalizaQuery(Lc_Qry);
  End;

end;

function TCtrlMobOrderItem.getNext: Integer;
var
  Lc_qry: TFDQuery;
begin
  Try
    Lc_qry := createQuery;
    with Lc_qry do
    Begin
      sql.Clear;
      sql.Add(concat(
                  'SELECT MAX(id) id ',
                  'FROM tb_order_item ',
                  ' where ( tb_institution_id =:tb_institution_id ) ',
                  ' and (tb_order_id =:tb_order_id) '
                  ));
      ParamByName('tb_institution_id').AsInteger := Registro.Estabelecimento;
      ParamByName('tb_order_id').AsInteger := Registro.Ordem;
      Active := True;
      First;
      result := StrToIntDef(FieldByName('id').AsString,0) + 1;
    End;
  Finally
    FinalizaQuery(Lc_Qry);
  End;
end;

function TCtrlMobOrderItem.getprice: Boolean;
begin
  merchandise.Product.price.Registro.Estabelecimento  := Registro.Estabelecimento;
  merchandise.Product.price.Registro.Tabela           := Registro.TabelaPreco;
  merchandise.Product.price.Registro.Produto          := Registro.Produto;
  merchandise.Product.price.getByKey;
end;

function TCtrlMobOrderItem.getproduct: Boolean;
begin
  merchandise.Product.Registro.Estabelecimento := Registro.Estabelecimento;
  merchandise.Product.Registro.Codigo           := Registro.Produto;
  merchandise.Product.getByKey;

end;

function TCtrlMobOrderItem.insert: boolean;
begin
  Registro.Codigo := getNext;
  Try
    insertObj(Registro);
    Result := True;
  Except
    Result := False;
  End;

end;

function TCtrlMobOrderItem.save: boolean;
begin
  try
    SaveObj(Registro);
    Result := true;
  except
    Result := False;
  end;
end;

end.
