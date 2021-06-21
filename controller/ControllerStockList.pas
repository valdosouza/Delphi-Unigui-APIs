unit ControllerStockList;

interface
uses System.Classes, System.SysUtils,BaseController,prm_stock_list,rest.json,
      tblStockList, FireDAC.Comp.Client,FireDAC.Stan.Param,
      System.Generics.Collections, TypesCollection,
      ControllerStockBalance, tblSalesmanHasStock;

Type

  TControllerStockList = Class(TBaseController)

    procedure clear;
  private

  public
    Registro : TStockList;
    Lista : TListStockList;
    balance : TControllerStockBalance;
    Parametro : TPrmStockList;
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure setParametro(par:String);
    procedure getList;
    function getbySalesman:TSalesmanHasStock;
    function save:boolean;
    function insert:boolean;
    Function delete:boolean;
    Function deleteItems:boolean;
    function getByKey:Boolean;
    procedure getSyncronize(InstitutionID:Integer;lastTime : TDateTime);
    procedure assign(ObjOri : TStockList);
    function IsMain:Boolean;
    function getMain:Integer;
    procedure setProducts;
  End;

implementation

{ ControllerStockList }

procedure TControllerStockList.assign(ObjOri: TStockList);
begin
  _assign(ObjOri,Registro);
end;

procedure TControllerStockList.clear;
begin
  clearObj(Registro);
end;

constructor TControllerStockList.Create(AOwner: TComponent);
begin
  inherited;
  Registro := TStockList.Create;
  Lista := TListStockList.Create;
  balance := TControllerStockBalance.create(Self);
  Parametro := TPrmStockList.create;
end;

function TControllerStockList.delete: boolean;
begin
  Try
    deleteObj(Registro);
    Result := True;
  Except
    Result := False;
  End;
end;


function TControllerStockList.deleteItems: boolean;
Var
  I: Integer;
begin
  Try
    Registro.Estabelecimento := Registro.Estabelecimento;
    getList;
    for I := 0 to Lista.Count - 1 do
    Begin
      //Deve informar o Estabelecimento e o produto direto no balance
      balance.Registro.Tabela := Lista[I].Codigo;
      deleteObj(balance.Registro);
    End;
    Result := True;
  Except
    Result := False;
  End;

end;

destructor TControllerStockList.Destroy;
begin
  Parametro.Destroy;
  balance.DisposeOf;
  Registro.DisposeOf;
  Lista.DisposeOf;
  inherited;
end;


function TControllerStockList.insert: boolean;
begin
  try
    SaveObj(Registro);
    Result := true;
  except
    Result := False;
  end;
end;

function TControllerStockList.IsMain: Boolean;
VAr
  Lc_Qry : TFDQuery;
begin
  try
    Lc_Qry := createQuery;
    with Lc_Qry do
    Begin
      exist := False;
      active := False;
      sql.Clear;
      SQL.Add(concat(
              'SELECT * ',
              'FROM tb_stock_list ',
              'WHERE ( kind = ''S'' )' +
              ' and ( tb_institution_id=:tb_institution_id ) ',
              ' and ( id >0 ) ',
              ' AND ( id <>:id ) '
      ));
      ParamByName('id').AsInteger := Registro.Codigo;
      ParamByName('tb_institution_id').AsInteger := Registro.Estabelecimento;
      Active := True;
      FetchAll;
      First;
      REsult := (RecordCount > 0);
    End;
  finally
    Lc_Qry.Close;
    Lc_Qry.DisposeOf
  end;


end;

function TControllerStockList.save: boolean;
begin
  try
    if Registro.Codigo = 0 then
      Registro.Codigo := getNextByField(Registro,'id',Registro.Estabelecimento);
    SaveObj(Registro);
    Result := true;
  except
    Result := False;
  end;
end;


procedure TControllerStockList.setParametro(par: String);
begin
  try
    Parametro := TPrmStockList.Create;
    Parametro:= TJson.JsonToObject<TPrmStockList>(par);
  //Tratar Data
    Parametro.UltimaAtualizacao := dataMysql(Parametro.UltimaAtualizacao);
  Except
    Parametro.UltimaAtualizacao := '1900-01-01 01:00:00'
  end;

end;

procedure TControllerStockList.setProducts;
Var
  Lc_Qry : TFDQuery;
  Lc_SqlTxt : String;
BEgin
  try
    //Cria a Consulta de Estoques Disponiveis
    Lc_Qry := createQuery;
    with Lc_Qry do
    Begin
      sql.add(concat(
                  'SELECT pd.id ',
                  'FROM tb_product pd ',
                  'where ',
                  'not exists ( ',
                  '    select sb.tb_merchandise_id from tb_stock_balance sb ',
                  '    where ',
                  '    sb.tb_merchandise_id = pd.id AND ',
                  '    sb.tb_stock_list_id = :tb_stock_list_id  and ',
                  '    sb.tb_institution_id = :tb_institution_id ) ',
                  'and ( pd.tb_institution_id = :tb_institution_id ) '
      ));
      ParamByName('tb_stock_list_id').AsInteger:= Registro.Codigo;
      ParamByName('tb_institution_id').AsInteger:= Registro.Estabelecimento;
      Active := True;
      FetchAll;
      First;
      while not Eof do
      Begin
        balance.Registro.Estabelecimento := Registro.Estabelecimento;
        balance.Registro.Tabela          := Registro.Codigo;
        balance.Registro.Mercadoria      := FieldByName('id').AsInteger;
        balance.Registro.Quantidade      := 0;
        balance.Registro.Minimo          := 0;
        balance.insert;
        Next;
      end;
    End;
  finally
    finalizaQuery(Lc_Qry);
  end;


end;

function TControllerStockList.getByKey: Boolean;
begin
  _getByKey(Registro);
end;

function TControllerStockList.getbySalesman: TSalesmanHasStock;
var
  Lc_Qry : TFDQuery;
begin
  Try
    Result := TSalesmanHasStock.Create;
    Lc_Qry := createQuery;
    with Lc_Qry do
    Begin
      sql.add(concat('SELECT * ',
                     'FROM tb_salesman_has_stock ',
                     'WHERE tb_institution_id =:tb_institution_id ',
                     ' and tb_salesman_id=:tb_salesman_id '
      ));

      ParamByName('tb_institution_id').AsInteger  := Parametro.Tabela.Estabelecimento;
      ParamByName('tb_salesman_id').AsInteger     := Parametro.Vendedor;
      Active := True;
      FetchAll;
      First;
      exist := RecordCount > 0;
      if exist then
        get(Lc_Qry,Result);
    end;
  Finally
    FinalizaQuery(Lc_Qry);
  End;
end;

procedure TControllerStockList.getList;
var
  Lc_Qry : TFDQuery;
  LITem : TStockList;
begin
  Try
    Lc_Qry := createQuery;
    with Lc_Qry do
    Begin
      sql.add(concat('SELECT * ',
                      'FROM tb_stock_list pl ',
                      'WHERE tb_institution_id =:tb_institution_id ',
                      ' ORDER BY description  asc '));

      ParamByName('tb_institution_id').AsInteger := Parametro.Tabela.Estabelecimento;
      Active := True;
      FetchAll;
      First;
      Lista.Clear;
      while not eof do
      Begin
        LITem := TStockList.Create;
        get(Lc_Qry,LITem);
        Lista.add(LITem);
        next;
      end;

    end;
  Finally
    FinalizaQuery(Lc_Qry);
  End;
end;

function TControllerStockList.getMain: Integer;
var
  Lc_Qry : TFDQuery;
begin
  Try
    Lc_Qry := createQuery;
    with Lc_Qry do
    Begin
      sql.add(concat('SELECT * ',
                     'FROM tb_stock_list ',
                     'where kind = ''S'' '
      ));
      Active := True;
      FetchAll;
      First;
      exist := RecordCount > 0;
      if exist then
        REsult := FieldByName('id').asinteger
      else
        REsult := 1;
    end;
  Finally
    FinalizaQuery(Lc_Qry);
  End;
end;

procedure TControllerStockList.getSyncronize(InstitutionID: Integer;
  lastTime: TDateTime);
var
  Lc_Qry : TFDQuery;
  LITem : TStockList;
begin
  Try
    Lc_Qry := createQuery;
    with Lc_Qry do
    Begin
      sql.add(concat('SELECT sl.*                                     ',
                     'FROM tb_stock_list sl                          ',
                     'where ( sl.tb_institution_id =:institution_id ) ',
                     ' and ( sl.updated_at >:updated_at )             ',
                     'order by sl.updated_at                        '
      ));
      parambyname('institution_id').AsInteger := InstitutionID;
      parambyname('updated_at').AsDateTime := lastTime;
      Active := True;
      FetchAll;
      First;
      Lista.Clear;
      while not eof do
      Begin
        LITem := TStockList.Create;
        get(Lc_Qry,LITem);
        Lista.add(LITem);
        next;
      end;
    end;
  Finally
    Lc_Qry.Close;
    FreeAndNil(Lc_Qry);
  End;
end;

end.
