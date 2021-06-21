unit TypesCollection;

interface

uses System.Generics.Collections, tblCountry,tblState,tblCity, tblPhone,tblEntity,
    tblOrderItem, tblCustomer,tblProvider, tblStockList, tblPrice, tblPriceList,
  tblStockBalance, tblAddress, tblPaymentTypes, tblSocialMedia,
  ObjPriceList, ObjStockList, tblMerchandise, tblCategory, tblProduct, tblBrand,
  tblPackage, tblMeasure, tblStock, tblOrderSale,tblFinancial,tblFinancialBills,
  tblCashier,tblCashierItems,objPromotion, tblFinancialStatement,
  tblpromotion, tblpromotionLog,tblpromotionitemsLog,tblpromotionitems,
  tblorderconsignment, tblorderconsignmentOperation,tblStockStatement,
  tblKickback,tblInstitution,tblOrderPurchase,tblOrderStockAdjust, tblClinModule,
  tblClinQuestionnaire,tblClinQuestion,tblClinQuiz, tblClinAnwer,tblprivilege,
  tblLogOperation, tblWhatsappHasContact, tblWhatsappHasTalk, tblRestMenu;


Type
  //Objetos Primarios
  TListInstitution = TObjectList<TInstitution>;
  TListCountry = TObjectList<TCountry>;
  TListState = TObjectList<TState>;
  TListCity = TObjectList<TCity>;
  TListCategory = TObjectList<TCategory>;
  TListProduct = TObjectList<TProduct>;
  TListBrand = TObjectList<TBrand>;
  TListMerchandise = TObjectList<TMerchandise>;
  TListPackage = TObjectList<TPackage>;
  TListMeasure = TObjectList<TMeasure>;
  TListStock = TObjectList<TStock>;
  TListPriceList = TObjectList<TPriceList>;
  TListPrice = TObjectList<TPrice>;
  TListStockList = TObjectList<TStockList>;
  TListStockStatement = TObjectList<TStockStatement>;

  TListPaymentTypes = TObjectList<TPaymentTypes>;

  TListPhone = TObjectList<TPhone>;
  TListAddress = TObjectList<TAddress>;
  TListSocialMidia = TObjectList<TSocialMedia>;
  TListCustomer = TObjectList<TCustomer>;
  TListProvider = TObjectList<TProvider>;
  TListCashier = TObjectList<TCashier>;
  TListCashierItem = TObjectList<TCashierItems>;
  TListOrdemItem = TObjectList<TOrderItem>;
  TListOrdemSale = TObjectList<TOrderSale>;
  TListOrdemPurchase = TObjectList<TOrderPurchase>;
  TListOrdemStockAdjust = TObjectList<TOrderStockAdjust>;
  TListStockBalance = TObjectList<TStockBalance>;

  TListPromotion = TObjectList<TPromotion>;
  TListPromotionItems = TObjectList<TPromotionItems>;

  TListObjPromotion = TObjectList<TObjPromotion>;

  TListFinancial = TObjectList<TFinancial>;
  TListFinancialBills = TObjectList<TFinancialBills>;
  TListFinancialStatement = TObjectList<TFinancialStatement>;

  TListOrdemConsignment = TObjectList<TOrderConsignment>;
  TListOrdemConsignmentOperation = TObjectList<TOrderConsignmentOperation>;

  TListKickback = TObjectList<TKickback>;

  TListEntity = TObjectList<TEntity>;
  TListClinModule = TObjectList<TClinModule>;
  TListClinQuestionnaire = TObjectList<TClinQuestionnaire>;
  TListClinQuestion = TObjectList<TClinQuestion>;
  TListClinQuiz = TObjectList<TClinQuiz>;
  TListClinAnwer = TObjectList<TClinAnwer>;

  TListPrivilege = TObjectList<TPrivilege>;
  TListLogOperation  = TObjectList<TLogOperation>;

  TListWhatsAppContact = TObjectList<TWhatsappHasContact>;
  TListWhatsAppTalk = TObjectList<TWhatsappHasTalk>;

  TListRestMenu = TObjectList<TRestMenu>;


implementation

end.




