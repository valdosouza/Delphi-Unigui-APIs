unit ctrl_mob_stock_balance;

interface

uses System.Classes, FireDAC.Comp.Client,TypesCollection,
  System.SysUtils, ctrl_mob_base,tblStockBalance, ctrl_mob_stock_statement;

Type
  TCtrlMobStockBalance = class(TCtrlMobBase)
    private

    public
      Registro : TStockBalance;
      Lista : TListStockBalance;
      Movimento : TCtrlMobStockStatement;
      constructor Create(AOwner: TComponent); override;
      destructor Destroy; override;
      procedure createTable;
      function deleteAll:Boolean;
      function save:Boolean;
      function saveIfnotExist:Boolean;
      function getByKey:boolean;
      function getlist:Boolean;
      procedure assign(ObjOri : TStockBalance);
      procedure Recontar;
  end;

implementation


uses MainModule, ctrl_mob_stock_list;


procedure TCtrlMobStockBalance.assign(ObjOri: TStockBalance);
begin
  _assign(ObjOri,Registro);
end;

constructor TCtrlMobStockBalance.Create(AOwner: TComponent);
begin
  Registro := TStockBalance.create;
  Movimento := TCtrlMobStockStatement.Create(Self);
  Lista := TListStockBalance.Create;
  createTable;
  setStrutureUpdate;
end;

procedure TCtrlMobStockBalance.createTable;
begin
  execcmd(concat(
                'CREATE TABLE if not exists tb_stock_balance ( ',
                '  tb_institution_id int(11) , ',
                '  tb_stock_list_id int(11) , ',
                '  tb_merchandise_id int(11) , ',
                '  quantity decimal(10,4) , ',
                '  minimum decimal(10,4) , ',
                '  created_at datetime , ',
                '  updated_at datetime ) ; '
      ));
end;

function TCtrlMobStockBalance.deleteAll: Boolean;
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
                'delete from tb_stock_balance '
      ));
      ExecSQL;
    End;
  Finally
    FinalizaQuery(Lc_Qry);
  End;
end;

destructor TCtrlMobStockBalance.Destroy;
begin
  {$IFDEF WIN32}
  Registro.DisposeOf;
  Movimento.destroy;
  Lista.destroy;
  {$ENDIF }
end;

function TCtrlMobStockBalance.getByKey: boolean;
begin
  _getByKey(Registro);
end;

function TCtrlMobStockBalance.getlist: Boolean;
var
  Lc_Qry : TFDQuery;
  LITem : TStockBalance;
  LcAux : String;
begin
  Try
    Lc_Qry := createQuery;
    with Lc_Qry do
    Begin
      sql.add(concat('SELECT * ',
                     'FROM tb_stock_balance ',
                     'WHERE ( tb_institution_id =:institution_id ) ',
                     ' and ( tb_stock_list_id=:tb_stock_list_id ) '
      ));

      //Incrementa SQL
      //Verifica de quais dispositivos serão feitos os downloads


      //sql.add(' limit 0,30 '); //somente em teste
      //Passagem de parametros
      parambyname('institution_id').AsInteger   := Registro.Estabelecimento;
      parambyname('tb_stock_list_id').AsInteger := Registro.Tabela;
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
  End;
end;

procedure TCtrlMobStockBalance.Recontar;
Var
  I : Integer;
begin
  getlist;
  for I := 0 to Lista.Count-1 do
  Begin
    ClonarObj(Lista[I],Registro);
    Movimento.Registro.Estabelecimento := Registro.Estabelecimento;
    Movimento.Registro.Estoque         := Registro.Tabela;
    Movimento.Registro.Mercadoria      := Registro.Mercadoria;
    Registro.Quantidade := Movimento.recontar;
    Movimento.Update;
  End;
end;

function TCtrlMobStockBalance.save: Boolean;
begin
  try
    SaveObj(Registro);
    Result := true;
  except
    Result := False;
  end;

end;

function TCtrlMobStockBalance.saveIfnotExist: Boolean;
VAr
  LcStockList : TCtrlMobStockList;
  I : Integer;
begin
  TRy
    LcStockList := TCtrlMobStockList.Create(Self);
    LcStockList.Registro.Estabelecimento := Self.Registro.Estabelecimento;
    LcStockList.getList;
    for I := 0 to LcStockList.Lista.Count-1 do
    Begin
      Registro.Tabela := LcStockList.Lista[I].Codigo;
      getByKey;
      if not exist then
      BEgin
        Registro.Quantidade := 0;
        Registro.Minimo     := 0;
        insertObj(Registro);
      End;
    End;
  Finally
    //LcStockList.DisposeOf; deu erro de invalid/Memoria
  End;
end;

end.
