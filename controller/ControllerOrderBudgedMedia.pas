unit ControllerOrderBudgedMedia;

interface
uses System.Classes, System.SysUtils,BaseController,
      tblAgency, FireDAC.Comp.Client,Md5, FireDAC.Stan.Param,
      ControllerEntity, tblOrderBudgedMedia, ControllerPaymentTypes,
      ControllerAgency, ControllerAdvertiser, ControllerOrder,
      ControllerOrderBudgedItemPiJr;

Type
  TControllerOrderBudgedMedia= Class(TBaseController)
    procedure clear;
  private
    Agencia:String;

  public
    Registro          : TOrderBudgedMedia;
    Order             : TControllerOrder;
    PaymentType       : TControllerPaymentTypes;
    Agency            : TControllerAgency;
    Advertiser        : TControllerAdvertiser;
    OrderBudgetItemPi : TControllerOrderBudgedItemPiJr;
    Entity : TControllerEntity;

    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    function save:boolean;
    function insert:boolean;
    Function delete:boolean;
    function getByKey:Boolean;
  End;

implementation

{ ControllerAgency }

procedure TControllerOrderBudgedMedia.clear;
begin
  ClearObj(Registro);
end;

constructor TControllerOrderBudgedMedia.Create(AOwner: TComponent);
begin
  inherited;
  Registro          := TOrderBudgedMedia.Create;
  Order             := TControllerOrder.Create(self);
  PaymentType       := TControllerPaymentTypes.Create(self);
  Agency            := TControllerAgency.Create(self);
  Advertiser        := TControllerAdvertiser.Create(self);
  OrderBudgetItemPi := TControllerOrderBudgedItemPiJr.Create(self);
end;

function TControllerOrderBudgedMedia.delete: boolean;
begin
  Try
    deleteObj(Registro);
    Result := True;
  Except
    Result := False;
  End;
end;

destructor TControllerOrderBudgedMedia.Destroy;
begin
  FreeAndNil(Registro);
  inherited;
end;

function TControllerOrderBudgedMedia.getByKey: Boolean;
begin
  _getByKey(Registro);
end;

function TControllerOrderBudgedMedia.insert: boolean;
begin
  try
    Registro.Codigo := getNextByField(Registro,'id',0);
    insertObj(Registro);
    Result := true;
  except
    Result := False;
  end;
end;

function TControllerOrderBudgedMedia.save: boolean;
begin
  try
    saveObj(Registro);
    Result := true;
  except
    Result := False;
  end;
end;

end.
