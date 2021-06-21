unit ctrl_mob_stock_list;

interface

uses System.Classes,ctrl_mob_base, System.SysUtils,TypesCollection,
  FireDAC.Comp.Client, tblSTockList, ctrl_mob_stock_balance;

Type
  TCtrlMobStockList = class(TCtrlMobBase)
    private

    public
      Registro : TStockList;
      Balance : TCtrlMobStockBalance;
      Lista : TListStockList;
      constructor Create(AOwner: TComponent); override;
      destructor Destroy; override;
      procedure createTable;
      function save:Boolean;
      procedure assign(ObjOri : TStockList);
      function getMain:Integer;
      procedure getList;
  end;

implementation

uses MainModule;


procedure TCtrlMobStockList.assign(ObjOri: TStockList);
begin
  _assign(ObjOri,Registro);
end;

constructor TCtrlMobStockList.Create(AOwner: TComponent);
begin
  Registro := TSTockList.create;
  Balance := TCtrlMobStockBalance.Create(Self);
  Lista := TListStockList.create;
  createTable;
end;

procedure TCtrlMobStockList.createTable;
begin
  execcmd(concat(
                'CREATE TABLE if not exists tb_stock_list ( ',
                '  id int(11) , ',
                '  tb_institution_id int(11) , ',
                '  description varchar(45) , ',
                '  kind char(1) , ',
                '  created_at datetime , ',
                '  updated_at datetime ) ; '
      ));
end;

destructor TCtrlMobStockList.Destroy;
begin
  {$IFDEF WIN32}
  Registro.DisposeOf;
  Balance.Destroy;
  Lista.Destroy;
  {$ENDIF }
end;

procedure TCtrlMobStockList.getList;
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

      ParamByName('tb_institution_id').AsInteger := Registro.Estabelecimento;
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

function TCtrlMobStockList.getMain: Integer;
var
  Lc_Qry : TFDQuery;
begin
  Try
    Lc_Qry := createQuery;
    Lc_Qry.sql.add(concat('SELECT * ',
                     'FROM tb_stock_list ',
                     'where kind = ''S'' ',
                     ' and (tb_institution_id=:tb_institution_id) '
      ));
    Lc_Qry.parambyNAme('tb_institution_id').AsInteger := Registro.Estabelecimento;
    Lc_Qry.Active := True;
    Lc_Qry.FetchAll;
    Lc_Qry.First;
    exist := Lc_Qry.RecordCount > 0;
    if exist then
      REsult := Lc_Qry.FieldByName('id').asinteger
    else
      REsult := 1;
  Finally
    FinalizaQuery(Lc_Qry);
  End;
end;

function TCtrlMobStockList.save: Boolean;
begin
  try
    SaveObj(Registro);
    Result := true;
  except
    Result := False;
  end;
end;

end.

