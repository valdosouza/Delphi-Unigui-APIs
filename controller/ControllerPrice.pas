unit ControllerPrice;

interface
uses System.Classes, System.SysUtils,BaseController,rest.Json,prm_price,
      tblPrice, FireDAC.Comp.Client,FireDAC.Stan.Param,Datasnap.DBClient,Data.DB,
      System.Generics.Collections, TypesCollection,
      prm_base,ControllerConfig, GenericDao;

Type


  TControllerPrice = Class(TBaseController)

    procedure clear;
  private

  public
    Registro : TPrice;
    Lista: TListPrice;
    Parametro : TPrmPrice;
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure setParametro(par:String);
    function getTableName:String;
    function Insert:Boolean;
    function update:Boolean;
    function save:boolean;
    function setSincronized:String;
    function getAll:Boolean;
    function getAllByProduct:Boolean;
    Function delete:boolean;
    Function updateList(price_list: TClientDataSet):Boolean;
    function getByKey:Boolean;
    procedure getlist;
    procedure assign(ObjOri : TPrice);
  End;

implementation

{ ControllerPrice }

procedure TControllerPrice.assign(ObjOri: TPrice);
begin
  _assign(ObjOri,Registro);
end;

procedure TControllerPrice.clear;
begin
  clearObj(Registro);
end;

constructor TControllerPrice.Create(AOwner: TComponent);
begin
  inherited;
  Registro  := TPrice.Create;
  Lista     := TListPrice.Create;
  Parametro := TPrmPrice.Create;
end;


function TControllerPrice.delete: boolean;
Var
  I: Integer;
begin
  Try
    deleteObj(Registro);
    Result := True;
  Except
    Result := False;
  End;
end;


destructor TControllerPrice.Destroy;
begin
  Registro.DisposeOf;
  Lista.DisposeOf;
  Parametro.Destroy;
  inherited;
end;


function TControllerPrice.save: boolean;
begin
  try
    SaveObj(Registro);
    Result := true;
  except
    Result := False;
  end;
end;

procedure TControllerPrice.setParametro(par: String);
begin
  try
    Parametro := TPrmPrice.Create;
    Parametro:= TJson.JsonToObject<TPrmPrice>(par);
  //Tratar Data
    Parametro.UltimaAtualizacao := dataMysql(Parametro.UltimaAtualizacao);
  Except
    Parametro.UltimaAtualizacao := '1900-01-01 01:00:00'
  end;

end;

function TControllerPrice.setSincronized: String;
begin
  if existObj(Registro) then
    Result := TGenericDAO._Update(Registro)
  else
    Result := TGenericDAO._Insert(Registro)

end;

Function  TControllerPrice.update:Boolean;
begin
  try
    updateObj(Registro);
    Result := true;
  except
    Result := False;
  end;
end;

function TControllerPrice.updateList(price_list: TClientDataSet): Boolean;
begin
  Result := True;
  with price_list do
  Begin
    First;
    while not eof do
    Begin
      if (FieldByName('reg_status').AsString = 'Modified') then
      Begin
        Registro.Estabelecimento  := FieldByName('tb_institution_id').AsInteger;
        Registro.Tabela           := FieldByName('tb_price_list_id').AsInteger;
        Registro.Produto          := FieldByName('tb_product_id').AsInteger;
        Registro.Preco            := FieldByName('price_tag').AsFloat;
        Registro.MargemLucro      := FieldByName('aliq_kickback').AsFloat;
        Registro.Comissao         := FieldByName('aliq_profit').AsFloat;
        Registro.Quantidade       := FieldByName('quantity').AsFloat;
        updateObj(Registro);
      End;
      next;
    End;
  End;
end;

function TControllerPrice.getAll: Boolean;
Var
  Lc_Qry : TFDQuery;
begin
  Try
    Lc_Qry := createQuery;
    with Lc_Qry do
    Begin
      Active := False;
      SQL.Clear;
      SQL.Add('SELECT DISTINCT  p.tb_institution_id, p.tb_product_id, p.tb_price_list_id, '+
              'tp.description, p.price_tag, p.aliq_profit, p.aliq_kickback, p.quantity '+
              'FROM tb_price p '+
              'INNER JOIN tb_price_list tp '+
              'ON (p.tb_price_list_id = tp.id) and (p.tb_institution_id = tp.tb_institution_id ) '+
              ' where ( p.tb_product_id =:tb_product_id ) and ( tp.tb_institution_id=:tb_institution_id )');
      ParamByName('tb_product_id').AsInteger := Registro.Produto;
      ParamByName('tb_institution_id').AsInteger := Registro.Estabelecimento;
      active := True;
      FetchAll;
      result := (RowsAffected > 0) ;
    End;
  Finally
    Lc_Qry.Close;
    FreeAndNil(Lc_Qry);
  End;
end;

function TControllerPrice.getAllByProduct: Boolean;
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
                  'SELECT pl.tb_institution_id, pd.id tb_product_id, ',
                  'pl.id tb_price_list_id, pl.description, ',
                  'pr.price_tag, pr.aliq_profit, pr.aliq_kickback, pr.quantity ',
                  'from tb_price_list pl ',
                  '  left outer join tb_price pr ',
                  '  on (pr.tb_price_list_id = pl.id) ',
                  '  left outer join tb_product pd ',
                  '  on (pd.id = pr.tb_product_id) ',
                  ' where ( p.tb_product_id =:tb_product_id ) ',
                  ' and ( tp.tb_institution_id=:tb_institution_id )'
              ));
      ParamByName('tb_product_id').AsInteger := Registro.Produto;
      ParamByName('tb_institution_id').AsInteger := Registro.Estabelecimento;
      active := True;
      FetchAll;
      result := (RowsAffected > 0) ;
    End;
  Finally
    Lc_Qry.Close;
    FreeAndNil(Lc_Qry);
  End;
end;

function TControllerPrice.getByKey: Boolean;
begin
  _getByKey(Registro);
end;

procedure TControllerPrice.getList;
var
  Lc_Qry : TFDQuery;
  LITem : TPrice;
  LcConfig : TControllerConfig;
  LcStatusProduto : String;
begin
  Try
    LcConfig := TControllerConfig.Create(Self);
    LcConfig.Registro.Estabelecimento := parametro.Preco.Estabelecimento;
    LcConfig.Registro.Campo := 'DOWNLOAD_PRODUCT';
    LcConfig.getByKey;
    if LcConfig.exist then
      LcStatusProduto := LcConfig.Registro.Conteudo
    else
      LcStatusProduto := 'A';

    Lc_Qry := createQuery;
    with Lc_Qry do
    Begin
      sql.add(concat('SELECT pr.*                                     ',
                     'FROM tb_price pr                                '
      ));

      //Incrementa SQL - INNER
      sql.add(concat(
               '  inner join tb_merchandise m                          ',
               '  on ( m.id = pr.tb_product_id )                    ',
               '     and ( m.tb_institution_id = pr.tb_institution_id ) ',
               '  inner join tb_product p                              ',
               '  on (m.id = p.id )                                    ',
               '     and (m.tb_institution_id = p.tb_institution_id)   '

      ));

      //Incrementa SQL - WHERE
      sql.add(concat(
                'where ( pr.tb_institution_id =:institution_id )         ',
                ' and ( p.active = ''S'' )                              ',
                ' and ( m.kind = ''P''   )                               '
      ));
      if LcStatusProduto = 'P' then
        sql.add(concat(
                  ' and ( p.published = ''S'' )                         '
        ));


      if Trim(parametro.UltimaAtualizacao) <> '' then
        sql.add(' AND ( pr.updated_at >:updated_at ) ');

      //Incrementa SQL - ORDER BY
      if Trim(parametro.UltimaAtualizacao) <> '' then
      Begin
        sql.add(' order by pr.updated_at asc ');
      End
      else
      Begin
        sql.add(' ORDER BY pr.id  asc ');
      End;

      //Passagem de parametros

      parambyname('institution_id').AsInteger := parametro.Preco.Estabelecimento;
      if Trim(Parametro.UltimaAtualizacao) <> '' then
        parambyname('updated_at').AsString := Parametro.UltimaAtualizacao;
//        parambyname('updated_at').AsDateTime := StrToDateTime( Parametro.UltimaAtualizacao);
      Active := True;
      FetchAll;
      First;
      Lista.Clear;
      while not eof do
      Begin
        LITem := TPrice.Create;
        get(Lc_Qry,LITem);
        Lista.add(LITem);
        next;
      end;
    end;
  Finally
    FinalizaQuery(Lc_Qry);
  End;


end;


function TControllerPrice.getTableName: String;
var
  Lc_Qry : TFDQuery;
  LITem : TPrice;
begin
  Try
    Lc_Qry := createQuery;
    with Lc_Qry do
    Begin
      sql.Clear;
      sql.Add(concat(
                'select pl.description ',
                'from tb_price_list pl ',
                'where ( pl.tb_institution_id =:tb_institution_id ) ',
                ' and ( pl.id =:id )'
      ));
      ParamByName('tb_institution_id').AsInteger := Registro.Estabelecimento;
      ParamByName('id').AsInteger := Registro.Tabela;
      Active := True;
      Result := FieldByName('description').AsString;
    End;
  Finally
    Lc_Qry.Close;
    FreeAndNil(Lc_Qry);
  End;
end;

Function  TControllerPrice.Insert:Boolean;
begin
  try
   insertObj(Registro);
    Result := true;
  except
    Result := False;
  end;
end;

end.
