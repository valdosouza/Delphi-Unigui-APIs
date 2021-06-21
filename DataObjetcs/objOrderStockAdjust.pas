unit objOrderStockAdjust;

interface

uses System.SysUtils, objEntityFiscal, tblprovider, ObjProvider, ObjSalesMan, tblOrder,
  tblOrderPi, tblMedParts, tblMedPartsJr, tblMedPartsRt, tblMedInsertDate,
  System.Generics.Collections, tblOrderItem, tblOrderStockAdjust,tblOrderTotalizer,
  tblOrderBilling,objBase;

Type
   TListItems = TObjectList<Torderitem>;
  TObjOrderStockAdjust = Class(TObjBase)
  private
    FTotalizer: TOrderTotalizer;
    FDestinatario: TObjEntityFiscal;
    FBilling: TOrderBilling;
    FFormaPagamento: String;
    FItems: TListItems;
    FOrder: TOrder;
    FOrderStockAdjust: TOrderStockAdjust;
    procedure setFBilling(const Value: TOrderBilling);
    procedure setFDestinatario(const Value: TObjEntityFiscal);
    procedure setFFormaPagamento(const Value: String);
    procedure setFItems(const Value: TListItems);
    procedure setFOrder(const Value: TOrder);
    procedure setFOrderStockAdjust(const Value: TOrderStockAdjust);
    procedure setFTotalizer(const Value: TOrderTotalizer);

  public
      constructor Create;override;
      destructor Destroy;override;
      procedure clear;
      property Destinatario : TObjEntityFiscal read FDestinatario write setFDestinatario;
      property FormaPagamento     : String read FFormaPagamento write setFFormaPagamento;
      property Order : TOrder read FOrder write setFOrder;
      property OrderStockAdjust : TOrderStockAdjust read FOrderStockAdjust write setFOrderStockAdjust;
      property Items  : TListItems  read FItems write setFItems;
      property Totalizer : TOrderTotalizer read FTotalizer write setFTotalizer;
      property Billing  : TOrderBilling read FBilling write setFBilling;
  End;

implementation

uses GenericDao;
{ TObjOrderStockAdjust }

procedure TObjOrderStockAdjust.clear;
begin
  TGenericDAO._Clear(FTotalizer);
  TGenericDAO._Clear(FBilling);
  FItems.Clear;
  FDestinatario.clear;
  TGenericDAO._Clear(FOrderStockAdjust);
  TGenericDAO._Clear(FOrder);
end;

constructor TObjOrderStockAdjust.Create;
begin
  inherited;
  FTotalizer        := TOrderTotalizer.Create;
  FBilling          := TOrderBilling.Create;
  FItems            := TListItems.Create;
  FDestinatario     := TObjEntityFiscal.Create;
  FOrderStockAdjust := TOrderStockAdjust.Create;
  FOrder            := TOrder.Create;;
end;

destructor TObjOrderStockAdjust.Destroy;
begin
  {$IFDEF WIN32}
  FDestinatario.Destroy;
  FTotalizer.DisposeOf;
  FBilling.DisposeOf;
  FItems.DisposeOf;
  FOrderStockAdjust.DisposeOf;
  FOrder.DisposeOf;

  {$ENDIF }
end;

procedure TObjOrderStockAdjust.setFBilling(const Value: TOrderBilling);
begin
  FBilling := Value;
end;

procedure TObjOrderStockAdjust.setFDestinatario(const Value: TObjEntityFiscal);
begin
  FDestinatario := Value;
end;

procedure TObjOrderStockAdjust.setFFormaPagamento(const Value: String);
begin
  FFormaPagamento := Value;
end;

procedure TObjOrderStockAdjust.setFItems(const Value: TListItems);
begin
  FItems := Value;
end;

procedure TObjOrderStockAdjust.setFOrder(const Value: TOrder);
begin
  FOrder := Value;
end;

procedure TObjOrderStockAdjust.setFOrderStockAdjust(
  const Value: TOrderStockAdjust);
begin
  FOrderStockAdjust := Value;
end;

procedure TObjOrderStockAdjust.setFTotalizer(const Value: TOrderTotalizer);
begin
  FTotalizer := Value;
end;

end.
