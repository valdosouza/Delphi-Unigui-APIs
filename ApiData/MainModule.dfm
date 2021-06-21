object SC: TSC
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 633
  Width = 1114
  object MysqlLink: TFDPhysMySQLDriverLink
    DriverID = 'MySql'
    VendorLib = 'libmysql.dll'
    Left = 622
    Top = 16
  end
  object FDGUIxWaitCursor1: TFDGUIxWaitCursor
    Provider = 'Console'
    Left = 710
    Top = 24
  end
  object DS_SC_Country: TDSServerClass
    OnGetClass = DS_SC_CountryGetClass
    Server = DSServer1
    LifeCycle = 'Invocation'
    Left = 32
    Top = 152
  end
  object DS_SC_Agency: TDSServerClass
    OnGetClass = DS_SC_AgencyGetClass
    Server = DSServer1
    LifeCycle = 'Invocation'
    Left = 152
    Top = 529
  end
  object DS_SC_State: TDSServerClass
    OnGetClass = DS_SC_StateGetClass
    Server = DSServer1
    LifeCycle = 'Invocation'
    Left = 32
    Top = 209
  end
  object DS_SC_City: TDSServerClass
    OnGetClass = DS_SC_CityGetClass
    Server = DSServer1
    LifeCycle = 'Invocation'
    Left = 32
    Top = 265
  end
  object DS_SC_Services: TDSServerClass
    OnGetClass = DS_SC_ServicesGetClass
    Server = DSServer1
    LifeCycle = 'Invocation'
    Left = 32
    Top = 329
  end
  object DS_SC_customer: TDSServerClass
    OnGetClass = DS_SC_customerGetClass
    Server = DSServer1
    LifeCycle = 'Invocation'
    Left = 32
    Top = 393
  end
  object DS_SC_Institution: TDSServerClass
    OnGetClass = DS_SC_InstitutionGetClass
    Server = DSServer1
    LifeCycle = 'Invocation'
    Left = 32
    Top = 89
  end
  object DS_SC_Merchandise: TDSServerClass
    OnGetClass = DS_SC_MerchandiseGetClass
    Server = DSServer1
    LifeCycle = 'Invocation'
    Left = 152
    Top = 152
  end
  object DS_SC_Price_List: TDSServerClass
    OnGetClass = DS_SC_Price_ListGetClass
    Server = DSServer1
    LifeCycle = 'Invocation'
    Left = 152
    Top = 209
  end
  object DS_SC_Stock_List: TDSServerClass
    OnGetClass = DS_SC_Stock_ListGetClass
    Server = DSServer1
    LifeCycle = 'Invocation'
    Left = 384
    Top = 89
  end
  object DS_SC_Payment_types: TDSServerClass
    OnGetClass = DS_SC_Payment_typesGetClass
    Server = DSServer1
    LifeCycle = 'Invocation'
    Left = 152
    Top = 329
  end
  object DS_SC_SalesMan: TDSServerClass
    OnGetClass = DS_SC_SalesManGetClass
    Server = DSServer1
    LifeCycle = 'Invocation'
    Left = 152
    Top = 393
  end
  object DS_SC_Order_Sale: TDSServerClass
    OnGetClass = DS_SC_Order_SaleGetClass
    Server = DSServer1
    LifeCycle = 'Invocation'
    Left = 32
    Top = 457
  end
  object DS_SC_Product: TDSServerClass
    OnGetClass = DS_SC_ProductGetClass
    Server = DSServer1
    LifeCycle = 'Invocation'
    Left = 152
    Top = 449
  end
  object DS_SC_Brand: TDSServerClass
    OnGetClass = DS_SC_BrandGetClass
    Server = DSServer1
    LifeCycle = 'Invocation'
    Left = 272
    Top = 152
  end
  object DS_SC_Package: TDSServerClass
    OnGetClass = DS_SC_PackageGetClass
    Server = DSServer1
    LifeCycle = 'Invocation'
    Left = 272
    Top = 209
  end
  object DS_SC_Category: TDSServerClass
    OnGetClass = DS_SC_CategoryGetClass
    Server = DSServer1
    LifeCycle = 'Invocation'
    Left = 152
    Top = 265
  end
  object DS_SC_Stock: TDSServerClass
    OnGetClass = DS_SC_StockGetClass
    Server = DSServer1
    LifeCycle = 'Invocation'
    Left = 272
    Top = 329
  end
  object DS_SC_Price: TDSServerClass
    OnGetClass = DS_SC_PriceGetClass
    Server = DSServer1
    LifeCycle = 'Invocation'
    Left = 272
    Top = 393
  end
  object DS_SC_Stock_Balance: TDSServerClass
    OnGetClass = DS_SC_Stock_BalanceGetClass
    Server = DSServer1
    LifeCycle = 'Invocation'
    Left = 272
    Top = 449
  end
  object DS_SC_Measure: TDSServerClass
    OnGetClass = DS_SC_MeasureGetClass
    Server = DSServer1
    LifeCycle = 'Invocation'
    Left = 272
    Top = 81
  end
  object DS_SC_BankAccount: TDSServerClass
    OnGetClass = DS_SC_BankAccountGetClass
    Server = DSServer1
    LifeCycle = 'Invocation'
    Left = 384
    Top = 152
  end
  object DS_SC_FinancialPlans: TDSServerClass
    OnGetClass = DS_SC_FinancialPlansGetClass
    Server = DSServer1
    LifeCycle = 'Invocation'
    Left = 384
    Top = 209
  end
  object DS_SC_FinancialStatement: TDSServerClass
    OnGetClass = DS_SC_FinancialStatementGetClass
    Server = DSServer1
    LifeCycle = 'Invocation'
    Left = 272
    Top = 265
  end
  object DS_SC_Stock_Statement: TDSServerClass
    OnGetClass = DS_SC_Stock_StatementGetClass
    Server = DSServer1
    LifeCycle = 'Invocation'
    Left = 504
    Top = 89
  end
  object DS_SC_Advertiser: TDSServerClass
    OnGetClass = DS_SC_AdvertiserGetClass
    Server = DSServer1
    LifeCycle = 'Invocation'
    Left = 32
    Top = 521
  end
  object DS_SC_Broadcaster: TDSServerClass
    OnGetClass = DS_SC_BroadcasterGetClass
    Server = DSServer1
    LifeCycle = 'Invocation'
    Left = 272
    Top = 529
  end
  object DS_SC_Order_PI: TDSServerClass
    OnGetClass = DS_SC_Order_PIGetClass
    Server = DSServer1
    LifeCycle = 'Invocation'
    Left = 32
    Top = 568
  end
  object DS_SC_Med_Material: TDSServerClass
    OnGetClass = DS_SC_Med_MaterialGetClass
    Server = DSServer1
    LifeCycle = 'Invocation'
    Left = 152
    Top = 568
  end
  object DS_SC_Med_Pos_Prog: TDSServerClass
    OnGetClass = DS_SC_Med_Pos_ProgGetClass
    Server = DSServer1
    LifeCycle = 'Invocation'
    Left = 272
    Top = 568
  end
  object DS_SC_Med_Price_JR: TDSServerClass
    OnGetClass = DS_SC_Med_Price_JRGetClass
    Server = DSServer1
    LifeCycle = 'Invocation'
    Left = 392
    Top = 393
  end
  object DS_SC_Line_Business: TDSServerClass
    OnGetClass = DS_SC_Line_BusinessGetClass
    Server = DSServer1
    LifeCycle = 'Invocation'
    Left = 376
    Top = 465
  end
  object DS_SC_Contact: TDSServerClass
    OnGetClass = DS_SC_ContactGetClass
    Server = DSServer1
    LifeCycle = 'Invocation'
    Left = 392
    Top = 329
  end
  object DS_SC_FinancialBills: TDSServerClass
    OnGetClass = DS_SC_FinancialBillsGetClass
    Server = DSServer1
    LifeCycle = 'Invocation'
    Left = 392
    Top = 265
  end
  object DS_SC_Invoice: TDSServerClass
    OnGetClass = DS_SC_InvoiceGetClass
    Server = DSServer1
    LifeCycle = 'Invocation'
    Left = 512
    Top = 265
  end
  object DS_SC_Entity_Fiscal: TDSServerClass
    OnGetClass = DS_SC_Entity_FiscalGetClass
    Server = DSServer1
    LifeCycle = 'Invocation'
    Left = 152
    Top = 89
  end
  object DS_SC_Cashier: TDSServerClass
    OnGetClass = DS_SC_CashierGetClass
    Server = DSServer1
    LifeCycle = 'Invocation'
    Left = 512
    Top = 401
  end
  object DS_SC_Promotion: TDSServerClass
    OnGetClass = DS_SC_PromotionGetClass
    Server = DSServer1
    LifeCycle = 'Invocation'
    Left = 504
    Top = 152
  end
  object DS_SC_Promotion_Items: TDSServerClass
    OnGetClass = DS_SC_Promotion_ItemsGetClass
    Server = DSServer1
    LifeCycle = 'Invocation'
    Left = 504
    Top = 209
  end
  object DS_SC_Invoice_Merchandise: TDSServerClass
    OnGetClass = DS_SC_Invoice_MerchandiseGetClass
    Server = DSServer1
    LifeCycle = 'Invocation'
    Left = 504
    Top = 329
  end
  object DS_SC_Order_Consignment: TDSServerClass
    OnGetClass = DS_SC_Order_ConsignmentGetClass
    Server = DSServer1
    LifeCycle = 'Invocation'
    Left = 512
    Top = 473
  end
  object DS_SC_Kickback: TDSServerClass
    OnGetClass = DS_SC_KickbackGetClass
    Server = DSServer1
    LifeCycle = 'Invocation'
    Left = 416
    Top = 569
  end
  object DSServer1: TDSServer
    OnDisconnect = DSServer1Disconnect
    OnError = DSServer1Error
    ChannelResponseTimeout = 0
    Left = 24
    Top = 11
  end
  object AppEvent: TApplicationEvents
    OnException = AppEventException
    Left = 472
    Top = 24
  end
  object DS_SC_Invoice_Return_55: TDSServerClass
    OnGetClass = DS_SC_Invoice_Return_55GetClass
    Server = DSServer1
    LifeCycle = 'Invocation'
    Left = 664
    Top = 89
  end
  object DS_SC_Invoice_Return_65: TDSServerClass
    OnGetClass = DS_SC_Invoice_Return_65GetClass
    Server = DSServer1
    LifeCycle = 'Invocation'
    Left = 664
    Top = 145
  end
  object DS_SC_Invoice_Return_Service: TDSServerClass
    OnGetClass = DS_SC_Invoice_Return_ServiceGetClass
    Server = DSServer1
    LifeCycle = 'Invocation'
    Left = 664
    Top = 217
  end
  object DS_SC_Invoice_Rectification: TDSServerClass
    OnGetClass = DS_SC_Invoice_RectificationGetClass
    Server = DSServer1
    LifeCycle = 'Invocation'
    Left = 664
    Top = 289
  end
  object DS_SC_Order_Purchase: TDSServerClass
    OnGetClass = DS_SC_Order_PurchaseGetClass
    Server = DSServer1
    LifeCycle = 'Invocation'
    Left = 664
    Top = 369
  end
  object DS_SC_Order_Stock_Adjust: TDSServerClass
    OnGetClass = DS_SC_Order_Stock_AdjustGetClass
    Server = DSServer1
    LifeCycle = 'Invocation'
    Left = 664
    Top = 425
  end
  object DS_SC_Rest_Menu: TDSServerClass
    OnGetClass = DS_SC_Rest_MenuGetClass
    Server = DSServer1
    LifeCycle = 'Invocation'
    Left = 872
    Top = 89
  end
  object DS_SC_Rest_Menu_Has_Ingredient: TDSServerClass
    OnGetClass = DS_SC_Rest_Menu_Has_IngredientGetClass
    Server = DSServer1
    LifeCycle = 'Invocation'
    Left = 872
    Top = 169
  end
  object DS_SC_Rest_Group: TDSServerClass
    OnGetClass = DS_SC_Rest_GroupGetClass
    Server = DSServer1
    LifeCycle = 'Invocation'
    Left = 880
    Top = 241
  end
  object DS_SC_Rest_Subgroup: TDSServerClass
    OnGetClass = DS_SC_Rest_SubgroupGetClass
    Server = DSServer1
    LifeCycle = 'Invocation'
    Left = 880
    Top = 313
  end
  object DS_SC_Rest_Group_Has_Measure: TDSServerClass
    OnGetClass = DS_SC_Rest_Group_Has_MeasureGetClass
    Server = DSServer1
    LifeCycle = 'Invocation'
    Left = 880
    Top = 385
  end
  object DS_SC_Rest_Group_Has_Optional: TDSServerClass
    OnGetClass = DS_SC_Rest_Group_Has_OptionalGetClass
    Server = DSServer1
    LifeCycle = 'Invocation'
    Left = 880
    Top = 457
  end
  object DS_SC_Provider: TDSServerClass
    OnGetClass = DS_SC_ProviderGetClass
    Server = DSServer1
    LifeCycle = 'Invocation'
    Left = 1000
    Top = 97
  end
end
