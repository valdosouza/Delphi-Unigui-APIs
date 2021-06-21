unit ControllerOrderPacking;

interface
uses System.Classes, System.SysUtils,BaseController,
      tblorderpacking, tblEntity, FireDAC.Comp.Client,Md5, FireDAC.Stan.Param,
      ControllerEntityFiscal, ControllerSituation, ControllerOrder, ControllerOrderItem,
      ControllerOrderTotalizer, ControllerCarrier, ControllerOrderShipping;

Type
  TControllerOrderpacking = Class(TBaseController)
    procedure clear;
  private

  public
    Registro : TOrderpacking;
    Order : TControllerOrder;
    Entity : TControllerEntityFiscal;
    Situation : TControllerSituation;
    OrderTotalizer  : TControllerOrderTotalizer;
    items           : TControllerOrderItem;
    Carrier         : TControllerCarrier;
    OrderShipping   : TControllerOrderShipping;

    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    function save:boolean;
    function getByKey:Boolean;
    function delete: boolean;
    function getAllByKey:boolean;
    Function getNexNumber:String;
    function getNumber:Boolean;
  End;

implementation

{ ControllerOrderPacking}

uses tblOrderTotalizer;


procedure TControllerOrderPacking.clear;
begin
  ClearObj(Registro);
end;

constructor TControllerOrderPacking.Create(AOwner: TComponent);
begin
  inherited;
  Registro := TOrderPacking.Create;
  Entity := TControllerEntityFiscal.Create(Self);
  Situation := TControllerSituation.Create(Self);
  Order := TControllerOrder.Create(Self);
  items  := TControllerOrderItem.Create(self);
  OrderShipping   := TControllerOrderShipping.Create(self);
  OrderTotalizer  := TControllerOrderTotalizer.Create(self);
  Carrier         := TControllerCarrier.Create(self);
end;

function TControllerOrderpacking.delete: boolean;
begin
  Try
    deleteObj(Registro);
    Result := True;
  Except
    Result := False;
  End;
end;

destructor TControllerOrderPacking.Destroy;
begin
  FreeAndNil(Registro);
  FreeAndNil(Situation);
  FreeAndNil(Order);
  inherited;
end;

function TControllerOrderPacking.save: boolean;

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

function TControllerOrderpacking.getAllByKey: boolean;
begin
  _getByKey(Registro);

  with Order do
  Begin
    Registro.Codigo := Self.Registro.Codigo;
    Registro.Estabelecimento := Self.Registro.Estabelecimento;
    getByKey;
  End;

  with Entity do
  Begin
    Registro.Codigo := Self.Registro.Entidade;
    getAllByKey;
  End;

  with Situation do
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

  with Carrier do
  Begin
    Registro.Codigo := Self.Registro.Codigo;
    Registro.Estabelecimento := Self.Registro.Estabelecimento;
    getAllByKey;
  End;

  with OrderShipping do
  Begin
    Registro.Codigo := Self.Registro.Codigo;
    Registro.Estabelecimento := Self.Registro.Estabelecimento;
    getByKey;
  End;

end;

function TControllerOrderpacking.getByKey: Boolean;
begin
  _getByKey(Registro);
end;

function TControllerOrderpacking.getNexNumber: String;
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
                'FROM tb_order_packing op ',
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

function TControllerOrderpacking.getNumber: Boolean;
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
              'from tb_order_packing ',
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

