unit ctrl_mob_state;

interface

uses System.Classes,ctrl_mob_base, FireDAC.Comp.Client,
  System.SysUtils,tblState,TypesCollection;

Type
  TCtrlMobState = class(TCtrlMobBase)
    private

    public
      Registro : TState;
      Lista : TListState;
      constructor Create(AOwner: TComponent); override;
      destructor Destroy; override;
      procedure createTable;
      function getByKey:boolean;
      function getByAbreviatura:boolean;
      function getList:Boolean;
      function save:Boolean;
      procedure assign(ObjOri : TState);
  end;

implementation

uses MainModule;


procedure TCtrlMobState.assign(ObjOri: TState);
begin
  _assign(ObjOri,Registro);
end;

constructor TCtrlMobState.Create(AOwner: TComponent);
begin
  Registro := TState.Create;
  Lista := TListState.create;
  createTable;
end;

procedure TCtrlMobState.createTable;
begin
  execcmd(concat(
              ' CREATE TABLE if not exists  tb_state (  ',
              ' id int(11),                             ',
              ' tb_country_id int(11),                  ',
              ' abbreviation varchar(2),                ',
              ' name varchar(100),                      ',
              ' created_at datetime,                    ',
              ' updated_at datetime );                  '
        ));
end;


destructor TCtrlMobState.Destroy;
begin
  {$IFDEF WIN32}
  Registro.DisposeOf;
  Lista.DisposeOf;
  {$ENDIF }
end;

function TCtrlMobState.getByAbreviatura: boolean;
begin
  get( getByField('tb_state','abbreviation',Registro.Abreviatura),Registro);
end;

function TCtrlMobState.getByKey: boolean;
begin
  _getByKey(Registro);
end;

function TCtrlMobState.getList: Boolean;
var
  Lc_Qry : TFDQuery;
  LITem : TState;
begin
  try
    Lc_Qry := createQuery;
    with Lc_Qry do
    Begin
      sql.add(concat(
                'SELECT s.* ',
                'FROM tb_state s ',
                'where ( id > 0 ) '
      ));
      //Incrementa SQL - Inner Join

      //Incrementa SQL - Where
      if Registro.Nome <> '' then
        sql.add(' and (s.name like :name) ');
      //Incrementa SQL - Order By
      if orderby = '' then orderby := 's.id';
      sql.add(concat(' ORDER BY ',orderby,'  asc '));
      sql.add(concat(' limit 0,50 '));

      //Passagem de parametros
      if Registro.Nome <> '' then
        ParamByName('name').AsString := concat('%',Registro.Nome,'%');

      Active := True;
      FetchAll;
      First;
      Lista.Clear;
      while not eof do
      Begin
        LITem := TState.Create;
        get(Lc_Qry,LITem);
        Lista.add(LITem);
        next;
      end;
    end;
  finally
    FinalizaQuery(Lc_Qry);
  end;
end;

function TCtrlMobState.save: Boolean;
begin
  try
    SaveObj(Registro);
    Result := true;
  except
    Result := False;
  end;

end;

end.
