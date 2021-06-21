unit ControllerMerchandise;


interface
uses System.Classes, System.SysUtils,BaseController,TypesListCollection,
      tblMerchandise,FireDAC.Comp.Client,Md5, FireDAC.Stan.Param,
      ControllerBrand, ControllerProduct,ControllerStock,ControllerPrice,
      ControllerStockBalance,ControllerMerchandiseHasProvider,prm_merchandise,
  list_spl_merchandise, TypesCollection, ControllerPriceList,ObjMerchandise,
  System.Generics.Collections,prm_base,ControllerConfig,
  ControllerStockList, REST.json, ACBrValidador, tblprice;

Type
  TObjListMerchandise = TObjectList<TObjMerchandise>;

  TControllerMerchandise = Class(TBaseController)
    procedure clear;
  private


  public
    Registro      : TMerchandise;
    Obj           : TObjMerchandise;
    Marca         : TControllerBrand;
    Produto       : TControllerProduct;
    ListaPreco    : TControllerPriceList;
    Estoque       : TControllerStock;
    ListaEstoque : TControllerStockList;
    HadProvider   : TControllerMerchandiseHasProvider;
    Lista         : TListMerchandise;
    ListaObj     : TObjListMerchandise;
    Parametro   : TPrmMerchandise;
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure setParametro(par:String);
    function save:boolean;
    function update:boolean;
    function insert:boolean;
    function existBond: boolean;
    function desactive:boolean;
    function getByIdentifier:Boolean;
    function delete: boolean;
    function getByKey:Boolean;
    function getAllByKey:Boolean;
    function getListSpl : TCollSplMerchandise ;
    function getIdByProvider(docFiscal,product: String): Integer;
    procedure getlist;
    procedure getListObj;
    procedure fillDataObjeto(pMerchandise:TMerchandise);
    procedure assign(ObjOri : TMerchandise);
    function saveDataObjeto(DObj : TObjMerchandise):Boolean;
  End;

implementation

{ ControllerProduct }

procedure TControllerMerchandise.assign(ObjOri: TMerchandise);
begin
  _assign(ObjOri,Registro);
end;

procedure TControllerMerchandise.clear;
begin
  clearObj(Registro);
  Marca.clear;
  Produto.clear;
  Estoque.clear;
  ListaPreco.clear;
end;

constructor TControllerMerchandise.Create(AOwner: TComponent);
begin
  inherited;
  Registro      := TMerchandise.Create;
  Produto       := TControllerProduct.create(nil);
  Marca         := TControllerBrand.create(nil);
  Estoque       := TControllerStock.create(nil);
  ListaPreco    := TControllerPriceList.create(nil);
  ListaEstoque  := TControllerStockList.create(nil);
  Obj           := TObjMerchandise.Create;
  Lista         := TListMerchandise.Create;
  ListaObj      := TObjListMerchandise.Create;
  HadProvider   := TControllerMerchandiseHasProvider.create(nil);
  Parametro     := TPrmMerchandise.Create;
end;

function TControllerMerchandise.delete: boolean;
Var
  I : Integer;
begin
  //Lista de Estoque
  ListaEstoque.balance.Registro.Estabelecimento := Registro.Estabelecimento;
  ListaEstoque.balance.Registro.Mercadoria      := Registro.Codigo;
  ListaEstoque.deleteItems;
  //Lista de Preços
  ListaPreco.Registro.Estabelecimento :=   Registro.Estabelecimento;
  ListaPreco.getList;
  for I := 0 to ListaPreco.Lista.Count - 1 do
  Begin
    ListaPreco.Preco.Registro.Estabelecimento := Registro.Estabelecimento;
    ListaPreco.Preco.Registro.Produto         := Registro.Codigo;
    ListaPreco.Preco.Registro.Tabela          := ListaPreco.Lista[I].Codigo;
    ListaPreco.Preco.delete;
  End;


  deleteObj(Estoque.Registro);
  deleteObj(Registro);
  deleteObj(Produto.Registro);
end;

function TControllerMerchandise.desactive: boolean;
begin
  //Produto
  Produto.Registro.Estabelecimento  := Registro.Estabelecimento;
  Produto.Registro.Codigo           := Registro.Codigo;
  Produto.Registro.Ativo            := 'N';
  Produto.update;
end;

destructor TControllerMerchandise.Destroy;
begin
  Registro.DisposeOf;
  Obj.Destroy;
  Marca.DisposeOf;
  Produto.DisposeOf;
  Estoque.DisposeOf;
  ListaPreco.DisposeOf;
  Lista.DisposeOf;
  ListaObj.DisposeOf;
  ListaEstoque.DisposeOf;
  HadProvider.DisposeOf;
  Parametro.destroy;
  inherited;
end;

function TControllerMerchandise.insert: boolean;
begin
  try
    insertObj(Registro);
    Result := true;
  except
    Result := False;
  end;
end;

function TControllerMerchandise.save: boolean;
begin
  try
    SaveObj(Registro);
    Result := true;
  except
    Result := False;
  end;
end;

function TControllerMerchandise.saveDataObjeto(DObj: TObjMerchandise): Boolean;
Var
  I,J : Integer;
  LcValidBar: TACBrValidador;
  LcIDProduto : Integer;
begin
  try
    Try
      LcValidBar:= TACBrValidador.Create(nil);

      //Verifica se o codigo do produto é igual a zero
      if DObj.Produto.Codigo = 0 then
      Begin
        //Verifica se codigo de barras é valida para consultar se existe
        LcValidBar.TipoDocto := docGTIN;
        LcValidBar.Documento := DObj.Estoque.CodigoBarra;
        if LcValidBar.Validar then
        Begin
          //Se o codigo é valido consultamos se o produto existe no banco de dados
          Estoque.Registro.CodigoBarra := DObj.Estoque.CodigoBarra;
          Estoque.getByBarCode;
          //Se existir carregamos o codigo do produto no objeto para continur a atulizaçõ
          if Estoque.exist then
            DObj.Produto.Codigo := Estoque.Registro.Mercadoria;
        End;
      End;

      Produto.ClonarObj(DObj.Produto, Produto.Registro);
      Produto.save;

      ClonarObj(DObj.Mercadoria, Registro);
      Registro.Codigo := Produto.Registro.Codigo;
      //Tratar a MArca
      Marca.Registro.Descricao := DObj.Marca;
      Marca.Institution.Estabelecimento := DObj.Estabelecimento;
      Marca.Institution.Ativo := 'S';
      Marca.saveByDescription;
      Registro.Marca := Marca.Registro.Codigo;
      save;

      Estoque.ClonarObj(DObj.Estoque, estoque.Registro);
      Estoque.Registro.Mercadoria := Registro.Codigo;
      //Tratar a Embalagem
      with Estoque do
      Begin
        Embalagem.Registro.Descricao := DObj.Embalagem;
        Embalagem.Institution.Estabelecimento := DObj.Estabelecimento;
        Embalagem.Institution.Ativo := 'S';
        Embalagem.saveByDescription;
        Registro.Embalagem := Embalagem.Registro.Codigo;
      End;

      //Tratar a Medida
      with Estoque do
      Begin
        Medida.Registro.Descricao := DObj.Medida;
        Medida.Institution.Estabelecimento := DObj.Estabelecimento;
        Medida.Institution.Ativo := 'S';
        Medida.saveByDescription;
        Registro.Medida := Medida.Registro.Codigo;
      End;
      Estoque.save;
      Result := true;
    except
      Result := False;
    end;
  finally
    LcValidBar.DisposeOf;
  end;
end;

procedure TControllerMerchandise.setParametro(par: String);
begin
  try
    Parametro := TPrmMerchandise.Create;
    Parametro:= TJson.JsonToObject<TPrmMerchandise>(par);
  //Tratar Data
    Parametro.UltimaAtualizacao := dataMysql(Parametro.UltimaAtualizacao);
  Except
    Parametro.UltimaAtualizacao := '1900-01-01 01:00:00'
  end;

end;

function TControllerMerchandise.update: boolean;
begin
  try
    updateObj(Registro);
    Result := true;
  except
    Result := False;
  end;

end;

function TControllerMerchandise.existBond: boolean;
Var
  Lc_Qry : TFDQuery;
begin
  Lc_Qry := createQuery;
  with Lc_Qry do
  Begin
    sql.Add(concat(
            'select id ',
            'from tb_order_item oi ',
            'where ( oi.tb_product_id =:product_id ) ',
            ' and (oi.tb_institution_id =:institution_id ) '
      ));
    ParamByName('product_id').AsInteger := Registro.Codigo;
    ParamByName('institution_id').AsInteger := Registro.Estabelecimento;
    Active := True;
    FetchAll;
    Result := (recordCount > 0);
  End;
    FinalizaQuery(Lc_Qry);
end;

procedure TControllerMerchandise.fillDataObjeto(pMerchandise: TMerchandise);
var
  I:Integer;
  ItemPreco :TPrice;
begin
  Obj := TObjMerchandise.Create;

  Produto.Registro.Estabelecimento := pMerchandise.Estabelecimento;
  Produto.Registro.Codigo := pMerchandise.Codigo;
  Produto.getByKey;
  if Produto.exist then
    self.ClonarObj( Produto.Registro,Obj.Produto);

  self.ClonarObj( pMerchandise, Obj.Mercadoria);

  Estoque.Registro.Estabelecimento := pMerchandise.Estabelecimento;
  Estoque.Registro.Mercadoria       := pMerchandise.Codigo;
  Estoque.getByKey;
  if Estoque.exist then
    self.ClonarObj( Estoque.Registro, Obj.Estoque);

  Obj.Grupo := 'Geral';
  Obj.SubGrupo := 'Todos';
  Produto.Category.Parametro.Categoria.Codigo           := Produto.Registro.Categoria;
  Produto.Category.Parametro.Categoria.Estabelecimento  := Produto.Registro.Estabelecimento;
  Produto.Category.getGroup;//25/04/2020 - usado para o roteador baixar nos PDVS
  if Produto.Category.exist then
  BEgin
    if Produto.Category.Lista.Count > 0 then
    Begin
      Obj.Grupo     := Produto.Category.Lista[0].Descricao;
      if Produto.Category.Lista.Count > 1 then
         Obj.SubGrupo  := Produto.Category.Lista[1].Descricao;
    End;
  End;

  Marca.Registro.Codigo := Registro.Marca;
  Marca.getbyKey;
  if Marca.exist then
    Obj.Marca := Marca.Registro.Descricao
  else
    Obj.Marca := 'Não inf.';

  Estoque.Embalagem.Registro.Codigo := Estoque.Registro.Embalagem;
  Estoque.Embalagem.getbyKey;
  if Estoque.Embalagem.exist then
    Obj.Embalagem := Estoque.Embalagem.Registro.Descricao
  else
    Obj.Embalagem := 'Não inf.';

  Estoque.Medida.Registro.Codigo := Estoque.Registro.Medida;
  Estoque.Medida.getbyKey;
  if Estoque.Medida.exist then
    Obj.Medida := Estoque.Medida.Registro.Descricao
  else
    Obj.Medida := 'Nao inf.';
  {
  ListaPreco.Parametro.Tabela.Estabelecimento := pMerchandise.Estabelecimento;
  ListaPreco.getList;
  Obj.Precos.Clear;
  for I := 0 to ListaPreco.lista.count-1 do
  Begin
    ListaPreco.Preco.Registro.Estabelecimento := pMerchandise.Estabelecimento;
    ListaPreco.Preco.Registro.Tabela          := ListaPreco.lista[I].Codigo;
    ListaPreco.Preco.Registro.Produto         := pMerchandise.Codigo;
    ListaPreco.Preco.getByKey;
    if ListaPreco.Preco.exist then
    Begin
      ItemPreco :=TPrice.Create;
      ClonarObj(ListaPreco.Preco.Registro,ItemPreco);
      Obj.Precos.Add(ItemPreco);
    End;
  End;
  }
end;

function TControllerMerchandise.getAllByKey: Boolean;
begin
  getByKey;

  Produto.Registro.codigo := Registro.Codigo;
  Produto.Registro.Estabelecimento := Registro.Estabelecimento;
  Produto.getAllByKey;

  Estoque.Registro.Mercadoria := Registro.Codigo;
  Estoque.Registro.Estabelecimento := Registro.Estabelecimento;
  Estoque.getAllByKey;

  Marca.Registro.Codigo := Registro.Marca;
  Marca.Institution.Estabelecimento := Registro.Estabelecimento;
  Marca.getByKey;

end;

function TControllerMerchandise.getByIdentifier: Boolean;
Var
  Lc_Qry : TFdQuery;
begin
  Try
    Lc_Qry := createQuery;
    with Lc_Qry do
    Begin
      Active := False;
      SQL.Clear;
      SQL.Add(concat(
                'SELECT * ',
                'FROM tb_merchandise ',
                'Where ( tb_institution_id =:tb_institution_id ) ',
                ' and  ( id_internal=:id_internal ) '
      ));
      if (REgistro.Codigo > 0) then
        SQL.Add(' AND (id <>:id )');

      ParamByName('tb_institution_id').AsInteger := REgistro.Estabelecimento;
      ParamByName('id_internal').AsString := Registro.CodigoInterno;

      if (REgistro.Codigo > 0) then
        ParamByName('id').AsInteger := REgistro.Codigo;

      Active := True;
      FetchAll;
      exist := (recordCount > 0);
      if exist then get(Lc_Qry,Registro) ;
    End;
  Finally
    FinalizaQuery(Lc_Qry);
  End;
end;

function TControllerMerchandise.getByKey: Boolean;
begin
  _getByKey(Registro);
  Produto.Registro.codigo := Registro.Codigo;
  Produto.Registro.Estabelecimento := Registro.Estabelecimento;
  Produto.getByKey;
end;

function TControllerMerchandise.getIdByProvider(docFiscal,product: String): Integer;
begin
  with HadProvider.Registro do
  Begin
    Estabelecimento := Self.Registro.Estabelecimento;
    Fornecedor := 0;
    Fornecedor := HadProvider.provider.Fiscal.Juridica.getIDbyCNPJ(docFiscal);
    //Se voltar zero tenta pelo CPF
    if ( Fornecedor = 0 ) then
      Fornecedor := HadProvider.provider.Fiscal.Fisica.getIDbyCPF(docFiscal);
    ProdutoFornecedor := product;
    if ( Fornecedor > 0 ) then
    Begin
      HadProvider.getByProvider;
      Result := HadProvider.Registro.Mercadoria;
    End
    else
    Begin
      Result := 0;
    End;
  End;
end;


function TControllerMerchandise.getListSpl: TCollSplMerchandise;
Var
  Lc_Qry :TFDQuery;
  Lista : TListSplMerchandise;
begin
  { TODO -ovaldo -cnormal : Será impementado }
  {
  Try
    result := TCollSplMerchandise.Create;
    Lc_Qry := createQuery;
    with Lc_Qry,Parametro do
    Begin
      sql.Clear;
      sql.Add(concat(
            'select pr.id, pr.description product, pk.description package, stb.quantity ,prc.price_tag ',
            'from tb_product pr ',
            '  inner join tb_merchandise me ',
            '  on (me.id = pr.id) and (me.tb_institution_id = pr.tb_institution_id) ',
            '  inner  join tb_stock st ',
            '  on (st.tb_merchandise_id = me.id) and (st.tb_institution_id = me.tb_institution_id) ',
            '  inner join tb_price prc ',
            '  on (prc.tb_product_id = pr.id) and (prc.tb_institution_id = pr.tb_institution_id) ',
            '  inner join tb_stock_balance stb ',
            '  on (stb.tb_merchandise_id = me.id) and  (stb.tb_institution_id = me.tb_institution_id) ',
            '  inner join tb_package pk ',
            '  on (pk.id = st.tb_package_id) ',
            'where ( pr.tb_institution_id =:institution_id ) '
          ));
      //Incrmenta o sql
      if Produto.Registro.Descricao <> '' then
        sql.Add(' and ( pr.description like :product) ');

      sql.Add(concat('Limit ', InttoStr( (Pagina * 20 ) - 20 ),',', InttoStr( (Pagina * 20 ) ) ));
      //passagem de PArametros
      ParamByName('institution_id').AsInteger := Institution;

      if Produto.Registro.Descricao <> '' then
        ParamByName('product').AsString := concat('%',Produto.Registro.Descricao,'%');

      Active := True;
      FetchAll;
      First;
      while not eof do
      Begin
        Lista := TListSplMerchandise.Create;
        Lista.Codigo    := FieldByName('id').AsInteger;
        Lista.Descricao := FieldByName('product').AsString;
        Lista.Embalagem := FieldByName('package').AsString;
        Lista.Estoque   := FieldByName('quantity').AsFloat;
        Lista.Preco     := FieldByName('price_tag').AsFloat;
        //add lista
        Result.Add(Lista);
        Next;
      End;
    End;
  Finally
    FinalizaQuery(Lc_Qry);
  End;
  }
end;


procedure TControllerMerchandise.getList;
var
  Lc_Qry : TFDQuery;
  LITem : TMerchandise;
  LcConfig : TControllerConfig;
  LcStatusProduto : String;
begin
  Try
    LcConfig := TControllerConfig.Create(Self);
    LcConfig.Registro.Estabelecimento := Parametro.Mercadoria.Estabelecimento;
    LcConfig.Registro.Campo := 'DOWNLOAD_PRODUCT';
    LcConfig.getByKey;
    if LcConfig.exist then
      LcStatusProduto := LcConfig.Registro.Conteudo
    else
      LcStatusProduto := 'A';

    Lc_Qry := createQuery;
    with Lc_Qry do
    Begin
      sql.add(concat('SELECT m.*                                           ',
                     'FROM tb_merchandise m                                '
      ));

      //Incrementa SQL - INNER
      sql.add(concat(
               '  inner join tb_product p                            ',
               '  on (m.id = p.id )                                  ',
               '     and (m.tb_institution_id = p.tb_institution_id) '
      ));

      //Incrementa SQL - WHERE
      sql.add(concat(
                'where ( m.tb_institution_id =:institution_id )         ',
//                ' and ( p.active = ''S'' )                              ',
                ' and ( m.kind = ''P''   )                               '
      ));
      if LcStatusProduto = 'P' then
        sql.add(concat(
                  ' and ( p.published = ''S'' )                         '
        ));




      if Trim(Parametro.UltimaAtualizacao) <> '' then
        sql.add(' AND ( m.updated_at >:updated_at ) ');

      //Incrementa SQL - ORDER BY
      if Trim(Parametro.UltimaAtualizacao) <> '' then
      Begin
        sql.add(' order by m.updated_at asc ');
      End
      else
      Begin
        sql.add(' ORDER BY m.id  asc ');
      End;

      //Passagem de parametros
      parambyname('institution_id').AsInteger := Parametro.Mercadoria.Estabelecimento;

      if Trim(Parametro.UltimaAtualizacao) <> '' then
        parambyname('updated_at').AsString := Parametro.UltimaAtualizacao;


      Active := True;
      FetchAll;
      First;
      Lista.Clear;
      while not eof do
      Begin
        LITem := TMerchandise.Create;
        get(Lc_Qry,LITem);
        Lista.add(LITem);
        next;
      end;
    end;
  Finally
    FinalizaQuery(Lc_Qry);
  End;


end;

procedure TControllerMerchandise.getListObj;
Var
  I : Integer;
  LcReg : TMerchandise;
begin
  ListaObj.Clear;
  for I := 0 to (Lista.Count - 1)do
  Begin
    LcReg := TMerchandise.Create;
    LcReg := Lista[I];
    fillDataObjeto(LcReg);
    ListaObj.Add( Obj );
  End;

end;

end.

