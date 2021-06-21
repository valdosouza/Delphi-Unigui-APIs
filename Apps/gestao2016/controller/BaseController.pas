unit BaseController;

interface

uses System.Classes,GenericDao, FireDAC.Comp.Client, System.SysUtils,
  UnFunctions;

Type
  TBaseController = Class(TComponent)
  private

  protected

    function clearObj<T: class>(Obj: T):Boolean;
    function insertObj<T: class>(Obj: T):Boolean;
    function updateObj<T: class>(Obj: T):Boolean;
    function deleteObj<T: class>(Obj: T):Boolean;
    procedure SaveObj<T: class>(Obj: T);
    procedure replaceObj<T: class>(Obj: T);
    function getLastInsert<T: class>(Obj: T):Integer;
    function getNextByField<T: class>(Obj: T; Field: String;Intitution: Integer): Integer;
    function getByField(strTable:String;field:String; Content:String):TFDQuery;
    procedure _getByKey<T: class>(Obj: T);
    function existObj<T: class>(Obj: T):Boolean;


    procedure get<T: class>(Qry: TFDQuery;Obj: T);
  public
    exist : Boolean;
    update : Boolean;
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;

    Function GeraQuery():TFDQuery;
    function Generator(pc_Gen: string): Integer;
    procedure SetGenertor(pGen,pCampo,pTabela: string);


    function TimeValid(value:String):Boolean;
    procedure setGenerator(Generator,Sequencia:String);
    Procedure geralog(origem,msg : string);Virtual;
  published
    { Published declarations }
    //Informa o banco de dados


  End;

implementation

{ TBaseController }

uses uSC;


function TBaseController.existObj<T>(Obj: T): Boolean;
Var
  LCQry : TFDQuery;
begin
  try
    try
      LCQry := GeraQuery;
      LCQry.SQL.Clear;
      LCQry.SQL.Add (TGenericDAO._Select(Obj,''));
      LCQry.Active := True;
      LCQry.FetchAll;
      result := ( LCQry.RecordCount > 0 );
    Except
      on E: Exception do
        geralog('Base - existObj - ',E.Message);
    end;
  finally
    LCQry.Close;
    LCQry.DisposeOf;
  end;
end;


function TBaseController.deleteObj<T>(Obj: T): Boolean;
Var
  LCQry : TFDQuery;
begin
  try
    try
      LCQry := GeraQuery;
      with LCQry do
      Begin
        SQL.Clear;
        SQL.Add ( TGenericDAO._Delete(Obj) );
        ExecSQL;
      End;
    Except
     on E: Exception do
      geralog('Base - ',E.Message);
    end;
  finally
    LCQry.Close;
    LCQry.DisposeOf;
  end;
end;


function TBaseController.clearObj<T>(Obj: T): Boolean;
begin
  Try
    TGenericDAO._Clear(Obj);
    Result := True;
  except
    Result := False;
  End;
end;

constructor TBaseController.Create(AOwner: TComponent);
begin
  inherited;
  exist := False;
  update := False;
end;

destructor TBaseController.Destroy;
begin
  inherited;
end;

Function TBaseController.GeraQuery():TFDQuery;
begin
  Result := TFDQuery.Create(Self);
  With Result do
  Begin
    Connection := getConnection;
    Active := False;
    sql.Clear;
  End;
end;


function TBaseController.getByField(strTable, field, Content: String): TFDQuery;
var
  vSelect: string;
begin
  Result := GeraQuery;
  with Result do
  begin
    Active := False;
    SQL.Clear;
    vSelect := Format('Select * from %s where ( %s = :%s ) ',[strTable, Field, Field]);
    SQL.Add(vSelect);
    ParamByName(Field).Value := Content;
    active := True;
    FetchAll;
    exist := (RecordCount > 0);
  end;
end;

function TBaseController.getLastInsert<T>(Obj: T): Integer;
Var
  LCQry : TFDQuery;
begin
  try
    try
      LCQry := GeraQuery;
      with LCQry do
      Begin
        SQL.Clear;
        SQL.Add ( TGenericDAO._getLastInsert( Obj ) );
        Active := True;
      End;
      Result := StrToIntDef(LCQry.FieldByName('id').AsString,0);
    Except
      on E: Exception do
      geralog('Base - ',E.Message);
    end;
  finally
    LCQry.Close;
    LCQry.DisposeOf;
  end;
end;

function TBaseController.getNextByField<T>(Obj: T; Field: String;
  Intitution: Integer): Integer;
Var
  LCQry : TFDQuery;
begin
  try
    try
      LCQry := GeraQuery;
      LCQry.SQL.Clear;
      LCQry.SQL.Add ( TGenericDAO._getNextByField( Obj,Field, Intitution  ) );
      LCQry.Active := True;
      Result := StrToIntDef( LCQry.FieldByName(Field).AsString,0) + 1;
    Except
      on E: Exception do
      geralog('Base - ',E.Message);
    end;
  finally
    LCQry.Close;
    LCQry.DisposeOf;
  end;
end;

function TBaseController.insertObj<T>(Obj: T): Boolean;
Var
  LCQry : TFDQuery;
begin
  try
    try
      LCQry := GeraQuery;
      with LCQry do
      Begin
        SQL.Clear;
        SQL.Add ( TGenericDAO._Insert(Obj) );
        ExecSQL;
      End;
    Except
    on E: Exception do
      geralog('Base - ',E.Message);
    end;
  finally
    LCQry.Close;
    LCQry.DisposeOf;
  end;


end;

procedure TBaseController.SaveObj<T>(Obj: T);
begin
  if existObj(Obj) then
    updateObj(Obj)
  else
    InsertObj(Obj);
end;

procedure TBaseController.setGenerator(Generator, Sequencia: String);
var
  Lc_SqlTxt: string;
  Lc_Qry : TFDQuery;
begin
  Try
    Lc_Qry := GeraQuery;
    with Lc_Qry do
    Begin
      CachedUpdates := True;
      if Sequencia = '' then Sequencia := '0';

      sql.Add('ALTER SEQUENCE ' + Generator + ' RESTART WITH ' + Sequencia);
      ExecSQL;
    end;
  Finally
    Lc_Qry.Close;
    Lc_Qry.DisposeOf;
  End;
end;

procedure TBaseController.SetGenertor(pGen,pCampo,pTabela: string);
Var
  Qry : TFDQuery;
begin
  try
    try
      Qry := GeraQuery;
      with Qry do
      Begin
        SQL.Clear;
        SQL.Add ( Concat(
              'SELECT GEN_ID( ',pGen,',',
              '  (SELECT MAX(',pCampo,') FROM ',pTabela,') - GEN_ID(',pGen,', 0)) FROM RDB$DATABASE; '
        ) );
        open;
      End;
    Except
      on E: Exception do
      geralog('Base - SetGenertor - ',E.Message);
    end;
  finally
    Qry.Close;
    Qry.DisposeOf;
  end;

end;

function TBaseController.TimeValid(value: String): Boolean;
begin
  try
    StrToTime(Value);
    Result := True;
  Except
    Result := False;
  end;

end;

function TBaseController.updateObj<T>(Obj: T): Boolean;
Var
  LCQry : TFDQuery;
begin
  try
    try
      LCQry := GeraQuery;
      with LCQry do
      Begin
        SQL.Clear;
        SQL.Add ( TGenericDAO._Update(Obj) );
        ExecSQL;
      End;
    Except
      on E: Exception do
      geralog('Base - ',E.Message);
    end;
  finally
    LCQry.Close;
    LCQry.DisposeOf;
  end;
end;

procedure TBaseController.get<T>(Qry: TFDQuery;Obj: T) ;
begin
  clearObj(Obj);
  TGenericDAO._get(Qry,Obj);
end;

procedure TBaseController._getByKey<T>(Obj: T);
VAr
  Qry : TFDQuery;
begin
  Try
    try
      Qry := GeraQuery;
      Qry.SQL.Clear;
      Qry.SQL.Add (TGenericDAO._Select(Obj,''));
      Qry.Active := True;
      Qry.FetchAll;
      exist  := ( Qry.RecordCount > 0 );
      if exist then TGenericDAO._get(Qry,Obj) ;
    Except
      on E: Exception do
      geralog('Base - _getByKey - ',E.Message);
    end;
  Finally
    Qry.Close;
    Qry.DisposeOf;
  End;

end;


function TBaseController.Generator(pc_Gen: string): Integer;
var
  Lc_SqlTxt: string;
  Qry : TFDQuery;
begin
  TRy
    Qry := GeraQuery;
    with Qry do
    Begin
      CachedUpdates := True;
      sql.Add('SELECT GEN_ID(' + pc_Gen + ',1) FROM RDB$DATABASE');
      Active := True;
      Result := fieldbyname('GEN_ID').AsInteger;
      ApplyUpdates;
    end;
  Finally
    Qry.Close;
    Qry.DisposeOf;
  End;
end;


procedure TBaseController.geralog(origem, msg: string);
begin
  GeralogCrashlytics(origem,msg);
end;

end.
