unit ControllerOrderProductionMp;

interface
uses System.Classes, System.SysUtils,BaseController,
      tblOrderProductionMp, FireDAC.Comp.Client,Md5, FireDAC.Stan.Param,
      ControllerEntityFiscal, ControllerCompany, ControllerPerson,System.Generics.Collections,
  ControllerMerchandise;

Type
  TListaOrdemItemMp = TObjectList<TOrderProductionMp>;

  TControllerOrderProductionMp = Class(TBaseController)
    Lista: TListaOrdemItemMp;
    procedure clear;
  private

  public
    Registro : TOrderProductionMp;
    Mercadoria : TControllerMerchandise;
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    function getNext:Integer;
    function save:boolean;
    function insert:boolean;
    function update:boolean;
    Function delete:boolean;
    function getByKey:Boolean;
    function getAllByKey:boolean;
    procedure getList;
  End;

implementation

{ ControllerAccounting }

procedure TControllerOrderProductionMp.clear;
begin
  ClearObj(Registro);
end;

constructor TControllerOrderProductionMp.Create(AOwner: TComponent);
begin
  inherited;
  Registro := TOrderProductionMp.Create;
  Mercadoria := TControllerMerchandise.Create(Self);
  Lista := TListaOrdemItemMp.Create;
end;

function TControllerOrderProductionMp.delete: boolean;
begin
  Try
    deleteobj(Registro);
    Result := True;
  Except
    Result := False;
  End;
end;

destructor TControllerOrderProductionMp.Destroy;
begin
  FreeAndNil(Registro);
  FReeAndNil(Mercadoria);
  inherited;
end;


function TControllerOrderProductionMp.insert: boolean;
begin
  try
    if Registro.Codigo = 0 then
      Registro.Codigo := getNext;
    insertObj(Registro);
    Result := true;
  except
    Result := False;
  end;
end;

function TControllerOrderProductionMp.save: boolean;
begin
  try
    saveObj(Registro);
    Result := true;
  except
    Result := False;
  end;
end;

function TControllerOrderProductionMp.update: boolean;
begin
  try
    UpdateObj(Registro);
    Result := true;
  except
    Result := False;
  end;
end;


function TControllerOrderProductionMp.getAllByKey: boolean;
begin
  getByKey;
  Mercadoria.Registro.Codigo := Registro.Produto;
  Mercadoria.getAllByKey;

end;

function TControllerOrderProductionMp.getByKey: Boolean;
begin
  _getByKey(Registro);
  Mercadoria.Registro.Codigo := Self.Registro.Codigo;
  Mercadoria.getByKey;
end;

procedure TControllerOrderProductionMp.getList;
var
  Qry : TFDQuery;
  LITem : TOrderProductionMp;
begin
  Qry := createQuery;
  with Qry do
  Begin
    sql.add(concat('SELECT * ',
                    'FROM tb_order_production_mp oi ',
                    'WHERE tb_institution_id =:tb_institution_id ',
                    ' AND tb_order_id =:tb_order_id ',
                    ' AND (kind =:kind) ',
                    ' ORDER BY id '));

    ParamByName('tb_institution_id').AsInteger := Registro.Estabelecimento;
    ParamByName('tb_order_id').AsInteger := Registro.Ordem;
    ParamByName('kind').AsString := Registro.TipoInclusao;
    Active := True;
    FetchAll;
    First;
    Lista.Clear;
    while not eof do
    Begin
      LITem := TOrderProductionMp.Create;
      with LITem do
      Begin
        Codigo := fieldByName('id').asInteger;
        Estabelecimento := fieldByName('tb_institution_id').asInteger;
        Ordem := fieldByName('tb_order_id').asInteger;
        Produto := fieldByName('tb_product_id').asInteger;
        Estoque := fieldByName('tb_stock_list_id').asInteger;
        TipoInclusao := fieldByName('kind').asString;
        Quantidade := fieldByName('quantity').asFloat;
        ValorUnitario := fieldByName('unit_value').asFloat;
        RegistroCriado := fieldByName('created_at').AsDateTime;
        RegistroAlterado := fieldByName('updated_at').AsDateTime;
      end;
      Lista.add(LITem);
      next;
    end;
    Close;
  end;
  FreeAndNil(Qry);
end;

function TControllerOrderProductionMp.getNext: Integer;
var
  Lc_qry: TFDQuery;
begin
  Lc_qry := createQuery;
  with Lc_qry do
  Begin
    sql.Clear;
    sql.Add(concat(
                'SELECT MAX(id) id ',
                'FROM tb_order_production_mp ',
                ' where ( tb_institution_id =:tb_institution_id ) ',
                ' and (tb_order_id =:tb_order_id) '
                ));
    ParamByName('tb_institution_id').AsInteger := Registro.Estabelecimento;
    ParamByName('tb_order_id').AsInteger := Registro.Ordem;
    Active := True;
    First;
    result := StrToIntDef(FieldByName('id').AsString,0) + 1;
  End;
  FreeAndNil(Lc_qry);
end;

end.
