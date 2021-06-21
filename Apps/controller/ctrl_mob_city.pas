unit ctrl_mob_city;

interface

uses System.Classes,ctrl_mob_base,  System.SysUtils,
  FireDAC.Comp.Client, tblCity, ctrl_mob_state,TypesCollection;

Type
  TCtrlMobCity = class(TCtrlMobBase)
    private
    FUF: String;
    procedure setFUF(const Value: String);

    protected
      procedure setStrutureUpdate;Override;
    public
      Registro : TCity;
      State : TCtrlMobState;
      Lista : TListCity;
      function getList:Boolean;
      constructor Create(AOwner: TComponent); override;
      destructor Destroy; override;
      procedure setParametro(par:String);
      procedure createTable;
      function getByKey:boolean;
      function save:Boolean;
      procedure getByName;
      procedure assign(ObjOri : TCity);
      property UF : String read FUF write setFUF;
  end;

implementation

uses MainModule;


procedure TCtrlMobCity.assign(ObjOri: TCity);
begin
  _assign(ObjOri,Registro);
end;

constructor TCtrlMobCity.Create(AOwner: TComponent);
begin
  Registro := TCity.Create;
  State := TCtrlMobState.Create(Self);
  Lista := TListCity.create;
  createTable;
  setStrutureUpdate;
end;

procedure TCtrlMobCity.createTable;
begin
  execcmd(concat(
              ' CREATE TABLE if not exists  tb_City ( ',
              '  id int(11), ',
              '  tb_state_id int(11) , ',
              '  ibge varchar(20) , ',
              '  name varchar(100) , ',
              '  aliq_iss decimal(10,2), ',
              ' created_at datetime , ',
              ' updated_at datetime ) '
        ));
end;


destructor TCtrlMobCity.Destroy;
begin
  {$IFDEF WIN32}
  Registro.disposeOf;
  State.disposeOf;
  Lista.disposeOf;
  {$ENDIF }
end;

function TCtrlMobCity.getByKey: boolean;
begin
  _getByKey(Registro);
end;

procedure TCtrlMobCity.getByName;
Var
  Lc_Qry : TFDQuery;
begin
  Try
    Lc_Qry := createQuery;
    with Lc_Qry do
    Begin
      Active := False;
      SQL.Clear;
      SQL.Add('Select * '+
              'from tb_city c '+
              'where (name =:name) and (tb_state_id=:tb_state_id) ');
      ParamByName('name').AsString := Registro.Nome;
      ParamByName('tb_state_id').AsInteger := Registro.CodigoEstado;
      active := True;
      FetchAll;
      exist := (RecordCount > 0);
      if (exist) then get(Lc_Qry,Registro);
    End;
  Finally
    FinalizaQuery(Lc_Qry);
  End;
end;

function TCtrlMobCity.getList: Boolean;
var
  Lc_Qry : TFDQuery;
  LITem : TCity;
begin
  Try
    Lc_Qry := createQuery;
    with Lc_Qry do
    Begin
      sql.add(concat(
                'SELECT c.* ',
                'FROM tb_city c '
      ));

      //Incrementa SQL - Where
      sql.add('where ( c.id is not null )');

      if Registro.CodigoEstado > 0 then
        sql.add(' AND ( c.tb_state_id =:state_id ) ');

      if Registro.Nome <> '' then
        sql.add(' and (c.name like :name) ');

      //Incrementa SQL - Order By
      if orderby = '' then orderby := 'c.id';
      sql.add(concat(' ORDER BY ',orderby,'  asc '));

      // apenas para teste sql.add(' limit 0,1 ');

      //Passagem de parametros

      if Registro.CodigoEstado > 0 then
        parambyname('state_id').AsInteger := Registro.CodigoEstado;

      if Registro.Nome <> '' then
        ParamByName('name').AsString := concat('%',Registro.Nome,'%');

      Active := True;
      FetchAll;
      First;
      Lista.Clear;
      while not eof do
      Begin
        LITem := TCity.Create;
        get(Lc_Qry,LITem);
        Lista.add(LITem);
        next;
      end;
    end;
  Finally
    FinalizaQuery(Lc_Qry);
  End;
end;

function TCtrlMobCity.save: Boolean;
begin
  try
    SaveObj(Registro);
    Result := true;
  except
    Result := False;
  end;

end;

procedure TCtrlMobCity.setFUF(const Value: String);
begin
  FUF := Value;
  if FUF <> '' then
  Begin
    State.Registro.Abreviatura := FUF;
    State.getByAbreviatura;
  End;

end;

procedure TCtrlMobCity.setParametro(par: String);
begin

end;

procedure TCtrlMobCity.setStrutureUpdate;
begin
  createColumnIfNotExists('tb_city','population','int(11)');
  createColumnIfNotExists('tb_city','density','decimal(10,2)');
  createColumnIfNotExists('tb_city','area','decimal(10,2)');
end;

end.
