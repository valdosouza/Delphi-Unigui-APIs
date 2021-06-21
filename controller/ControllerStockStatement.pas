unit ControllerStockStatement;


interface
uses System.Classes, System.SysUtils,BaseController, rest.json, prm_stock_statement,
      tblStockStatement,FireDAC.Comp.Client,Md5, FireDAC.Stan.Param,
  objStockStatement, TypesCollection,prm_base,ControllerStockList,ControllerSalesmanHasStock;

Type
  TControllerStockStatement = Class(TBaseController)
    procedure clear;
  private
    function getNext:Integer;
  public
    Registro : TStockStatement;
    Lista : TListStockStatement;
    Parametro : TPrmStockStatement;
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure setParametro(par:String);
    function getIDbyControls:Integer;
    function getIDbyControlsProducts:Integer;
    function insert:Boolean;
    function Update:boolean;
    function save:boolean;
    function delete:Boolean;
    function deletebyOrder:Boolean;
    procedure getlist;
    function saveDataObjeto(DObj : TObjStockStatement): Boolean;
  End;

implementation

{StockStatement }

procedure TControllerStockStatement.clear;
begin
  clearObj(Registro);
end;

constructor TControllerStockStatement.Create(AOwner: TComponent);
begin
  inherited;
  Registro := TStockStatement.Create;
  Lista := TListStockStatement.create;
  Parametro := TPrmStockStatement.create;
end;

function TControllerStockStatement.deletebyOrder: Boolean;
Var
  Lc_Qry : TFDQuery;
begin
  Try
    Lc_Qry := createQuery;
    with Lc_Qry do
    Begin
      Active:= False;
      sql.Clear;
      sql.Add(concat(
                'delete from tb_stock_statement ',
                'where (tb_institution_id =:institution_id ) ',
                ' and (tb_order_id=:order_id) ',
                ' and (terminal=:terminal) '
            ));
      ParamByName('institution_id').AsInteger := Registro.Estabelecimento;
      ParamByName('terminal').AsInteger := Registro.Terminal;
      ParamByName('order_id').AsInteger := Registro.Ordem;
      ExecSQL;

    End;
  Finally
    Lc_Qry.Close;
    FreeAndNil(Lc_Qry);
  End;

end;

function TControllerStockStatement.delete: Boolean;
begin
  deleteObj(Registro);
end;

destructor TControllerStockStatement.Destroy;
begin
  Parametro.Destroy;
  Lista.DisposeOf;
  Registro.DisposeOf;
  inherited;
end;

function TControllerStockStatement.getIDbyControls: Integer;
Var
  Lc_Qry : TFdQuery;
Begin
  try
    Lc_Qry := createQuery;
    with Lc_Qry do
    Begin
      sql.Add(concat(
                'SELECT id ',
                'FROM tb_stock_statement ',
                'WHERE ( kind =:kind ) ',
                ' AND  ( tb_order_id =:tb_order_id ) ',
                ' AND  ( tb_order_item_id=:tb_order_item_id ) ',
                ' AND  ( terminal =:terminal ) ',
                ' AND  (tb_institution_id =:tb_institution_id) '
      ));
      ParamByName('kind').asstring              := Registro.Tipo;
      ParamByName('tb_order_id').asInteger      := Registro.Ordem;
      ParamByName('tb_order_item_id').asInteger := Registro.OrdemItem;
      ParamByName('terminal').asInteger         := Registro.Terminal;
      ParamByName('tb_institution_id').asInteger := Registro.Estabelecimento;
      Active := True;
      FetchAll;
      if (recordcount > 0) then
        REsult := FieldByName('id').AsInteger
      else
        REsult := 0;
    End;
  finally
    FinalizaQuery(Lc_Qry);
  end;
end;

function TControllerStockStatement.getIDbyControlsProducts: Integer;
Var
  Lc_Qry : TFdQuery;
Begin
  try
    Lc_Qry := createQuery;
    with Lc_Qry do
    Begin
      sql.Add(concat(
                'SELECT id ',
                'FROM tb_stock_statement ',
                'WHERE ( kind =:kind ) ',
                ' AND  ( tb_order_id =:tb_order_id ) ',
                ' AND  ( tb_order_item_id=:tb_order_item_id ) ',
                ' AND  ( terminal =:terminal ) ',
                ' AND ( tb_merchandise_id=:tb_merchandise_id ) ',
                ' AND  (tb_institution_id =:tb_institution_id) '
      ));
      ParamByName('kind').asstring                := Registro.Tipo;
      ParamByName('tb_order_id').asInteger        := Registro.Ordem;
      ParamByName('tb_order_item_id').asInteger   := Registro.OrdemItem;
      ParamByName('terminal').asInteger           := Registro.Terminal;
      ParamByName('tb_merchandise_id').asInteger  := Registro.Mercadoria;
      ParamByName('tb_institution_id').asInteger   := Registro.Estabelecimento;
      Active := True;
      FetchAll;
      if (recordcount > 0) then
        REsult := FieldByName('id').AsInteger
      else
        REsult := 0;
    End;
  finally
    FinalizaQuery(Lc_Qry);
  end;
end;

procedure TControllerStockStatement.getlist;
var
  Lc_Qry : TFDQuery;
  LITem : TStockStatement;
  LcStockList : TControllerStockList;
  LcStockSalesman : TControllerSalesmanHasStock;
  LcStock : Integer;
begin
  Try
    Lc_Qry := createQuery;
    with Lc_Qry do
    Begin
      sql.add(concat('SELECT * ',
                     'FROM tb_stock_statement ',
                     'WHERE ( tb_institution_id =:institution_id ) '
      ));

      //Incrementa SQL
      if Parametro.Movimento.Terminal > 0 then
        sql.add(' and (terminal <>:terminal ) ');


      if Parametro.Vendedor > 0 then
      Begin
        try
          LcStockList     := TControllerStockList.Create(nil);
          LcStockSalesman := TControllerSalesmanHasStock.Create(nil);
          LcStockSalesman.Parametro.Estabelecimento := Parametro.Movimento.Estabelecimento;
          LcStockSalesman.Parametro.Vendedor        := Parametro.Vendedor;
          LcStockSalesman.getbySalesman;
          if LcStockSalesman.exist then
            LcStock := LcStockSalesman.Registro.Estoque
          else
            LcStock := LcStockList.getMain;
          sql.add(' and (tb_stock_list_id =:tb_stock_list_id ) ');
        finally
          LcStockList.DisposeOf;
          LcStockSalesman.DisposeOf;
        end;
      End;

      if Trim(Parametro.UltimaAtualizacao) <> '' then
      Begin
        sql.add(' AND ( updated_at >:updated_at ) ');
        sql.add(' order by updated_at asc ');
      End
      else
      Begin
        if Trim(orderby)='' then orderby := 'id';
        sql.add(concat(' ORDER BY ',orderby,'  asc '));
      End;

      //sql.add(' limit 0,30 '); //somente em teste
      //Passagem de parametros
      parambyname('institution_id').AsInteger := Parametro.Movimento.Estabelecimento;

      if Parametro.Movimento.Terminal > 0 then
        parambyname('terminal').AsInteger := Parametro.Movimento.Terminal;

      //Com vendedor maior do que zero é para verificar qual estoque pegar
      if Parametro.Vendedor > 0 then
        parambyname('tb_stock_list_id').AsInteger := LcStock;

      if Trim(Parametro.UltimaAtualizacao) <> '' then
        parambyname('updated_at').AsString := Parametro.UltimaAtualizacao;

      Active := True;
      FetchAll;
      First;
      Lista.Clear;
      while not eof do
      Begin
        LITem := TStockStatement.Create;
        get(Lc_Qry,LITem);
        Lista.add(LITem);
        next;
      end;
    end;
  Finally
    FinalizaQuery(Lc_Qry);
  End;
end;

function TControllerStockStatement.getNext: Integer;
var
  Lc_qry: TFDQuery;
begin
  Try
    Lc_qry := createQuery;
    with Lc_qry do
    Begin
      sql.Clear;
      sql.Add(concat(
                'SELECT MAX(id) id ',
                'FROM tb_stock_statement ',
                'where ( tb_institution_id =:tb_institution_id ) ',
                'and terminal = :terminal '
      ));
      ParamByName('tb_institution_id').AsInteger := Registro.Estabelecimento;
      ParamByName('terminal').AsInteger := Registro.Terminal;
      Active := True;
      First;
      result := StrToIntDef(FieldByName('id').AsString,0) + 1;
    End;
  Finally
    FinalizaQuery(Lc_Qry);
  End;

end;

function TControllerStockStatement.insert: Boolean;
begin
  Try
    if Registro.Codigo = 0 then
      Registro.Codigo := getNext;
    InsertObj(Registro);
    Result := True;
  Except
    Result := False
  End;

end;

function TControllerStockStatement.save: boolean;
begin
  Try
//    Registro.Codigo := getIDbyControls;
//    if ( Registro.Codigo = 0) then
//      Insert
//    else
//      Update;
    SaveObj(Registro);
    Result := True;
  Except
    Result := False
  End;
end;

function TControllerStockStatement.saveDataObjeto(
  DObj: TObjStockStatement): Boolean;
begin
  self.Registro := DObj.Movimento;
  self.save;
end;


procedure TControllerStockStatement.setParametro(par: String);
begin
  try
    Parametro := TPrmStockStatement.Create;
    Parametro:= TJson.JsonToObject<TPrmStockStatement>(par);
  //Tratar Data
    Parametro.UltimaAtualizacao := dataMysql(Parametro.UltimaAtualizacao);
  Except
    Parametro.UltimaAtualizacao := '1900-01-01 01:00:00'
  end;
end;

function TControllerStockStatement.Update: boolean;
begin
  Try
    updateObj(Registro);
    Result := True;
  Except
    Result := False
  End;
end;

end.

