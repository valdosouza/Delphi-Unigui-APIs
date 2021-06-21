unit objOrderPurchase;

interface

uses System.SysUtils, objEntityFiscal, tblprovider,  ObjSalesMan, tblOrder,
  tblOrderPi, tblMedParts, tblMedPartsJr, tblMedPartsRt, tblMedInsertDate,
  System.Generics.Collections, tblOrderItem, tblOrderPurchase,tblOrderTotalizer,
  tblOrderBilling,objBase;

Type
   TListItems = TObjectList<Torderitem>;
  TObjOrderPurchase = Class(TObjBase)
  private
    FTotalizer: TOrderTotalizer;
    FBilling: TOrderBilling;
    FFormaPagamento: String;
    FItems: TListItems;
    FOrder: TOrder;
    FOrderPurchase: TOrderPurchase;
    FFornecedor: TProvider;
    FFiscal: TObjEntityFiscal;
    procedure setFBilling(const Value: TOrderBilling);
    procedure setFFiscal(const Value: TObjEntityFiscal);
    procedure setFFormaPagamento(const Value: String);
    procedure setFFornecedor(const Value: TProvider);
    procedure setFItems(const Value: TListItems);
    procedure setFOrder(const Value: TOrder);
    procedure setFOrderPurchase(const Value: TOrderPurchase);
    procedure setFTotalizer(const Value: TOrderTotalizer);


  public
      constructor Create;override;
      destructor Destroy;override;
      procedure clear;
      property Fiscal : TObjEntityFiscal read FFiscal write setFFiscal;
      property Fornecedor : TProvider read FFornecedor write setFFornecedor;

      property FormaPagamento : String read FFormaPagamento write setFFormaPagamento;
      property Order          : TOrder read FOrder write setFOrder;
      property OrderPurchase  : TOrderPurchase read FOrderPurchase write setFOrderPurchase;
      property Items          : TListItems  read FItems write setFItems;
      property Totalizer      : TOrderTotalizer read FTotalizer write setFTotalizer;
      property Billing        : TOrderBilling read FBilling write setFBilling;
  End;

implementation

uses GenericDao;
{ TObjOrderPurchase }

procedure TObjOrderPurchase.clear;
begin
  TGenericDAO._Clear(FTotalizer);
  TGenericDAO._Clear(FBilling);
  FItems.Clear;
  TGenericDAO._Clear(FFornecedor);
  TGenericDAO._Clear(FOrderPurchase);
  TGenericDAO._Clear(FOrder);
end;

constructor TObjOrderPurchase.Create;
begin
  inherited;
  FTotalizer  := TOrderTotalizer.Create;
  FBilling    := TOrderBilling.Create;
  FItems      := TListItems.Create;
  FFiscal     := TObjEntityFiscal.Create;
  FFornecedor    := TProvider.Create;
  FOrderPurchase  := TOrderPurchase.Create;
  FOrder      := TOrder.Create;;
end;

destructor TObjOrderPurchase.Destroy;
begin
  {$IFDEF WIN32}
  FTotalizer.DisposeOf;
  FBilling.DisposeOf;
  FItems.DisposeOf;
  FFiscal.Destroy;
  FFornecedor.DisposeOf;
  FOrderPurchase.DisposeOf;
  FOrder.DisposeOf;

  {$ENDIF }
end;


procedure TObjOrderPurchase.setFBilling(const Value: TOrderBilling);
begin
  FBilling := Value;
end;

procedure TObjOrderPurchase.setFFiscal(const Value: TObjEntityFiscal);
begin
  FFiscal := Value;
end;

procedure TObjOrderPurchase.setFFormaPagamento(const Value: String);
begin
  FFormaPagamento := Value;
end;

procedure TObjOrderPurchase.setFFornecedor(const Value: TProvider);
begin
  FFornecedor := Value;
end;

procedure TObjOrderPurchase.setFItems(const Value: TListItems);
begin
  FItems := Value;
end;

procedure TObjOrderPurchase.setFOrder(const Value: TOrder);
begin
  FOrder := Value;
end;

procedure TObjOrderPurchase.setFOrderPurchase(const Value: TOrderPurchase);
begin
  FOrderPurchase := Value;
end;

procedure TObjOrderPurchase.setFTotalizer(const Value: TOrderTotalizer);
begin
  FTotalizer := Value;
end;

end.
