unit ControllerEstoque;

interface

uses System.Classes, System.SysUtils,BaseController,
      tblEstoque ,GenericDao,
      System.Generics.Collections, FireDAC.Comp.Client;

Type
  TListaEstoque = TObjectList<TEstoque>;

  TControllerEstoque = Class(TBaseController)
    Lista : TListaEstoque;
  private

  public
    Registro : TEstoque;

    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    function salva:boolean;
    function migra:Boolean;
    function Insert:boolean;
    function update:boolean;
    Function delete:boolean;
    procedure getbyId;
    procedure getList;
    Function getIdByEstoqueProduto:Integer;
    function getByCodigo:Boolean;
    function CriaRegistroAutomatico:boolean;
  End;

implementation

constructor TControllerEstoque.Create(AOwner: TComponent);
begin
  inherited;
  Registro := TEstoque.Create;
  Lista := TListaEstoque.Create;
end;


destructor TControllerEstoque.Destroy;
begin
  FreeAndNil(Registro);
  FreeAndNil(Lista);
  inherited;
end;


function TControllerEstoque.salva: boolean;
begin
  Try
    if Registro.Codigo = 0 then
      Registro.Codigo := Generator('GN_Estoque');
    SaveObj(Registro);
    Result := True;
  Except
    Result := False
  End;

end;




function TControllerEstoque.update: boolean;
begin
  Try
    Result := True;
    UpdateObj(Registro);
  Except
    Result := False
  End;

end;

function TControllerEstoque.CriaRegistroAutomatico: boolean;
var
  LcQry : TFDQuery;
begin
  LcQry := GeraQuery;
  with LcQry do
  Begin
    //Cria a Consulta de Tabelas Disponiveis
    SQL.Clear;
    SQL.add(concat(
                 'SELECT ETS_CODIGO '+
                 ' FROM tb_estoques '+
                 ' WHERE ETS_CODIGO NOT IN( '+
                 ' SELECT DISTINCT ETS_CODIGO '+
                 ' FROM tb_produto '+
                 '    INNER JOIN tb_estoque '+
                 '    ON (tb_estoque.EST_CODPRO = tb_produto.PRO_CODIGO) '+
                 '    INNER JOIN tb_estoques '+
                 '    ON (tb_estoques.ETS_CODIGO = tb_estoque.EST_CODETS) '+
                 ' WHERE PRO_CODIGO = :PRO_CODIGO)'
    ));
    ParamByName('PRO_CODIGO').AsInteger := REgistro.CodigoProduto;
    Active := True;
    FetchAll;
    First;
    IF (RecordCount > 0) then
    Begin
      while not Eof do
      begin
        REgistro.Codigo := 0;
        REgistro.CodigoEstoque := FieldByName('ETS_CODIGO').AsInteger;
        REgistro.QtdeDisp := 0;
        self.save;
        Next;
      end;
    end;
  End;
end;

function TControllerEstoque.delete: boolean;
begin
  Try
    DeleteObj(Registro);
    Result := True;
  Except
    Result := False;
  End;
end;

procedure TControllerEstoque.getById;
begin
  _getByKey(Registro);
end;

Function TControllerEstoque.getIdByEstoqueProduto:Integer;
var
  Qry : TFDQuery;
  LcLista : TEstoque;
begin
  Try
    Qry := GeraQuery;
    with Qry do
    Begin
      exist := False;
      active := False;
      sql.Clear;
      SQL.Add('SELECT EST_CODIGO '+
              'FROM TB_Estoque '+
              'WHERE ( EST_CODETS=:ETS_CODIGO ) AND ( EST_CODPRO =:PRO_CODIGO ) ');
      ParamByName('ETS_CODIGO').AsInteger := Registro.codigoEstoque;
      ParamByName('PRO_CODIGO').AsInteger := Registro.CodigoProduto;
      Active := True;
      FetchAll;
      First;
      if RecordCount > 0 then
        Result := FieldByName('EST_CODIGO').AsInteger
      else
        Result := 0;
    End;
  finally
    Qry.Close;
    Qry.DisposeOf
  end;
end;

procedure TControllerEstoque.getList;
var
  Qry : TFDQuery;
  LcLista : TEstoque;
begin
  Try
    Qry := GeraQuery;
    with Qry do
    Begin
      active := False;
      sql.Clear;
      sql.add('SELECT * FROM TB_ESTOQUE where (EST_CODIGO > 0 ) ');
      if Registro.CodigoProduto > 0 then
        sql.add(' AND (EST_CODPRO=:PRO_CODIGO) ');
      if Registro.CodigoEstoque > 0 then
        sql.add(' AND (EST_CODETS=:ETS_CODIGO) ');

      sql.add(' ORDER BY EST_CODIGO ');

      //Passagem de Parametro
      if Registro.CodigoProduto > 0 then
        ParamByName('PRO_CODIGO').AsInteger := Registro.CodigoProduto;
      if Registro.CodigoEstoque > 0 then
        ParamByName('ETS_CODIGO').AsInteger := Registro.CodigoEstoque;
      Active := True;
      FetchAll;
      First;
      Lista.Clear;
      while not eof do
      Begin
        LcLista := TEstoque.Create;
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

function TControllerEstoque.Insert: boolean;
begin
  Try
    if Registro.Codigo = 0 then
      Registro.Codigo := Generator('GN_ESTOQUE');
    insertObj(Registro);
    Result := True;
  Except
    Result := False
  End;

end;

function TControllerEstoque.migra: Boolean;
begin
  SaveObj(Registro);
end;



function TControllerEstoque.getByCodigo: Boolean;
VAr
  Qry : TFDQuery;
begin
  try
    Qry := GeraQuery;
    with Qry do
    Begin
      exist := False;
      active := False;
      sql.Clear;
      SQL.Add('SELECT * '+
              'FROM TB_ESTOQUE '+
              'WHERE ( EST_CODIGO=:EST_CODIGO )');
      ParamByName('EST_CODIGO').AsInteger := Registro.Codigo;
      Active := True;
      FetchAll;
      First;
      exist := (RecordCount > 0);
      if exist then
        get(Qry,Registro);
    End;
  finally
    Qry.Close;
    Qry.DisposeOf
  end;
end;

end.
