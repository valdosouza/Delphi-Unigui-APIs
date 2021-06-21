unit ControllerProduto;

interface
uses  System.Classes, System.SysUtils,BaseController,
      tblProduto ,GenericDao, ControllerMedida,
      System.Generics.Collections,controllerPreco,ControllerEmbalagem,
      controllerEstoque,ControllerMarcaProduto, FireDAC.Comp.Client;

Type
  TListaProdutos = TObjectList<TProduto>;

  TControllerProduto = Class(TBaseController)
    Lista : TListaProdutos;
  private
  protected

  public
    Registro : TProduto;
    Marca : TControllerMarcaProduto;
    Medida : TControllerMedida;
    Embalagem : TControllerEmbalagem;
    Preco : TcontrollerPreco;
    Estoque : TcontrollerEstoque;
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    function save:boolean;
    Function migra:Boolean;
    procedure getbyId;
    function getbyFactoryProduct:Boolean;
    function getbyBarCode:Boolean;
    function getCusto:Real;
    function insert:boolean;
    function update:boolean;
    Function delete:boolean;
    procedure getList(limite:String);
    function getField(codigo:Integer;Field:String):String;
    Function getByDescricao(descricao:String):Integer;
    procedure MarcaPromocao(Codigo:Integer;Ativa:Boolean);
    procedure clear;
  End;

implementation


procedure TControllerProduto.clear;
begin
  clearObj(registro);
end;

constructor TControllerProduto.Create(AOwner: TComponent);
begin
  inherited;
  Registro  := TProduto.Create;
  Marca     := TControllerMarcaProduto.Create(Self);
  Medida    := TControllerMedida.Create(Self);
  Embalagem := TControllerEmbalagem.Create(Self);
  Lista     := TListaProdutos.Create;
  Preco     := TcontrollerPreco.Create(Self);
  Estoque   := TcontrollerEstoque.Create(Self);
end;

function TControllerProduto.delete: boolean;
begin
  Try
    DeleteObj(Registro);
    Result := True;
  Except
    Result := False;
  End;
end;

destructor TControllerProduto.Destroy;
begin
  Estoque.DisposeOf;
  Marca.DisposeOf;
  Preco.DisposeOf;
  Embalagem.DisposeOf;
  Registro.DisposeOf;
  Medida.DisposeOf;
  Lista.DisposeOf;
  inherited;
end;


function TControllerProduto.insert: boolean;
begin
  Try
    if Registro.Codigo = 0 then
     Registro.Codigo := Generator('GN_PRODUTO');
    InsertObj(Registro);
    Result := True;
  Except
    Result := False;
  End;
end;

procedure TControllerProduto.MarcaPromocao(Codigo: Integer;Ativa:Boolean);
Var
  Qry : TFDQuery;
begin
  Try
    Qry := GeraQuery();
    with Qry do
    Begin
      IF not Transaction.Active then Transaction.StartTransaction;
      sql.Add('UPDATE TB_PRODUTO SET '+
              'PRO_CAMPANHA=:PRO_CAMPANHA '+
              'WHERE ( PRO_CODIGO=:PRO_CODIGO )');
      if Ativa then
        ParamByName('PRO_CAMPANHA').AsString := 'S'
      else
        ParamByName('PRO_CAMPANHA').AsString := 'N';
      ParamByName('PRO_CODIGO').AsInteger := Codigo;
      ExecSQL;
      IF Transaction.Active then Transaction.Commit;
    End;
  Finally
    Qry.Close;
    FreeAndNil(Qry);
  End;

end;

function TControllerProduto.migra: Boolean;
begin
  SaveObj(Registro);
end;


function TControllerProduto.save: boolean;
begin
  if Registro.Codigo = 0 then
  Begin
    Registro.Codigo := Generator('GN_PRODUTO');
    if (Registro.CodigoFabrica = '') then
      Registro.CodigoFabrica := IntToStr(Registro.Codigo);
  End;
  SaveObj(Registro);
end;



function TControllerProduto.update: boolean;
begin
  Try
    UpdateObj(Registro);
    Result := True;
  Except
    Result := False;
  End;

end;

function TControllerProduto.getbyBarCode: Boolean;
var
  Qry : TFDQuery;
begin
  Try
    Qry := GeraQuery;
    with Qry do
    Begin
      Active := False;
      SQL.Clear;
      SQL.Add(concat(
                'select * ',
                'from tb_produto ',
                'where (PRO_CODIGOBAR =:PRO_CODIGOBAR )'
      ));
      ParamByName('PRO_CODIGOBAR').AsString := Registro.CodigoBarras;
      Active := True;
      FetchAll;
      exist := (recordCount > 0);
      if (exist) then get(Qry,Registro);
    End;
  Finally
    Qry.Close;
    qry.DisposeOf;
  End;
end;

Function TControllerProduto.getByDescricao(descricao: String):Integer;
Var
  Qry : TFDQuery;
begin
  Try
    Qry := GeraQuery;
    with Qry do
    Begin
      SQL.Add(concat(
                'select * ',
                'from tb_produto ',
                'where (PRO_DESCRICAO LIKE :PRO_DESCRICAO )'
      ));
      ParamByName('PRO_DESCRICAO').AsString := concat('%',Descricao,'%');
      Active := True;
      FetchAll;
      if (RecordCount = 1) then
      Begin
        exist := True;
        get(Qry,Registro);
        Result := 1;
      End
      else
      Begin
        exist := False;
        Result := RecordCount;
      End;
    End;
  Finally
    Qry.Close;
    FreeAndNil(qry);
  End;
end;

function TControllerProduto.getbyFactoryProduct:Boolean;
Var
  Qry : TFDQuery;
begin
  Try
    Qry := GeraQuery;
    with Qry do
    Begin
      Active := False;
      SQL.Clear;
      SQL.Add(concat(
                'select * ',
                'from tb_produto ',
                'where (PRO_CODIGOFAB =:PRO_CODIGOFAB )'
      ));
      ParamByName('PRO_CODIGOFAB').AsString := Registro.CodigoFabrica;
      Active := True;
      FetchAll;
      exist := (recordCount > 0);
      if (exist) then get(Qry,Registro);
    End;
  Finally
    Qry.Close;
    qry.disposeof;
  End;
end;

procedure TControllerProduto.getById;
begin
  _getByKey(Registro);
end;

function TControllerProduto.getCusto: Real;
Var
  Qry : TFDQuery;
begin
  Try
    Qry := GeraQuery;
    with Qry do
    Begin
      SQL.Add(concat(
                'select PRO_VL_CUSTO ',
                'from tb_produto ',
                'where (pro_codigo=:pro_codigo )'
      ));
      ParamByName('pro_codigo').AsInteger := Registro.Codigo;
      Active := True;
      Result := FieldByName('PRO_VL_CUSTO').AsFloat;
    End;
  Finally
    Qry.Close;
    qry.disposeof;
  End;
end;

function TControllerProduto.getField(codigo: Integer; Field: String): String;
var
  Qry : TFDQuery;
  LcLista : TProduto;
begin
  Try
    Qry := GeraQuery;
    with Qry do
    Begin
      active := False;
      sql.Clear;
      sql.add(concat(
                'SELECT ', Field ,' FROM TB_PRODUTO ',
                'where PRO_CODIGO=:PRO_CODIGO '
               ));
      ParamByName('PRO_CODIGO').AsInteger := Codigo;
      Active := True;
      FetchAll;
      Result := FieldByName(Field).asString;
    end;
  Finally
    Qry.close;
    FreeAndNil(Qry);
  End;
end;

procedure TControllerProduto.getList(limite:String);
var
  Qry : TFDQuery;
  LcLista : TProduto;
begin
  Try
    Qry := GeraQuery;
    with Qry do
    Begin
      active := False;
      sql.Clear;
      if StrToIntDef(limite,0)>0 then
        sql.add(concat('SELECT FIRST ',limite,' * '))
      else
        sql.add('SELECT * ');

      sql.add(concat(
                'FROM TB_PRODUTO ',
                'WHERE (PRO_CODIGO IS NOT NULL) '
                ));
      if Registro.Internet = 'S' then
        sql.add(' AND (PRO_INTERNET = ''S'') ');

      sql.add(' ORDER BY PRO_CODIGO ');
      Active := True;
      FetchAll;
      First;
      Lista.Clear;
      while not eof do
      Begin
        LcLista := TProduto.Create;
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
