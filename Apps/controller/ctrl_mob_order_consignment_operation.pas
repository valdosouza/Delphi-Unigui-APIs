unit ctrl_mob_order_consignment_operation;

interface
uses System.Classes, System.SysUtils,
      tblOrderConsignmentOperation, FireDAC.Comp.Client,FireDAC.Stan.Param,
      ctrl_mob_order, TypesCollection,
      list_spl_order_consignment_operation,TypesListCollection, ctrl_mob_base,
  list_spl_order_consignment_items, ctrl_mob_order_item,list_spl_order_consignment_items_statement,
  ctrl_mob_price;

Type
  TCtrlMobOrderConsignmentOperation = Class(TCtrlMobBAse)
  private
    function getPrice(ProdutoID:Integer):Real;

  public
    Registro              : TOrderConsignmentOperation;
    MItem                 : TCtrlMobOrderItem;
    Lista                 : TListOrdemConsignmentOperation;
    ListSpl               : TCollSplOrderConsignmentOperation;
    ListSplItems          : TCollSplOrderConsignmentItems;
    ListSplItemsBalance   : TCollSplOrderConsignmentItems;
    ListSplItemsStatement : TCollSplOrderConsignmentItemsStatement;
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure createTable;
    procedure updateTbInstituition;
    procedure setStrutureUpdate;Override;
    procedure clear;
    function save:boolean;
    function insert:boolean;
    Function delete:boolean;
    function getByKey:Boolean;
    function getCountByKind:Integer;
    function getBalance:REal;
    function getBalanceByProduct(Id:Integer):Real;
    function getTotalValue:REal;
    function getTotalValueByProduct(Id:Integer):Real;
    procedure getListSpl(palavra:TStringList);
    procedure getListSplItems(palavra:TStringList);
    procedure getListSplItemsBalance(palavra:TStringList);
    procedure getListSplItemsStatement(CodeProduct:Integer);
    procedure getList;
    procedure getlast;
  End;

implementation

{ TCtrlMobOrderConsignmentOperation }

uses MainModule, UnFunctions;


procedure TCtrlMobOrderConsignmentOperation.clear;
begin
  clearObj(Registro);
end;

constructor TCtrlMobOrderConsignmentOperation.Create(AOwner: TComponent);
begin
  inherited;
  createTable;  //não trocar a sequecia
  setStrutureUpdate;
  Registro              := TOrderConsignmentOperation.Create;
  Lista                 := TListOrdemConsignmentOperation.Create;
  MItem                := TCtrlMobOrderItem.Create(self);
  ListSpl               := TCollSplOrderConsignmentOperation.Create;
  ListSplItems          := TCollSplOrderConsignmentItems.Create;
  ListSplItemsBalance   := TCollSplOrderConsignmentItems.Create;
  ListSplItemsStatement := TCollSplOrderConsignmentItemsStatement.Create;

end;

procedure TCtrlMobOrderConsignmentOperation.createTable;
begin
  execcmd(concat(
              'CREATE TABLE if not exists tb_order_consignment_operation ( ',
              '  tb_order_item_id int(11) NOT NULL, ',
              '  tb_institution_id int(11) NOT NULL, ',
              '  terminal int(11) NOT NULL, ',
              '  tb_order_id int(11) NOT NULL, ',
              '  dt_record date DEFAULT NULL, ',
              '  kind varchar(2) DEFAULT NULL, ',
              '  created_at datetime DEFAULT NULL, ',
              '  updated_at datetime DEFAULT NULL) '
    ));
end;

function TCtrlMobOrderConsignmentOperation.delete: boolean;
begin

end;

destructor TCtrlMobOrderConsignmentOperation.Destroy;
begin
  {$IFDEF WIN32}
  Registro.DisposeOf;
  Lista.DisposeOf;
  MItem.DisposeOf;
  ListSpl.DisposeOf;
  ListSplItems.DisposeOf;
  ListSplItemsBalance.DisposeOf;
  inherited;
  {$ENDIF }
end;

function TCtrlMobOrderConsignmentOperation.getBalance: REal;
Var
  Lc_Qry : TFdQuery;
begin
  Try
    Lc_Qry := createQuery;
    with Lc_Qry do
    Begin
      sql.Add(concat(
                'select distinct oi.tb_product_id ',
                'from tb_order_consignment_operation oco ',
                '  inner join tb_order_item oi ',
                '  on ( oi.id = oco.tb_order_item_id ) ',
                '     and  ( oi.tb_order_id = oco.tb_order_id) ',
                '     and  ( oi.tb_institution_id = oco.tb_institution_id ) ',
                'where ( oco.tb_order_id =:tb_order_id ) ',
                ' and ( oco.tb_institution_id =:tb_institution_id ) '
      ));
      if Registro.Data > 0 then
        sql.Add(' and ( oco.dt_record =:dt_record ) ');

      if Registro.Tipo <> '' then
      Begin
        if ( Pos('%',Registro.Tipo) > 0 ) then
          sql.Add(' and ( oco.kind like :kind ) ')
        else
          sql.Add(' and ( oco.kind =:kind ) ')
      End;

      //Passagem de PArametros
      ParamByName('tb_institution_id').AsInteger  := Registro.Estabelecimento;

      ParamByName('tb_order_id').AsInteger        := Registro.Ordem;

      if Registro.Data > 0 then
        ParamByName('dt_record').AsDate := Registro.Data;


      if Registro.Tipo <> '' then
      Begin
        if ( Pos('%',Registro.Tipo) > 0 ) then
          ParamByName('kind').AsString := concat(Registro.Tipo,'%')
        else
          ParamByName('kind').AsString := Registro.Tipo;
      End;

      Active := TRue;
      First;
      REsult := 0;
      while not eof do
      Begin
        REsult := REsult + getBalanceByProduct(FieldByName('tb_product_id').AsInteger);
        Next;
      End;
    End;
  Finally
    FinalizaQuery(Lc_Qry);
  End;
end;

function TCtrlMobOrderConsignmentOperation.getBalanceByProduct(Id: Integer): Real;
Var
  Lc_Qry : TFdQuery;
begin
  Try
    Lc_Qry := createQuery;
    with Lc_Qry do
    Begin
      sql.Add(concat(
                'select oco.kind, oi.quantity , oi.unit_value ',
                'from tb_order_consignment_operation oco ',
                '  inner join tb_order_item oi ',
                '  on ( oi.id = oco.tb_order_item_id ) ',
                '     and  ( oi.tb_institution_id = oco.tb_institution_id) ',
                '     and  ( oi.tb_order_id = oco.tb_order_id) ',
                'where ( oco.tb_institution_id =:tb_institution_id ) ',
                ' and ( oco.tb_order_id =:tb_order_id) ',
                ' and (oi.tb_product_id =:tb_product_id ) '
      ));

      if Registro.Tipo <> '' then
      Begin
        if ( Pos('%',Registro.Tipo) > 0 ) then
          sql.Add(' and ( oco.kind like :kind ) ')
        else
          sql.Add(' and ( oco.kind =:kind ) ')
      End;

      if Registro.Data > 0 then
        sql.Add(' and ( oco.dt_record =:dt_record ) ');

      //Passagem de PArametros
      ParamByName('tb_institution_id').AsInteger := Self.Registro.Estabelecimento;

      ParamByName('tb_order_id').AsInteger        := Self.Registro.Ordem;

      ParamByName('tb_product_id').AsInteger := Id;




      if Registro.Tipo <> '' then
      Begin
        if ( Pos('%',Registro.Tipo) > 0 ) then
          ParamByName('kind').AsString := concat(Registro.Tipo,'%')
        else
          ParamByName('kind').AsString := Registro.Tipo;
      End;

      if Registro.Data > 0 then
        ParamByName('dt_record').AsDateTime := Registro.Data;

      Active := TRue;
      First;
      REsult := 0;
      while not eof do
      Begin
        if Copy(FieldByName('kind').AsString,1,1) = 'E' then
          REsult := REsult + FieldByName('quantity').AsFloat
        else
          REsult := REsult - FieldByName('quantity').AsFloat;
        Next;
      End;
      if REsult < 0 then
        REsult := REsult * -1;
    End;
  Finally
    FinalizaQuery(Lc_Qry);
  End;

end;

function TCtrlMobOrderConsignmentOperation.getByKey: Boolean;
begin
  _getByKey(Registro);
end;

function TCtrlMobOrderConsignmentOperation.getCountByKind: Integer;
Var
  Lc_Qry : TFdQuery;
begin
  Try
    Lc_Qry := createQuery;
    with Lc_Qry do
    Begin
      sql.Add(concat(
                'select DISTINCT dt_record ',
                'from tb_order_consignment_operation ',
                'where ( kind like :kind ) ',
                ' and ( tb_order_id =:tb_order_id) ',
                ' and ( tb_institution_id =:tb_institution_id ) '
      ));
      if Registro.Data > 0 then
        sql.Add(' and ( oco.dt_record =:dt_record ) ');

      sql.Add(' group by dt_record ');

      //Passagem de Parametros
      ParamByName('tb_institution_id').AsInteger  := Self.Registro.Estabelecimento;

      ParamByName('tb_order_id').AsInteger  := Registro.Ordem;

      if Copy(Registro.Tipo,1,1) = 'E' then
        ParamByName(concat('kind')).AsString := 'EC'
      else
        ParamByName(concat('kind')).AsString := 'S%';

      if Registro.Data > 0 then
        ParamByName('dt_record').AsDate := Registro.Data;

      Active := True;
      FetchAll;
      Result := recordCount;
    End;
  Finally
    FinalizaQuery(Lc_Qry);
  End;
end;

procedure TCtrlMobOrderConsignmentOperation.getlast;
var
  Lc_Qry : TFDQuery;
  LITem : TOrderConsignmentOperation;
begin
  Try
    Lc_Qry := createQuery;
    with Lc_Qry do
    Begin
      sql.add(concat(
                 'SELECT occ.* ',
                 'FROM tb_order_consignment_operation occ ',
                 'WHERE occ.tb_institution_id =:tb_institution_id ',
                 ' AND occ.tb_order_id =:tb_order_id ',
                 ' order by occ.dt_record DESC ',
                 ' limit 1 '
      ));

      ParamByName('tb_institution_id').AsInteger := Registro.Estabelecimento;
      ParamByName('tb_order_id').AsInteger := Registro.Ordem;
      Active := True;
      FetchAll;
      exist := recordcount > 0;
      if exist then
        get(Lc_Qry,Registro);
    end;
  Finally
    FinalizaQuery(Lc_Qry);
  End;


end;

procedure TCtrlMobOrderConsignmentOperation.getList;
var
  Lc_Qry : TFDQuery;
  LITem : TOrderConsignmentOperation;
begin
  Try
    Lc_Qry := createQuery;
    with Lc_Qry do
    Begin
      sql.add(concat('SELECT occ.* ',
                      'FROM tb_order_consignment_operation occ ',
                      'WHERE occ.tb_institution_id =:tb_institution_id ',
                      ' AND occ.tb_order_id =:tb_order_id ',
                      ' ORDER BY occ.tb_order_item_id '));

      ParamByName('tb_institution_id').AsInteger := Registro.Estabelecimento;
      ParamByName('tb_order_id').AsInteger := Registro.Ordem;
      Active := True;
      FetchAll;
      First;
      Lista.Clear;
      while not eof do
      Begin
        LITem := TOrderConsignmentOperation.Create;
        get(Lc_Qry,LITem);
        Lista.add(LITem);
        next;
      end;
    end;
  Finally
    FinalizaQuery(Lc_Qry);
  End;

end;

procedure TCtrlMobOrderConsignmentOperation.getListSpl(palavra: TStringList);
Var
  Lc_Qry :TFDQuery;
  item : TListSplOrderConsignmentOperation;
  I:Integer;
  LcSqlStr : String;
begin
  Try
    Lc_Qry := createQuery;
    item := TListSplOrderConsignmentOperation.Create;
    with Lc_Qry do
    Begin
      sql.Clear;
      sql.Add(concat(
              'select DISTINCT ',
              'oco.tb_institution_id, ',
              'oco.terminal,',
              'oco.tb_order_id,',
              'oco.dt_record ',
              'from tb_order_consignment_operation oco ',
              'where (oco.tb_institution_id =:tb_institution_id) ',
              ' and  ( oco.tb_order_id =:tb_order_id ) ',
              ' and ( oco.kind like :kind ) '
          ));

      //Incrmenta o sql
      LcSqlStr := ' and ( ';
      if palavra.count > 0 then
      Begin
        for I := 0 to palavra.count -1 do
        Begin
          if I = 0 then
            LcSqlStr := concat(LcSqlStr,' ( oco.dt_record :palavra',i.ToString,' ) ')
          else
            LcSqlStr := concat(LcSqlStr,' or ( oco.dt_record :palavra',i.ToString,' ) ');
        End;
        LcSqlStr := concat(LcSqlStr,')');
        sql.Add(LcSqlStr);
      End;

      if registro.Data > 0 then
        sql.Add('and (oco.dt_record =:dt_record )  ');

      sql.Add('order by oco.dt_record desc ');
      if palavra.Count = 0 then   sql.Add('limit 0,40 ');

      //sql.Add(concat('Limit ', InttoStr( ( Page * 20 ) - 20 ),',', InttoStr( (Page * 20 ) ) ));
      //passagem de PArametros
      ParamByName('tb_institution_id').AsInteger  := Self.REgistro.Estabelecimento;
      ParamByName('tb_order_id').AsInteger        := Self.REgistro.Ordem;

      if palavra.count > 0 then
      Begin
        for I := 0 to palavra.count -1 do
          ParamByName(concat('palavra',i.ToString)).AsString := palavra[I];
      End;
      //Tipo
      if Registro.Tipo = 'EC' then
        ParamByName(concat('kind')).AsString := 'EC'
      else
        ParamByName(concat('kind')).AsString := 'S%';

      if registro.Data > 0 then
        ParamByName('dt_record').AsDateTime := REgistro.Data;
      Prepare;
      Active := True;
      FetchAll;
      First;
      ListSpl.Clear;
      while not eof do
      Begin
        item := TListSplOrderConsignmentOperation.Create;
        item.Estabelecimento  := FieldByName('tb_institution_id').AsInteger;
        item.terminal         := FieldByName('terminal').AsInteger;
        item.Codigo           := FieldByName('tb_order_id').AsInteger;
        item.Data             := FieldByName('dt_record').AsString;
        Self.Registro.Ordem   := FieldByName('tb_order_id').AsInteger;
        Self.Registro.Data    :=  FieldByName('dt_record').AsDateTime;
        item.Qtde             := FloatToStrF( self.getBalance,ffFixed,10,2);
        item.Valor            := FloatToStrF( self.getTotalValue,ffFixed,10,2);
        //add lista
        ListSpl.Add(item);
        Next;
      End;
    End;
  Finally
    Lc_Qry.Unprepare;
    FinalizaQuery(Lc_Qry);
  End;


end;

procedure TCtrlMobOrderConsignmentOperation.getListSplItems(
  palavra: TStringList);
Var
  Lc_Qry :TFDQuery;
  item : TListSplOrderConsignmentItems;
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
            'oi.tb_order_id, ',
            'oi.tb_product_id, ',
            'pd.description,',
            'oi.quantity, ',
            'oi.unit_value, ',
            'oi.discount_aliquot, ',
            'oi.discount_value, ',
            '( ( oi.quantity * oi.unit_value) - oi.discount_value ) subtotal ',
            'from tb_order_item oi ',
            '  inner join tb_order_consignment_operation oco ',
            '  on (oco.tb_order_item_id = oi.id) ',
            '      and  (oco.tb_order_id = oi.tb_order_id) ',
            '      and  (oco.tb_institution_id = oi.tb_institution_id) ',
            ' inner join tb_product pd ',
            ' on (oi.tb_product_id = pd.id) ',
            '     and (oi.tb_institution_id = pd.tb_institution_id) ',
            'where (oi.tb_order_id =:tb_order_id) ',
            ' and (oco.tb_institution_id=:tb_institution_id ) '
          ));
      if Registro.Data > 0 then
        sql.Add(' and ( oco.dt_record =:dt_record ) ');

      if Registro.Tipo <> '' then
      Begin
        if ( Pos('%',Registro.Tipo) > 0 ) then
          sql.Add(' and ( oco.kind like :kind ) ')
        else
          sql.Add(' and ( oco.kind =:kind ) ')
      End;

      //sql.Add(concat('Limit ', InttoStr( (Page * 20 ) - 20 ),',', InttoStr( (Page * 20 ) ) ));
      //Passagem de PArametros
      ParamByName('tb_institution_id').AsInteger := Self.Registro.Estabelecimento;
      ParamByName('tb_order_id').AsInteger      := Self.Registro.Ordem;

      if Registro.Data > 0 then
        ParamByName('dt_record').AsDate := Registro.Data;

      if Registro.Tipo <> '' then
      Begin
        if ( Pos('%',Registro.Tipo) > 0 ) then
          ParamByName('kind').AsString := concat(Registro.Tipo,'%')
        else
          ParamByName('kind').AsString := Registro.Tipo;
      End;


      Active := True;
      FetchAll;
      First;
      ListSplItems.Clear;
      while not eof do
      Begin
        item := TListSplOrderConsignmentItems.Create;
        item.Codigo         := FieldByName('id').AsInteger;
        item.Produto        := FieldByName('tb_product_id').AsInteger;
        item.Descricao      := FieldByName('description').AsString;
        item.Qtde           := FieldByName('quantity').AsFloat;
        item.ValorUnitario  := FieldByName('unit_value').AsFloat;
        item.ValorSubTotal  := FieldByName('subtotal').AsFloat;
        //add lista
        ListSplItems.Add( item );
        Next;
      End;
    End;
  Finally
    FinalizaQuery(Lc_Qry);
  End;

end;

procedure TCtrlMobOrderConsignmentOperation.getListSplItemsBalance(
  palavra: TStringList);
Var
  Lc_Qry :TFDQuery;
  item : TListSplOrderConsignmentItems;
  I:Integer;
  LcSqlStr : String;
  LcSaldo : Real;
  LcSoma : Real;
Begin
  Try
    Lc_Qry := createQuery;
    with Lc_Qry do
    Begin
      sql.Clear;
      sql.Add(concat(
            'select distinct ',
            'oi.tb_institution_id, ',
            'oi.terminal, ',
            'oi.tb_order_id, ',
            'oi.tb_product_id, ',
            'pd.description ',
            'from tb_order_item oi ',
            '  inner join tb_order_consignment_operation oco ',
            '  on (oco.tb_order_item_id = oi.id) ',
            '      and  (oco.tb_order_id = oi.tb_order_id) ',
            '      and  ( oco.tb_institution_id = oi.tb_institution_id ) ',
            ' inner join tb_product pd ',
            ' on (oi.tb_product_id = pd.id) ',
            'where (oi.tb_order_id =:tb_order_id) ',
            ' and (oco.tb_institution_id=:tb_institution_id ) '
          ));

      //sql.Add(concat('Limit ', InttoStr( (Page * 20 ) - 20 ),',', InttoStr( (Page * 20 ) ) ));
      //Passagem de PArametros
      ParamByName('tb_institution_id').AsInteger  := Self.Registro.Estabelecimento;
      ParamByName('tb_order_id').AsInteger        := Registro.Ordem;

      Active := True;
      FetchAll;
      First;
      ListSplItemsBalance.Clear;
      while not eof do
      Begin
        LcSaldo := getBalanceByProduct(FieldByName('tb_product_id').AsInteger);
        if (LcSaldo > 0 ) then
        Begin
          item := TListSplOrderConsignmentItems.Create;
          item.Codigo         := 0;
          item.Produto        := FieldByName('tb_product_id').AsInteger;
          item.Descricao      := FieldByName('description').AsString;
          item.Qtde           := LcSaldo;
          item.ValorUnitario  := getPrice(FieldByName('tb_product_id').AsInteger);
          item.ValorSubTotal  := (item.Qtde *item.ValorUnitario);
          //add lista
          ListSplItemsBalance.Add( item );
        End;
        Next;
      End;
    End;
  Finally
    FinalizaQuery(Lc_Qry);
  End;
end;

procedure TCtrlMobOrderConsignmentOperation.getListSplItemsStatement(CodeProduct:Integer);
Var
  Lc_Qry :TFDQuery;
  item : TListSplOrderConsignmentItemsStatement;
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
            'oi.tb_order_id, ',
            'oi.tb_product_id, ',
            'pd.description,',
            'oi.quantity, ',
            'oi.unit_value, ',
            'oi.discount_aliquot, ',
            'oi.discount_value, ',
            '( ( oi.quantity * oi.unit_value) - oi.discount_value ) subtotal, ',
            'oco.dt_record, ',
            'oco.kind ',
            'from tb_order_item oi ',
            '  inner join tb_order_consignment_operation oco ',
            '  on (oco.tb_order_item_id = oi.id) ',
            '      and  ( oco.tb_order_id = oi.tb_order_id) ',
            '      and  ( oco.tb_institution_id = oi.tb_institution_id ) ',
            ' inner join tb_product pd ',
            ' on (oi.tb_product_id = pd.id) ',
            'where ( oi.tb_order_id =:tb_order_id) ',
            ' and  ( oi.tb_product_id =:tb_product_id) ',
            ' and  ( oco.tb_institution_id=:tb_institution_id ) ',
            'order by oco.dt_record desc, oco.kind desc '
          ));
      //sql.Add(concat('Limit ', InttoStr( (Page * 20 ) - 20 ),',', InttoStr( (Page * 20 ) ) ));
     //Passagem de PArametros
      ParamByName('tb_institution_id').AsInteger := Self.Registro.Estabelecimento;
      ParamByName('tb_order_id').AsInteger        := Registro.Ordem;
      ParamByName('tb_product_id').AsInteger      := CodeProduct;

      Active := True;
      FetchAll;
      First;
      ListSplItemsStatement.Clear;
      while not eof do
      Begin
        item := TListSplOrderConsignmentItemsStatement.Create;
        item.Codigo         := FieldByName('id').AsInteger;
        item.Produto        := FieldByName('tb_product_id').AsInteger;
        item.Descricao      := FieldByName('description').AsString;
        item.Qtde           := FieldByName('quantity').AsFloat;
        item.ValorUnitario  := FieldByName('unit_value').AsFloat;
        item.ValorSubTotal  := FieldByName('subtotal').AsFloat;
        item.Data           := FieldByName('dt_record').AsString;
        item.Tipo           := FieldByName('kind').AsString;
        //add lista
        ListSplItemsStatement.Add( item );
        Next;
      End;
    End;
  Finally
    FinalizaQuery(Lc_Qry);
  End;
end;

function TCtrlMobOrderConsignmentOperation.getPrice(ProdutoID: Integer): Real;
Var
  LcPrice : TCtrlMobPrice;
begin
  try
    LcPrice := TCtrlMobPrice.Create(Self);
    LcPrice.Registro.Estabelecimento := self.Registro.Estabelecimento;
    LcPrice.Registro.Tabela          := 1;
    LcPrice.Registro.Produto          := ProdutoID;
    LcPrice.getByKey;
    Result := LcPrice.Registro.Preco;
  finally
    LcPrice.DisposeOf;
  end;
end;

function TCtrlMobOrderConsignmentOperation.getTotalValue: REal;
Var
  Lc_Qry : TFdQuery;
begin
  Try
    Lc_Qry := createQuery;
    with Lc_Qry do
    Begin
      sql.Add(concat(
                'select distinct oi.tb_product_id ',
                'from tb_order_consignment_operation oco ',
                '  inner join tb_order_item oi ',
                '  on ( oi.id = oco.tb_order_item_id ) ',
                '     and  ( oi.tb_order_id = oco.tb_order_id) ',
                '     and  ( oi.tb_institution_id = oco.tb_institution_id) ',
                'where ( oco.tb_order_id =:tb_order_id) ',
                ' and  ( oco.tb_institution_id=:tb_institution_id ) '
      ));

      if Registro.Data > 0 then
        sql.Add(' and ( oco.dt_record =:dt_record ) ');

      if Registro.Tipo <> '' then
      Begin
        if ( Pos('%',Registro.Tipo) > 0 ) then
          sql.Add(' and ( oco.kind like :kind ) ')
        else
          sql.Add(' and ( oco.kind =:kind ) ')
      End;


      //Passagem de PArametros
      ParamByName('tb_institution_id').AsInteger  := self.Registro.Estabelecimento;
      ParamByName('tb_order_id').AsInteger        := Self.Registro.Ordem;

      if Registro.Data > 0 then
        ParamByName('dt_record').AsDate := Registro.Data;

      if Registro.Tipo <> '' then
      Begin
        if ( Pos('%',Registro.Tipo) > 0 ) then
          ParamByName('kind').AsString := concat(Registro.Tipo,'%')
        else
          ParamByName('kind').AsString := Registro.Tipo;
      End;

      Active := TRue;
      First;
      REsult := 0;
      while not eof do
      Begin
        REsult := REsult + getTotalValueByProduct(FieldByName('tb_product_id').AsInteger);
        Next;
      End;
    End;
  Finally
    FinalizaQuery(Lc_Qry);
  End;


end;

function TCtrlMobOrderConsignmentOperation.getTotalValueByProduct(
  Id: Integer): Real;
Var
  Lc_Qry : TFdQuery;
begin
  Try
    Lc_Qry := createQuery;
    with Lc_Qry do
    Begin
      sql.Add(concat(
                'select oco.kind, oi.quantity , oi.unit_value ',
                'from tb_order_consignment_operation oco ',
                '  inner join tb_order_item oi ',
                '  on ( oi.id = oco.tb_order_item_id ) ',
                '     and  ( oi.tb_order_id = oco.tb_order_id) ',
                '     and  ( oi.tb_institution_id = oco.tb_institution_id) ',
                'where ( oco.tb_order_id =:tb_order_id) ',
                ' and  ( oi.tb_product_id =:tb_product_id ) ',
                ' and  ( oco.tb_institution_id=:tb_institution_id ) '
      ));
      //Incrementa sql
      if Registro.Data > 0 then
        sql.Add(' and ( oco.dt_record =:dt_record ) ');

      if Registro.Tipo <> '' then
      Begin
        if ( Pos('%',Registro.Tipo) > 0 ) then
          sql.Add(' and ( oco.kind like :kind ) ')
        else
          sql.Add(' and ( oco.kind =:kind ) ')
      End;

      //Passagem de PArametros
      ParamByName('tb_institution_id').AsInteger := Registro.Estabelecimento;
      ParamByName('tb_order_id').AsInteger := Registro.Ordem;

      ParamByName('tb_product_id').AsInteger := Id;

      if Registro.Data > 0 then
        ParamByName('dt_record').AsDateTime := Registro.Data;

      if Registro.Tipo <> '' then
      Begin
        if ( Pos('%',Registro.Tipo) > 0 ) then
          ParamByName('kind').AsString := concat(Registro.Tipo,'%')
        else
          ParamByName('kind').AsString := Registro.Tipo;
      End;

      Active := TRue;
      First;
      REsult := 0;
      while not eof do
      Begin
        if Copy(FieldByName('kind').AsString,1,1) = 'E' then
          REsult := REsult + (FieldByName('quantity').AsFloat * FieldByName('unit_value').AsFloat)
        else
          REsult := REsult - (FieldByName('quantity').AsFloat * FieldByName('unit_value').AsFloat);
        Next;
      End;
      if result<0 then
        Result := Result * -1
    End;
  Finally
    FinalizaQuery(Lc_Qry);
  End;
end;

function TCtrlMobOrderConsignmentOperation.insert: boolean;
begin
  Try
    insertObj(Registro);
    Result := True;
  Except
    Result := False;
  End;
end;

function TCtrlMobOrderConsignmentOperation.save: boolean;
begin
  Try
    SaveObj(Registro);
    Result := True;
  Except
    Result := False;
  End;
end;

procedure TCtrlMobOrderConsignmentOperation.setStrutureUpdate;
begin
  createColumnIfNotExists('tb_order_consignment_operation','tb_institution_id','int(11)');
end;

procedure TCtrlMobOrderConsignmentOperation.updateTbInstituition;
Var
  Lc_Qry : TFDQuery;
Begin
  Try
    Lc_Qry := createQuery;
    with Lc_Qry do
    Begin
      Active := False;
      sql.Clear;
      sql.Add(concat(
                'update tb_order_consignment_operation set     ',
                'tb_institution_id =:tb_institution_id  ',
                'where ( tb_institution_id is null ) or (tb_institution_id = '''' )  '
      ));
      ParamByName('tb_institution_id').AsInteger := Registro.Estabelecimento;
      ExecSQL;
    End;
  Finally
    FinalizaQuery(Lc_Qry);
  End;

end;

end.




