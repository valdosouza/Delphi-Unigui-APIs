 unit ControllerOrderPurchase;

interface
uses System.Classes, System.SysUtils,BaseController,Rest.json,
      tblOrderPurchase, tblEntity, FireDAC.Comp.Client,Md5,
       FireDAC.Stan.Param, ControllerProvider, ControllerPaymentTypes, ControllerOrder,
       ControllerOrderTotalizer, ControllerOrderItem, ControllerCarrier,
       ControllerOrderShipping, ControllerOrderBilling,
       ObjOrderPurchase,tblOrder,tblOrderItem,TypesCollection,prm_base,
       ControllerFinancial,System.Generics.Collections,prm_order_purchase,
       TypesListCollection,list_spl_order_purchase,list_spl_Value;

Type
  TObjListOrderPurchase = TObjectList<TObjOrderPurchase>;

  TControllerOrderPurchase = Class(TBaseController)

  private

  public
    Registro        : TOrderPurchase;
    Parametro       : TPrmOrderPurchase;
    Order           : TControllerOrder;
    Provider        : TControllerProvider;
    PaymentType     : TControllerPaymentTypes;
    OrderTotalizer  : TControllerOrderTotalizer;
    items           : TControllerOrderItem;
    Carrier         : TControllerCarrier;
    OrderShipping   : TControllerOrderShipping;
    OrderBilling    : TControllerOrderBilling;
    Totalizer       : TControllerOrderTotalizer;
    Billing         : TControllerOrderBilling;
    Financial       : TControllerFinancial;
    Lista           : TListOrdemPurchase;
    ListaObj        : TObjListOrderPurchase;
    Obj             : TObjOrderPurchase;


    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure setParametro(par:String);
    function save:boolean;
    procedure clear;
    function getByKey:Boolean;
    function getAllByKey:boolean;
    function delete: boolean;
    Function getNexNumber:String;
    Function getNumber:Boolean;
    Function getLastCodigo:Integer;
    function getListSplByDate : TCollSplValue;
    procedure getList;
    function getListSpl : TCollSplOrderPurchase;
    procedure FillDataObjeto(PcRegistro: TOrderPurchase);
    function saveDataObjeto(DObj : TObjOrderPurchase):Boolean;

  End;

implementation

{ ControllerOrderPurchase}

procedure TControllerOrderPurchase.clear;
begin
  ClearObj(Registro);
  PaymentType.clear;
  Order.clear;
  Provider.clear;
  OrderTotalizer.clear;
end;

constructor TControllerOrderPurchase.Create(AOwner: TComponent);
begin
  inherited;
  Registro        := TOrderPurchase.Create;
  PaymentType     := TControllerPaymentTypes.Create(self);
  Order           := TControllerOrder.Create(self);
  Provider        := TControllerProvider.Create(self);
  OrderTotalizer  := TControllerOrderTotalizer.Create(self);
  items           := TControllerOrderItem.Create(self);
  carrier         := TControllerCarrier.Create(self);
  OrderShipping   := TControllerOrderShipping.Create(self);
  OrderBilling    := TControllerOrderBilling.Create(self);
  Totalizer       := TControllerOrderTotalizer.Create(self);
  Billing         := TControllerOrderBilling.Create(self);
  Financial       := TControllerFinancial.Create(self);
  Lista           := TListOrdemPurchase.Create;
  ListaObj        := TObjListOrderPurchase.Create;
  Obj             := TObjOrderPurchase.create;
  Parametro       := TPrmOrderPurchase.create;
end;

function TControllerOrderPurchase.delete: boolean;
begin
  Try
    deleteObj(Registro);
    Result := True;
  Except
    Result := False;
  End;
end;

destructor TControllerOrderPurchase.Destroy;
begin
  Registro.DisposeOf;
  PaymentType.DisposeOf;
  Order.DisposeOf;
  Provider.DisposeOf;
  OrderTotalizer.DisposeOf;
  items.DisposeOf;
  carrier.DisposeOf;
  OrderShipping.DisposeOf;
  OrderBilling.DisposeOf;
  Totalizer.DisposeOf;
  Billing.DisposeOf;
  Financial.DisposeOf;
  Lista.DisposeOf;
  ListaObj.DisposeOf;
  Obj.Destroy;
  Parametro.Destroy;
  inherited;
end;

procedure TControllerOrderPurchase.FillDataObjeto(PcRegistro: TOrderPurchase);
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
      ClonarObj(Self.Order.Registro, Obj.Order );

      //OrderPurchase
      ClonarObj( PcRegistro, Obj.OrderPurchase );
      //Referencia Doc Fiscal CPF/CNPJ
      Provider.Registro.Codigo          :=  Obj.OrderPurchase.fornecedor;
      Provider.Registro.Estabelecimento :=  PcRegistro.Estabelecimento;
      Provider.getByKey;
      Provider.fillDataObjeto(Provider.Registro,Provider.Obj);

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
        ClonarObj(Self.items.Lista[I],lcitems );
        Obj.Items.Add(lcitems)
      end;

      //Totlalizer
      Self.Totalizer.clear;
      Self.Totalizer.Registro.Estabelecimento := PcRegistro.Estabelecimento;
      Self.Totalizer.Registro.Codigo := PcRegistro.Codigo;
      Self.Totalizer.Registro.Terminal := PcRegistro.Terminal;
      Self.Totalizer.getByKey;
      if Self.Totalizer.exist then
        ClonarObj( Self.Totalizer.Registro, Obj.Totalizer );

      //Billing
      Self.Billing.clear;
      Self.Billing.Registro.Estabelecimento := PcRegistro.Estabelecimento;
      Self.Billing.Registro.Codigo := PcRegistro.Codigo;
      Self.Billing.Registro.Terminal := PcRegistro.Terminal;
      Self.Billing.getByKey;
      if Self.Billing.exist then
      Begin
        ClonarObj(Self.Billing.Registro, Obj.Billing);
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
        obj.Billing.Responsavel     := Self.Order.Registro.Usuario;
      End;
    End;

end;

function TControllerOrderPurchase.save: boolean;
begin
  if Registro.Numero = 0 then
    Registro.Numero := getNextByField(Registro,'number',Registro.Estabelecimento);
  try
    saveObj(Registro);
    Result := true;
  except
    Result := False;
  end;
end;

function TControllerOrderPurchase.saveDataObjeto(
  DObj: TObjOrderPurchase): Boolean;
Var
  I:Integer;
begin
  tRY
    //Salva o Fornecedor e reposiciona os registro dele
    self.Provider.Fiscal.saveDataObjeto(DObj.Fiscal);

    DObj.Fornecedor.Codigo := DObj.Fiscal.Entidade.Entidade.Codigo;
    _assign(DObj.Fornecedor,self.Provider.Registro);
    self.Provider.save;

    //O usuario do Aplicativo já vem com o codigo do vendedor correto.
    if DObj.Order.Usuario = 0 then
      DObj.Order.Usuario := DObj.Estabelecimento;

    ClonarObj( DObj.Order, self.Order.Registro);
    self.Order.save;

    ClonarObj( DObj.OrderPurchase, self.Registro);
    self.save;

    for I := 0 to DObj.Items.Count -1 do
    Begin
      ClonarObj( DObj.Items[I], self.items.Registro );
      self.items.save;
    End;

    ClonarObj(  DObj.Totalizer, Totalizer.Registro);
    self.Totalizer.save;

    ClonarObj( DObj.Billing, self.Billing.Registro);
    if DObj.FormaPagamento <> '' then
    Begin
      PaymentType.Registro.Descricao := DObj.FormaPagamento;
      PaymentType.getByDescripton;
      //
      self.Billing.Registro.FormaPagamento := PaymentType.Registro.Codigo;
    end;
    self.Billing.save;
    Result := True;
  EXCEPT
    on E: Exception do
    Begin
      geralog('TControllerOrderSale.saveDataObjeto',concat(e.Message,Registro.Numero.ToString));
      Result := False;
    End;
  end;
end;

procedure TControllerOrderPurchase.setParametro(par: String);
begin
  Parametro:= TJson.JsonToObject<TPrmOrderPurchase>(par);
  //Tratar Data
  Parametro.UltimaAtualizacao := dataMysql(Parametro.UltimaAtualizacao);

end;

function TControllerOrderPurchase.getAllByKey: boolean;
begin
  _getByKey(Registro);

  with Order do
  Begin
    Registro.Codigo := Self.Registro.Codigo;
    Registro.Estabelecimento := Self.Registro.Estabelecimento;
    getByKey;
  End;

  with Provider do
  Begin
    Registro.Codigo := Self.Registro.Fornecedor;
    Registro.Estabelecimento := Self.Registro.Estabelecimento;
    getAllByKey;
  End;

  with OrderTotalizer do
  Begin
    Registro.Codigo := Self.Registro.Codigo;
    Registro.Estabelecimento := Self.Registro.Estabelecimento;
    getByKey;
  End;

  with items do
  Begin
    Registro.Ordem := Self.Registro.Codigo;
    Registro.Estabelecimento := Self.Registro.Estabelecimento;
    getList;
  End;

  with Carrier do
  Begin
    Registro.Codigo := Self.Registro.Codigo;
    Registro.Estabelecimento := Self.Registro.Estabelecimento;
    getAllByKey;
  End;

  with OrderShipping do
  Begin
    Registro.Codigo := Self.Registro.Codigo;
    Registro.Estabelecimento := Self.Registro.Estabelecimento;
    getByKey;
  End;

  with OrderBilling do
  Begin
    Registro.Codigo := Self.Registro.Codigo;
    Registro.Estabelecimento := Self.Registro.Estabelecimento;
    getByKey;
  End;

end;

function TControllerOrderPurchase.getByKey: Boolean;
begin
  Registro.Estabelecimento  := Parametro.OrdemCompra.Estabelecimento;
  Registro.Codigo           := Parametro.OrdemCompra.Codigo;
  Registro.Terminal         := Parametro.OrdemCompra.Terminal;
  _getByKey(Registro);
end;

function TControllerOrderPurchase.getLastCodigo: Integer;
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
                'FROM tb_order_purchase op ',
                'where op.tb_institution_id =:institution_id '
      ));

      if Parametro.OrdemCompra.Terminal > 0 then
        SQL.Add(' and (terminal =:terminal) ');


      ParamByName('institution_id').AsInteger := Parametro.OrdemCompra.Estabelecimento;


      if registro.Terminal > 0 then
        ParamByName('terminal').AsInteger := Parametro.OrdemCompra.Terminal;

      Active := True;
      FetchAll;
      Result := FieldByName('id').AsInteger;
    End;
  Finally
    finalizaQuery(Lc_Qry);
  End;


end;


procedure TControllerOrderPurchase.getList;
var
  Lc_Qry : TFDQuery;
  LITem : TOrderPurchase;
  LcAux : String;
begin
  Try
    Lc_Qry := createQuery;
    with Lc_Qry do
    Begin
      sql.add(concat('SELECT ods.* ',
                     'FROM tb_order_purchase ods ',
                     '  inner join tb_order od ',
                     '  on (od.id = ods.id) ',
                     '   and (od.tb_institution_id = ods.tb_institution_id) ',
                     '   and (od.terminal = ods.terminal) ',
                     'WHERE ( od.status = ''N'' ) ',
                     ' and ( ods.tb_institution_id =:institution_id ) '
      ));

      //Incrementa SQL
      //Verifica de quais dispositivos serão feitos os downloads

      if Parametro.OrdemCompra.Terminal > 0 then
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
      parambyname('institution_id').AsInteger := Parametro.OrdemCompra.Estabelecimento;

      if Parametro.OrdemCompra.Terminal > 0 then
        parambyname('terminal').AsInteger := Parametro.OrdemCompra.Terminal;

      if Trim(Parametro.UltimaAtualizacao) <> '' then
        parambyname('updated_at').AsString := Parametro.UltimaAtualizacao;

      Active := True;
      FetchAll;
      First;
      Lista.Clear;
      while not eof do
      Begin
        LITem := TOrderPurchase.Create;
        get(Lc_Qry,LITem);
        Lista.add(LITem);
        next;
      end;
    end;
  Finally
    FinalizaQuery(Lc_Qry);
  End;
end;

function TControllerOrderPurchase.getListSpl: TCollSplOrderPurchase;
Var
  Lc_Qry :TFDQuery;
  Lista : TListSplOrderPurchase;
begin
  Try
    result := TCollSplOrderPurchase.Create;
    Lc_Qry := createQuery;
    with Lc_Qry do
    Begin
      sql.Clear;
      sql.Add(concat(
              'SELECT distinct ors.id, ors.number, ord.dt_record, ',
              'et.name_company, et.nick_trade, ort.total_value ',
              'FROM tb_order ord ',
              '  inner join tb_order_purchase ors ',
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
      sql.Add(concat('Limit ', InttoStr( ( Parametro.Pagina * 20 ) - 20 ),',', InttoStr( ( Parametro.Pagina * 20 ) ) ));
      //passagem de PArametros
      ParamByName('institution_id').AsInteger := Parametro.OrdemCompra.Estabelecimento;

      ParamByName('dataini').AsDate := Parametro.DataInicial;
      ParamByName('datafim').AsDate := Parametro.DataFinal;

      if Parametro.Entidade.NomeRazao <> '' then
        ParamByName('name').AsString := concat('%',Parametro.Entidade.NomeRazao,'%');

      Active := True;
      FetchAll;
      First;
      while not eof do
      Begin
        Lista := TListSplOrderPurchase.Create;
        Lista.Codigo          := FieldByName('id').AsInteger;
        Lista.Pedido          := FieldByName('number').AsString;
        Lista.Data            := FieldByName('dt_record').AsDateTime;
        Lista.NomeFornecedor  := FieldByName('name_company').AsString;
        Lista.ValorPedido     := FieldByName('total_value').AsFloat;
        //add lista
        Result.Add(Lista);
        Next;
      End;
    End;
  Finally
    FinalizaQuery(Lc_Qry);
  End;
end;

function TControllerOrderPurchase.getListSplByDate: TCollSplValue;
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
              '  INNER JOIN tb_order_purchase pur ',
              '  on (pur.id = ord.id) ',
              '    and (pur.tb_institution_id = ord.tb_institution_id) ',
              '  INNER JOIN tb_invoice inv ',
              '  on (pur.id = inv.id) ',
              '    and (pur.tb_institution_id = inv.tb_institution_id) ',
              '  INNER JOIN tb_entity ent ',
              '  ON (ent.id = inv.tb_entity_id) ',
              'where ord.tb_institution_id=:tb_institution_id ',
              ' and (dt_emission between :dataini and :datafim) ',
              'group by 1 '
          ));


      //passagem de PArametros
      ParamByName('tb_institution_id').AsInteger := Parametro.OrdemCompra.Estabelecimento;

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
        Lista.Estabelecimento := Parametro.OrdemCompra.Estabelecimento;
        Lista.Terminal        := Parametro.OrdemCompra.Terminal;
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

function TControllerOrderPurchase.getNexNumber: String;
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
                'FROM tb_order_purchase op ',
                'where op.tb_institution_id =:institution_id '
      ));
      ParamByName('institution_id').AsInteger := Registro.Estabelecimento;
      Active := True;
      LcNumber := StrToIntDef(FieldByName('ordem').AsString,0) + 1;
      Result := IntToStr(LcNumber);
    End;
  Finally
    Lc_Qry.close;
    FReeandNil(Lc_Qry)
  End;
end;

function TControllerOrderPurchase.getNumber: Boolean;
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
              'from tb_order_purchase ',
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
    Lc_Qry.close;
    FReeandNil(Lc_Qry)
  End;
end;

end.

