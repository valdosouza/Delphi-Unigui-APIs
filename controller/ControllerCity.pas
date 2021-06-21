unit ControllerCity;

interface
uses System.Classes, System.SysUtils,BaseController, TypesCollection,
      tblCity,FireDAC.Comp.Client,Md5, FireDAC.Stan.Param, ControllerState,
      prm_city,Rest.json;

Type
  TControllerCity = Class(TBaseController)

    procedure clear;
  private

  public
    Registro : TCity;
    State : TControllerState;
    Lista: TListCity;
    Parametro : TPrmCity;
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure setParametro(par:String);
    function save:boolean;
    procedure getByName;
    function getByKey:Boolean;
    function insert:boolean;
    function update:boolean;
    Function delete:boolean;
    procedure getByIBGE;
    procedure getByIBGEWithoutLastNumber;
    procedure getList;
    procedure assign(ObjOri : TCity);
  End;

implementation

{ ControllerCity }

procedure TControllerCity.assign(ObjOri: TCity);
begin
  _assign(ObjOri,Registro);
end;

procedure TControllerCity.clear;
begin
  clearObj(Registro);
end;

constructor TControllerCity.Create(AOwner: TComponent);
begin
  inherited;
  Registro := TCity.Create;
  State := TControllerState.Create(Self);
  Lista := TListCity.create;
  Parametro := TPrmCity.Create;
end;

function TControllerCity.delete: boolean;
begin
  Try
    deleteObj(Registro);
    Result := True;
  Except
    Result := False;
  End;
end;

destructor TControllerCity.Destroy;
begin
  Registro.DisposeOf;
  Lista.DisposeOf;
  State.DisposeOf;
  Parametro.Destroy;
  inherited;
end;


function TControllerCity.insert: boolean;
begin
  Registro.Codigo := getNextByField(Registro,'id',0);
  Try
    insertObj(Registro);
    Result := True;
  Except
    Result := False;
  End;
end;

function TControllerCity.save: boolean;
begin
  if Registro.Codigo = 0 then
    Registro.Codigo := getNextByField(Registro,'id',0);
  Try
    SaveObj(Registro);
    Result := True;
  Except
    Result := False;
  End;
end;

procedure TControllerCity.setParametro(par: String);
begin
  try
    Parametro := TPrmCity.Create;
    Parametro:= TJson.JsonToObject<TPrmCity>(par);
  //Tratar Data
    Parametro.UltimaAtualizacao := dataMysql(Parametro.UltimaAtualizacao);
  Except
    Parametro.UltimaAtualizacao := '2000-01-01 01:00:00'
  end;


end;

function TControllerCity.update: boolean;
begin
  Try
    updateObj(Registro);
    Result := True;
  Except
    Result := False;
  End;
end;

procedure TControllerCity.getByIBGE;
Var
  Lc_Qry :TFDQuery;
begin
  Try
    Lc_Qry := getByField('tb_city','ibge',registro.IBGE);
    if exist then
     get(Lc_Qry,Registro);
  Finally
    Lc_Qry.Close;
    FreeAndNil(Lc_Qry);
  End;
end;

procedure TControllerCity.getByIBGEWithoutLastNumber;
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
              'Select * ',
              'from tb_city c ',
              'where (c.ibge like :ibge ) '
      ));
      ParamByName('ibge').AsString := concat(Registro.IBGE,'%');
      active := True;
      FetchAll;
      exist := (RecordCount > 0);
      if (exist) then get(Lc_Qry,Registro);
    End;
  Finally
    FinalizaQuery(Lc_Qry);
  End;
end;

function TControllerCity.getByKey: Boolean;
begin
  _getByKey(Registro);
end;

procedure TControllerCity.getByName;
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

procedure TControllerCity.getList;
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

      //Incrementa SQL - Inner Join
      if Parametro.Vendedor > 0 then
      Begin
        sql.add(concat(
                 '  INNER JOIN tb_state s ',
                 '  on ( c.tb_state_id = s.id ) ',
                 '  INNER JOIN tb_salesman_has_state she ',
                 '  on (she.tb_state_id = s.id) '
        ));
      End;

      //Incrementa SQL - Where
      sql.add('where ( c.id is not null )');

      if Parametro.Estabelecimento > 0 then
        sql.add(' and ( she.tb_institution_id =:tb_institution_id )');

      if Parametro.Vendedor > 0 then
        sql.add(' and ( she.tb_salesman_id=:tb_salesman_id ) ');

      if Registro.CodigoEstado > 0 then
        sql.add(' AND ( c.tb_state_id =:state_id ) ');

      if Trim(Parametro.UltimaAtualizacao) <> '' then
        sql.add(' AND ( c.updated_at >:updated_at ) ');


      //Incrementa SQL - Order By
      if Trim(Parametro.UltimaAtualizacao) <> '' then
      Begin
        sql.add(' order by c.updated_at asc ');
      End
      else
      Begin
        if Trim(orderby)='' then orderby := 'c.id';
        sql.add(concat(' ORDER BY ',orderby,'  asc '));
      End;

      // apenas para teste sql.add(' limit 0,1 ');

      //Passagem de parametros
      if Parametro.Estabelecimento > 0 then
        parambyname('tb_institution_id').AsInteger := Parametro.Estabelecimento;

      if Registro.CodigoEstado > 0 then
        parambyname('state_id').AsInteger := Registro.CodigoEstado;

      if Trim(Parametro.UltimaAtualizacao) <> '' then
        parambyname('updated_at').AsString := Parametro.UltimaAtualizacao;

      if Parametro.Vendedor > 0 then
        parambyname('tb_salesman_id').AsInteger := Parametro.Vendedor;

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
    Lc_Qry.Close;
    FreeAndNil(Lc_Qry);
  End;

end;



end.
