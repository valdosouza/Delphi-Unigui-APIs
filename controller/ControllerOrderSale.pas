unit ControllerOrderSale;

interface
uses System.Classes, System.SysUtils,BaseController,
      tblOrderSale, tblEntity, FireDAC.Comp.Client,Md5,REST.json,
      FireDAC.Stan.Param, ControllerCustomer, ControllerOrder, ControllerSalesman,
      ControllerPaymentTypes,ControllerOrderTotalizer, ControllerOrderItem,
      ControllerOrderBilling, prm_order_sale, list_spl_value,list_spl_order_sale, TypesCollection,
  TypesListCollection, ControllerFinancial,ObjOrderSale, tblOrderItem,
  System.Generics.Collections,tblorder,tblCustomer,tblOrderTotalizer, tblOrderBilling;

Type
  TObjListOrderSale = TObjectList<TObjOrderSale>;

  TControllerOrderSale = Class(TBaseController)
    procedure clear;
  private
    function getDispositivos:String;
  public
    Registro          : TOrderSale;
    Parametro         : TPrmOrderSale;
    Order             : TControllerOrder;
    Customer          : TControllerCustomer;
    SalesMan          : TControllerSalesman;
    PaymentType       : TControllerPaymentTypes;
    Totalizer         : TControllerOrderTotalizer;
    items             : TControllerOrderItem;
    Billing           : TControllerOrderBilling;
    Financial         : TControllerFinancial;
    ListSpl            : TCollSplOrderSale;
    Lista             : TListOrdemSale;
    ListaObj          : TObjListOrderSale;
    Obj               : TObjOrderSale;
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    function save:boolean;
    function deleteAll: boolean;
    function getByKey:Boolean;
    function getLastBySalesman:Boolean;
    function getBySalesman:Boolean;
    function getAllLevelOne:Boolean;
    Function getNexNumber:String;
    Function getLastNumber:String;
    Function getLastCodigo:Integer;
    Function getLastOrder:Boolean;
    function getNumber:Boolean;
    function getListSpl : TCollSplOrderSale;
    function getListSplByHour : TCollSplValue;
    function getListSplByDate : TCollSplValue;
    procedure getListObj;
    procedure getList;
    procedure FillDataObjeto(PcRegistro: TOrderSale);
    function saveDataObjeto(DObj : TObjOrderSale):Boolean;
    procedure setParametro(par:String);
  End;

implementation

{ ControllerOrderSale}

procedure TControllerOrderSale.clear;
begin
  clearObj(Registro);
end;

constructor TControllerOrderSale.Create(AOwner: TComponent);
begin
  inherited;
  Registro    := TOrderSale.Create;
  Parametro   := TPrmOrderSale.Create;
  PaymentType := TControllerPaymentTypes.Create(self);
  Order       := TControllerOrder.Create(self);
  Customer    := TControllerCustomer.Create(self);
  Totalizer   := TControllerOrderTotalizer.Create(self);
  SalesMan    := TControllerSalesman.Create(self);
  items       := TControllerOrderItem.Create(self);
  Billing     := TControllerOrderBilling.Create(self);
  Financial   := TControllerFinancial.Create(self);
  ListSpl     := TCollSplOrderSale.Create;
  Lista       := TListOrdemSale.Create;
  ListaObj    := TObjListOrderSale.Create;
  Obj         := TObjOrderSale.Create;
end;

function TControllerOrderSale.deleteAll: boolean;
begin
  Try
    items.Registro.Codigo           := Registro.Codigo;
    items.Registro.Estabelecimento  := Registro.Estabelecimento;
    items.Registro.Terminal         := Registro.Terminal;
    items.deletebyOrder;

    Billing.Registro.Codigo           := Registro.Codigo;
    Billing.Registro.Estabelecimento  := Registro.Estabelecimento;
    Billing.Registro.Terminal         := Registro.Terminal;
    Billing.delete;

    Totalizer.Registro.Codigo           := Registro.Codigo;
    Totalizer.Registro.Estabelecimento  := Registro.Estabelecimento;
    Totalizer.Registro.Terminal         := Registro.Terminal;
    Totalizer.delete;

    deleteObj(Registro);

    order.Registro.Codigo           := Registro.Codigo;
    order.Registro.Estabelecimento  := Registro.Estabelecimento;
    order.Registro.Terminal         := Registro.Terminal;
    order.delete;

    Result := True;
  Except
    on E : Exception do
    Begin
      geralog('ControllerOrderSale',E.Message);
      Result := False;
    End;
  End;

end;

destructor TControllerOrderSale.Destroy;
begin
  Obj.Destroy;
  Registro.DisposeOf;
  Parametro.Destroy;
  PaymentType.DisposeOf;
  Order.DisposeOf;
  Customer.DisposeOf;
  Totalizer.DisposeOf;
  SalesMan.DisposeOf;
  items.DisposeOf;
  Billing.DisposeOf;
  Financial.DisposeOf;
  ListSpl.DisposeOf;
  Lista.DisposeOf;
  ListaObj.DisposeOf;
  inherited;
end;

procedure TControllerOrderSale.FillDataObjeto(PcRegistro: TOrderSale);
Var
  I : Integer;
  LcOrder : TOrder;
  lcitems : TOrderItem;
begin
    //Order
    Self.Order.clear;
    Self.Order.Registro.Estabelecimento := PcRegistro.Estabelecimento;
    Self.Order.Registro.Codigo          := PcRegistro.Codigo;
    Self.Order.Registro.Terminal        := PcRegistro.Terminal;
    Self.Order.getByKey;
    if Self.Order.exist then
    BEgin
      _assign(Self.Order.Registro, Obj.Order );

      //OrderSale
      _assign( PcRegistro, Obj.OrderSale );
       //Cliente
      Customer.Registro.Codigo          :=  Obj.OrderSale.Cliente;
      Customer.Registro.Estabelecimento :=  PcRegistro.Estabelecimento;
      Customer.getAllByKey;
      Customer.Fiscal.fillDataObjeto(Customer.Registro.Codigo,Obj.Fiscal);
      Customer.assign(Customer.Registro,Obj.Cliente);

      //Vendedor
      Self.SalesMan.Colaborador.Fiscal.Fisica.Registro.Codigo := Obj.OrderSale.Vendedor;
      Obj.DocFiscalVendedor := Self.SalesMan.Colaborador.Fiscal.Fisica.getCpfById;

      //Items
      Self.items.Registro := TOrderItem.Create;
      Self.items.Registro.Estabelecimento := PcRegistro.Estabelecimento;
      Self.items.Registro.Ordem           := PcRegistro.Codigo;
      Self.items.Registro.Terminal        := PcRegistro.Terminal;
      Self.items.Lista := TListItems.Create;
      Self.items.getList;
      for I := 0 to Self.items.Lista.Count - 1 do
      Begin
        lcitems := TOrderItem.Create;
        _assign(Self.items.Lista[I],lcitems );
        Obj.Items.Add(lcitems)
      end;

      //Totlalizer
      Self.Totalizer.clear;
      Self.Totalizer.Registro.Estabelecimento := PcRegistro.Estabelecimento;
      Self.Totalizer.Registro.Codigo := PcRegistro.Codigo;
      Self.Totalizer.Registro.Terminal := PcRegistro.Terminal;
      Self.Totalizer.getByKey;
      if Self.Totalizer.exist then
        _assign( Self.Totalizer.Registro, Obj.Totalizer );

      //Billing
      Self.Billing.clear;
      Self.Billing.Registro.Estabelecimento := PcRegistro.Estabelecimento;
      Self.Billing.Registro.Codigo := PcRegistro.Codigo;
      Self.Billing.Registro.Terminal := PcRegistro.Terminal;
      Self.Billing.getByKey;
      if Self.Billing.exist then
      Begin
        _assign(Self.Billing.Registro, Obj.Billing);
        //Forma de Pagamento - Descritivo
        PaymentType.Registro.Codigo             := Self.Billing.Registro.FormaPagamento;
        PaymentType.Institution.Estabelecimento := PcRegistro.Estabelecimento;
        PaymentType.getbyKey;
        obj.FormaPagamento := PaymentType.Registro.Descricao;
      End
      else
      Begin
        obj.Billing.Estabelecimento := PcRegistro.Estabelecimento;
        obj.Billing.Codigo          := PcRegistro.Codigo;
        obj.Billing.Terminal        := PcRegistro.Terminal;
        SELF.PaymentType.Institution.Estabelecimento := PcRegistro.Estabelecimento;
        SELF.PaymentType.Registro.Descricao := 'CARTEIRA';
        SELF.PaymentType.getByDescripton;
        obj.Billing.FormaPagamento  := SELF.PaymentType.Registro.Codigo;
        obj.Billing.Parcelas        := '1';
        obj.Billing.Prazo           := '000 - A VISTA';
        obj.Billing.Responsavel     := PcRegistro.Vendedor;
      End;
    End;
end;

function TControllerOrderSale.save: boolean;
begin
  if Registro.Numero = 0 then
    Registro.Numero := getNextByField(Registro,'number',Registro.Estabelecimento);
  try
    SaveObj(Registro);
    Result := true;
  except
    Result := False;
  end;
end;

function TControllerOrderSale.saveDataObjeto(DObj: TObjOrderSale): Boolean;
VAr
  I : Integer;
  lcitems : TOrderItem;
begin
  tRY
    //Salva o cliente e reposiciona os registro de cliente e vendedor]
    self.Customer.Fiscal.saveDataObjeto(DObj.Fiscal);
    DObj.Cliente.Codigo := DObj.Fiscal.Entidade.Entidade.Codigo;
    _assign(DObj.Cliente,self.Customer.Registro);
    self.Customer.save;
    //Verifica o codigo do vendedor na web pesquisando pelo vendedor do pedido (não confundir com a função dentro do cliente)
    //O campo DocFiscalVendedor não é preenchhido no Aplicativo por que já está com o codigo correto
    if Length(DObj.DocFiscalVendedor)> 0 then
    Begin
      if Length(DObj.DocFiscalVendedor) = 11 then
        DObj.OrderSale.Vendedor := self.SalesMan.Colaborador.Fiscal.Fisica.getIDbyCPF(DObj.DocFiscalVendedor)
      else
        DObj.OrderSale.Vendedor := self.SalesMan.Colaborador.Fiscal.Juridica.getIDbyCNPJ(DObj.DocFiscalVendedor);
    End;
    //O usuairo do Gestão será substituido pelo Vendedor
    //O usuario do Aplicativo já vem com o codigo do vendedor correto.
    if DObj.OrderSale.Vendedor > 0 then
      DObj.Order.Usuario := DObj.OrderSale.Vendedor
    else
    Begin
      DObj.OrderSale.Vendedor := DObj.Estabelecimento;
      DObj.Order.Usuario := DObj.Estabelecimento;
    End;


    if DObj.Descricao = 'SERVER' then
    Begin
      if DObj.CodigoWeb > 0 then
      BEgin
        self.Registro.Codigo           := DObj.CodigoWeb;
        self.Registro.Estabelecimento  := DObj.Estabelecimento;
        //Passou antes pelo Customer.saveDataObjeto para pegar o codigo do vendedor na web.
        self.Registro.Vendedor         := DObj.OrderSale.Vendedor;
        self.getBySalesman;
        if exist then
        Begin
          DObj.Terminal       := self.Registro.Terminal;
          //Reposiciona os registro orderSale
          DObj.OrderSale      := self.Registro;
          //Reposiciona os registro ordem
          DObj.Order.Codigo   := self.Registro.Codigo;
          DObj.Order.Terminal := self.Registro.Terminal;
          DObj.Order.Usuario  := self.Registro.Vendedor;
          //Reposiciona os registro billing
          DObj.Billing.Codigo         := self.Registro.Codigo;
          DObj.Billing.Terminal       := self.Registro.Terminal;
          //Reposiciona o regstro forma de pagamento
          PaymentType.Registro.Descricao := DObj.FormaPagamento;
          PaymentType.getByDescripton;
          DObj.Billing.FormaPagamento := PaymentType.Registro.Codigo;
          //Reposiciona os registro totalizer
          DObj.Totalizer.Codigo         := self.Registro.Codigo;
          DObj.Totalizer.Terminal       := self.Registro.Terminal;
        End;
      End;
    End;
    {Na seção anterior reposicionamos todos os dados do objeto principal
      para seguirmos daqui em diante sem complicações
    }
    _assign( DObj.Order, self.Order.Registro);
    self.Order.save;

    _assign( DObj.OrderSale, self.Registro);
    self.save;


    for I := 0 to DObj.Items.Count -1 do
    Begin
      _assign( DObj.Items[I], self.items.Registro );
      self.items.save;
    End;

    _assign(  DObj.Totalizer, Totalizer.Registro);
    self.Totalizer.save;

    _assign( DObj.Billing, self.Billing.Registro);
    if DObj.FormaPagamento <> '' then
    Begin
      PaymentType.Registro.Descricao := DObj.FormaPagamento;
      PaymentType.getByDescripton;
      //
      self.Billing.Registro.FormaPagamento := PaymentType.Registro.Codigo;
    end;
    self.Billing.save;
    result := True;
  except
    on E: Exception do
    Begin
      Geralog('TControllerOrderSale.saveDataObjeto',concat(e.Message,Registro.Numero.ToString));
      Result := False;
    End;
  end;
end;

procedure TControllerOrderSale.setParametro(par: String);
begin
  Parametro:= TJson.JsonToObject<TPrmOrderSale>(par);
  //Tratar Data
  Parametro.UltimaAtualizacao := dataMysql(Parametro.UltimaAtualizacao);
end;

function TControllerOrderSale.getAllLevelOne: Boolean;
begin
  _getByKey(Registro);
  //Order
  Order.Registro.Codigo := Registro.Codigo;
  Order.Registro.Estabelecimento := Registro.Estabelecimento;
  Order.Registro.Terminal := Registro.Terminal;
  Order.getByKey;
  //Customer
  Customer.Registro.Estabelecimento := Registro.Estabelecimento;
  Customer.Registro.Codigo := Registro.Cliente;
  Customer.getAllByKey;
  //itens
  items.Registro.Estabelecimento := Registro.Estabelecimento;
  items.Registro.Ordem := Registro.Codigo;
  items.Registro.Terminal := Registro.Terminal;
  items.getList;
  //Totalizador
  Totalizer.Registro.Estabelecimento := Registro.Estabelecimento;
  Totalizer.Registro.Codigo := Registro.Codigo;
  Totalizer.Registro.Terminal := Registro.Terminal;
  Totalizer.getByKey;
  //Negociação
  Billing.Registro.Estabelecimento := Registro.Estabelecimento;
  Billing.Registro.Codigo := Registro.Codigo;
  Billing.Registro.Terminal := Registro.Terminal;
  Billing.getByKey;

  //Cobrança
  Financial.Registro.Estabelecimento := Registro.Estabelecimento;
  Financial.Registro.Ordem := Registro.Codigo;
  Financial.Registro.Terminal := Registro.Terminal;
  Financial.getByKey;

end;

function TControllerOrderSale.getByKey: Boolean;
begin
  Registro.Estabelecimento  := parametro.OrdemVenda.Estabelecimento;
  Registro.Codigo           := parametro.OrdemVenda.Codigo;
  Registro.Terminal         := parametro.OrdemVenda.Terminal;
  Registro.Vendedor         := parametro.OrdemVenda.Vendedor;
  _getByKey(Registro);
end;

function TControllerOrderSale.getBySalesman: Boolean;
Var
  Lc_Qry : TFDQuery;
begin
  Try
    Lc_Qry := createQuery;
    with Lc_Qry do
    Begin
      Active := False;
      SQL.Clear;
      SQL.Add(concat(
                'SELECT os.* ',
                'FROM tb_order_sale os ',
                'where ( os.tb_institution_id =:institution_id ) ',
                '  and ( os.id =:id ) ',
                '  and ( os.tb_salesman_id =:salesman_id ) '
      ));
      ParamByName('id').AsInteger := Registro.Codigo;
      ParamByName('institution_id').AsInteger := Registro.Estabelecimento;
      ParamByName('salesman_id').AsInteger := Registro.Vendedor;
      Active := True;
      FetchAll;
      exist := recordCount > 0;
      if exist then
        get(Lc_Qry,Registro);
    End;
  Finally
    Lc_Qry.Unprepare;
    finalizaQuery(Lc_Qry);
  End;
end;

function TControllerOrderSale.getDispositivos: String;
var
  Lc_Qry : TFDQuery;
  LITem : TOrderSale;
begin
  Try
    Lc_Qry := createQuery;
    with Lc_Qry do
    Begin
      sql.add(concat(
                'select id ',
                'from tb_devices ',
                'where tb_institution_id =:institution_id ',
                'and download = ''S'' '
      ));

      //Passagem de parametros
      parambyname('institution_id').AsInteger := Registro.Estabelecimento;
      Active := True;
      FetchAll;
      First;
      Result := '0';
      while not eof do
      Begin
        Result := concat(Result,',',FieldByName('id').AsString);
        next;
      end;
      Result := concat('(',Result,')');
    end;
  Finally
    FinalizaQuery(Lc_Qry);
  End;
end;

function TControllerOrderSale.getLastBySalesman: Boolean;
Var
  LcNumber : Integer;
  Lc_Qry : TFDQuery;
begin
  Try
    Lc_Qry := createQuery;
    with Lc_Qry do
    Begin
      Active := False;
      SQL.Clear;
      SQL.Add(concat(
                'SELECT * ',
                'FROM tb_order_sale op ',
                'where ( op.tb_institution_id =:institution_id ) ',
                ' and (op.tb_salesman_id=:tb_salesman_id) ',
                ' and (op.id =:id) '
      ));
      ParamByName('institution_id').AsInteger := Parametro.OrdemVenda.Estabelecimento;
      ParamByName('tb_salesman_id').AsInteger := Parametro.OrdemVenda.Vendedor;
      ParamByName('id').AsInteger             := Parametro.OrdemVenda.Codigo;
      Active := True;
      FetchAll;
      get(Lc_Qry,Registro);
    End;
  Finally
    finalizaQuery(Lc_Qry);
  End;
end;

function TControllerOrderSale.getLastCodigo: Integer;
Var
  LcNumber : Integer;
  Lc_Qry : TFDQuery;
begin
  Try
    Lc_Qry := createQuery;
    with Lc_Qry do
    Begin
      Active := False;
      SQL.Clear;
      SQL.Add(concat(
                'SELECT MAX(op.id) id ',
                'FROM tb_order_sale op ',
                'where op.tb_institution_id =:institution_id '
      ));
      if Parametro.OrdemVenda.Vendedor > 0 then
        SQL.Add(' and (tb_salesman_id=:tb_salesman_id) ');

      if Parametro.OrdemVenda.Terminal > 0 then
        SQL.Add(' and (terminal =:terminal) ');


      ParamByName('institution_id').AsInteger := Parametro.OrdemVenda.Estabelecimento;

      if Parametro.OrdemVenda.Vendedor > 0 then
        ParamByName('tb_salesman_id').AsInteger := Parametro.OrdemVenda.Vendedor;

      if Parametro.OrdemVenda.Terminal > 0 then
        ParamByName('terminal').AsInteger := Parametro.OrdemVenda.Terminal;

      Active := True;
      FetchAll;
      Result := FieldByName('id').AsInteger;
    End;
  Finally
    finalizaQuery(Lc_Qry);
  End;


end;

function TControllerOrderSale.getLastNumber: String;
Var
  LcNumber : Integer;
  Lc_Qry : TFDQuery;
begin
  Try
    Lc_Qry := createQuery;
    with Lc_Qry do
    Begin
      Active := False;
      SQL.Clear;
      SQL.Add(concat(
                'SELECT MAX(op.number) ordem ',
                'FROM tb_order_sale op ',
                'where op.tb_institution_id =:institution_id '
      ));
      if registro.Vendedor > 0 then
        SQL.Add(' and (tb_salesman_id=:tb_salesman_id) ');

      ParamByName('institution_id').AsInteger := Registro.Estabelecimento;
      if registro.Vendedor > 0 then
        ParamByName('tb_salesman_id').AsInteger := Registro.Vendedor;

      Active := True;
      FetchAll;
      Result := FieldByName('ordem').AsString;
    End;
  Finally
    finalizaQuery(Lc_Qry);
  End;

end;


function TControllerOrderSale.getLastOrder: Boolean;
begin
  Registro.Estabelecimento := parametro.OrdemVenda.Estabelecimento;
  Registro.Terminal        := parametro.OrdemVenda.Terminal;
  Registro.Vendedor        := parametro.OrdemVenda.Vendedor;
  Registro.Codigo          := getLastCodigo;
  _getByKey(Registro);
end;

procedure TControllerOrderSale.getList;
var
  Lc_Qry : TFDQuery;
  LITem : TOrderSale;
  LcAux : String;
begin
  Try
    Lc_Qry := createQuery;
    with Lc_Qry do
    Begin
      sql.add(concat('SELECT ods.* ',
                     'FROM tb_order_sale ods ',
                     '  inner join tb_order od ',
                     '  on (od.id = ods.id) ',
                     '   and (od.tb_institution_id = ods.tb_institution_id) ',
                     '   and (od.terminal = ods.terminal) ',
                     'WHERE ( od.status = ''N'' ) ',
                     ' and ( ods.tb_institution_id =:institution_id ) '
      ));

      //Incrementa SQL
      //Verifica de quais dispositivos serão feitos os downloads

      if Parametro.OrdemVenda.Terminal > 0 then
        sql.add(' and (ods.terminal =:terminal)' );


      if Trim(Parametro.UltimaAtualizacao) <> '' then
      Begin
        sql.add(' AND ( ods.updated_at >:updated_at ) ');
        sql.add(' order by ods.updated_at asc ');
      End
      else
      Begin
        if Trim(orderby)='' then orderby := 'ods.id';
        sql.add(concat(' ORDER BY ',orderby,'  asc '));
      End;

      //Passagem de parametros
      parambyname('institution_id').AsInteger := Parametro.OrdemVenda.Estabelecimento;

      if Parametro.OrdemVenda.Terminal > 0 then
        parambyname('terminal').AsInteger := Parametro.OrdemVenda.Terminal;

      if Trim(Parametro.UltimaAtualizacao) <> '' then
        parambyname('updated_at').AsString := Parametro.UltimaAtualizacao;

      Active := True;
      FetchAll;
      First;
      Lista.Clear;
      while not eof do
      Begin
        LITem := TOrderSale.Create;
        get(Lc_Qry,LITem);
        Lista.add(LITem);
        next;
      end;
    end;
  Finally
    FinalizaQuery(Lc_Qry);
  End;


end;

procedure TControllerOrderSale.getListObj;
Var
  I : Integer;
  LcReg : TOrderSale;
begin
  ListaObj.Clear;
  getList;
  for I := 0 to (Lista.Count - 1)do
  Begin
    LcReg := TOrderSale.Create;
    LcReg := Lista[I];
    try
      FillDataObjeto(LcReg);
    Except on E: Exception do
      geralog(concat('Order Sale - getListObj - Sequencia ',I.ToString,' | '), E.Message);
    end;
    ListaObj.Add( Obj );
  End;

end;

function TControllerOrderSale.getListSpl: TCollSplOrderSale;
Var
  Lc_Qry :TFDQuery;
  Lista : TListSplOrderSale;
begin
  Try
    result := TCollSplOrderSale.Create;
    Lc_Qry := createQuery;
    with Lc_Qry do
    Begin
      sql.Clear;
      sql.Add(concat(
              'SELECT distinct ors.id, ors.number, ord.dt_record, ',
              'et.name_company, et.nick_trade, ort.total_value ',
              'FROM tb_order ord ',
              '  inner join tb_order_sale ors ',
              '  on (ors.id = ord.id) and  (ors.tb_institution_id = ord.tb_institution_id) ',
              '  INNER JOIN tb_entity et ',
              '  on (ors.tb_customer_id = et.id) ',
              '  inner join tb_order_totalizer ort ',
              '  on (ort.id = ord.id) and  (ort.tb_institution_id = ord.tb_institution_id) ',
              'where ord.tb_institution_id =:institution_id ',
              ' and (ord.dt_record between :dataini and :datafim)',
              ' and ( ors.kind =:kind ) '
          ));


      if Parametro.Entidade.NomeRazao <> '' then
        sql.Add(' and ( et.name_company like :name) ');

      //paginação
      //Limite 0,20  - pagina 1 do 00 ao 20
      //Limite 20,40 - pagina 2 do 20 ao 40
      //Limite 40,60 - pagina 3 do 40 ao 60
      //Limite 60,80 - pagina 4 do 60 ao 80
      sql.Add(concat('Limit ', InttoStr( (Parametro.Pagina * 20 ) - 20 ),',', InttoStr( (Parametro.Pagina * 20 ) ) ));
      //passagem de PArametros
      ParamByName('institution_id').AsInteger := Parametro.OrdemVenda.Estabelecimento;

      ParamByName('dataini').AsString := Copy( ConverteDataMysql( Parametro.DataInicial),1,10);
      ParamByName('datafim').AsString := Copy( ConverteDataMysql( Parametro.DataFinal),1,10);

      if Parametro.Entidade.NomeRazao <> '' then
        ParamByName('name').AsString := concat('%',Parametro.Entidade.NomeRazao,'%');

      Active := True;
      FetchAll;
      First;
      while not eof do
      Begin
        Lista := TListSplOrderSale.Create;
        Lista.Codigo      := FieldByName('id').AsInteger;
        Lista.Pedido      := FieldByName('number').AsString;
        Lista.Data        := FieldByName('dt_record').AsDateTime;
        Lista.NomeCliente := FieldByName('name_company').AsString;
        Lista.ValorPedido := FieldByName('total_value').AsFloat;
        //add lista
        Result.Add(Lista);
        Next;
      End;
    End;
  Finally
    FinalizaQuery(Lc_Qry);
  End;

end;

function TControllerOrderSale.getListSplByDate: TCollSplValue;
Var
  Lc_Qry :TFDQuery;
  Lista : TListSplValue;
begin
  Try
    result := TCollSplValue.Create;
    Lc_Qry := createQuery;
    with Lc_Qry do
    Begin
      sql.Clear;
      sql.Add(concat(
              'SELECT  SUBSTR( ord.created_at,1,10) dt_venda , sum(inv.VALUE) total_value ',
              'FROM tb_order ord ',
              '  INNER JOIN tb_order_sale sal ',
              '  on (sal.id = ord.id) ',
              '    and (sal.tb_institution_id = ord.tb_institution_id) ',
              '  INNER JOIN tb_invoice inv ',
              '  on (sal.id = inv.id) ',
              '    and (sal.tb_institution_id = inv.tb_institution_id) ',
              '  INNER JOIN tb_entity ent ',
              '  ON (ent.id = inv.tb_entity_id) ',
              'where ord.tb_institution_id=:tb_institution_id ',
              ' and (dt_emission between :dataini and :datafim) ',
              'group by 1 '
          ));


      //passagem de PArametros
      ParamByName('tb_institution_id').AsInteger := Parametro.OrdemVenda.Estabelecimento;

      ParamByName('dataini').AsString := Copy( ConverteDataMysql( Parametro.DataInicial),1,10);
      ParamByName('datafim').AsString := Copy( ConverteDataMysql( Parametro.DataFinal),1,10);

      if Parametro.Entidade.NomeRazao <> '' then
        ParamByName('name').AsString := concat('%',Parametro.Entidade.NomeRazao,'%');

      Active := True;
      FetchAll;
      First;
      while not eof do
      Begin
        Lista := TListSplValue.Create;
        Lista.Estabelecimento := Parametro.OrdemVenda.Estabelecimento;
        Lista.Terminal        := Parametro.OrdemVenda.Terminal;
        Lista.Descricao       := concat(FieldByName('dt_venda').AsString);
        Lista.Valor           := FieldByName('total_value').AsFloat;
        //add lista
        Result.Add(Lista);
        Next;
      End;
    End;
  Finally
    FinalizaQuery(Lc_Qry);
  End;
end;

function TControllerOrderSale.getListSplByHour: TCollSplValue;
Var
  Lc_Qry :TFDQuery;
  Lista : TListSplValue;
begin
  Try
    result := TCollSplValue.Create;
    Lc_Qry := createQuery;
    with Lc_Qry,Parametro do
    Begin
      sql.Clear;
      sql.Add(concat(
              'SELECT  SUBSTR( ord.created_at,12, 2) hr_venda , sum(inv.VALUE) total_value ',
              'FROM tb_order ord ',
              '  INNER JOIN tb_order_sale sal ',
              '  on (sal.id = ord.id) ',
              '    and (sal.tb_institution_id = ord.tb_institution_id) ',
              '  INNER JOIN tb_invoice inv ',
              '  on (sal.id = inv.id) ',
              '    and (sal.tb_institution_id = inv.tb_institution_id) ',
              '  INNER JOIN tb_entity ent ',
              '  ON (ent.id = inv.tb_entity_id) ',
              'where ord.tb_institution_id=:tb_institution_id ',
              ' and (dt_emission between :dataini and :datafim) ',
              'group by 1 '
          ));


      //passagem de PArametros
      ParamByName('tb_institution_id').AsInteger := Parametro.OrdemVenda.Estabelecimento;

      ParamByName('dataini').AsString := Copy( ConverteDataMysql( Parametro.DataInicial),1,10);
      ParamByName('datafim').AsString := Copy( ConverteDataMysql( Parametro.DataFinal),1,10);

      if Entidade.NomeRazao <> '' then
        ParamByName('name').AsString := concat('%',Entidade.NomeRazao,'%');

      Active := True;
      FetchAll;
      First;
      while not eof do
      Begin
        Lista := TListSplValue.Create;
        Lista.Estabelecimento := Parametro.OrdemVenda.Estabelecimento;
        Lista.Terminal        := Parametro.OrdemVenda.Terminal;
        Lista.Descricao       := concat(FieldByName('hr_venda').AsString,':00 Horas');
        Lista.Valor           := FieldByName('total_value').AsFloat;
        //add lista
        Result.Add(Lista);
        Next;
      End;
    End;
  Finally
    FinalizaQuery(Lc_Qry);
  End;


end;

function TControllerOrderSale.getNexNumber: String;
Var
  LcNumber : Integer;
  Lc_Qry : TFDQuery;
begin
  Try
    Lc_Qry := createQuery;
    with Lc_Qry do
    Begin
      Active := False;
      SQL.Clear;
      SQL.Add(concat(
                'SELECT MAX(op.number) ordem ',
                'FROM tb_order_sale op ',
                'where op.tb_institution_id =:institution_id '
      ));
      ParamByName('institution_id').AsInteger := Registro.Estabelecimento;
      Active := True;
      LcNumber := StrToIntDef(FieldByName('ordem').AsString,0) + 1;
      Result := IntToStr(LcNumber);
    End;
  Finally
    finalizaQuery(Lc_Qry);
  End;
end;

function TControllerOrderSale.getNumber: Boolean;
Var
  Lc_Qry : TFDQuery;
begin
  Try
    Lc_Qry := createQuery;
    with Lc_Qry do
    Begin
      Active := False;
      sql.Clear;
      sql.Add(concat(
              'Select id, number ',
              'from tb_order_sale ',
              'where ( tb_institution_id =:tb_institution_id ) ',
              ' and (number =:number) '
              ));
      ParamByName('tb_institution_id').AsInteger := Registro.Estabelecimento;
      ParamByName('number').AsInteger := Registro.Numero;
      Prepare;
      Active := True;
      FetchAll;
      if (RecordCount > 0 ) then
      Begin
        registro.Codigo := FieldByName('id').AsInteger;
        Result := True;
      End
      else
      Begin
        Result := False;
      End;
    End;
  Finally
    finalizaQuery(Lc_Qry);
  End;
end;

end.
