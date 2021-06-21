unit TypesListCollection;

interface

uses System.Generics.Collections, list_spl_customer,list_spl_merchandise,list_spl_provider,
     list_spl_order_sale,list_spl_order_sale_items,list_spl_order_Consignment,
     list_spl_order_consignment_operation,list_spl_order_consignment_items, list_spl_institution,
     list_spl_order_consignment_items_statement, list_spl_financial_statement,list_spl_kickback,
     list_spl_order_purchase,list_spl_order_stock_adjust,
     list_spl_Value;

Type
  TCollSplInstitution = TObjectList<TListSplInstitution>;
  TCollSplCustomer = TObjectList<TListSplCustomer>;
  TCollSplProvider = TObjectList<TListSplProvider>;
  TCollSplMerchandise = TObjectList<TListSplMerchandise>;
  TCollSplOrderSale = TObjectList<TListSplOrderSale>;
  TCollSplOrderPurchase = TObjectList<TListSplOrderPurchase>;
  TCollSplOrderStockAdjust = TObjectList<TListSplOrderStockAdjust>;
  TCollSplOrderSaleItems = TObjectList<TListSplOrderSaleItems>;
  TCollSplOrderConsignment = TObjectList<TListSplOrderConsignment>;
  TCollSplOrderConsignmentOperation = TObjectList<TListSplOrderConsignmentOperation>;
  TCollSplOrderConsignmentItems = TObjectList<TListSplOrderConsignmentItems>;
  TCollSplOrderConsignmentItemsStatement = TObjectList<TListSplOrderConsignmentItemsStatement>;

  TCollSplFinancialStatement = TObjectList<TListSplFinancialStatement>;
  TCollSplKickback = TObjectList<TListSplKickback>;

  TCollSplValue = TObjectList<TListSplValue>;
implementation

end.




