
unit ControllerOrderJob;

interface
uses System.Classes, System.SysUtils,BaseController,
      tblOrderJob, tblEntity, FireDAC.Comp.Client,Md5, FireDAC.Stan.Param,
      ControllerCustomer, ControllerSituation, ControllerOrder,ControllerOrderItem,
      ControllerOrderToBuy,ControllerOrderTotalizer, ControllerStockReserved,
      ControllerOrderToProduction;

Type
  TControllerOrderJob = Class(TBaseController)
    procedure clear;
  private

  public
    Registro          : TOrderJob;
    Order             : TControllerOrder;
    Customer          : TControllerCustomer;
    Situation         : TControllerSituation;
    items             : TControllerOrderItem;
    OrderJobToBuy     : TControllerOrderToBuy;
    OrderTotalizer    : TControllerOrderTotalizer;
    StockReserved     : TControllerStockReserved;
    OrderToProduction : TControllerOrderToProduction;

    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    function save:boolean;
    function delete: boolean;
    function getByKey:Boolean;
    function getAllByKey:boolean;
    Function getNexNumber:String;
    function getNumber:Boolean;

  End;

implementation

{ ControllerOrderJob}

procedure TControllerOrderJob.clear;
begin
  ClearObj(Registro);
  Order.clear;
  Order.clear;
  Customer.clear;
  Situation.clear;
end;

constructor TControllerOrderJob.Create(AOwner: TComponent);
begin
  inherited;
  Registro          := TOrderJob.Create;
  Customer          := TControllerCustomer.Create(self);
  Situation         := TControllerSituation.Create(Self);
  Order             := TControllerOrder.Create(self);
  items             := TControllerOrderItem.Create(self);
  OrderJobToBuy     := TControllerOrderToBuy.Create(self);
  OrderTotalizer    := TControllerOrderTotalizer.Create(self);
  StockReserved     := TControllerStockReserved.Create(self);
  OrderToProduction := TControllerOrderToProduction.Create(self);

end;

function TControllerOrderJob.delete: boolean;
begin
  Try
    deleteObj(Registro);
    Result := True;
  Except
    Result := False;
  End;

end;

destructor TControllerOrderJob.Destroy;
begin
  FreeAndNil(Registro);
  FreeAndNil(Customer);
  FreeAndNil(Situation);
  inherited;
end;

function TControllerOrderJob.save: boolean;
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

function TControllerOrderJob.getAllByKey: boolean;
begin
  _getByKey(Registro);

  with Order do
  Begin
    Registro.Codigo := Self.Registro.Codigo;
    Registro.Estabelecimento := Self.Registro.Estabelecimento;
    getByKey;
  End;

  with Customer do
  Begin
    Registro.Codigo := Self.Registro.Cliente;
    Registro.Estabelecimento := Self.Registro.Estabelecimento;
    getAllByKey;
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

end;

function TControllerOrderJob.getByKey: Boolean;
begin
  _getByKey(Registro);
end;

function TControllerOrderJob.getNexNumber: String;
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
                'FROM tb_order_job op ',
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

function TControllerOrderJob.getNumber: Boolean;
Var
  Lc_Qry : TFDQuery;
begin
  Try
    Lc_Qry := createQuery;
    with Lc_Qry do
    Begin
      Active := False;
      sql.Clear;
      sql.Add(concat(
              'Select id, number ',
              'from 	tb_order_job ',
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
