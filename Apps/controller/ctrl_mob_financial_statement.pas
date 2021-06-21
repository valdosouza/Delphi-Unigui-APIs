unit ctrl_mob_financial_statement;


interface
uses System.Classes, System.SysUtils,ctrl_mob_base,TypesCollection, rest.json,
      tblFinancialPlans,FireDAC.Comp.Client,FireDAC.Stan.Param,prm_financial,
       System.Generics.Defaults, System.Generics.Collections,TypesListCollection,
  tblFinancialStatement, objFinancialStatement, list_spl_financial_statement;

Type
  TCtrlMobFinancialStatement =  class(TCtrlMobBase)

    procedure clear;
  private

  public
    Registro : TFinancialStatement;
    CollListaSpl : TCollSplFinancialStatement;
    Lista: TListFinancialStatement;
    Parametro : TPrmFinancial;
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure setParametro(par:String);
    procedure createTable;
    function save:boolean;
    procedure getAll;
    function insert:boolean;
    function getByKey:Boolean;
    function getBySettledCode:Boolean;
    function saveDataObjeto(DObj : TObjFinancialStatement):Boolean;
    function ValorContaRealizada(Fc_Tipo,Fc_Plano,Fc_Campo:String;Fc_DataIni,Fc_DataFim:TDate):Real;
    procedure getListSpl(palavra:TStringList;pdata:Tdate);
    function getLastPaymentByOrder(OrderID:Integer):Boolean;
    function getLastPayment(CustomerID:Integer):Boolean;
    function getlist:Boolean;
  End;

implementation

{ TCtrlMobFinancialStatement }

uses UnFunctions, MainModule;


procedure TCtrlMobFinancialStatement.clear;
begin
  clearObj(Registro);
end;

constructor TCtrlMobFinancialStatement.Create(AOwner: TComponent);
begin
  inherited;
  Registro := TFinancialStatement.Create;
  Lista := TListFinancialStatement.Create;
  CollListaSpl := TCollSplFinancialStatement.Create;
  Parametro := TPrmFinancial.create;
  createTable;
end;


procedure TCtrlMobFinancialStatement.createTable;
begin
  execcmd(concat(
                'CREATE TABLE if not exists tb_financial_statement ( ',
                '  id int(11) NOT NULL, ',
                '  tb_institution_id int(11) NOT NULL, ',
                '  terminal int(11) NOT NULL DEFAULT ''0'', ',
                '  tb_bank_account_id int(11) NOT NULL, ',
                '  dt_record date DEFAULT NULL, ',
                '  tb_bank_historic_id int(11) NOT NULL, ',
                '  credit_value decimal(10,2) DEFAULT NULL, ',
                '  debit_value decimal(10,2) DEFAULT NULL, ',
                '  manual_history varchar(100) DEFAULT NULL, ',
                '  kind char(1) DEFAULT NULL, ',
                '  settled_code int(11) DEFAULT NULL, ',
                '  tb_user_id int(11) DEFAULT NULL, ',
                '  Future char(1) DEFAULT NULL, ',
                '  dt_original date DEFAULT NULL, ',
                '  doc_reference char(30) DEFAULT NULL, ',
                '  conferred char(1) DEFAULT NULL, ',
                '  tb_payment_types_id int(11) DEFAULT NULL, ',
                '  tb_financial_plans_id_cre int(11) NOT NULL DEFAULT ''0'', ',
                '  tb_financial_plans_id_deb int(11) NOT NULL DEFAULT ''0'', ',
                '  created_at datetime DEFAULT NULL, ',
                '  updated_at datetime DEFAULT NULL) '
      ));
end;

destructor TCtrlMobFinancialStatement.Destroy;
begin
  inherited;
end;


function TCtrlMobFinancialStatement.insert: boolean;
begin
  Registro.Codigo := getNextByField(Registro,'id',Registro.Estabelecimento);
  try
    SaveObj(Registro);
    Result := true;
  except
    Result := False;
  end;
end;

function TCtrlMobFinancialStatement.save: boolean;
begin
  if Registro.Codigo = 0 then
  Begin
    Registro.Codigo := getNextByField(Registro,'id',Registro.Estabelecimento);
  End;
  try
    SaveObj(Registro);
    Result := true;
  except
    Result := False;
  end;
end;


function TCtrlMobFinancialStatement.saveDataObjeto(
  DObj: TObjFinancialStatement): Boolean;
begin
  try
    Registro := DObj.Movimento;
    SaveObj(Registro);
    Result := true;
  except
    Result := False;
  end;
end;

procedure TCtrlMobFinancialStatement.setParametro(par: String);
begin
  Parametro:= TJson.JsonToObject<TPrmFinancial>(par);
  //Tratar Data
  Parametro.UltimaAtualizacao := dataMysql(Parametro.UltimaAtualizacao);
end;

function TCtrlMobFinancialStatement.ValorContaRealizada(Fc_Tipo, Fc_Plano,
  Fc_Campo: String; Fc_DataIni, Fc_DataFim: TDate): Real;
Var
  Lc_Qry : TFDQuery;
begin
  try
    Lc_Qry := createQuery;
    with Lc_Qry do
    Begin
      Active := False;
      SQL.Clear;
      if ( Fc_Tipo = 'R' ) then
      Begin
        SQL.Add('SELECT SUM(' + Fc_Campo + ') total_value '+
                'FROM tb_financial_statement fs '+
                '   INNER JOIN tb_financial_plans fp '+
                '   ON  (fp.id = tb_financial_plans_id_cre) ');
      End
      else
      Begin
        SQL.Add('SELECT SUM(' + Fc_Campo + ') total_value '+
                'FROM tb_financial_statement fs '+
                '   INNER JOIN tb_financial_plans fp '+
                '   ON  (fp.id = tb_financial_plans_id_deb) ');
      End;

      SQL.Add('Where posit_level like  :posit_level AND (fp.dt_record :DATAINI AND :DATAFIM) ');

      ParamByName('posit_level').AsAnsiString := Fc_Plano +'%';
      ParamByName('DATAINI').AsDate := Fc_DataIni;
      ParamByName('DATAFIM').AsDate := Fc_DataFim;
      Active := True;
      Result := FieldByName('total_value').AsFloat;
    end;
  finally
    FinalizaQuery(Lc_Qry);
  end;
end;


procedure TCtrlMobFinancialStatement.getAll;
var
  Lc_Qry : TFDQuery;
  lFinancialSate: TFinancialStatement;
begin
  Try
    Lc_Qry := createQuery;
    with Lc_Qry do
    Begin
      sql.add('SELECT * '+
              'FROM tb_financial_statement '+
              'WHERE tb_institution_id =:tb_institution_id '
              );

      ParamByName('tb_institution_id').AsInteger := Registro.Estabelecimento;
      Active := True;
      FetchAll;
      First;
      Lista.Clear;
      while not eof do
      Begin
        lFinancialSate := TFinancialStatement.Create;
        get(Lc_Qry,lFinancialSate);
        Lista.add(lFinancialSate);
        next;
      end;
    end;
  Finally
    FinalizaQuery(Lc_Qry);
  End;
end;

function TCtrlMobFinancialStatement.getByKey: Boolean;
begin
  _getByKey(Registro);
end;

function TCtrlMobFinancialStatement.getBySettledCode: Boolean;
var
  Lc_Qry : TFDQuery;
  LITem : TFinancialStatement;
begin
  Try
    Lc_Qry := createQuery;
    with Lc_Qry do
    Begin
      sql.add(concat(
              'SELECT fs.* ',
              'FROM tb_financial_statement fs ',
              'WHERE ( fs.tb_institution_id =:tb_institution_id ) ',
              ' and  ( fs.terminal=:terminal ) ',
              ' and  ( fs.settled_code=:settled_code ) '
      ));
      ParamByName('tb_institution_id').AsInteger := Registro.Estabelecimento;
      ParamByName('terminal').AsInteger := Registro.Terminal;
      ParamByName('settled_code').AsInteger := Registro.CodigoQuitacao;
      Active := True;
      FetchAll;
      exist := RecordCount > 0;
      if exist then
        get(Lc_Qry,Registro);
    end;
  Finally
    FinalizaQuery(Lc_Qry);
  End;
end;

function TCtrlMobFinancialStatement.getLastPayment(CustomerID: Integer): Boolean;
Var
  Lc_Qry :TFDQuery;
  item : TListSplFinancialStatement;
  I:Integer;
  LcSqlStr : String;
Begin
  Try
    Lc_Qry := createQuery;
    with Lc_Qry do
    Begin
      sql.Clear;
      sql.Add(concat(
                'select fs.* ',
                'from tb_financial_statement fs ',
                '  inner join tb_financial_payment fp ',
                '    on (fp.settled_code = fs.settled_code) ',
                '  and (fp.tb_institution_id = fs.tb_institution_id ) ',
                '  and (fp.terminal = fs.terminal ) ',

                '  inner join tb_order_sale ors ',
                '  on (fp.tb_order_id = ors.id) ',
                '  and (fp.tb_institution_id = ors.tb_institution_id ) ',
                '  and (fp.terminal = ors.terminal ) ',

                'where ( fs.dt_record=:dt_record ) ',
                '  and ( fp.tb_institution_id =:tb_institution_id ) ',
                '  and ( ors.tb_customer_id =:tb_customer_id) '
          ));
      //Incrmenta o sql

      //Passagem parametros
      ParamByName('tb_institution_id').AsInteger  := Registro.Estabelecimento;
      ParamByName('dt_record').AsDate             := Registro.Data;
      ParamByName('tb_customer_id').AsInteger        := CustomerID;
      Active := True;
      FetchAll;
      exist := RecordCount > 0;
      if exist then
        get(Lc_Qry,Registro);
    End;
  Finally
    FinalizaQuery(Lc_Qry);
  End;


end;

function TCtrlMobFinancialStatement.getLastPaymentByOrder(
  OrderID: Integer): Boolean;
Var
  Lc_Qry :TFDQuery;
  item : TListSplFinancialStatement;
  I:Integer;
  LcSqlStr : String;
Begin
  Try
    Lc_Qry := createQuery;
    with Lc_Qry do
    Begin
      sql.Clear;
      sql.Add(concat(
                'select fs.* ',
                'from tb_financial_statement fs ',
                '  inner join tb_financial_payment fp ',
                '    on (fp.settled_code = fs.settled_code) ',
                '  and (fp.tb_institution_id = fs.tb_institution_id ) ',
                '  and (fp.terminal = fs.terminal ) ',
                'where ( fs.dt_record=:dt_record ) ',
                '  and ( fp.tb_order_id =:tb_order_id ) ',
                '  and ( fp.tb_institution_id =:tb_institution_id ) '
          ));
      //Incrmenta o sql

      //Passagem parametros
      ParamByName('tb_institution_id').AsInteger  := Registro.Estabelecimento;
      ParamByName('dt_record').AsDate             := Registro.Data;
      ParamByName('tb_order_id').AsInteger        := OrderID;
      Active := True;
      FetchAll;
      exist := RecordCount > 0;
      if exist then
        get(Lc_Qry,Registro);
    End;
  Finally
    FinalizaQuery(Lc_Qry);
  End;

end;

function TCtrlMobFinancialStatement.getlist: Boolean;
var
  Lc_Qry : TFDQuery;
  LITem : TFinancialStatement;
  LcAux : String;
begin
  Try
    Lc_Qry := createQuery;
    with Lc_Qry do
    Begin
      sql.add(concat('SELECT * ',
                     'FROM tb_financial_statement ',
                     'WHERE ( tb_institution_id =:institution_id ) '
      ));

      //Incrementa SQL
      //Verifica de quais dispositivos serão feitos os downloads

      LcAux := '';//getDispositivos;
      if Trim(Parametro.UltimaAtualizacao) <> '' then
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
      parambyname('institution_id').AsInteger := Registro.Estabelecimento;
      if Trim( Parametro.UltimaAtualizacao ) <> '' then
        parambyname('updated_at').AsString := Parametro.UltimaAtualizacao;
      Active := True;
      FetchAll;
      First;
      Lista.Clear;
      while not eof do
      Begin
        LITem := TFinancialStatement.Create;
        get(Lc_Qry,LITem);
        Lista.add(LITem);
        next;
      end;
    end;
  Finally
    FinalizaQuery(Lc_Qry);
  End;


end;

procedure TCtrlMobFinancialStatement.getListSpl(palavra: TStringList;pdata:Tdate);
Var
  Lc_Qry :TFDQuery;
  item : TListSplFinancialStatement;
  I:Integer;
  LcSqlStr : String;
Begin
  Try
    Lc_Qry := createQuery;
    with Lc_Qry do
    Begin
      sql.Clear;
      sql.Add(concat(
              ' select fs.id, fs.dt_record, fs.credit_value, ',
              ' fs.debit_value, fs.manual_history ',
              ' from tb_financial_statement fs ',
              'where ( fs.tb_institution_id =:tb_institution_id ) '
          ));
      //Incrmenta o sql
      if ( pdata > 0) then
        sql.Add(' and ( fs.dt_record=:dt_record ) ');

      LcSqlStr := ' and ( ';
      if palavra.count > 0 then
      Begin
        for I := 0 to palavra.count -1 do
        Begin
          if I = 0 then
            LcSqlStr := concat(LcSqlStr,' ( fs.manual_history like  :palavra',i.ToString,' ) ')
          else
            LcSqlStr := concat(LcSqlStr,' and ( fs.manual_history like  :palavra',i.ToString,' ) ');
        End;
        LcSqlStr := concat(LcSqlStr,')');
        sql.Add(LcSqlStr);
      End;

      if palavra.Count = 0 then   sql.Add('limit 0,50 ');

      //sql.Add(concat('Limit ', InttoStr( (Page * 20 ) - 20 ),',', InttoStr( (Page * 20 ) ) ));
      //Passagem parametros
      ParamByName('tb_institution_id').AsInteger  := registro.Estabelecimento;

      if pdata > 0 then
        ParamByName('dt_record').AsDate  := pdata;

      if palavra.count > 0 then
      Begin
        for I := 0 to palavra.count -1 do
          ParamByName(concat('palavra',i.ToString)).AsString := concat('%',palavra[I],'%');
      End;

      Active := True;
      FetchAll;
      First;
      Self.CollListaSpl.Clear;
      while not eof do
      Begin
        item := TListSplFinancialStatement.Create;
        item.Codigo       := FieldByName('id').AsInteger;
        item.Data         := FieldByName('dt_record').AsDateTime;
        item.ValorCredito := FieldByName('credit_value').AsFloat;
        item.ValorDebito  := FieldByName('debit_value').AsFloat;
        item.Historico    := FieldByName('manual_history').AsString;
        //add lista
        Self.CollListaSpl.Add( item );
        Next;
      End;
    End;
  Finally
    FinalizaQuery(Lc_Qry);
  End;
end;

end.

