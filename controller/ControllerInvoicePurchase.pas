unit ControllerInvoicePurchase;

interface

Uses ControllerInvoiceMerchandise,ControllerProvider, System.Classes,
    ControllerOrderPurchase, System.SysUtils;

Type
  TControllerInvoicePurchase = Class(TControllerInvoiceMerchandise)
  private

  public
    Compra : TControllerOrderPurchase;

  constructor Create(AOwner: TComponent); override;
  destructor Destroy; override;

  End;

implementation

{ TControllerInvoicePurchase }
constructor TControllerInvoicePurchase.Create(AOwner: TComponent);
begin
  inherited;
  Compra   := TControllerOrderPurchase.Create(Self);
end;

destructor TControllerInvoicePurchase.Destroy;
begin
  FreeAndNil(Compra);
  inherited;
end;

end.
