unit ControllerOrderStockTransfer;

interface
uses System.Classes, System.SysUtils,BaseController,
      tblOrderStockTransfer, tblEntity, FireDAC.Comp.Client,Md5, FireDAC.Stan.Param,
      ControllerOrder, ControllerSituation, ControllerOrderItem,ControllerStockList,
      ControllerOrderTotalizer,ControllerCarrier,ControllerOrderShipping;

Type
  TControllerOrderStockTransfer = Class(TBaseController)
    procedure clear;
  private

  public
    Registro        : TOrderStockTransfer;
    Estoque         : TControllerStockList;
    Order           : TControllerOrder;
    items           : TControllerOrderItem;
    Carrier         : TControllerCarrier;
    Situation       : TControllerSituation;
    OrderShipping   : TControllerOrderShipping;
    OrderTotalizer  : TControllerOrderTotalizer;
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    function save:boolean;
    function delete: boolean;
    function getByKey:Boolean;
    function getAllByKey:Boolean;
    Function getNexNumber:String;
    function getNumber:Boolean;
  End;

implementation

{ ControllerOrderStockTransfer}


procedure TControllerOrderStockTransfer.clear;
begin
  ClearObj(Registro);
end;

constructor TControllerOrderStockTransfer.Create(AOwner: TComponent);
begin
  inherited;
  Registro        := TOrderStockTransfer.Create;
  Estoque         := TControllerStockList.Create(self);
  Order           := TControllerOrder.Create(self);
  items           := TControllerOrderItem.Create(self);;
  Carrier         := TControllerCarrier.Create(self);
  Situation       := TControllerSituation.Create(self);
  OrderShipping   := TControllerOrderShipping.Create(self);
  OrderTotalizer  := TControllerOrderTotalizer.Create(self);
end;

function TControllerOrderStockTransfer.delete: boolean;
begin
  Try
    deleteObj(Registro);
    Result := True;
  Except
    Result := False;
  End;
end;

destructor TControllerOrderStockTransfer.Destroy;
begin
  FreeAndNil(Registro);
  FreeAndNil(Order);
  FreeAndNil(OrderTotalizer);
  FreeAndNil(OrderShipping);
  FreeAndNil(items);
  FreeAndNil(Carrier);
  FreeAndNil(Situation);
  inherited;
end;

function TControllerOrderStockTransfer.save: boolean;
begin
  if Registro.Numero = 0 then
    Registro.Numero := getNextByField(Registro,'number',Registro.Estabelecimento);
  try
    saveObj(Registro);
    Result := true;
  except
    Result := False;
  end;
end;

function TControllerOrderStockTransfer.getAllByKey: Boolean;
begin
  _getByKey(Registro);

  with Order do
  Begin
    Registro.Codigo := Self.Registro.Codigo;
    Registro.Estabelecimento := Self.Registro.Estabelecimento;
    getByKey;
  End;

  with OrderTotalizer do
  Begin
    Registro.Codigo := Self.Registro.Codigo;
    Registro.Estabelecimento := Self.Registro.Estabelecimento;
    getByKey;
  End;

  with items do
  Begin
    Registro.Ordem := Self.Registro.Codigo;
    Registro.Estabelecimento := Self.Registro.Estabelecimento;
    getList;
  End;

  with OrderShipping do
  Begin
    Registro.Codigo := Self.Registro.Codigo;
    Registro.Estabelecimento := Self.Registro.Estabelecimento;
    getByKey;
  End;

  with Carrier do
  Begin
    Registro.Codigo := Self.Registro.Codigo;
    Registro.Estabelecimento := Self.Registro.Estabelecimento;
    getAllByKey;
  End;

end;

function TControllerOrderStockTransfer.getByKey: Boolean;
begin
  _getByKey(Registro);
end;

function TControllerOrderStockTransfer.getNexNumber: String;
Var
  LcNumber : Integer;
  Lc_Qry : TFDQuery;
begin
  Try
    Lc_Qry := createQuery;
    with Lc_Qry do
    Begin
      Active := False;
      SQL.Clear;
      SQL.Add(concat(
                'SELECT MAX(op.number) ordem ',
                'FROM tb_order_stock_transfer op ',
                'where op.tb_institution_id =:institution_id '
      ));
      ParamByName('institution_id').AsInteger := Registro.Estabelecimento;
      Active := True;
      LcNumber := StrToIntDef(FieldByName('ordem').AsString,0) + 1;
      Result := IntToStr(LcNumber);
    End;
  Finally
    Lc_Qry.close;
    FReeandNil(Lc_Qry)
  End;
end;

function TControllerOrderStockTransfer.getNumber: Boolean;
Var
  Lc_Qry : TFDQuery;
begin
  //Busca o registro pelo numero da pedido é já posiciona o codigo da ordem
  Try
    Lc_Qry := createQuery;
    with Lc_Qry do
    Begin
      Active := False;
      sql.Clear;
      sql.Add(concat(
              'Select id, number ',
              'from tb_order_stock_transfer ',
              'where ( tb_institution_id =:tb_institution_id ) ',
              ' and (number =:number) '
              ));
      ParamByName('tb_institution_id').AsInteger := Registro.Estabelecimento;
      ParamByName('number').AsInteger := Registro.Numero;
      Prepare;
      Active := True;
      FetchAll;
      if (RecordCount > 0 ) then
      Begin
        registro.Codigo := FieldByName('id').AsInteger;
        Result := True;
      End
      else
      Begin
        Result := False;
      End;

    End;

  Finally
    Lc_Qry.close;
    FReeandNil(Lc_Qry)
  End;
end;

end.
