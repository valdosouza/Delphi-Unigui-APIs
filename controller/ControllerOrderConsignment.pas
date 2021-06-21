unit ControllerOrderConsignment;

interface
uses System.Classes, System.SysUtils,BaseController,
      tblOrder, FireDAC.Comp.Client,Md5, FireDAC.Stan.Param,Rest.json,
  ControllerOrderConsignmentOperation,ControllerOrder,ControllerCustomer,
  TypesListCollection,tblOrderConsignment,tblOrderItem,objOrderConsignment,
  objOrderSale,ControllerSalesman,tblorderConsignmentOperation,
  prm_order_consignment,list_spl_order_Consignment,TypesCollection, UnFunctions,
  prm_base;

Type
  TControllerOrderConsignment = Class(TBaseController)

  private
  public
    Registro  : TOrderConsignment;
    Parametro : TPrmOrderConsignmet;
    Customer  : TControllerCustomer;
    SalesMan  : TControllerSalesman;
    Ordem     : TControllerOrder;
    Operacoes : TControllerOrderConsignmentOperation;
    Lista     : TListOrdemConsignment;
    ListSpl   : TCollSplOrderConsignment;
    Obj       : TObjOrderConsignment;
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure setParametro(par:String);
    procedure clear;
    function save:boolean;
    function insert:boolean;
    Function delete:boolean;
    function getByKey:Boolean;
    Function getLastCodigo:Integer;
    procedure FillDataObjeto(pRegistro:TOrderConsignment);
    function saveDataObjeto(DObj : TObjOrderConsignment):Boolean;
    function getBySalesman:Boolean;
    function getLastBySalesman:Boolean;
    function getListSpl : TCollSplOrderConsignment;
    procedure getlist;
  End;


implementation

{ TControllerOrderConsignment }

procedure TControllerOrderConsignment.clear;
begin
  clearObj(Registro);
end;

constructor TControllerOrderConsignment.Create(AOwner: TComponent);
begin
  inherited;
  Registro  := TOrderConsignment.Create;
  Operacoes := TControllerOrderConsignmentOperation.create(Self);
  Ordem     := TControllerOrder.create(Self);
  Customer  := TControllerCustomer.create(Self);
  SalesMan  := TControllerSalesman.create(Self);
  ListSpl   := TCollSplOrderConsignment.create;
  Obj       := TObjOrderConsignment.create;;
  Parametro := TPrmOrderConsignmet.Create;
  Lista     := TListOrdemConsignment.Create;
end;

function TControllerOrderConsignment.delete: boolean;
begin
  try
    deleteObj(Registro);
    Result := True;
  except
    Result := False;
  end;

end;

destructor TControllerOrderConsignment.Destroy;
begin
  Lista.DisposeOf;
  Parametro.Destroy;
  Obj.Destroy;
  Registro.DisposeOf;
  Operacoes.DisposeOf;
  Ordem.DisposeOf;
  SalesMan.DisposeOf;
  Customer.DisposeOf;
  ListSpl.DisposeOf;
  inherited;
end;

procedure TControllerOrderConsignment.FillDataObjeto(
  pRegistro: TOrderConsignment);
Var
  I : Integer;
  LcOrder : TOrder;
  lcItemsOper : TOrderConsignmentOperation;
  lcitems : TOrderItem;
begin
    //Order
    Self.Ordem.clear;
    Self.Ordem.Registro.Estabelecimento := pRegistro.Estabelecimento;
    Self.Ordem.Registro.Codigo          := pRegistro.Codigo;
    Self.Ordem.Registro.Terminal        := pRegistro.Terminal;
    Self.Ordem.getByKey;
    if Self.Ordem.exist then
    BEgin
      _assign(Self.Ordem.Registro, Obj.Order );

      //OrderConsignment
      _assign( pRegistro, Obj.Consignacao );
      //Referencia Doc Fiscal CPF/CNPJ
      Customer.Registro.Codigo          :=  Obj.Consignacao.Cliente;
      Customer.Registro.Estabelecimento :=  pRegistro.Estabelecimento;
      Customer.getByKey;
      ClonarObj(Customer.Registro,obj.Cliente);
      Customer.Fiscal.fillDataObjeto(Customer.Registro.Codigo,Obj.Fiscal);

      //Vendedor
      Self.SalesMan.Colaborador.Fiscal.Fisica.Registro.Codigo := Obj.Consignacao.Vendedor;
      Obj.DocFiscalVendedor := Self.SalesMan.Colaborador.Fiscal.Fisica.getCpfById;

      //operações
      Self.Operacoes.Registro := TOrderConsignmentOperation.Create;
      Self.Operacoes.Registro.Estabelecimento := pRegistro.Estabelecimento;
      Self.Operacoes.Registro.Ordem           := pRegistro.Codigo;
      Self.Operacoes.Registro.Terminal        := pRegistro.Terminal;
      Self.Operacoes.Lista := TListOrdemConsignmentOperation.Create;
      Self.Operacoes.getList;
      for I := 0 to Self.Operacoes.Lista.Count - 1 do
      Begin
        lcItemsOper := TOrderConsignmentOperation.Create;
        _assign(Self.Operacoes.Lista[I],lcItemsOper );
        Obj.Operacoes.Add( lcItemsOper );
      end;

      //Items
      Self.Operacoes.Item.Registro := TOrderItem.Create;
      Self.Operacoes.Item.Registro.Estabelecimento := pRegistro.Estabelecimento;
      Self.Operacoes.Item.Registro.Ordem           := pRegistro.Codigo;
      Self.Operacoes.Item.Registro.Terminal        := pRegistro.Terminal;
      Self.Operacoes.Item.Lista := TListItems.Create;
      Self.Operacoes.Item.getList;
      for I := 0 to Self.Operacoes.Item.Lista.Count - 1 do
      Begin
        lcitems := TOrderItem.Create;
        _assign(Self.Operacoes.Item.Lista[I],lcitems );
        Obj.Items.Add(lcitems)
      end;
    End;

end;

function TControllerOrderConsignment.getByKey: Boolean;
begin
  _getByKey(Registro);
end;

function TControllerOrderConsignment.getBySalesman: Boolean;
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
                'SELECT oc.* ',
                'FROM tb_order_consignment oc ',
                'where ( oc.tb_institution_id =:institution_id ) ',
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
    finalizaQuery(Lc_Qry);
  End;
end;

function TControllerOrderConsignment.getLastBySalesman: Boolean;
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
                'FROM tb_order_consignmente oc ',
                'where ( oc.tb_institution_id =:institution_id ) ',
                ' and (oc.tb_salesman_id=:tb_salesman_id) ',
                ' and (oc.id =:id) '
      ));
      ParamByName('institution_id').AsInteger := Parametro.Consignacao.Estabelecimento;
      ParamByName('tb_salesman_id').AsInteger := Parametro.Consignacao.Vendedor;
      ParamByName('id').AsInteger             := Parametro.Consignacao.Codigo;
      Active := True;
      FetchAll;
      get(Lc_Qry,Registro);
    End;
  Finally
    finalizaQuery(Lc_Qry);
  End;

end;

function TControllerOrderConsignment.getLastCodigo: Integer;
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
                'SELECT MAX(oc.id) id ',
                'FROM tb_order_consignment oc ',
                'where oc.tb_institution_id =:institution_id '
      ));
      if registro.Vendedor > 0 then
        SQL.Add(' and (tb_salesman_id=:tb_salesman_id) ');

      ParamByName('institution_id').AsInteger := Parametro.Consignacao.Estabelecimento;
      if registro.Vendedor > 0 then
        ParamByName('tb_salesman_id').AsInteger := Parametro.Consignacao.Vendedor;

      Active := True;
      FetchAll;
      Result := FieldByName('id').AsInteger;
    End;
  Finally
    finalizaQuery(Lc_Qry);
  End;


end;

procedure TControllerOrderConsignment.getList;
var
  Lc_Qry : TFDQuery;
  LITem : TOrderConsignment;
  LcAux : String;
begin
  Try
    Lc_Qry := createQuery;
    with Lc_Qry do
    Begin
      sql.add(concat('SELECT odc.* ',
                     'FROM tb_order_consignment odc ',
                     '  inner join tb_order od ',
                     '  on (od.id = odc.id) ',
                     '   and (od.tb_institution_id = odc.tb_institution_id) ',
                     '   and (od.terminal = odc.terminal) ',
                     'WHERE  ( odc.tb_institution_id =:institution_id ) '
      ));

      //Incrementa SQL
      //Verifica de quais dispositivos serão feitos os downloads

      if parametro.Consignacao.Terminal > 0 then
        sql.add(' and (odc.terminal =:terminal)' );


      if Trim(parametro.UltimaAtualizacao) <> '' then
      Begin
        sql.add(' AND ( odc.updated_at >:updated_at ) ');
        sql.add(' order by odc.updated_at asc ');
      End
      else
      Begin
        if Trim(orderby)='' then orderby := 'odc.id';
        sql.add(concat(' ORDER BY ',orderby,'  asc '));
      End;

      //Passagem de parametros
      parambyname('institution_id').AsInteger := parametro.Consignacao.Estabelecimento;

      if parametro.Consignacao.Terminal > 0 then
        parambyname('terminal').AsInteger := parametro.Consignacao.Terminal;

      if Trim(parametro.UltimaAtualizacao) <> '' then
        parambyname('updated_at').AsString := parametro.UltimaAtualizacao;
      Active := True;
      FetchAll;
      First;
      Lista.Clear;
      while not eof do
      Begin
        LITem := TOrderConsignment.Create;
        get(Lc_Qry,LITem);
        Lista.add(LITem);
        next;
      end;
    end;
  Finally
    FinalizaQuery(Lc_Qry);
  End;

end;

function TControllerOrderConsignment.getListSpl: TCollSplOrderConsignment;
Var
  Lc_Qry :TFDQuery;
  item : TListSplOrderConsignment;
begin
  Try
    result := TCollSplOrderConsignment.Create;
    Lc_Qry := createQuery;
    with Lc_Qry do
    Begin
      sql.Clear;
      sql.Add(concat(
              'SELECT distinct et.id, et.name_company, et.nick_trade ',
              'FROM tb_order ord ',
              '  inner join tb_order_consignment orc ',
              '  on (ord.id = orc.id) and  (ord.tb_institution_id = orc.tb_institution_id) ',
              '  INNER JOIN tb_entity et ',
              '  on (orc.tb_customer_id = et.id) ',
              'where (ord.id > 0) ',
              ' and ( institution_id =:institution_id ) '
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
      ParamByName('institution_id').AsInteger :=  Parametro.Consignacao.Estabelecimento;

      if Parametro.Entidade.NomeRazao <> '' then
        ParamByName('name').AsString := concat('%',Parametro.Entidade.NomeRazao,'%');

      Active := True;
      FetchAll;
      First;
      while not eof do
      Begin
        item := TListSplOrderConsignment.Create;
        item.Codigo      := FieldByName('id').AsInteger;
        item.NomeRazao := FieldByName('name_company').AsString;
        item.ApelidoFantasia := FieldByName('nick_trade').AsString;
        //add lista
        ListSpl.Add(item);
        Next;
      End;
    End;
  Finally
    FinalizaQuery(Lc_Qry);
  End;
end;

function TControllerOrderConsignment.insert: boolean;
begin
  try
    insertObj(Registro);
    Result := True;
  except
    Result := False;
  end;

end;

function TControllerOrderConsignment.save: boolean;
begin
  try
    SaveObj(Registro);
    Result := True;
  except
    Result := False;
  end;
end;

function TControllerOrderConsignment.saveDataObjeto(
  DObj: TObjOrderConsignment): Boolean;
VAr
  I : Integer;
  lcitems : TOrderItem;
begin
  tRY
    //Salva o cliente e reposiciona os registro de cliente e vendedor
    Customer.Fiscal.saveDataObjeto(DObj.Fiscal);
    DObj.Cliente.Codigo  := DObj.Fiscal.Entidade.Entidade.Codigo;
    ClonarObj(Dobj.Cliente, Customer.Registro);
    Customer.save;

    //Faz estas duas operaçoes independente de entrar na proxima condicional

    //Verifica o codigo do vendedor na web pesquisando pelo vendedor do pedido (não confundir com a função dentro do cliente)
    //O campo DocFiscalVendedor não é preenchhido no Aplicativo por que já está com o codigo correto
    if Length(DObj.DocFiscalVendedor)> 0 then
    Begin
      if Length(DObj.DocFiscalVendedor) = 11 then
        DObj.Consignacao.Vendedor := SalesMan.Colaborador.Fiscal.Fisica.getIDbyCPF(DObj.DocFiscalVendedor)
      else
        DObj.Consignacao.Vendedor := SalesMan.Colaborador.Fiscal.Juridica.getIDbyCNPJ(DObj.DocFiscalVendedor);
    End;
    //O usuairo do Gestão será substituido pelo Vendedor
    //O usuario do Aplicativo já vem com o codigo do vendedor correto.
    if DObj.Consignacao.Vendedor > 0 then
      DObj.Order.Usuario := DObj.Consignacao.Vendedor
    else
      DObj.Order.Usuario := DObj.Estabelecimento;

    if DObj.Descricao = 'SERVER' then
    Begin
      if DObj.CodigoWeb > 0 then
      BEgin
        Registro.Codigo           := DObj.CodigoWeb;
        Registro.Estabelecimento  := DObj.Estabelecimento;
        //Passou antes pelo Customer.saveDataObjeto para pegar o codigo do vendedor na web.
        Registro.Vendedor         := DObj.Consignacao.Vendedor;
        getBySalesman;
        if exist then
        Begin
          DObj.Terminal       := Registro.Terminal;
          //Reposiciona os registro orderSale
          DObj.Consignacao     := Registro;
          //Reposiciona os registro ordem
          DObj.Order.Codigo   := Registro.Codigo;
          DObj.Order.Terminal := Registro.Terminal;
          DObj.Order.Usuario  := Registro.Vendedor;
        End;
      End;
    End;
    {Na seção anterior reposicionamos todos os dados do objeto principal
      para seguirmos daqui em diante sem complicações
    }
    Ordem.Registro := DObj.Order;
    Ordem.save;

    self.Registro := DObj.Consignacao;
    self.save;

    for I := 0 to DObj.Operacoes.Count -1 do
    Begin
      _assign(DObj.Operacoes[I],Operacoes.Registro);
      Operacoes.save;
    End;


    for I := 0 to DObj.Items.Count -1 do
    Begin
      _assign(DObj.Items[I],Operacoes.Item.Registro);
      Operacoes.Item.save;
    End;


  EXCEPT
   on E: Exception do
    GeralogCrashlytics('TControllerOrderSale.saveDataObjeto',concat(e.Message,Registro.Codigo.ToString));
  end;


end;

procedure TControllerOrderConsignment.setParametro(par: String);
begin
  Parametro:= TJson.JsonToObject<TPrmOrderConsignmet>(par);
  //Tratar Data
  Parametro.UltimaAtualizacao := dataMysql(Parametro.UltimaAtualizacao);

end;

end.
