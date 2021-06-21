unit ctrl_mob_stock_statement;

interface
uses System.Classes, System.SysUtils,
     FireDAC.Comp.Client, FireDAC.Stan.Param,TypesListCollection,
     ctrl_mob_base,tblStockStatement,objStockStatement,TypesCollection,
     prm_stock_statement;

Type
  TCtrlMobStockStatement = Class(TCtrlMobBAse)
  private
    function getIDbyControls:Integer;
    function getIDbyControlsProducts:Integer;
  protected
    procedure setStrutureUpdate;Override;
  public
     Registro : TStockStatement;
    Lista : TListStockStatement;
    Parametro : TPrmStockStatement;
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure setParametro(par:String);
    procedure createTable;
    procedure createTriggerIn;
    procedure createTriggerOut;
    procedure createTriggerInUP;
    procedure createTriggerOutUP;
    procedure assign(ObjOri: TStockStatement);
    function Insert:boolean;
    function Update:boolean;
    function save:boolean;
    function delete:Boolean;
    function deletebyOrder:Boolean;
    function saveDataObjeto(DObj : TObjStockStatement): Boolean;
    procedure getlist;
    function recontar:Real;
  End;
implementation

{ TCtrlMobStockStatement }

uses MainModule, UnFunctions;

procedure TCtrlMobStockStatement.assign(ObjOri: TStockStatement);
begin
  _assign(ObjOri,Registro);
end;

constructor TCtrlMobStockStatement.Create(AOwner: TComponent);
begin
  inherited;
  Registro := TStockStatement.Create;
  Lista := TListStockStatement.Create;
  createTable;
  createTriggerIN;
  createTriggerOUT;
  createTriggerInUP;
  createTriggerOutUP;
  setStrutureUpdate;
  Parametro := TPrmStockStatement.Create;
end;

function TCtrlMobStockStatement.deletebyOrder: Boolean;
begin

end;

procedure TCtrlMobStockStatement.createTable;
begin
  execcmd(concat(
                'CREATE TABLE if not exists tb_stock_statement ( ',
                '  tb_institution_id int(11) NOT NULL, ',
                '  terminal int(11) NOT NULL, ',
                '  tb_order_id int(11) NOT NULL , ',
                '  tb_order_item_id int(11) NOT NULL , ',
                '  tb_stock_list_id int(11) NOT NULL , ',
                '  local varchar(25) , ',
                '  kind varchar(25) , ',
                '  dt_record date , ',
                '  direction varchar(1), ',
                '  tb_merchandise_id int(11), ',
                '  quantity decimal(10,7), ',
                '  operation varchar(10), ',
                '  created_at datetime, ',
                '  updated_at datetime ) '
      ));
end;

procedure TCtrlMobStockStatement.createTriggerIn;
begin
  execcmd(concat(
                'CREATE TRIGGER IF NOT EXISTS tg_stock_statement_in    AFTER INSERT ',
                'ON tb_stock_statement ',
                '  WHEN ( NEW.direction = ''E'' ) ',
                '  BEGIN ',
                '    UPDATE tb_stock_balance SET ',
                '      quantity = quantity + NEW.quantity ',
                '    WHERE ( tb_merchandise_id = NEW.tb_merchandise_id ) ',
                '    AND  ( tb_institution_id = NEW.tb_institution_id ) ',
                '    AND ( tb_stock_list_id = NEW.tb_stock_list_id); ',
                '  END '
      ));
end;

procedure TCtrlMobStockStatement.createTriggerInUP;
begin
  execcmd(concat(
                'CREATE TRIGGER IF NOT EXISTS  tg_stock_statement_in_up    BEFORE UPDATE ',
                'ON tb_stock_statement ',
                '  WHEN ( NEW.direction = ''E'' ) ',
                '  BEGIN ',
                '    UPDATE tb_stock_balance SET ',
                '      quantity = quantity - OLD.quantity ',
                '    WHERE ( tb_merchandise_id = NEW.tb_merchandise_id ) ',
                '    AND  ( tb_institution_id = NEW.tb_institution_id ) ',
                '    AND ( tb_stock_list_id = NEW.tb_stock_list_id); ',
                '    UPDATE tb_stock_balance SET ',
                '      quantity = quantity + NEW.quantity ',
                '    WHERE ( tb_merchandise_id = NEW.tb_merchandise_id ) ',
                '    AND  ( tb_institution_id = NEW.tb_institution_id ) ',
                '    AND ( tb_stock_list_id = NEW.tb_stock_list_id); ',
                '  END '
      ));
end;

procedure TCtrlMobStockStatement.createTriggerOut;
begin
  execcmd(concat(
                'CREATE TRIGGER IF NOT EXISTS tg_stock_statement_out    AFTER INSERT ',
                'ON tb_stock_statement ',
                '  WHEN ( NEW.direction = ''S'' ) ',
                '  BEGIN ',
                '    UPDATE tb_stock_balance SET ',
                '      quantity = quantity - NEW.quantity ',
                '    WHERE ( tb_merchandise_id = NEW.tb_merchandise_id ) ',
                '    AND  ( tb_institution_id = NEW.tb_institution_id ) ',
                '    AND ( tb_stock_list_id = NEW.tb_stock_list_id); ',
                '  END '
      ));
end;

procedure TCtrlMobStockStatement.createTriggerOutUP;
begin
  execcmd(concat(
                'CREATE TRIGGER IF NOT EXISTS  tg_stock_statement_out_up    BEFORE UPDATE ',
                'ON tb_stock_statement ',
                '  WHEN ( NEW.direction = ''S'' ) ',
                '  BEGIN ',
                '    UPDATE tb_stock_balance SET ',
                '      quantity = quantity + OLD.quantity ',
                '    WHERE ( tb_merchandise_id = NEW.tb_merchandise_id ) ',
                '    AND  ( tb_institution_id = NEW.tb_institution_id ) ',
                '    AND ( tb_stock_list_id = NEW.tb_stock_list_id); ',
                '    UPDATE tb_stock_balance SET ',
                '      quantity = quantity - NEW.quantity ',
                '    WHERE ( tb_merchandise_id = NEW.tb_merchandise_id ) ',
                '    AND  ( tb_institution_id = NEW.tb_institution_id ) ',
                '    AND ( tb_stock_list_id = NEW.tb_stock_list_id); ',
                '  END '
      ));
end;

function TCtrlMobStockStatement.delete: Boolean;
begin
  Try
    DeleteObj(Registro);
    Result := True;
  Except
    Result := False;
  End;

end;

destructor TCtrlMobStockStatement.Destroy;
begin
  {$IFDEF WIN32}
  Registro.DisposeOf;
  Lista.DisposeOf;
  Parametro.Destroy;
  inherited;

  {$ENDIF }
end;

function TCtrlMobStockStatement.getIDbyControls: Integer;
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
                ' AND  (tb_institution_id =:tb_institution_id) '
      ));
      ParamByName('kind').asstring              := Registro.Tipo;
      ParamByName('tb_order_id').asInteger      := Registro.Ordem;
      ParamByName('tb_order_item_id').asInteger := Registro.OrdemItem;
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

function TCtrlMobStockStatement.getIDbyControlsProducts: Integer;
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
                ' AND ( tb_merchandise_id=:tb_merchandise_id ) ',
                ' AND  (tb_institution_id =:tb_institution_id) '
      ));
      ParamByName('kind').asstring                := Registro.Tipo;
      ParamByName('tb_order_id').asInteger        := Registro.Ordem;
      ParamByName('tb_order_item_id').asInteger   := Registro.OrdemItem;
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

procedure TCtrlMobStockStatement.getlist;
var
  Lc_Qry : TFDQuery;
  LITem : TStockStatement;
  LcAux : String;
begin
  Try
    Lc_Qry := createQuery;
    with Lc_Qry do
    Begin
      sql.add(concat('SELECT * ',
                     'FROM tb_stock_statement ',
                     'WHERE ( tb_institution_id =:institution_id ) ',
                     ' and ( local <>:local ) '
      ));

      //Incrementa SQL
      //Verifica de quais dispositivos serão feitos os downloads

      LcAux := '';//getDispositivos;
      if Trim( Parametro.UltimaAtualizacao ) <> '' then
      Begin
        sql.add(' AND ( updated_at >:updated_at ) ');
        sql.add(' order by updated_at asc ');
      End
      else
      Begin
        sql.add(concat(' ORDER BY ',orderby,'  asc '));
      End;

      //sql.add(' limit 0,30 '); //somente em teste
      //Passagem de parametros
      parambyname('institution_id').AsInteger := Parametro.Movimento.Estabelecimento;
      parambyname('local').AsString := 'Desktop';
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

function TCtrlMobStockStatement.Insert: boolean;
begin
  Try
    if Registro.Codigo = 0 then
      Registro.Codigo := getNextByField(Registro,'id',Registro.Estabelecimento);
    InsertObj(Registro);
    Result := True;
  Except
    Result := False
  End;

end;

function TCtrlMobStockStatement.recontar: Real;
var
  Lc_Qry : TFDQuery;
  LcAux : String;
begin
  Try
    Lc_Qry := createQuery;
    with Lc_Qry do
    Begin
      sql.add(concat('SELECT * ',
                     'FROM tb_stock_statement ',
                     'WHERE ( tb_institution_id =:tb_institution_id ) ',
                     ' and ( tb_stock_list_id=:tb_stock_list_id) ',
                     ' and ( tb_merchandise_id =:tb_merchandise_id ) '
      ));

      //Incrementa SQL
      //Verifica de quais dispositivos serão feitos os downloads

      //sql.add(' limit 0,30 '); //somente em teste
      //Passagem de parametros
      parambyname('tb_institution_id').AsInteger  := Registro.Estabelecimento;
      parambyname('tb_stock_list_id').AsInteger   := Registro.Estoque;
      parambyname('tb_merchandise_id').AsInteger  := Registro.Mercadoria;
      Active := True;
      FetchAll;
      First;
      Result := 0;
      while not eof do
      Begin
        if (FieldByNAme('direction').AsString = 'E') then
          Result := Result  + FieldByNAme('quantity').AsFloat
        else
          Result := Result  + FieldByNAme('quantity').AsFloat;
        next;
      end;
    end;
  Finally
    FinalizaQuery(Lc_Qry);
  End;

end;

function TCtrlMobStockStatement.save: boolean;
begin
  Try
    if Registro.Codigo > 0 then
    Begin
      SaveObj(Registro);
    end
    else
    Begin
      Registro.Codigo := getIDbyControls;
      if ( Registro.Codigo = 0) then
        insert
      else
        update;
    End;
    Result := True;
  Except
    Result := False
  End;
end;

function TCtrlMobStockStatement.saveDataObjeto(
  DObj: TObjStockStatement): Boolean;
begin
  self.Registro := DObj.Movimento;
  self.save;
end;

procedure TCtrlMobStockStatement.setParametro(par: String);
begin

end;

procedure TCtrlMobStockStatement.setStrutureUpdate;
begin
  inherited;
  createColumnIfNotExists('tb_stock_statement','id','int(11)');
end;

function TCtrlMobStockStatement.Update: boolean;
begin
  Try
    updateObj(Registro);
    Result := True;
  Except
    Result := False
  End;
end;

end.
