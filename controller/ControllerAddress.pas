unit ControllerAddress;


interface
uses System.Classes, System.SysUtils,BaseController,
      tblAddress,FireDAC.Comp.Client,Md5, FireDAC.Stan.Param,
      ControllerCountry,ControllerState,ControllerCity, TypesCollection;


Type

  TControllerAddress = Class(TBaseController)

  procedure clear;
  private

  public
    Registro : TAddress;
    Pais : TControllerCountry;
    Estado : TControllerState;
    Cidade : TControllerCity;
    Lista : TListAddress;
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    function save:boolean;
    function getByKey:Boolean;
    function getAllByKey:boolean;
    procedure getbyMain;
    function getList:Boolean;

    function insert:boolean;
    function delete: boolean;
  End;

implementation

{ ControllerAddress }

procedure TControllerAddress.clear;
begin
  clearObj(Registro);
end;

constructor TControllerAddress.Create(AOwner: TComponent);
begin
  inherited;
  Registro := TAddress.Create;
  clearObj(Registro);
  Pais := TControllerCountry.Create(self);
  Estado := TControllerState.Create(self);
  Cidade := TControllerCity.Create(self);
  Lista := TListAddress.Create;

end;


function TControllerAddress.delete: boolean;
begin
  Try
    deleteObj(Registro);
    Result := True;
  Except
    Result := False;
  End;

end;

destructor TControllerAddress.Destroy;
begin
  Registro.DisposeOf;
  Pais.DisposeOf;
  Estado.DisposeOf;
  Cidade.DisposeOf;
  Lista.DisposeOf;
  inherited;
end;



function TControllerAddress.insert: boolean;
begin
  try
    SaveObj(Registro);
    Result := true;
  except
    Result := False;
  end;

end;

function TControllerAddress.save: boolean;
begin
  try
    SaveObj(Registro);
    Result := true;
  except
    Result := False;
  end;
end;

procedure TControllerAddress.getbyMain;
Var
  Lc_Qry : TFDQuery;
begin
  try
    Lc_Qry := createQuery;
    with Lc_Qry do
    Begin
      Active := False;
      sql.Clear;
      sql.Add('SELECT * FROM tb_address '+
              'where ( id = :id ) and ( main = :main )');
      ParamByName('id').AsInteger := Registro.Codigo;
      ParamByName('main').AsString :='S';
      Active := True;
      FetchAll;
      exist := (RecordCount > 0 );
    End;
    if (exist) then get(Lc_Qry,Registro);
  finally
    FinalizaQuery(Lc_Qry);
  end;
end;

function TControllerAddress.getList: Boolean;
Var
  Lc_Qry :TFDQuery;
  LcLista : TAddress;
begin
  Try
    LcLista := TAddress.Create;
    Lc_Qry := createQuery;
    with Lc_Qry do
    Begin
      sql.Clear;
      sql.Add(concat(
               'Select * ',
               'from tb_address ad ',
               'where ad.id =:id '
          ));
      //passagem de PArametros
      ParamByName('id').AsInteger := Registro.Codigo;
      Active := True;
      FetchAll;
      First;
      while not eof do
      Begin
        LcLista := TAddress.Create;
        get(Lc_Qry,LcLista);
        //add lista
        Lista.Add(LcLista);
        Next;
      End;
    End;
  Finally
    FinalizaQuery(Lc_Qry);
    LcLista.DisposeOf;
  End;
end;


function TControllerAddress.getAllByKey: boolean;
begin
  _getByKey(Registro);

  Pais.Registro.Codigo := Registro.CodigoPais;
  Pais.getByKey;

  Estado.Registro.Codigo := Registro.CodigoEstado;
  Estado.getByKey;

  Cidade.Registro.Codigo := Registro.CodigoCidade;
  Cidade.getByKey;

end;


function TControllerAddress.getByKey: Boolean;
begin
  _getByKey(Registro);
end;

end.

