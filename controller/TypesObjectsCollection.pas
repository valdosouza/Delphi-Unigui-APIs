unit TypesObjectsCollection;


interface

uses System.Generics.Collections,
    objCustomer, objProvider, objEntityFiscal, ObjMerchandise, ObjPriceList, objProduct,
  objSalesMan, objStock, ObjStockList, ObjInstitution,ObjOrderConsignment,
  objFinancialBills,ObjOrderSale;

type
  TListObjInstitution = TObjectList<TObjInstitution>;
  TListObjCustomer = TObjectList<TObjCustomer>;
  TListObjProvider = TObjectList<TObjProvider>;
  TListObjEntityFsical = TObjectList<TObjEntityFiscal>;
  TListObjMerchandise = TObjectList<TObjMerchandise>;
  TListObjPriceList = TObjectList<TObjPriceList>;
  TListObjProduct = TObjectList<TObjProduct>;
  TListObjSalesMan = TObjectList<TObjSalesMan>;
  TListObjStock = TObjectList<TObjStock>;
  TListObjStockList = TObjectList<TObjStockList>;
  TListObjtMerchandise = TObjectList<TObjMerchandise>;
  TListObjOrderSale = TObjectList<TObjOrderSale>;
  TListObjOrderConsignment = TObjectList<TObjOrderConsignment>;
  TListObjFinancialBills = TObjectList<TObjFinancialBills>;

implementation

end.
