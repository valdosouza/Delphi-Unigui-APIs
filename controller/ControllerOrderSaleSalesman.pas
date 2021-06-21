unit ControllerOrderSaleSalesman;


interface
uses System.Classes, System.SysUtils,BaseController,
      tblOrderSaleSalesman, tblEntity, FireDAC.Comp.Client,Md5,
      FireDAC.Stan.Param, ControllerCustomer, ControllerOrder, ControllerSalesman,
      ControllerPaymentTypes,ControllerOrderTotalizer, ControllerOrderItem,
      ControllerOrderBilling;

Type
  TControllerOrderSaleSalesman = Class(TBaseController)
    procedure clear;
  private

  public
    Registro          : TtblOrderSaleSalesman;
    Order             : TControllerOrder;
    Customer          : TControllerCustomer;
    SalesMan          : TControllerSalesman;
    PaymentType       : TControllerPaymentTypes;
    OrderTotalizer    : TControllerOrderTotalizer;
    itemsJob          : TControllerOrderItem;
    OrderBilling      : TControllerOrderBilling;

    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    function save:boolean;
    function delete: boolean;
    function getByKey:Boolean;
    function getAllAttributesLevelOne:Boolean;
    Function getNexNumber:String;
    function getNumber:Boolean;
  End;

implementation

{ ControllerOrderSale}

procedure TControllerOrderSaleSalesman.clear;
begin
  ClearObj(Registro);
end;

constructor TControllerOrderSaleSalesman.Create(AOwner: TComponent);
begin
  inherited;
  Registro          := TtblOrderSaleSalesman.Create;
  PaymentType       := TControllerPaymentTypes.Create(self);
  Order             := TControllerOrder.Create(self);
  Customer          := TControllerCustomer.Create(self);
  OrderTotalizer    := TControllerOrderTotalizer.Create(self);
  SalesMan          := TControllerSalesman.Create(self);
  itemsJob          := TControllerOrderItem.Create(self);
  OrderBilling      := TControllerOrderBilling.Create(self);
end;

function TControllerOrderSaleSalesman.delete: boolean;
begin
  Try
    deleteObj(Registro);
    Result := True;
  Except
    Result := False;
  End;

end;

destructor TControllerOrderSaleSalesman.Destroy;
begin
  FreeAndNil(Registro);
  inherited;
end;

function TControllerOrderSaleSalesman.save: boolean;
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

function TControllerOrderSaleSalesman.getAllAttributesLevelOne: Boolean;
begin
  _getByKey(Registro);
  //Order
  Order.Registro.Codigo := Registro.Codigo;
  Order.Registro.Estabelecimento := Registro.Estabelecimento;
  Order.getByKey;

end;

function TControllerOrderSaleSalesman.getByKey: Boolean;
begin
  _getByKey(Registro);
end;

function TControllerOrderSaleSalesman.getNexNumber: String;
Var
  LcNumber : Integer;
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
                'SELECT MAX(op.number) ordem ',
                'FROM tb_order_sale op ',
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

function TControllerOrderSaleSalesman.getNumber: Boolean;
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
              'from tb_order_sale ',
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
