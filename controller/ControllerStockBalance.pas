unit ControllerStockBalance;

interface
uses System.Classes, System.SysUtils,BaseController,rest.json, prm_stock_balance,
      tblStockBalance, FireDAC.Comp.Client,FireDAC.Stan.Param,
      TypesCollection,tblStockList,
      ControllerConfig,ControllerSalesmanHasStock;

Type

  TControllerStockBalance = Class(TBaseController)

    procedure clear;
  private
    function getMainStock:Integer;
    function getMain:Integer;
  public
    Registro : TStockBalance;
    Lista : TListStockBalance;
    Parametro :TPrmStockBalance;
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure setParametro(par:String);
    procedure insert;
    procedure update;
    function save:boolean;
    function createByList: Boolean;
    function getAll: Boolean;
    function getByKey:Boolean;
    function getbalance:real;
    procedure getlist;
    procedure assign(ObjOri : TStockBalance);
  End;

implementation

{ ControllerPriceList }

procedure TControllerStockBalance.assign(ObjOri: TStockBalance);
begin
  _assign(ObjOri,Registro);
end;

procedure TControllerStockBalance.clear;
begin
  clearObj(Registro);
end;

constructor TControllerStockBalance.Create(AOwner: TComponent);
begin
  inherited;
  Registro  := TStockBalance.Create;
  Lista :=  TListStockBalance.Create;
  Parametro := TPrmStockBalance.Create;
end;


destructor TControllerStockBalance.Destroy;
begin
  Parametro.Destroy;
  Registro.DisposeOf;
  Lista.DisposeOf;
  inherited;
end;


function TControllerStockBalance.save: boolean;
begin
  try
    SaveObj(Registro);
    Result := true;
  except
    Result := False;
  end;
end;


procedure TControllerStockBalance.setParametro(par: String);
begin
  try
    Parametro := TPrmStockBalance.Create;
    Parametro:= TJson.JsonToObject<TPrmStockBalance>(par);
  //Tratar Data
    Parametro.UltimaAtualizacao := dataMysql(Parametro.UltimaAtualizacao);
  Except
    Parametro.UltimaAtualizacao := '1900-01-01 01:00:00'
  end;

end;

function TControllerStockBalance.getMainStock:Integer;
VAr
  LcStockList : TControllerSalesmanHasStock;
begin
  try
    LcStockList := TControllerSalesmanHasStock.Create(nil);
    LcStockList.Parametro.Estabelecimento  := parametro.Estabelecimento;
    LcStockList.Parametro.Vendedor         := parametro.Vendedor;
    LcStockList.getbySalesman;
    if LcStockList.exist then
      Result := LcStockList.Registro.Estoque
    else
      Result := LcStockList.getMain;
  finally
    LcStockList.DisposeOf;
  end;
end;

procedure TControllerStockBalance.update;
begin
  updateObj(Registro);
end;

function TControllerStockBalance.createByList: Boolean;
Var
  Qr_StockList : TFDQuery;
begin
  //Verifica Tabelas Disponiveis
  Qr_StockList := createQuery;
  with Qr_StockList do
  Begin
    Active := False;
    SQL.Clear;
    SQL.Add('SELECT sl.id, sl.tb_institution_id '+
            'FROM tb_stock_list sl '+
            'where  ( sl.tb_institution_id =:tb_institution_id )');
    ParamByName('tb_institution_id').AsInteger := Registro.Estabelecimento;
    active := True;
    FetchAll;
    //Consulta se tem o produto na lista
    while not eof do
    Begin
      Registro.Tabela := FieldByName('id').AsInteger;
      self.getbyKey;
      if not self.exist then
      Begin
        Registro.Quantidade := 0;
        Registro.Minimo     := 0;
        insertObj(Registro);
      End;
      next;
    End;
  End;
  Qr_StockList.Close;
  Qr_StockList.DisposeOf;
end;

function TControllerStockBalance.getAll: Boolean;
Var
  Lc_Qry : TFDQuery;
begin
  Try
    Lc_Qry := createQuery;
    with Lc_Qry do
    Begin
      Active := False;
      SQL.Clear;
      SQL.Add('SELECT DISTINCT s.tb_institution_id, s.tb_merchandise_id, '+
              'sl.description, s.quantity, s.minimum '+
              'FROM tb_stock s '+
              '  INNER JOIN tb_stock_list sl '+
              '  ON (s.tb_merchandise_id = sl.id) and (s.tb_institution_id = sl.tb_institution_id ) '+
              'where ( s.tb_merchandise_id =:tb_merchandise_id) and ( sl.tb_institution_id=:tb_institution_id )');
      ParamByName('tb_merchandise_id').AsInteger := Registro.Mercadoria;
      ParamByName('tb_institution_id').AsInteger := Registro.Estabelecimento;
      active := True;
      FetchAll;
      result := (RowsAffected > 0) ;
    End;
  Finally
    finalizaQuery(Lc_Qry);
  End;
end;

function TControllerStockBalance.getbalance: real;
begin
  result := 0

end;

function TControllerStockBalance.getByKey: Boolean;
begin
  _getByKey(Registro);
end;

procedure TControllerStockBalance.getList;
var
  Lc_Qry : TFDQuery;
  LITem : TStockBalance;
  LcConfig : TControllerConfig;
  LcStatusProduto : String;
begin
  Try
    LcConfig := TControllerConfig.Create(nil);
    LcConfig.Registro.Estabelecimento := Parametro.Estabelecimento;
    LcConfig.Registro.Campo := 'DOWNLOAD_PRODUCT';
    LcConfig.getByKey;
    if LcConfig.exist then
      LcStatusProduto := LcConfig.Registro.Conteudo
    else
      LcStatusProduto := 'A';

    Lc_Qry := createQuery;
    with Lc_Qry do
    Begin
      sql.add(concat('SELECT sb.*                                     ',
                     'FROM tb_stock_balance sb                                '
      ));

      //Incrementa SQL - INNER
      sql.add(concat(
               '  inner join tb_merchandise m                          ',
               '  on ( m.id = sb.tb_merchandise_id )                    ',
               '     and ( m.tb_institution_id = sb.tb_institution_id ) ',
               '  inner join tb_product p                              ',
               '  on (m.id = p.id )                                    ',
               '     and (m.tb_institution_id = p.tb_institution_id)   '

      ));

      //Incrementa SQL - WHERE
      sql.add(concat(
                'where ( sb.tb_institution_id =:institution_id )         ',
//                ' and ( p.active = ''S'' )                              ', para sincronia deve manter todos os produtos
                ' and ( m.kind = ''P''   )                               '
      ));
      if LcStatusProduto = 'P' then
        sql.add(concat(
                  ' and ( p.published = ''S'' )                         '
        ));

      sql.add(' and ( sb.tb_stock_list_id =:tb_stock_list_id ) ');

      if Trim(Parametro.UltimaAtualizacao) <> '' then
        sql.add(' AND ( sb.updated_at >:updated_at ) ');

      //Incrementa SQL - ORDER BY
      if Trim(Parametro.UltimaAtualizacao) <> '' then
      Begin
        sql.add(' order by sb.updated_at asc ');
      End
      else
      Begin
        sql.add(' ORDER BY st.tb_merchandise_id  asc ');
      End;

      //Passagem de parametros
      parambyname('institution_id').AsInteger := Parametro.Estabelecimento;

      parambyname('tb_stock_list_id').AsInteger := getMainStock;

      if Trim(Parametro.UltimaAtualizacao) <> '' then
        parambyname('updated_at').AsString := Parametro.UltimaAtualizacao;


      Active := True;
      FetchAll;
      First;
      Lista.Clear;
      while not eof do
      Begin
        LITem := TStockBalance.Create;
        get(Lc_Qry,LITem);
        Lista.add(LITem);
        next;
      end;
    end;
  Finally
    FinalizaQuery(Lc_Qry);
    LcConfig.DisposeOf;
  End;
end;

function TControllerStockBalance.getMain: Integer;
var
  Lc_Qry : TFDQuery;
begin
  Try
    Lc_Qry := createQuery;
    with Lc_Qry do
    Begin
      sql.add(concat('SELECT id ',
                     'FROM tb_stock_list ',
                     'WHERE tb_institution_id =:tb_institution_id ',
                     ' and kind = ''S'' '
      ));

      ParamByName('tb_institution_id').AsInteger  := Registro.Estabelecimento;
      Active := True;
      FetchAll;
      First;
      exist := RecordCount > 0;
      if exist then
        REsult := FieldByNAme('id').AsInteger
      else
        REsult := 1;
    end;
  Finally
    FinalizaQuery(Lc_Qry);
  End;

end;


procedure TControllerStockBalance.insert;
begin
  insertObj(Registro)
end;

end.

