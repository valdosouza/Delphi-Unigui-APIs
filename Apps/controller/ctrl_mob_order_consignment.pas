unit ctrl_mob_order_consignment;

interface
uses System.Classes, System.SysUtils,rest.json,
      tblOrderConsignment,tblOrderConsignmentOperation, FireDAC.Comp.Client,FireDAC.Stan.Param,
      ctrl_mob_customer,ctrl_mob_order,  ctrl_mob_order_consignment_operation,
      list_spl_order_Consignment,TypesListCollection,prm_order_consignment,
       ctrl_mob_base, TypesCollection,ctrl_mob_financial_statement,
      tblOrder, tblOrderItem,objOrderConsignment,  ctrl_mob_salesman;

Type
  TCtrlMobOrderConsignment = Class(TCtrlMobBAse)
  private

  public
    Registro  : TOrderConsignment;
    MCustomer : TCtrlMobCustomer;
    MSalesMan  : TCtrlMobSalesman;
    MOrder     : TCtrlMobOrder;
    MOperacoes : TCtrlMobOrderConsignmentOperation;
    ListSpl       : TCollSplOrderConsignment;
    Lista         : TListOrdemConsignment;
    Obj           : TObjOrderConsignment;
    MFinancialStatement : TCtrlMobFinancialStatement;
    Parametro : TPrmOrderConsignmet;
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure updateTbInstituition;
    procedure setParametro(par:String);
    procedure createTable;
    procedure setStrutureUpdate;Override;
    procedure clear;
    function save:boolean;
    function insert:boolean;
    Function delete:boolean;
    function getByKey:Boolean;
    function GetByCustomer:Boolean;
    procedure getListSpl(palavra:TStringList);
    procedure getList;
    procedure FillDataObjeto(PcRegistro: TOrderConsignment);
    function saveDataObjeto(DObj : TObjOrderConsignment):Boolean;
  End;

implementation

{ TCtrlMobOrderConsignment }

uses MainModule, UnFunctions;


procedure TCtrlMobOrderConsignment.clear;
begin
  clearObj(registro);
end;

constructor TCtrlMobOrderConsignment.Create(AOwner: TComponent);
begin
  inherited;
  createTable;  //não trocar a sequecia
  setStrutureUpdate;
  Registro      := TOrderConsignment.Create;
  MCustomer     := TCtrlMobCustomer.Create(Self);
  MSalesMan     := TCtrlMobSalesman.Create(Self);
  MOrder        := TCtrlMobOrder.Create(Self);
  MOperacoes    := TCtrlMobOrderConsignmentOperation.Create(Self);
  ListSpl       := TCollSplOrderConsignment.Create;
  Lista         := TListOrdemConsignment.Create;
  Obj           := TObjOrderConsignment.Create;
  MFinancialStatement := TCtrlMobFinancialStatement.Create(Self);
  Parametro    := TPrmOrderConsignmet.create;

end;

procedure TCtrlMobOrderConsignment.createTable;
begin
  execcmd(concat(
              'CREATE TABLE if not exists tb_order_consignment ( ',
              '  id int(11) NOT NULL, ',
              '  tb_institution_id int(11), ',
              '  terminal int(11), ',
              '  tb_customer_id int(11), ',
              '  tb_salesman_id int(11), ',
              '  created_at datetime, ',
              '  updated_at datetime ) '
    ));
end;

function TCtrlMobOrderConsignment.delete: boolean;
begin
  try
    DeleteObj(Registro);
    Result := True;
  except
    Result := False;
  end;

end;

destructor TCtrlMobOrderConsignment.Destroy;
begin
  {$IFDEF WIN32}
  Parametro.Destroy;
  Registro.DisposeOf;
  MCustomer.DisposeOf;
  MOrder.DisposeOf;
  MOperacoes.DisposeOf;
  ListSpl.DisposeOf;
  Lista.DisposeOf;
  MFinancialStatement.DisposeOf;
  inherited;

  {$ENDIF }
end;

procedure TCtrlMobOrderConsignment.FillDataObjeto(
  PcRegistro: TOrderConsignment);
Var
  I : Integer;
  LcOrder : TOrder;
  lcitems : TOrderItem;
  lcOperation : TOrderConsignmentOperation;
begin
  //Order
  Self.MOrder.clear;
  Self.MOrder.Registro.Estabelecimento := PcRegistro.Estabelecimento;
  Self.MOrder.Registro.Codigo          := PcRegistro.Codigo;
  Self.MOrder.Registro.Terminal        := PcRegistro.Terminal;
  Self.MOrder.getByKey;
  if Self.MOrder.exist then
  BEgin
    _assign(Self.MOrder.Registro, Obj.Order );

    //OrderSale
    _assign( PcRegistro, Obj.Consignacao );
    //Referencia Doc Fiscal CPF/CNPJ
    MCustomer.Registro.Codigo          :=  Obj.Consignacao.Cliente;
    MCustomer.Registro.Estabelecimento :=  PcRegistro.Estabelecimento;
    MCustomer.getByKey;
    MCustomer.fillDataObjeto(MCustomer.Registro,self.Obj.Fiscal);
    _assign( MCustomer.Registro, Obj.Cliente );
    //Vendedor
    //O campo DocFiscalVendedor não é preenchhido no Aplicativo por que já está com o codigo correto
    Obj.DocFiscalVendedor := '';


    //OPerações
    Self.MOperacoes.Registro := TOrderConsignmentOperation.Create;
    Self.MOperacoes.Registro.Estabelecimento  := PcRegistro.Estabelecimento;
    Self.MOperacoes.Registro.Ordem            := PcRegistro.Codigo;
    Self.MOperacoes.Registro.Terminal         := PcRegistro.Terminal;

    Self.MOperacoes.Lista := TListOrdemConsignmentOperation.Create;
    Self.MOperacoes.getList;
    for I := 0 to Self.MOperacoes.Lista.Count - 1 do
    Begin
      lcOperation := TOrderConsignmentOperation.Create;
      _assign(Self.MOperacoes.Lista[I],lcOperation );
      Obj.Operacoes.Add(lcOperation)
    end;

    //Items
    Self.MOperacoes.MItem.Registro := TOrderItem.Create;
    Self.MOperacoes.MItem.Registro.Estabelecimento := PcRegistro.Estabelecimento;
    Self.MOperacoes.MItem.Registro.Ordem           := PcRegistro.Codigo;
    Self.MOperacoes.MItem.Registro.Terminal        := PcRegistro.Terminal;
    Self.MOperacoes.MItem.Lista := TListOrdemItem.Create;
    Self.MOperacoes.MItem.getList;
    for I := 0 to Self.MOperacoes.MItem.Lista.Count - 1 do
    Begin
      lcitems := TOrderItem.Create;
      _assign(Self.MOperacoes.MItem.Lista[I],lcitems );
      Obj.Items.Add(lcitems)
    end;
  End;
end;

function TCtrlMobOrderConsignment.GetByCustomer: Boolean;
Var
  Lc_Qry : TFdQuery;
begin
  Try
    Lc_Qry := createQuery;
    with Lc_Qry do
    Begin
      sql.Add(concat('select * ',
                     'from tb_order_consignment ',
                     'where ( tb_customer_id =:tb_customer_id ) ',
                     ' and ( tb_institution_id =:tb_institution_id ) '
                     ));
      ParamByName('tb_institution_id').AsInteger := Self.Registro.Estabelecimento;
      ParamByName('tb_customer_id').AsInteger := Self.Registro.Cliente;
      Active := True;
      FetchAll;
      exist := ( recordcount > 0);
      if exist then
        get(Lc_Qry,Registro);
    End;
  Finally
    FinalizaQuery(Lc_Qry);
  End;
end;

function TCtrlMobOrderConsignment.getByKey: Boolean;
begin

end;

procedure TCtrlMobOrderConsignment.getList;
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
                     'WHERE ( od.status = ''N'' ) ',
                     ' and ( odc.tb_institution_id =:institution_id ) '
      ));

      //Incrementa SQL
      //Verifica de quais dispositivos serão feitos os downloads

      LcAux := '';//getDispositivos;
      if LcAux <> '' then
        sql.add(concat('and (odc.terminal in ',LcAux,')'));
      if Trim( Parametro.UltimaAtualizacao ) <> '' then
      Begin
        sql.add(' AND ( odc.updated_at >:updated_at ) ');
        sql.add(' order by odc.updated_at asc ');
      End
      else
      Begin
        sql.add(concat(' ORDER BY ',orderby,'  asc '));
      End;

      //sql.add(' limit 0,30 '); //somente em teste
      //Passagem de parametros
      parambyname('institution_id').AsInteger := Self.Registro.Estabelecimento;
      if Trim(Parametro.UltimaAtualizacao) <> '' then
        parambyname('updated_at').AsString := Parametro.UltimaAtualizacao;
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

procedure TCtrlMobOrderConsignment.getListSpl(palavra: TStringList);
Var
  Lc_Qry :TFDQuery;
  item : TListSplOrderConsignment;
  I:Integer;
  LcSqlStr : String;
begin
  Try
    Lc_Qry := createQuery;
    item := TListSplOrderConsignment.Create;
    with Lc_Qry do
    Begin
      sql.Clear;
      sql.Add(concat(
              'SELECT distinct et.id, et.name_company, et.nick_trade ',
              'FROM tb_order ord ',
              '  inner join tb_order_consignment orc ',
              '  on (ord.id = orc.id) ',
              '     and  (ord.tb_institution_id = orc.tb_institution_id) ',
              '  INNER JOIN tb_entity et ',
              '  on (orc.tb_customer_id = et.id) ',
              'where (orc.tb_institution_id=:tb_institution_id ) '

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

function TCtrlMobOrderConsignment.insert: boolean;
begin
  try
    InsertObj(Registro);
    Result := True;
  except
    Result := False;
  end;

end;

function TCtrlMobOrderConsignment.save: boolean;
begin
  try
    SaveObj(Registro);
    Result := True;
  except
    Result := False;
  end;

end;

function TCtrlMobOrderConsignment.saveDataObjeto(
  DObj: TObjOrderConsignment): Boolean;
VAr
  I : Integer;
  lcitems : TOrderItem;
begin
  tRY
    //Salva o cliente e reposiciona os registro de cliente e vendedor
    MCustomer.saveDataObjeto(DObj.Cliente,DObj.Fiscal);
    //Faz estas duas operaçoes independente de entrar na proxima condicional
    DObj.Consignacao.Cliente  := DObj.Cliente.Codigo;
    //Verifica o codigo do vendedor na web pesquisando pelo vendedor do pedido (não confundir com a função dentro do cliente)
    //O campo DocFiscalVendedor não é preenchhido no Aplicativo por que já está com o codigo correto
    if Length(DObj.DocFiscalVendedor)> 0 then
    Begin
      if Length(DObj.DocFiscalVendedor) = 11 then
        DObj.Consignacao.Vendedor := MSalesMan.MColaborador.MFiscal.MFisica.getIDbyCPF(DObj.DocFiscalVendedor)
      else
        DObj.Consignacao.Vendedor := MSalesMan.MColaborador.MFiscal.MJuridica.getIDbyCNPJ(DObj.DocFiscalVendedor);
    End;
    //O usuairo do Gestão será substituido pelo Vendedor
    //O usuario do Aplicativo já vem com o codigo do vendedor correto.
    if DObj.Consignacao.Vendedor > 0 then
      DObj.Order.Usuario := DObj.Consignacao.Vendedor
    else
      DObj.Order.Usuario := DObj.Estabelecimento;

    ClonarObj(DObj.Order,MOrder.Registro);
    MOrder.save;

    ClonarObj( DObj.Consignacao, self.Registro );
    self.save;

    for I := 0 to DObj.Operacoes.Count -1 do
    Begin
      ClonarObj(DObj.Operacoes[I],MOperacoes.Registro);
      MOperacoes.save;
    End;


    for I := 0 to DObj.Items.Count -1 do
    Begin
      _assign(DObj.Items[I],MOperacoes.MItem.Registro);
      MOperacoes.MItem.save;
      { o Estoque é lançado de fora deste objeto pois temos entradas e saidas especificas
        e sobre a sincronia é feito direto pela tb_stock_statement
      with MOperacoes.MItem.merchandise.StockStatement.Registro do
      Begin
        //Insere o registro dos itens da consignção
        Codigo          := 0;
        Estabelecimento := UMM.GInstitution.Registro.Codigo;
        Terminal        := MOperacoes.Registro.Terminal;
        Ordem           := MOperacoes.MItem.Registro.Ordem;
        OrdemItem       := MOperacoes.MItem.Registro.Codigo;
        Estoque         := MOperacoes.MItem.Registro.Estoque;
        Local           := concat('Terminal ', IntToStr(MOperacoes.Registro.Terminal));
        Tipo            := 'Consignacao';
        DataRegistro    := MOperacoes.Registro.Data;
        Direcao         := Copy(MOperacoes.Registro.Tipo,1,1);
        Mercadoria      := MOperacoes.MItem.Registro.Produto;
        Quantidade      := MOperacoes.MItem.Registro.Quantidade;
        Operacao        := 'inclusão';
      End;
      MOperacoes.MItem.merchandise.StockStatement.Registro.RegistroAlterado := MOperacoes.Registro.Data;
      MOperacoes.MItem.merchandise.StockStatement.save;
      }
    End;
  EXCEPT
   on E: Exception do
    geralog('TCtrlMobOrderConsignment.saveDataObjeto',concat(e.Message,Registro.Codigo.ToString));
  end;


end;

procedure TCtrlMobOrderConsignment.setParametro(par: String);
begin
  Parametro:= TJson.JsonToObject<TPrmOrderConsignmet>(par);
  //Tratar Data
  Parametro.UltimaAtualizacao := dataMysql(Parametro.UltimaAtualizacao);
end;

procedure TCtrlMobOrderConsignment.setStrutureUpdate;
begin
  createColumnIfNotExists('tb_order_consignment','tb_institution_id','int(11)');

end;

procedure TCtrlMobOrderConsignment.updateTbInstituition;
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
                'update tb_order_consignment set     ',
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

