unit ControllerProduct;


interface
uses System.Classes, System.SysUtils,BaseController,
      tblProduct,FireDAC.Comp.Client,Md5, FireDAC.Stan.Param,REST.json,
      ControllerCategory, ControllerPriceList, TypesCollection,
      prm_base,ControllerConfig, prm_product;

Type

  TControllerProduct = Class(TBaseController)

    procedure clear;
  private


  public
    Registro : TProduct;
    Category : TControllerCategory;
    Lista : TListProduct;
    ListaPreco    : TControllerPriceList;
    Parametro : TPrmProduct;
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    function save:boolean;
    function update:boolean;
    function insert:boolean;
    function getByKey:Boolean;
    function getByCodebar:Boolean;
    function getAllByKey:Boolean;
    function delete: boolean;
    procedure getlist;
    procedure assign(ObjOri : TProduct);
    procedure setParametro(par:String);
  End;

implementation

{ ControllerProduct }

uses UnFunctions;

procedure TControllerProduct.assign(ObjOri: TProduct);
begin
  _assign(ObjOri,Registro);
end;

procedure TControllerProduct.clear;
begin
  clearObj(Registro);
end;

constructor TControllerProduct.Create(AOwner: TComponent);
begin
  inherited;
  Registro    := TProduct.Create;
  Category    := TControllerCategory.Create(nil);
  ListaPreco  := TControllerPriceList.Create(nil);
  Lista       := TListProduct.create;
  Parametro   := TPrmProduct.Create;
end;

function TControllerProduct.delete: boolean;
begin
  Try
    deleteObj(Registro);
    Result := True;
  Except
    Result := False;
  End;
end;

destructor TControllerProduct.Destroy;
begin
  Parametro.Destroy;
  ListaPreco.DisposeOf;
  Category.DisposeOf;
  Registro.DisposeOf;
  Lista.DisposeOf;
  inherited;
end;


function TControllerProduct.insert: boolean;
begin
  Registro.Codigo := getNextByField(Registro,'id',Registro.Estabelecimento);
  try
    SaveObj(Registro);
    Result := true;
  except
    Result := False;
  end;
end;


function TControllerProduct.save: boolean;
begin
  if Registro.Codigo = 0 then
    Registro.Codigo := getNextByField(Registro,'id',Registro.Estabelecimento);
  try
    if trim(Registro.Identificador) = '' then
      Registro.Identificador := IntToStr( Registro.Codigo );
    SaveObj(Registro);
    Result := true;
  except
    Result := False;
  end;
end;


procedure TControllerProduct.setParametro(par: String);
begin
  try
    Parametro := TPrmProduct.Create;
    Parametro:= TJson.JsonToObject<TPrmProduct>(par);
  //Tratar Data
    Parametro.UltimaAtualizacao := dataMysql(Parametro.UltimaAtualizacao);
  Except
    Parametro.UltimaAtualizacao := '1900-01-01 01:00:00'
  end;
end;

function TControllerProduct.update: boolean;
begin
  try
    updateObj(Registro);
    Result := true;
  except
    Result := False;
  end;

end;

function TControllerProduct.getAllByKey: Boolean;
begin
  _getByKey(Registro);
end;

function TControllerProduct.getByCodebar: Boolean;
var
  Lc_Qry : TFDQuery;
  LITem : TProduct;
begin
  Lc_Qry := createQuery;
  with Lc_Qry do
  Begin
    SQL.Add(concat(
              'Select p.*                                           ',
              'from tb_product p                                    ',
              '  inner join tb_merchandise m                        ',
              '   on (m.id = p.id )                                 ',
              '   and (m.tb_institution_id = p.tb_institution_id)   ',
              '  inner join tb_stock s                              ',
              '   on (s.tb_merchandise_id = m.id )                  ',
              '   and (s.tb_institution_id = m.tb_institution_id)   ',
              'where p.tb_institution_id =:institution_id           ',
              'and s.codebar =:codebar                              '
    ));
    parambyname('institution_id').AsInteger := parametro.Produto.Estabelecimento;
    parambyname('codebar').AsString := parametro.CodigoBarras;
    Active := True;
    FetchAll;
    exist := (recordCount > 0);
    if (exist) then get(Lc_Qry,Registro);
  End;
end;

function TControllerProduct.getByKey: Boolean;
begin
  _getByKey(Registro);
end;

procedure TControllerProduct.getList;
var
  Lc_Qry : TFDQuery;
  LITem : TProduct;
  LcConfig : TControllerConfig;
  LcStatusProduto : String;
begin
  Try
    LcConfig := TControllerConfig.Create(Self);
    LcConfig.Registro.Estabelecimento := Parametro.Produto.Estabelecimento;
    LcConfig.Registro.Campo := 'DOWNLOAD_PRODUCT';
    LcConfig.getByKey;
    if LcConfig.exist then
      LcStatusProduto := LcConfig.Registro.Conteudo
    else
      LcStatusProduto := 'A';

    Lc_Qry := createQuery;
    with Lc_Qry do
    Begin
      sql.add(concat('SELECT p.*  ',
                     'FROM tb_product p  '
      ));

      //Incrementa SQL - INNER
      sql.add(concat(
               '  inner join tb_merchandise m  ',
               '  on (m.id = p.id )  ',
               '     and (m.tb_institution_id = p.tb_institution_id) '
      ));

      //Incrementa SQL - WHERE
      sql.add(concat(
                'where ( p.tb_institution_id =:institution_id )         ',
      //       ' and ( p.active = ''S'' )                              ',//desativado pois foi tratado mais à frente
                ' and ( m.kind = ''P''   )                               '
      ));
      if LcStatusProduto = 'P' then
        sql.add(concat(
                  ' and ( p.published = ''S'' )                         '
        ));

      //Se for preenchido precisamos sincronia ativos e inativos
      if Trim(Parametro.UltimaAtualizacao) <> '' then
      Begin
        sql.add(' AND ( p.updated_at >:updated_at ) ')
      End
      else
      Begin
        //Neste caso mostrar somente os ativos pois não se trata de sincronia
        sql.add(concat(
                  ' and ( p.active = ''S'' )                              '
        ));
      End;

      //Incrementa SQL - ORDER BY
      if Trim(Parametro.UltimaAtualizacao) <> '' then
      Begin
        sql.add(' order by p.updated_at asc ');
      End
      else
      Begin
        sql.add(' ORDER BY p.id  asc ');
      End;

      //Passagem de parametros
      parambyname('institution_id').AsInteger := Parametro.Produto.Estabelecimento;

      if Trim(Parametro.UltimaAtualizacao) <> '' then
        parambyname('updated_at').AsString := Parametro.UltimaAtualizacao;


      Active := True;
      FetchAll;
      First;
      Lista.Clear;
      while not eof do
      Begin
        LITem := TProduct.Create;
        get(Lc_Qry,LITem);
        Lista.add(LITem);
        next;
      end;
    end;
  Finally
    FinalizaQuery(Lc_Qry);
  End;
end;


end.

