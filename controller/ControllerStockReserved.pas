unit ControllerStockReserved;

interface
uses System.Classes, System.SysUtils,BaseController,
      tblStockReserved, FireDAC.Comp.Client,FireDAC.Stan.Param,
      System.Generics.Collections, ControllerOrderJobHasReserved;

Type

  TControllerStockReserved = Class(TBaseController)
    procedure clear;
  private

   function getNext:Integer;
  public
    Registro : TStockReserved;
    OrderHasReserved : TControllerOrderJobHasReserved;

    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    function updateStatus: boolean;
    function save:boolean;
    function insert:boolean;
    Function delete:boolean;
    function getByKey:Boolean;
   End;

implementation

{ ControllerStockList }

procedure TControllerStockReserved.clear;
begin
  ClearObj(Registro);
end;

constructor TControllerStockReserved.Create(AOwner: TComponent);
begin
  inherited;
  Registro := TStockReserved.Create;
  OrderHasReserved := TControllerOrderJobHasReserved.Create(self);
end;

function TControllerStockReserved.delete: boolean;
begin
  Try
    deleteObj(Registro);
    Result := True;
  Except
    Result := False;
  End;
end;


destructor TControllerStockReserved.Destroy;
begin
  FreeAndNil(Registro);
  inherited;
end;


function TControllerStockReserved.insert: boolean;
begin
  try
    saveObj(Registro);
    Result := true;
  except
    Result := False;
  end;
end;

function TControllerStockReserved.save: boolean;
begin
  try
    if Registro.Codigo = 0 then
      Registro.Codigo := getNext;
    saveObj(Registro);
    Result := true;
  except
    Result := False;
  end;

end;

function TControllerStockReserved.updateStatus: boolean;
var
  Qry : TFDQuery;
begin
  Qry := createQuery;
  with Qry do
  Begin
    sql.add(concat(' update tb_stock_reserved sr set ',
                   ' sr.status=:status ',
                   'WHERE ( tb_institution_id =:institution_id ) ',
                   ' AND  ( id =:id ) ',
                   ' AND  ( tb_stock_list_id =:stock_list_id ) '
        ));

    ParamByName('institution_id').AsInteger := Registro.Estabelecimento;
    ParamByName('id').AsInteger := Registro.Codigo;
    ParamByName('tb_stock_list_id').AsInteger := Registro.ListaEstoque;
    ParamByName('Status').AsString := Registro.Status;
    ExecSQL;
    Close;
  end;
  FreeAndNil(Qry);
end;


function TControllerStockReserved.getByKey: Boolean;
begin
  _getByKey(Registro);
end;

function TControllerStockReserved.getNext: Integer;
var
  Lc_qry: TFDQuery;
begin
  Lc_qry := createQuery;
  with Lc_qry do
  Begin
    sql.Clear;
    sql.Add(concat(
                'SELECT MAX(id) id ',
                'FROM tb_stock_reserved  ',
                ' where ( tb_institution_id =:tb_institution_id ) ',
                ' and (	tb_stock_list_id =:tb_stock_list_id) '
                ));
    ParamByName('tb_institution_id').AsInteger := Registro.Estabelecimento;
    ParamByName('tb_stock_list_id').AsInteger := Registro.ListaEstoque;
    Active := True;
    First;
    result := StrToIntDef(FieldByName('id').AsString,0) + 1;
  End;
  FreeAndNil(Lc_qry);
end;

end.
