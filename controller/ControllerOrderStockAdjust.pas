unit ControllerOrderStockAdjust;

interface
uses System.Classes, System.SysUtils,BaseController,Rest.json,
      tblOrderStockAdjust, tblEntity, FireDAC.Comp.Client,Md5, FireDAC.Stan.Param,
      ControllerOrder, ControllerEntityFiscal, ControllerOrderItem,System.Generics.Collections,
      ControllerOrderShipping, ControllerOrderTotalizer, prm_order_stock_adjust,
      ControllerPaymentTypes, ControllerOrderBilling, ControllerFinancial,
      TypesListCollection,TypesCollection,ObjOrderStockAdjust,prm_base,
      tblorder,tblorderitem,list_spl_order_stock_adjust;

Type
  TObjListOrderStockAdjust = TObjectList<TObjOrderStockAdjust>;

  TControllerOrderStockAdjust = Class(TBaseController)
    procedure clear;
  private

  public
    Registro      : TOrderStockAdjust;
    Parametro     : TPrmOrderStockAdjust;
    Order         : TControllerOrder;
    Destinatario  : TControllerEntityFiscal;
    PaymentType   : TControllerPaymentTypes;
    itemsJob      : TControllerOrderItem;
    Billing       : TControllerOrderBilling;
    Financial     : TControllerFinancial;
    Shipping      : TControllerOrderShipping;
    Totalizer     : TControllerOrderTotalizer;
    items         : TControllerOrderItem;
    ListSpl       : TCollSplOrderStockAdjust;
    Lista         : TListOrdemStockAdjust;
    ListaObj      : TObjListOrderStockAdjust;
    Obj           : TObjOrderStockAdjust;
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure setParametro(par:String);
    function save:boolean;
    function delete: boolean;
    function getAllByKey:boolean;
    function getByKey:Boolean;
    Function getNexNumber:String;
    function getNumber:Boolean;
    Function getLastCodigo:Integer;
    Function getLastOrder:Boolean;
    procedure getList;
    function getListSpl : TCollSplOrderStockAdjust;
    procedure FillDataObjeto(PcRegistro: TOrderStockAdjust);
    function saveDataObjeto(DObj : TObjOrderStockAdjust):Boolean;

  End;

implementation

{ TOrderStockAdjust }

procedure TControllerOrderStockAdjust.clear;
begin
//
end;

constructor TControllerOrderStockAdjust.Create(AOwner: TComponent);
begin
  inherited;
  Registro      := TOrderStockAdjust.Create;
  Parametro     := TPrmOrderStockAdjust.Create;
  Order         := TControllerOrder.Create(self);
  Destinatario  := TControllerEntityFiscal.Create(self);
  itemsJob      := TControllerOrderItem.Create(self);
  PaymentType   := TControllerPaymentTypes.Create(Self);
  items         := TControllerOrderItem.Create(self);
  Shipping      := TControllerOrderShipping.Create(self);
  Totalizer     := TControllerOrderTotalizer.Create(self);
  Billing       := TControllerOrderBilling.Create(self);
  Financial     := TControllerFinancial.Create(self);
  ListSpl       := TCollSplOrderStockAdjust.Create;
  Lista         := TListOrdemStockAdjust.Create;
  ListaObj      := TObjListOrderStockAdjust.Create;
  Obj           := TObjOrderStockAdjust.Create;
end;

function TControllerOrderStockAdjust.delete: boolean;
begin
  Try
    deleteObj(Registro);
    Result := True;
  Except
    Result := False;
  End;
end;

destructor TControllerOrderStockAdjust.Destroy;
begin
  Registro.DisposeOf;
  Parametro.Destroy;
  Order.DisposeOf;
  Destinatario.DisposeOf;
  itemsJob.DisposeOf;
  PaymentType.DisposeOf;
  items.DisposeOf;
  Shipping.DisposeOf;
  Totalizer.DisposeOf;
  Billing.DisposeOf;
  Financial.DisposeOf;
  ListSpl.DisposeOf;
  Lista.DisposeOf;
  ListaObj.DisposeOf;
  Obj.Destroy;
  inherited;
end;

procedure TControllerOrderStockAdjust.FillDataObjeto(
  PcRegistro: TOrderStockAdjust);
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

    //OrderSale
    ClonarObj( PcRegistro, Obj.OrderStockAdjust );
    //Referencia Doc Fiscal CPF/CNPJ
    Destinatario.Registro.Codigo          :=  Obj.OrderStockAdjust.Destinatario;
    Destinatario.getByKey;
    Destinatario.fillDataObjeto(Destinatario.Registro.Codigo,self.Obj.Destinatario);

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
      obj.Billing.Responsavel     := obj.Order.Usuario
    End;
  End;

end;

function TControllerOrderStockAdjust.getAllByKey: boolean;
begin
  _getByKey(Registro);

  with Order do
  Begin
    Registro.Codigo := Self.Registro.Codigo;
    Registro.Estabelecimento := Self.Registro.Estabelecimento;
    getByKey;
  End;

  with Destinatario do
  Begin
    Registro.Codigo := Self.Registro.Destinatario;
    getAllByKey;
  End;

  with Totalizer do
  Begin
    Registro.Codigo := Self.Registro.Codigo;
    Registro.Estabelecimento := Self.Registro.Estabelecimento;
    getByKey;
  End;

  with Shipping do
  Begin
    Registro.Codigo := Self.Registro.Codigo;
    Registro.Estabelecimento := Self.Registro.Estabelecimento;
    getByKey;
  End;

  with itemsJob do
  Begin
    Registro.Codigo := Self.Registro.Codigo;
    Registro.Estabelecimento := Self.Registro.Estabelecimento;
    getByKey;
  End;

end;

function TControllerOrderStockAdjust.getByKey: Boolean;
begin
  Registro.Estabelecimento  := Parametro.OrdemAjuste.Estabelecimento;
  Registro.Codigo           := Parametro.OrdemAjuste.Codigo;
  Registro.Terminal         := Parametro.OrdemAjuste.Terminal;
  _getByKey(Registro);
end;

function TControllerOrderStockAdjust.getLastCodigo: Integer;
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
                'FROM tb_order_stock_adjust op ',
                'where op.tb_institution_id =:institution_id '
      ));

      if parametro.OrdemAjuste.Terminal > 0 then
        SQL.Add(' and (terminal =:terminal) ');


      ParamByName('institution_id').AsInteger := parametro.OrdemAjuste.Estabelecimento;


      if parametro.OrdemAjuste.Terminal > 0 then
        ParamByName('terminal').AsInteger := parametro.OrdemAjuste.Terminal;

      Active := True;
      FetchAll;
      Result := FieldByName('id').AsInteger;
    End;
  Finally
    finalizaQuery(Lc_Qry);
  End;


end;

function TControllerOrderStockAdjust.getLastOrder: Boolean;
begin
  Registro.Estabelecimento  := Parametro.OrdemAjuste.Estabelecimento;
  Registro.Codigo           := getLastCodigo;
  Registro.Terminal         := Parametro.OrdemAjuste.Terminal;
  _getByKey(Registro);
end;

procedure TControllerOrderStockAdjust.getList();
var
  Lc_Qry : TFDQuery;
  LITem : TOrderStockAdjust;
  LcAux : String;
begin
  Try
    Lc_Qry := createQuery;
    with Lc_Qry do
    Begin
      sql.add(concat('SELECT ods.* ',
                     'FROM tb_order_stock_adjust ods ',
                     '  inner join tb_order od ',
                     '  on (od.id = ods.id) ',
                     '   and (od.tb_institution_id = ods.tb_institution_id) ',
                     '   and (od.terminal = ods.terminal) ',
                     'WHERE ( od.status = ''N'' ) ',
                     ' and ( ods.tb_institution_id =:institution_id ) '
      ));

      //Incrementa SQL
      //Verifica de quais dispositivos serão feitos os downloads

      if Parametro.OrdemAjuste.Terminal > 0 then
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
      parambyname('institution_id').AsInteger := Parametro.OrdemAjuste.Estabelecimento;

      if Parametro.OrdemAjuste.Terminal > 0 then
        parambyname('terminal').AsInteger := Parametro.OrdemAjuste.Terminal;

      if Trim(Parametro.UltimaAtualizacao) <> '' then
        parambyname('updated_at').AsString := Parametro.UltimaAtualizacao;

      Active := True;
      FetchAll;
      First;
      Lista.Clear;
      while not eof do
      Begin
        LITem := TOrderStockAdjust.Create;
        get(Lc_Qry,LITem);
        Lista.add(LITem);
        next;
      end;
    end;
  Finally
    FinalizaQuery(Lc_Qry);
  End;


end;

function TControllerOrderStockAdjust.getListSpl: TCollSplOrderStockAdjust;
Var
  Lc_Qry :TFDQuery;
  Lista : TListSplOrderStockAdjust;
begin
  Try
    result := TCollSplOrderStockAdjust.Create;
    Lc_Qry := createQuery;
    with Lc_Qry do
    Begin
      sql.Clear;
      sql.Add(concat(
              'SELECT distinct ors.id, ors.number, ord.dt_record, ',
              'et.name_company, et.nick_trade, ort.total_value ',
              'FROM tb_order ord ',
              '  inner join tb_order_stock_adjust ors ',
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
      ParamByName('institution_id').AsInteger := Parametro.OrdemAjuste.Estabelecimento;

      ParamByName('dataini').AsDate := Parametro.DataInicial;
      ParamByName('datafim').AsDate := Parametro.DataFinal;

      if Parametro.Entidade.NomeRazao <> '' then
        ParamByName('name').AsString := concat('%',Parametro.Entidade.NomeRazao,'%');

      Active := True;
      FetchAll;
      First;
      while not eof do
      Begin
        Lista := TListSplOrderStockAdjust.Create;
        Lista.Codigo          := FieldByName('id').AsInteger;
        Lista.Pedido          := FieldByName('number').AsString;
        Lista.Data            := FieldByName('dt_record').AsDateTime;
        Lista.Destinatario    := FieldByName('name_company').AsString;
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

function TControllerOrderStockAdjust.getNexNumber: String;
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
                'FROM tb_order_stock_adjust op ',
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

function TControllerOrderStockAdjust.getNumber: Boolean;
Var
  Lc_Qry : TFDQuery;
begin
  //Busca o registro pelo numero da pedido é já posiciona o codigo da ordem
  Try
    Lc_Qry := createQuery;
    with Lc_Qry do
    Begin
      Active := False;
      sql.Clear;
      sql.Add(concat(
              'Select id, number ',
              'from tb_order_stock_adjust ',
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

function TControllerOrderStockAdjust.save: boolean;
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

function TControllerOrderStockAdjust.saveDataObjeto(
  DObj: TObjOrderStockAdjust): Boolean;
Var
  I:Integer;
begin
  tRY
    //Salva o Destinatario e reposiciona os registro dele
    Destinatario.saveDataObjeto(DObj.Destinatario);

    //Faz estas duas operaçoes independente de entrar na proxima condicional
    DObj.OrderStockAdjust.Destinatario  := DObj.Destinatario.Entidade.Entidade.Codigo;
    //O usuario do Aplicativo já vem com o codigo do vendedor correto.
    if DObj.Order.Usuario = 0 then
      DObj.Order.Usuario := DObj.Estabelecimento;

    ClonarObj( DObj.Order, self.Order.Registro);
    self.Order.save;

    ClonarObj( DObj.OrderStockAdjust, self.Registro);
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
    Result := TRue;
  EXCEPT
    on E: Exception do
    Begin
      geralog('TControllerOrderSale.saveDataObjeto',concat(e.Message,Registro.Numero.ToString));
      Result := False;
    End;
  end;
end;

procedure TControllerOrderStockAdjust.setParametro(par: String);
begin
  Parametro:= TJson.JsonToObject<TPrmOrderStockAdjust>(par);
  //Tratar Data
  Parametro.UltimaAtualizacao := dataMysql(Parametro.UltimaAtualizacao);

end;

end.
