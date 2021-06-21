unit ControllerOrderProduction;

interface
uses System.Classes, System.SysUtils,BaseController,
      tblOrderProduction, tblEntity, FireDAC.Comp.Client,Md5, FireDAC.Stan.Param,
      Controllermerchandise, ControllerSituation, ControllerOrder, ControllerOrderItem,
      ControllerOrderTotalizer;

Type
  TControllerOrderProduction = Class(TBaseController)
    procedure clear;
  private

  public
    Registro      : TOrderProduction;
    merchandise   : TControllermerchandise;
    Situation     : TControllerSituation;
    Order         : TControllerOrder;
    itemsJob      : TControllerOrderItem;
    OrderTotalizer  : TControllerOrderTotalizer;

    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    function save:boolean;
    function delete: boolean;
    function getByKey:Boolean;
    Function getNexNumber:String;
    function getNumber:Boolean;
  End;

implementation

{ ControllerOrderProduction}

procedure TControllerOrderProduction.clear;
begin
  ClearObj(Registro);
end;

constructor TControllerOrderProduction.Create(AOwner: TComponent);
begin
  inherited;
  Registro    := TOrderProduction.Create;
  merchandise := TControllermerchandise.Create(self);
  Situation   := TControllerSituation.Create(self);
  Order       := TControllerOrder.Create(self);
  itemsJob  := TControllerOrderItem.Create(self);
  OrderTotalizer  := TControllerOrderTotalizer.Create(self);
end;

function TControllerOrderProduction.delete: boolean;
begin
  Try
    deleteObj(Registro);
    Result := True;
  Except
    Result := False;
  End;

end;

destructor TControllerOrderProduction.Destroy;
begin
     FreeAndNil(Registro);
     inherited;
end;

function TControllerOrderProduction.save: boolean;
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

function TControllerOrderProduction.getNexNumber: String;
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
                'FROM tb_order_production op ',
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

function TControllerOrderProduction.getNumber: Boolean;
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
              'from 	tb_order_production ',
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

function TControllerOrderProduction.getByKey: Boolean;
begin
  _getByKey(Registro);
end;

end.
