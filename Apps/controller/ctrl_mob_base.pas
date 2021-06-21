unit ctrl_mob_base;

interface

uses System.Classes,System.SysUtils, FireDAC.Comp.Client, FireDAC.Stan.Param,
    System.Generics.Collections,tblCountry,tblState,tblCity, uDataCM, uAuthCM,
  tblCrashlytics,REST.Json,System.Json,tblCustomer,ObjEntityFiscal,
  tblAddress, tblPhone,GenericDao;

Type

  TCtrlMobBase = Class(TComponent)

  private


  protected
//    FDataCM: TDataCM;
//    FAuthCM: TAuthCM;
//    procedure setFAuthCM(const Value: TAuthCM);
//    procedure setFDataCM(const Value: TDataCM);

    function clearObj<T: class>(Obj: T):Boolean;
    function insertObj<T: class>(Obj: T):Boolean;
    function updateObj<T: class>(Obj: T):Boolean;
    function deleteObj<T: class>(Obj: T):Boolean;
    procedure SaveObj<T: class>(Obj: T);
    function getLastInsert<T: class>(Obj: T):Integer;
    function getNextByField<T: class>(Obj: T; Field: String;Intitution: Integer): Integer;
    function getByField(strTable:String;field:String; Content:String):TFDQuery;
    procedure _assign<T: class>(ObjOri: T;ObjClone: T);
    procedure _getByKey<T: class>(Obj: T);

    function existObj<T: class>(Obj: T):Boolean;
    Procedure geralog(origem,msg : string);Virtual;
    procedure get<T: class>(Qry: TFdQuery;Obj: T);
    function createQuery(): TFDQuery;Virtual;
    function dataMysql(data:String) : String;
    procedure FinalizaQuery(Qry:TFDQuery);Virtual;
    function execcmd(sql:STring):Boolean;

    function createColumnIfNotExists(tbl,col,columnType:String):Boolean;
    procedure setStrutureUpdate;Virtual;
  public
    exist : Boolean;
    orderby : String;
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    function GeneratePrimaryKey:string;
    function setOrderBy:String;
    Function ConverteDataMysql(Data:TDateTime) : String;
    procedure ClonarObj<T: class>(ObjOri: T;ObjClone: T);
    procedure clonarObjEntityFiscal(Source,Destiny:TObjEntityFiscal);
    procedure assign<T: class>(ObjOri: T;ObjClone: T);
  End;

implementation

{ TCtrlMobBase }

uses MainModule, UnFunctions,ctrl_mob_stock_statement;


function TCtrlMobBase.clearObj<T>(Obj: T): Boolean;
begin
  Try
    TGenericDAO._Clear(Obj);
    Result := True;
  except
    Result := False;
  End;

end;

procedure TCtrlMobBase.ClonarObj<T>(ObjOri, ObjClone: T);
begin
  TGenericDAO._assign(ObjOri,ObjClone);
end;

procedure TCtrlMobBase.clonarObjEntityFiscal(Source, Destiny: TObjEntityFiscal);
Var
  I : Integer;
  Lc_Aux:Integer;
  LcEndereco : TAddress;
  LcFone : TPhone;
begin
  if (Source.Fisica <> nil) then
    _assign(Source.Fisica,    Destiny.Fisica );
  if (Source.Juridica <> nil) then
    _assign(Source.Juridica,  Destiny.Juridica);
  if (Source.Entidade.Entidade <> nil) then
    _assign(Source.Entidade.Entidade,  Destiny.Entidade.Entidade);

  //Endereço
  for I := 0 to Source.Entidade.ListaEndereco.Count -1 do
  Begin
    if assigned(Source.Entidade.ListaEndereco[I]) then
    Begin
      LcEndereco := TAddress.Create;
      _assign( Source.Entidade.ListaEndereco[I], LcEndereco);
      Destiny.Entidade.ListaEndereco.Add(LcEndereco);
    End;
  End;
  //Telefone
  for I := 0 to Source.Entidade.ListaFones.Count -1 do
  Begin
    if (Source.Entidade.ListaFones[I]<>nil) then
    Begin
      LcFone := TPhone.Create;
      _assign( Source.Entidade.ListaFones[I], LcFone);
      Destiny.Entidade.ListaFones.Add(LcFone);
    End;
  End;
  if (Source.Entidade.Email <> nil) then
    _assign(Source.Entidade.Email, Destiny.Entidade.Email);


end;

function TCtrlMobBase.ConverteDataMysql(Data: TDateTime): String;
Var
  Lc_Dia,Lc_Mes, Lc_Ano, Lc_Hora : String;
  Lc_data :String;

begin
  Result := '1900-01-01 01:00:00';
  Lc_data := DateTimeToStr(Data);
  if trim(Lc_data) <> '' then
  Begin
    if (Pos('-',Lc_data) > 0) then
    Begin
       Result := Lc_data ;
    End
    else
    if (Pos('/',Lc_data) > 0) then
    Begin
      //01/01/2016 00:00:01
      Lc_Dia  := Copy(Lc_data,1,2);
      Lc_Mes  := Copy(Lc_data,4,2);
      Lc_Ano  := Copy(Lc_data,7,4);
      Lc_Hora := Copy(Lc_data,12,8);
      Result := concat(Lc_Ano,'-',Lc_Mes,'-',Lc_Dia,' ', Lc_Hora);
    End
  End;

end;

constructor TCtrlMobBase.Create(AOwner: TComponent);
begin
  inherited;
end;

function TCtrlMobBase.createColumnIfNotExists(tbl, col,columnType: String): Boolean;
Var
  Lc_Qry : TFDQuery;
  I : Integer;
BEgin
  TRy
    Result := False;
    Lc_Qry := createQuery;
    with Lc_Qry do
    BEgin
      sql.Add(concat('select * from ',tbl,' limit 1;'));
      Active := True;
      FetchAll;
      for I := 0 to Fields.Count - 1 do
      Begin
        if ( col = Fields[I].FieldName ) then
        Begin
          Result := True;
          Break;
        end;
      end;
      if not Result then
      Begin
        Active := False;
        SQL.Clear;
        //             'alter table tb_stock_statement add column id int(11);
        sql.Add(concat('alter table ',tbl,' add column ',col,' ',columnType, '; '));
        ExecSQL;
      End;
    end;
  Finally
    FinalizaQuery(Lc_Qry);
  end;

end;



function TCtrlMobBase.createQuery: TFDQuery;

begin
  try
    Result := TFDQuery.Create(Self);
    Result.UpdateOptions.RequestLive := False;
    Result.Connection := getConnection;
  Except
    on E: Exception do
      geralog('TCtrlMobBase.createQuery',E.Message);
  end;

end;

function TCtrlMobBase.dataMysql(data: String): String;
Var
  Lc_Dia,Lc_Mes, Lc_Ano, Lc_Hora : String;
begin
  Result := '1900-01-01 01:00:00';
  if trim(data) <> '' then
  Begin
    if (Pos('-',data) > 0) then
    Begin
       Result := Data ;
    End
    else
    if (Pos('/',data) > 0) then
    Begin
      //01/01/2016 00:00:01
      Lc_Dia  := Copy(data,1,2);
      Lc_Mes  := Copy(data,4,2);
      Lc_Ano  := Copy(data,7,4);
      Lc_Hora := Copy(data,12,8);
      Result := concat(Lc_Ano,'-',Lc_Mes,'-',Lc_Dia,' ', Lc_Hora);
    End
  End;

end;

function TCtrlMobBase.deleteObj<T>(Obj: T): Boolean;
Var
  LcSql : String;
  Lc_Qry :TFDQuery;
begin
  Try
    LcSql := TGenericDAO._Delete(Obj) ;
    Lc_Qry := createQuery;
    try
      Lc_Qry.SQL.Add(LcSql);
      Lc_Qry.ExecSQL;
    Except
      on E: Exception do
        geralog('Base - deleteObj - ',concat(E.Message,'SQL: ',LcSql) );
    end;
  Finally
    FinalizaQuery(Lc_Qry);
  End;
end;

destructor TCtrlMobBase.Destroy;
begin
  inherited;
end;

function TCtrlMobBase.execcmd(sql: STring): Boolean;
Var
  Lc_Qry : TFDQuery;
begin
  try
    try
      Lc_Qry := createQuery;
      Lc_Qry.SQL.Add( sql );
      Lc_Qry.Prepare;
      Lc_Qry.ExecSQL;
    Except
      on E: Exception do
        geralog('TBaseController.execcmd',concat(E.Message,' - SQL: ',Lc_Qry.SQL.text) );
    end;
  finally
    Lc_Qry.Unprepare;
    FinalizaQuery(Lc_Qry);
  end;
end;

function TCtrlMobBase.existObj<T>(Obj: T): Boolean;
Var
  Lc_Qry : TFDQuery;
begin
  try
    try
      Lc_Qry := createQuery;
      Lc_Qry.SQL.Clear;
      Lc_Qry.SQL.Add (TGenericDAO._Select(Obj,''));
      Lc_Qry.Prepare;
      Lc_Qry.Active := True;
      Lc_Qry.FetchAll;
      result := ( Lc_Qry.RecordCount > 0 );
    Except
      on E: Exception do
        geralog('Base - existObj - ',concat(E.Message,' - SQL: ',Lc_Qry.SQL.text) );
    end;
  finally
    Lc_Qry.Unprepare;
    FinalizaQuery(Lc_Qry);
  end;


end;

procedure TCtrlMobBase.FinalizaQuery(Qry: TFDQuery);
begin
  Qry.Close;
  //Qry.Connection.Close;
  //Qry.Connection.DisposeOf;
  Qry.DisposeOf;
  Qry := nil;
end;

function TCtrlMobBase.GeneratePrimaryKey: string;
begin
  Result := TGUID.Empty.NewGuid.ToString;
  Result := RemoveCaracterInformado(Result,['}','{','-']);
end;

procedure TCtrlMobBase.geralog(origem, msg: string);
begin

end;

procedure TCtrlMobBase.get<T>(Qry: TFdQuery; Obj: T);
begin
  clearObj(Obj);
  TGenericDAO._get(Qry,Obj);
end;

function TCtrlMobBase.getByField(strTable, field, Content: String): TFDQuery;
begin
  Result := createQuery;
  with Result do
  Begin
    Active := False;
    SQL.Clear;
    SQL.Add(Format('Select * from %s where ( %s = :%s ) ',[strTable, Field, Field]));
    ParamByName(Field).Value := Content;
    active := True;
  End;
end;


function TCtrlMobBase.getLastInsert<T>(Obj: T): Integer;
Var
  Lc_Qry : TFDQuery;
begin
  try
    try
      Lc_Qry := createQuery;
      Lc_Qry.SQL.Clear;
      Lc_Qry.SQL.Add ( TGenericDAO._getLastInsert( Obj ) );
      Lc_Qry.Prepare;
      Lc_Qry.Active := True;
      Result := StrToIntDef(Lc_Qry.FieldByName('id').AsString,0);
    Except on E: Exception do
        geralog('Base - getLastInsert - ',concat(E.Message,'SQL: ',Lc_Qry.SQL.text) );
    end;
  finally
    Lc_Qry.Unprepare;
    FinalizaQuery(Lc_Qry);
  end;
end;

function TCtrlMobBase.getNextByField<T>(Obj: T; Field: String;
  Intitution: Integer): Integer;
Var
  Lc_Qry : TFDQuery;
begin
  try
    try
      Lc_Qry := createQuery;
      Lc_Qry.SQL.Clear;
      Lc_Qry.SQL.Add ( TGenericDAO._getNextByField( Obj,Field, Intitution  ) );
      Lc_Qry.Prepare;
      Lc_Qry.Active := True;
      Result := StrToIntDef( Lc_Qry.FieldByName(Field).AsString,0) + 1;
    Except
      on E: Exception do
        geralog('Base - getNextByField - ',concat(E.Message,'SQL: ',Lc_Qry.SQL.text) );
    end;
  finally
    Lc_Qry.Unprepare;
    FinalizaQuery(Lc_Qry);
  end;
end;

function TCtrlMobBase.insertObj<T>(Obj: T): Boolean;
Var
  LcSql : String;
  Lc_Qry :TFDQuery;
begin
  Try
    LcSql := TGenericDAO._Insert(Obj);
    Lc_Qry := createQuery;
    try
      Lc_Qry.SQL.Add(LcSql);
      Lc_Qry.ExecSQL;
    Except
      on E: Exception do
        geralog('Base - insertObj - ',concat(E.Message,'SQL: ',LcSql) );
    end;
  Finally
    FinalizaQuery(Lc_Qry);
  End;


end;

procedure TCtrlMobBase.SaveObj<T>(Obj: T);
begin
  if existObj(Obj)  then
    updateObj(Obj)
  else
    InsertObj(Obj);
end;

function TCtrlMobBase.setOrderBy: String;
begin
  if Trim(orderby)<>'' then
    Result := concat(' ORDER BY ', orderby,' asc  ')
end;

procedure TCtrlMobBase.setStrutureUpdate;
begin

end;


function TCtrlMobBase.updateObj<T>(Obj: T): Boolean;
Var
  LcSql : String;
  Lc_Qry :TFDQuery;
begin
  Try
    Lc_Qry := createQuery;
    try
      LcSql := TGenericDAO._Update(Obj);
      Lc_Qry.SQL.Add(LcSql);
      Lc_Qry.ExecSQL;
    Except
      on E: Exception do
      geralog('Base - updateObj - ',concat(E.Message,'SQL: ',LcSql) );
    end;
  Finally
    FinalizaQuery(Lc_Qry);
  End;


end;

procedure TCtrlMobBase._assign<T>(ObjOri, ObjClone: T);
begin
  TGenericDAO._assign(ObjOri,ObjClone);
end;

procedure TCtrlMobBase._getByKey<T>(Obj: T);
VAr
  Lc_Qry : TFdQuery;
begin
  Try
    try
      Lc_Qry := createQuery;
      Lc_Qry.SQL.Clear;
      Lc_Qry.SQL.Add (TGenericDAO._Select(Obj,''));
      Lc_Qry.Prepare;
      Lc_Qry.Active := True;
      Lc_Qry.FetchAll;
      exist  := ( Lc_Qry.RecordCount > 0 );
      if exist then TGenericDAO._get(Lc_Qry,Obj) ;
    Except
      on E: Exception do
      geralog('Base - _getByKey',concat(E.Message,' - SQL: ',Lc_Qry.SQL.text) );
    end;
  Finally
    Lc_Qry.Unprepare;
    FinalizaQuery(Lc_Qry);
  End;
end;


procedure TCtrlMobBase.assign<T>(ObjOri, ObjClone: T);
begin
  _assign(ObjOri,ObjClone);
end;

end.
