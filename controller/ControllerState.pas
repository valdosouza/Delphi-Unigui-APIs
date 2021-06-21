unit ControllerState;

interface
uses System.Classes, System.SysUtils,BaseController,TypesCollection,
      tblState,FireDAC.Comp.Client,Md5, FireDAC.Stan.Param,
      ControllerCountry,prm_state,rest.json;

Type
  TControllerState = Class(TBaseController)

  procedure clear;
  private

  public
    Registro : TState;
    Country : TControllerCountry;
    Lista: TListState;
    Parametro : TPrmState;
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure setParametro(par:String);
    function save:boolean;
    function getByKey:Boolean;
    procedure getByAbbreviation();
    function insert:boolean;
    function update:boolean;
    Function delete:boolean;
    Procedure getList;
    procedure assign(ObjOri : TState);
  End;

implementation

{ ControllerState }

procedure TControllerState.assign(ObjOri: TState);
begin
  _assign(ObjOri,Registro);
end;

procedure TControllerState.clear;
begin
  clearObj(Registro);
end;

constructor TControllerState.Create(AOwner: TComponent);
begin
  inherited;
  Registro := TState.Create;
  Country := TControllerCountry.Create(Self);
  Lista := TListState.Create;
  Parametro := TPrmState.Create;
end;

function TControllerState.delete: boolean;
begin
  Try
    deleteObj(Registro);
    Result := True;
  Except
    Result := False;
  End;
end;

destructor TControllerState.Destroy;
begin
  Parametro.Destroy ;
  Country.DisposeOf ;
  Registro.DisposeOf ;
  Lista.DisposeOf ;
  inherited;
end;


function TControllerState.insert: boolean;
begin
  try
    insertObj(Registro);
    Result := true;
  except
    Result := False;
  end;
end;

function TControllerState.save: boolean;
begin
  try
    SaveObj(Registro);
    Result := true;
  except
    Result := False;
  end;

end;

procedure TControllerState.setParametro(par: String);
begin
  try
    Parametro := TPrmState.Create;
    Parametro:= TJson.JsonToObject<TPrmState>(par);
  //Tratar Data
    Parametro.UltimaAtualizacao := dataMysql(Parametro.UltimaAtualizacao);
  Except
    Parametro.UltimaAtualizacao := '1900-01-01 01:00:00'
  end;
end;

function TControllerState.update: boolean;
begin
  try
    updateObj(Registro);
    Result := true;
  except
    Result := False;
  end;
end;

procedure TControllerState.getByAbbreviation();
Var
  Lc_Qry :TFDQuery;
begin
  Try
    Lc_Qry := createQuery;
    with Lc_Qry do
    Begin
      Active := False;
      SQL.Clear;
      SQL.Add('Select * '+
              'from tb_state s '+
              'where abbreviation =:abbreviation');
      ParamByName('abbreviation').AsString := Registro.Abreviatura;
      active := True;
      FetchAll;
      exist := (RecordCount > 0);
      if (exist) then get(Lc_Qry,Registro);
    End;
  finally
    Lc_Qry.Close;
    FreeandNil(Lc_Qry);
  end;

end;

function TControllerState.getByKey: Boolean;
begin
  _getByKey(Registro);
end;

procedure TControllerState.getList;
var
  Qry : TFDQuery;
  LITem : TState;
begin
  try
    Qry := createQuery;
    with Qry do
    Begin
      sql.add(concat(
                'SELECT s.* ',
                'FROM tb_state s '
      ));
      //Incrementa SQL - Inner Join
      if Parametro. Vendedor > 0 then
      Begin
        sql.add(concat(
                 '  INNER JOIN tb_salesman_has_state she ',
                 '  on (she.tb_state_id = s.id) '
        ));
      End;
      sql.add('Where ( id is not null) ');
      //Incrementa SQL - Where
      if Parametro.Vendedor > 0 then
        sql.add(' and ( she.tb_salesman_id=:tb_salesman_id ) ');

      if Trim(Parametro.UltimaAtualizacao) <> '' then
        sql.add(' AND ( s.updated_at >:updated_at ) ');

      //Incrementa SQL - Order By
      if Trim(Parametro.UltimaAtualizacao) <> '' then
      Begin
        sql.add(' order by s.updated_at asc ');
      End
      else
      Begin
        if Trim(orderby)='' then orderby := 's.id';
        sql.add(concat(' ORDER BY ',orderby,'  asc '));
      End;

      //Passagem de parametros
      if Parametro.Vendedor > 0 then
        parambyname('tb_salesman_id').AsInteger := Parametro.Vendedor;

      if Trim(Parametro.UltimaAtualizacao) <> '' then
        parambyname('updated_at').AsString := Parametro.UltimaAtualizacao;

      Active := True;
      FetchAll;
      First;
      Lista.Clear;
      while not eof do
      Begin
        LITem := TState.Create;
        get(Qry,LITem);
        Lista.add(LITem);
        next;
      end;
    end;
  finally
    Qry.Close;
    FreeAndNil(Qry);
  end;

end;

end.
