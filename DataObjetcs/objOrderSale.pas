unit objOrderSale;

interface

uses System.SysUtils, objEntityFiscal, tblCustomer,  ObjSalesMan, tblOrder,
  tblOrderPi, tblMedParts, tblMedPartsJr, tblMedPartsRt, tblMedInsertDate,
  System.Generics.Collections, tblOrderItem, tblOrderSale,tblOrderTotalizer,
  tblOrderBilling, objBase;

Type
  TListItems = TObjectList<TOrderItem>;
  TObjOrderSale = Class(TObjBase)
  private
    FOrderSale: TOrderSale;
    FTotalizer: TOrderTotalizer;
    FBilling: TOrderBilling;
    FFormaPagamento: String;
    FItems: TListItems;
    FCliente: TCustomer;
    FOrder: TOrder;
    FFiscal: TObjEntityFiscal;
    FDocFiscalVendedor: String;
    FVendedor: Integer;
    procedure setFBilling(const Value: TOrderBilling);
    procedure setFCliente(const Value: TCustomer);
    procedure setFFiscal(const Value: TObjEntityFiscal);
    procedure setFFormaPagamento(const Value: String);
    procedure setFItems(const Value: TListItems);
    procedure setFOrder(const Value: TOrder);
    procedure setFOrderSale(const Value: TOrderSale);
    procedure setFTotalizer(const Value: TOrderTotalizer);
    procedure setFDocFiscalVendedor(const Value: String);
    procedure setFVendedor(const Value: Integer);

  public
      constructor Create;override;
      destructor Destroy;override;
      procedure clear;
      property Fiscal : TObjEntityFiscal read FFiscal write setFFiscal;
      property Cliente : TCustomer read FCliente write setFCliente;
      property Vendedor : Integer read FVendedor write setFVendedor;
      property DocFiscalVendedor : String read FDocFiscalVendedor write setFDocFiscalVendedor;
      property FormaPagamento     : String read FFormaPagamento write setFFormaPagamento;
      property Order : TOrder read FOrder write setFOrder;
      property OrderSale : TOrderSale read FOrderSale write setFOrderSale;
      property Items  : TListItems  read FItems write setFItems;
      property Totalizer : TOrderTotalizer read FTotalizer write setFTotalizer;
      property Billing  : TOrderBilling read FBilling write setFBilling;
  End;

implementation

uses GenericDao;
{ TObjOrderSale }

procedure TObjOrderSale.clear;
begin
  TGenericDAO._Clear(FTotalizer);
  TGenericDAO._Clear(FBilling);
  FItems.Clear;
  TGenericDAO._Clear(FCliente);
  FFiscal.clear;
  TGenericDAO._Clear(FOrderSale);
  TGenericDAO._Clear(FOrder);
end;

constructor TObjOrderSale.Create;
begin
  inherited;
  FTotalizer  := TOrderTotalizer.Create;
  FBilling    := TOrderBilling.Create;
  FItems      := TListItems.Create;
  FFiscal     := TObjEntityFiscal.Create;
  FCliente    := TCustomer.Create;
  FOrderSale  := TOrderSale.Create;
  FOrder      := TOrder.Create;;
end;

destructor TObjOrderSale.Destroy;
begin
  {$IFDEF WIN32}
    FTotalizer.DisposeOf;
    FBilling.DisposeOf;
    FItems.DisposeOf;
    Fiscal.Destroy;
    FCliente.DisposeOf;
    FOrderSale.DisposeOf;
    FOrder.DisposeOf;
  {$ENDIF }
end;


procedure TObjOrderSale.setFBilling(const Value: TOrderBilling);
begin
  FBilling := Value;
end;

procedure TObjOrderSale.setFCliente(const Value: TCustomer);
begin
  FCliente := Value;
end;

procedure TObjOrderSale.setFDocFiscalVendedor(const Value: String);
begin
  FDocFiscalVendedor := Value;
end;

procedure TObjOrderSale.setFFiscal(const Value: TObjEntityFiscal);
begin
  FFiscal := Value;
end;

procedure TObjOrderSale.setFFormaPagamento(const Value: String);
begin
  FFormaPagamento := Value;
end;

procedure TObjOrderSale.setFItems(const Value: TListItems);
begin
  FItems := Value;
end;

procedure TObjOrderSale.setFOrder(const Value: TOrder);
begin
  FOrder := Value;
end;

procedure TObjOrderSale.setFOrderSale(const Value: TOrderSale);
begin
  FOrderSale := Value;
end;

procedure TObjOrderSale.setFTotalizer(const Value: TOrderTotalizer);
begin
  FTotalizer := Value;
end;

procedure TObjOrderSale.setFVendedor(const Value: Integer);
begin
  FVendedor := Value;
end;

end.


