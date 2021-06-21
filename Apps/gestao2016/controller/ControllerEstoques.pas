unit ControllerEstoques;

interface

uses IBX.IBDatabase,System.Classes, Vcl.Grids,IBX.IBQuery, System.SysUtils,BaseController,
      tblEstoques,GenericDao, Un_MSg,System.Generics.Collections,
  ControllerEstoque;

Type
  TListaEstoques  = TObjectList<TEstoques>;

  TControllerEstoques = Class(TBaseController)
    Lista : TListaEstoques;
  private
  public
    Registro : TEstoques;
    SaldoEstoque : TControllerEstoque;
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure getbyId;
    function save:boolean;
    function migra:Boolean;
    function insert:boolean;
    function update:boolean;
    Function delete:boolean;
    procedure GetList;
  End;

implementation

uses Un_sistema, Un_funcoes,Un_Regra_Negocio;


constructor TControllerEstoques.Create(AOwner: TComponent);
begin
  inherited;
  Registro := TEstoques.Create;
  Lista := TListaEstoques.Create;
  SaldoEstoque := TControllerEstoque.Create(nil);
end;

function TControllerEstoques.delete: boolean;
begin
  Try
    DeleteObj(Registro);
    Result := True;
  Except
    Result := False;
  End;
end;

destructor TControllerEstoques.Destroy;
begin
  FreeAndNil(SaldoEstoque);
  FreeAndNil(Registro);
  FreeAndNil(Lista);
  inherited;
end;

function TControllerEstoques.insert: boolean;
begin
  if Registro.Codigo = 0 then
    Registro.Codigo := Generator('GN_ESTOQUES');
  Try
    InsertObj(Registro);
    Result := True;
  Except
    Result := False;
  End;
end;


function TControllerEstoques.migra: Boolean;
begin
  SaveObj(Registro);
end;

function TControllerEstoques.save: boolean;
begin
  Try
    if Registro.Codigo = 0 then
      Registro.Codigo := Generator('GN_ESTOQUES');
    SaveObj(Registro);
    Result := True;
  Except
    Result := False;
  End;
end;

function TControllerEstoques.update: boolean;
begin
  Try
    UpdateObj(Registro);
    Result := True;
  Except
    Result := False;
  End;
end;

procedure TControllerEstoques.getById;
begin
    _getByKey(Registro);
end;


procedure TControllerEstoques.GetList;
var
  Qry : TIBQuery;
  LcLista : TEstoques;
begin
  Try
    Qry := GeraQuery;
    with Qry do
    Begin
      active := False;
      sql.Clear;
      sql.add(concat(
                'SELECT * FROM tb_estoques ',
                'where ETS_CODMHA=:ETS_CODMHA ',
                'ORDER BY ETS_CODIGO '
      ));
      ParamByName('ETS_CODMHA').AsInteger := Registro.Estabelecimento;
      Active := True;
      FetchAll;
      First;
      Lista.Clear;
      while not eof do
      Begin
        LcLista := TEstoques.Create;
        get(qry,LcLista);
        Lista.add(LcLista);
        next;
      end;
    end;
  Finally
    Qry.close;
    FreeAndNil(Qry);
  End;
end;


end.
