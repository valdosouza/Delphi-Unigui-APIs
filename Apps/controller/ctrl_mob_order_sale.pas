unit ctrl_mob_order_sale;

interface
uses System.Classes,System.SysUtils, FireDAC.Comp.Client, FireDAC.Stan.Param,
    System.Generics.Collections,ctrl_mob_base,REST.Json,System.Json,ctrl_mob_Customer,
    ctrl_mob_order, ctrl_mob_order_item,ctrl_mob_payment_type,
  ctrl_mob_order_totalizer, ctrl_mob_order_billing,  list_spl_order_sale,
  ctrl_mob_financial,tblOrderSale, TypesListCollection,UnFunctions,
  tblOrder, tblOrderItem,objOrderSale, ctrl_mob_salesman, tblOrderTotalizer,
  tblOrderBilling, TypesCollection,ctrl_mob_kickback, prm_order_sale;

Type
  TCtrlMobOrderSale = class(TCtrlMobBase)

    Private

    public
      Registro      : TOrderSale;
      MOrder        : TCtrlMobOrder;
      MPaymentType  : TCtrlMobPaymentType;
      MCustomer     : TCtrlMobCustomer;
      MTotalizer    : TCtrlMobOrderTotalizer;
      mBilling      : TCtrlmOBOrderBilling;
      MFinancial    : TCtrlMobFinancial;
      MSalesMan     : TCtrlMobSalesman;
      MItems        : TCtrlMobOrderItem;
      ListSpl       : TCollSplOrderSale;
      Obj           : TObjOrderSale;
      Lista         : TListOrdemSale;
      MKickBack     : TCtrlMobKickBack;
      Parametro    : TPrmOrderSale;
      constructor Create(AOwner: TComponent); override;
      destructor Destroy; override;
      procedure setParametro(par:String);
      procedure clear;
      procedure createTable;
      function getBySalesman:Boolean;
      procedure getListSpl(palavra:TStringList);
      function getNextID:Integer;
      function save:Boolean;
      function getAllLevelOne:Boolean;
      function getbyKey:Boolean;
      function deleteAll: boolean;
      procedure FillDataObjeto(PcRegistro: TOrderSale;pObj: TObjOrderSale);
      function saveDataObjeto(DObj : TObjOrderSale):Boolean;
      procedure getList;
      function getbyDataCustomer(pDate:Tdate):Boolean;
      function evazio:Boolean;
      procedure UndeleteAll;
    //      procedure ClonarObj(Orig,Dest:TObjOrderSale:
end;
implementation

{ TCtrlMobOrderSale }

uses MainModule ;

procedure TCtrlMobOrderSale.clear;
begin
  clearObj(Registro);
  MOrder.clear;
  MPaymentType.clear;
  MCustomer.clear;
  MTotalizer.clear;
  MBilling.clear;
  MFinancial.clear;
  MSalesMan.clear;
  MItems.clear;
  MKickBack.clear;
end;

constructor TCtrlMobOrderSale.Create(AOwner: TComponent);
begin
  Registro        := TOrderSale.create;
  MOrder          := TCtrlMobOrder.Create(Self);
  MPaymentType    := TCtrlMobPaymentType.Create(Self);
  MCustomer       := TCtrlMobCustomer.Create(Self);
  MTotalizer      := TCtrlMobOrderTotalizer.Create(Self);
  MBilling        := TCtrlmOBOrderBilling.Create(Self);
  MFinancial      := TCtrlMobFinancial.Create(Self);
  MSalesMan       := TCtrlMobSalesman.Create(Self);
  MItems          := TCtrlMobOrderItem.Create(Self);
  ListSpl         := TCollSplOrderSale.create;
  Lista           := TListOrdemSale.create;
  Obj             := TObjOrderSale.create;
  MKickBack       := TCtrlMobKickBack.Create(Self);
  Parametro       := TPrmOrderSale.Create;
  createTable;
end;

procedure TCtrlMobOrderSale.createTable;
begin
  execcmd(concat(
                'CREATE TABLE  if not exists  tb_order_sale ( ',
                '  id int(11) , ',
                '  tb_institution_id int(11) , ',
                '  terminal int(11), ',
                '  tb_salesman_id int(11) , ',
                '  number int(11) , ',
                '  tb_customer_id int(11) , ',
                '  kind char(2) , ',
                '  created_at datetime , ',
                '  updated_at datetime ) ; '
      ));
end;

function TCtrlMobOrderSale.deleteAll: boolean;
begin
  Try
    //Não apagamos o pedido, alteramos o Status para Apagado
    Morder.Registro.Codigo           := Registro.Codigo;
    Morder.Registro.Estabelecimento  := Registro.Estabelecimento;
    Morder.Registro.Terminal         := Registro.Terminal;
    MOrder.getByKey;
    MOrder.Registro.Status := 'A';
    MOrder.update;
    Result := True;
  Except
    on E : Exception do
    Begin
      geralog('CtrlMobOrderSale',E.Message);
      Result := False;
    End;
  End;

end;

destructor TCtrlMobOrderSale.Destroy;
begin
  {$IFDEF WIN32}
  Parametro.Destroy;
  Registro.DisposeOf;
  MOrder.Destroy;
  MPaymentType.Destroy;
  MCustomer.Destroy;
  MTotalizer.Destroy;
  MBilling.Destroy;
  MFinancial.Destroy;
  MSalesMan.Destroy;
  MItems.Destroy;
  ListSpl.Destroy;
  Lista.Destroy;
  Obj.Destroy;
  MKickBack.Destroy;
  {$ENDIF }
  inherited;
end;


function TCtrlMobOrderSale.evazio: Boolean;
Var
  Lc_Qry : TFDQuery;
begin
  Try
    Try
      Lc_Qry := createQuery;
      with Lc_Qry do
      Begin
        Active := False;
        SQL.Clear;
        SQL.Add(concat(
                  'SELECT os.* ',
                  'FROM tb_order_sale os ',
                  '   inner join tb_order od ',
                  '   on (od.id = os.id) ',
                  '       and (od.tb_institution_id = os.tb_institution_id) ',
                  'where os.tb_institution_id=:tb_institution_id '
        ));
        ParamByName('tb_institution_id').AsInteger := Registro.Codigo;
        Active := True;
        FetchAll;
        result := not ( recordCount > 0 );
      End;
    Except
      on E: Exception do
        Geralog('TCtrlMobOrderSale.evazio',E.Message);

    End;
  Finally
    FinalizaQuery(Lc_Qry);
  End;
end;

procedure TCtrlMobOrderSale.FillDataObjeto(PcRegistro: TOrderSale;pObj: TObjOrderSale);
Var
  I : Integer;
  LcOrder : TOrder;
  lcitems : TOrderItem;
begin
  //Order
  pObj.clear;
  Self.MOrder.clear;
  Self.MOrder.Registro.Estabelecimento := PcRegistro.Estabelecimento;
  Self.MOrder.Registro.Codigo          := PcRegistro.Codigo;
  Self.MOrder.Registro.Terminal        := PcRegistro.Terminal;
  Self.MOrder.getByKey;
  if Self.MOrder.exist then
  BEgin
    //Order
    _assign(Self.MOrder.Registro, pObj.Order );

    //OrderSale
    _assign( PcRegistro, pObj.OrderSale );

    //Referencia Doc Fiscal CPF/CNPJ
    MCustomer.Registro.Codigo          :=  pObj.OrderSale.Cliente;
    MCustomer.Registro.Estabelecimento :=  pObj.OrderSale.Estabelecimento;
    MCustomer.getByKey;
    MCustomer.fillDataObjeto(MCustomer.Registro,pObj.Fiscal);

    //Vendedor
    //O campo DocFiscalVendedor não é preenchhido no Aplicativo por que já está com o codigo correto
    //pObj.DocFiscalVendedor := '';foi retirada


    //Items
    Self.Mitems.Registro := TOrderItem.Create;
    Self.Mitems.Registro.Estabelecimento := pObj.OrderSale.Estabelecimento;
    Self.Mitems.Registro.Ordem           := pObj.OrderSale.Codigo;
    Self.Mitems.Registro.Terminal        := pObj.OrderSale.Terminal;
    Self.Mitems.Lista := TListItems.Create;
    Self.Mitems.getList;
    pObj.Items.Clear;
    for I := 0 to Self.Mitems.Lista.Count - 1 do
    Begin
      lcitems := TOrderItem.Create;
      _assign(Self.Mitems.Lista[I],lcitems );
      pObj.Items.Add(lcitems)
    end;

    //Totlalizer
    Self.MTotalizer.Registro := TOrderTotalizer.Create;
    Self.MTotalizer.Registro.Estabelecimento  := pObj.OrderSale.Estabelecimento;
    Self.MTotalizer.Registro.Codigo           := pObj.OrderSale.Codigo;
    Self.MTotalizer.Registro.Terminal         := pObj.OrderSale.Terminal;
    Self.MTotalizer.getByKey;
    if Self.MTotalizer.exist then
      _assign( Self.MTotalizer.Registro, pObj.Totalizer );

    //Billing
    Self.MBilling.Registro := TOrderBilling.Create;
    Self.MBilling.Registro.Estabelecimento  := pObj.OrderSale.Estabelecimento;
    Self.MBilling.Registro.Codigo           := pObj.OrderSale.Codigo;
    Self.MBilling.Registro.Terminal         := pObj.OrderSale.Terminal;
    Self.MBilling.getByKey;
    if Self.MBilling.exist then
    Begin
      _assign(Self.MBilling.Registro, pObj.Billing);
      //Forma de Pagamento - Descritivo
      MPaymentType.Registro.Codigo             := Self.MBilling.Registro.FormaPagamento;
      MPaymentType.getByid;
      pObj.FormaPagamento := MPaymentType.Registro.Descricao;
    End
    else
    Begin
      pObj.Billing.Estabelecimento := pObj.OrderSale.Estabelecimento;
      pObj.Billing.Codigo          := pObj.OrderSale.Codigo;
      pObj.Billing.Terminal        := pObj.OrderSale.Terminal;
      Self.MPaymentType.Registro.Descricao := 'CARTEIRA';
      Self.MPaymentType.getByDescripton;
      pObj.Billing.FormaPagamento  := Self.MPaymentType.Registro.Codigo;
      pObj.Billing.Parcelas        := '1';
      pObj.Billing.Prazo           := '000 - A VISTA';
      pObj.Billing.Responsavel     := pObj.OrderSale.Vendedor;
    End;
  End;
end;

function TCtrlMobOrderSale.getAllLevelOne: Boolean;
begin
  _getByKey(Registro);
  //Order
  MOrder.Registro.Codigo := Registro.Codigo;
  MOrder.Registro.Estabelecimento := Registro.Estabelecimento;
  MOrder.Registro.Terminal := Registro.Terminal;
  MOrder.getByKey;
  //Customer
  MCustomer.Registro.Estabelecimento := Registro.Estabelecimento;
  MCustomer.Registro.Codigo := Registro.Cliente;
  MCustomer.getAllByKey;
  //itens
  Mitems.Registro.Estabelecimento := Registro.Estabelecimento;
  Mitems.Registro.Ordem := Registro.Codigo;
  Mitems.Registro.Terminal := Registro.Terminal;
  Mitems.getList;
  //Totalizador
  MTotalizer.Registro.Estabelecimento := Registro.Estabelecimento;
  MTotalizer.Registro.Codigo := Registro.Codigo;
  MTotalizer.Registro.Terminal := Registro.Terminal;
  MTotalizer.getByKey;
  //Negociação
  MBilling.Registro.Estabelecimento := Registro.Estabelecimento;
  MBilling.Registro.Codigo := Registro.Codigo;
  MBilling.Registro.Terminal := Registro.Terminal;
  MBilling.getByKey;

  //Cobrança
  MFinancial.Registro.Estabelecimento := Registro.Estabelecimento;
  MFinancial.Registro.Ordem := Registro.Codigo;
  MFinancial.Registro.Terminal := Registro.Terminal;
  MFinancial.getByKey;

end;

function TCtrlMobOrderSale.getbyDataCustomer(pDate: Tdate): Boolean;
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
                '   inner join tb_order od ',
                '   on (od.id = os.id) ',
                '       and (od.tb_institution_id = os.tb_institution_id) ',
                'where ( od.tb_institution_id =:institution_id ) ',
                '  and ( od.dt_record =:dt_record ) ',
                '  and ( os.tb_customer_id =:tb_customer_id ) '
      ));
      ParamByName('institution_id').AsInteger := Registro.Estabelecimento;
      ParamByName('dt_record').AsDate := pDate;
      ParamByName('tb_customer_id').AsInteger := Registro.Cliente;
      Active := True;
      FetchAll;
      exist := recordCount > 0;
      if exist then
      Begin
        get(Lc_Qry,Registro);

        MTotalizer.Registro.Estabelecimento := Registro.Estabelecimento;
        MTotalizer.Registro.Terminal        := Registro.Terminal;
        MTotalizer.Registro.Codigo          := Registro.Codigo;
        MTotalizer.getbyKey;

        mBilling.Registro.Estabelecimento := Registro.Estabelecimento;
        mBilling.Registro.Terminal        := Registro.Terminal;
        mBilling.Registro.Codigo          := Registro.Codigo;
        mBilling.getbyKey;


      End;
    End;
  Finally
    FinalizaQuery(Lc_Qry);
  End;


end;

function TCtrlMobOrderSale.getbyKey: Boolean;
begin
  _getByKey(Registro);
end;

function TCtrlMobOrderSale.getBySalesman: Boolean;
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
                'SELECT op.* ',
                'FROM tb_order_sale op ',
                'where ( op.tb_institution_id =:institution_id ) ',
                '  and ( id =:id ) ',
                '  and ( tb_salesman_id =:salesman_id ) '
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
    FinalizaQuery(Lc_Qry);
  End;
end;

procedure TCtrlMobOrderSale.getList;
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

      LcAux := '';//getDispositivos;
      if LcAux <> '' then
        sql.add(concat('and (ods.terminal in ',LcAux,')'));
      if Trim( Parametro.UltimaAtualizacao ) <> '' then
      Begin
        sql.add(' AND ( ods.updated_at >:updated_at ) ');
        sql.add(' order by ods.updated_at asc ');
      End
      else
      Begin
        sql.add(concat(' ORDER BY ',orderby,'  asc '));
      End;

      //sql.add(' limit 0,30 '); //somente em teste
      //Passagem de parametros
      parambyname('institution_id').AsInteger := Registro.Estabelecimento;
      if Trim( Parametro.UltimaAtualizacao ) <> '' then
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

procedure TCtrlMobOrderSale.getListSpl(palavra: TStringList);
Var
  Lc_Qry :TFDQuery;
  item : TListSplOrderSale;
  I:Integer;
  LcSqlStr : String;
begin
  Try
    Lc_Qry := createQuery;
    item := TListSplOrderSale.Create;
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
              'where (ord.id > 0) and (ord.status = ''N'') ',
              ' and ( ors.tb_institution_id=:tb_institution_id ) '
          ));
      //Incrmenta o sql
      LcSqlStr := ' and ( ';
      if palavra.count > 0 then
      Begin
        for I := 0 to palavra.count -1 do
        Begin
          if I = 0 then
            LcSqlStr := concat(LcSqlStr,' ( et.name_company like :palavra',i.ToString,' ) ')
          else
            LcSqlStr := concat(LcSqlStr,' or ( et.name_company like :palavra',i.ToString,' ) ');
        End;
        LcSqlStr := concat(LcSqlStr,')');
      End;

      if palavra.count > 0 then
      Begin
        LcSqlStr := concat(LcSqlStr, ' or ( ');
        for I := 0 to palavra.count -1 do
        Begin
          if I = 0 then
            LcSqlStr := concat(LcSqlStr,' ( et.nick_trade like :palavra',i.ToString,' ) ')
          else
            LcSqlStr := concat(LcSqlStr,' or ( et.nick_trade like :palavra',i.ToString,' ) ');
        End;
        LcSqlStr := concat(LcSqlStr,')');
        sql.Add(LcSqlStr);
      End;

      sql.Add(orderby);
      if palavra.Count = 0 then   sql.Add('limit 0,40 ');

      //sql.Add(concat('Limit ', InttoStr( ( Page * 20 ) - 20 ),',', InttoStr( (Page * 20 ) ) ));
      //passagem de PArametros
      ParamByName('tb_institution_id').AsInteger := Self.Registro.Estabelecimento;
      if palavra.count > 0 then
      Begin
        for I := 0 to palavra.count -1 do
          ParamByName(concat('palavra',i.ToString)).AsString := concat('%',palavra[I],'%');
      End;

      Active := True;
      FetchAll;
      First;
      ListSpl.clear;
      while not eof do
      Begin
        item             := TListSplOrderSale.Create;
        item.Codigo      := FieldByName('id').AsInteger;
        item.Pedido      := FieldByName('number').AsString;
        item.Data        := FieldByName('dt_record').AsDateTime;
        item.NomeCliente := FieldByName('name_company').AsString;
        item.ValorPedido := FieldByName('total_value').AsFloat;

        //add lista
        ListSpl.Add(item);
        Next;
      End;
    End;
  Finally
    FinalizaQuery(Lc_Qry);
  End;


end;


function TCtrlMobOrderSale.getNextID: Integer;
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
             'select max(id) id ',
             'from tb_order '
      ));
      Active := True;
      FetchAll;
      Result := StrToIntDef( FieldByName('id').AsString,0);
    End;
  Finally
    FinalizaQuery(Lc_Qry);
  End;

end;

function TCtrlMobOrderSale.save: Boolean;
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

function TCtrlMobOrderSale.saveDataObjeto(DObj: TObjOrderSale): Boolean;
VAr
  I : Integer;
  lcitems : TOrderItem;
begin
  tRY
    //Fiscal
    MCustomer.MFiscal.saveDataObjeto(DObj.Fiscal);
    //Ajkusta os codigos do cliente
    DObj.OrderSale.Cliente  := DObj.Fiscal.Entidade.Entidade.Codigo;
    DObj.Cliente.Codigo     := DObj.Fiscal.Entidade.Entidade.Codigo;
    //Cliente
    ClonarObj(DObj.Cliente,MCustomer.Registro);
    MCustomer.save;

    //Verifica o codigo do vendedor na web pesquisando pelo vendedor do pedido (não confundir com a função dentro do cliente)
    if Length(DObj.DocFiscalVendedor)> 0 then
    Begin
      if Length(DObj.DocFiscalVendedor) = 11 then
        DObj.OrderSale.Vendedor := MSalesMan.MColaborador.MFiscal.MFisica.getIDbyCPF(DObj.DocFiscalVendedor)
      else
        DObj.OrderSale.Vendedor := MSalesMan.MColaborador.MFiscal.MJuridica.getIDbyCNPJ(DObj.DocFiscalVendedor);
    End;
    //O usuairo do Gestão será substituido pelo Vendedor
    if DObj.OrderSale.Vendedor > 0 then
      DObj.Order.Usuario := DObj.OrderSale.Vendedor
    else
      DObj.Order.Usuario := DObj.Estabelecimento;

    _assign(DObj.Order,MOrder.Registro);
    MOrder.save;

    _assign(DObj.OrderSale,self.Registro );
    self.save;


    for I := 0 to DObj.Items.Count -1 do
    Begin
      if assigned(DObj.Items[I]) then
      Begin
        _assign(DObj.Items[I], Mitems.Registro);
        Mitems.save;
      End;
    End;

    _assign(DObj.Totalizer, MTotalizer.Registro);
    MTotalizer.save;

    _assign(DObj.Billing, MBilling.Registro);
    MBilling.save;
  EXCEPT
   on E: Exception do
    Geralog('TCTRLmOBOrderSale.saveDataObjeto',concat(e.Message,Registro.Numero.ToString));
  end;


end;

procedure TCtrlMobOrderSale.setParametro(par: String);
begin
  Parametro:= TJson.JsonToObject<TPrmOrderSale>(par);
  //Tratar Data
  Parametro.UltimaAtualizacao := dataMysql(Parametro.UltimaAtualizacao);
end;

procedure TCtrlMobOrderSale.UndeleteAll;
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
          'update tb_order set ',
          'status = ''N'' ',
          'where status = ''A'' '
      ));
      ExecSQL;
    End;
  Finally
    FinalizaQuery(Lc_Qry);
  End;

end;

end.
