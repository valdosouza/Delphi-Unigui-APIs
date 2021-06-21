program Vendas;

uses
  {$IFDEF DEBUG}
  {$IFDEF WIN32}
  FastMM4 in 'D:\FastMM\FastMM4.pas',
  {$ENDIF }
  {$ENDIF }
  System.StartUpCopy,
  FMX.Forms,
  {$IFDEF ANDROID}
  Androidapi.Helpers,
  {$ENDIF ANDROID}
  uLogin in '..\framework\uLogin.pas' {Login},
  base_form in '..\framework\base_form.pas' {BaseForm},
  base_registry in '..\framework\base_registry.pas' {BaseRegistry},
  base_search in '..\framework\base_search.pas' {BaseSearch},
  container_form in '..\framework\container_form.pas' {ContainerForm},
  base_lista_combo in '..\framework\base_lista_combo.pas' {BaseListaCombo},
  lista_combo_institution in '..\framework\lista_combo_institution.pas' {ListaComboInstitution},
  usplash in '..\framework\usplash.pas' {splash},
  MainModule in '..\framework\MainModule.pas' {UMM: TDataModule},
  tas_home in '..\framework\tas_home.pas' {TasHome},
  uMain in 'uMain.pas' {Main},
  openForms in 'openForms.pas',
  uAuthCM in '..\..\restClient\autentica\uAuthCM.pas' {AuthCM: TDataModule},
  sea_order_sale in 'sea_order_sale.pas' {SeaOrderSale},
  UnFunctions in '..\function\UnFunctions.pas',
  sea_cashier in 'sea_cashier.pas' {SeaCashier},
  cad_entity in 'cad_entity.pas' {CadEntity},
  tas_order_sale in 'tas_order_sale.pas' {TasOrderSale},
  DownTables in '..\function\DownTables.pas',
  list_spl_order_sale in '..\..\list\list_spl_order_sale.pas',
  list_spl_order_sale_items in '..\..\list\list_spl_order_sale_items.pas',
  Network in '..\function\Network.pas',
  un_print in '..\function\un_print.pas',
  tas_config in 'tas_config.pas' {TasConfig},
  unWait in '..\function\unWait.pas',
  ctrl_mob_order_sale in '..\controller\ctrl_mob_order_sale.pas',
  ctrl_mob_merchandise in '..\controller\ctrl_mob_merchandise.pas',
  ctrl_mob_institution_has_entity in '..\controller\ctrl_mob_institution_has_entity.pas',
  ctrl_mob_entity in '..\controller\ctrl_mob_entity.pas',
  ctrl_mob_entity_fiscal in '..\controller\ctrl_mob_entity_fiscal.pas',
  ctrl_mob_customer in '..\controller\ctrl_mob_customer.pas',
  ctrl_mob_order_item in '..\controller\ctrl_mob_order_item.pas',
  ctrl_mob_order in '..\controller\ctrl_mob_order.pas',
  ctrl_mob_order_totalizer in '..\controller\ctrl_mob_order_totalizer.pas',
  ctrl_mob_salesman in '..\controller\ctrl_mob_salesman.pas',
  ctrl_mob_sync_data in '..\controller\ctrl_mob_sync_data.pas',
  ctrl_mob_payment_type in '..\controller\ctrl_mob_payment_type.pas',
  ctrl_mob_order_billing in '..\controller\ctrl_mob_order_billing.pas',
  ctrl_mob_financial in '..\controller\ctrl_mob_financial.pas',
  ctrl_mob_line_business in '..\controller\ctrl_mob_line_business.pas',
  ctrl_mob_mailing in '..\controller\ctrl_mob_mailing.pas',
  ctrl_mob_institution_has_line_business in '..\controller\ctrl_mob_institution_has_line_business.pas',
  ctrl_mob_social_media in '..\controller\ctrl_mob_social_media.pas',
  ctrl_mob_product in '..\controller\ctrl_mob_product.pas',
  ctrl_mob_package in '..\controller\ctrl_mob_package.pas',
  ctrl_mob_price in '..\controller\ctrl_mob_price.pas',
  ctrl_mob_price_list in '..\controller\ctrl_mob_price_list.pas',
  ctrl_mob_stock in '..\controller\ctrl_mob_stock.pas',
  ctrl_mob_stock_balance in '..\controller\ctrl_mob_stock_balance.pas',
  ctrl_mob_stock_list in '..\controller\ctrl_mob_stock_list.pas',
  ctrl_mob_config in '..\controller\ctrl_mob_config.pas',
  ctrl_mob_address in '..\controller\ctrl_mob_address.pas',
  ctrl_mob_base in '..\controller\ctrl_mob_base.pas',
  ctrl_mob_brand in '..\controller\ctrl_mob_brand.pas',
  ctrl_mob_category in '..\controller\ctrl_mob_category.pas',
  ctrl_mob_city in '..\controller\ctrl_mob_city.pas',
  ctrl_mob_company in '..\controller\ctrl_mob_company.pas',
  ctrl_mob_country in '..\controller\ctrl_mob_country.pas',
  ctrl_mob_entity_has_mailing in '..\controller\ctrl_mob_entity_has_mailing.pas',
  ctrl_mob_mailing_group in '..\controller\ctrl_mob_mailing_group.pas',
  ctrl_mob_measure in '..\controller\ctrl_mob_measure.pas',
  ctrl_mob_person in '..\controller\ctrl_mob_person.pas',
  ctrl_mob_phone in '..\controller\ctrl_mob_phone.pas',
  ctrl_mob_state in '..\controller\ctrl_mob_state.pas',
  ctrl_mob_user in '..\controller\ctrl_mob_user.pas',
  tblBrand in '..\..\model\tblBrand.pas',
  tblMerchandise in '..\..\model\tblMerchandise.pas',
  tblPriceList in '..\..\model\tblPriceList.pas',
  tblProduct in '..\..\model\tblProduct.pas',
  tblStock in '..\..\model\tblStock.pas',
  tblStockBalance in '..\..\model\tblStockBalance.pas',
  GenericDao in '..\..\framework\GenericDao.pas',
  uDataCM in '..\..\restClient\apiData\uDataCM.pas' {DataCM: TDataModule},
  uDataEntityFiscalCC in '..\..\restClient\apiData\uDataEntityFiscalCC.pas',
  updateTables in '..\function\updateTables.pas',
  CtrlSync in '..\..\Classes\CtrlSync.pas',
  uSC in '..\..\uSC.pas',
  ctrl_mob_collaborator in '..\controller\ctrl_mob_collaborator.pas',
  TypesCollection in '..\..\controller\TypesCollection.pas',
  TypesObjectsCollection in '..\..\controller\TypesObjectsCollection.pas',
  sea_order_consignment in 'sea_order_consignment.pas' {SeaOrderConsignment},
  tas_order_consignment in 'tas_order_consignment.pas' {TasOrderConsignment},
  tblOrderConsignment in '..\..\model\tblOrderConsignment.pas',
  tblOrderConsignmentOperation in '..\..\model\tblOrderConsignmentOperation.pas',
  ctrl_mob_order_consignment in '..\controller\ctrl_mob_order_consignment.pas',
  ctrl_mob_order_consignment_operation in '..\controller\ctrl_mob_order_consignment_operation.pas',
  list_spl_order_consignment in '..\..\list\list_spl_order_consignment.pas',
  list_spl_order_consignment_operation in '..\..\list\list_spl_order_consignment_operation.pas',
  list_spl_order_items in '..\..\list\list_spl_order_items.pas',
  list_spl_order_consignment_items in '..\..\list\list_spl_order_consignment_items.pas',
  list_spl_order_consignment_items_statement in '..\..\list\list_spl_order_consignment_items_statement.pas',
  ctrl_mob_salesman_has_state in '..\controller\ctrl_mob_salesman_has_state.pas',
  ctrl_mob_salesman_has_stock in '..\controller\ctrl_mob_salesman_has_stock.pas',
  ctrl_mob_stock_statement in '..\controller\ctrl_mob_stock_statement.pas',
  uDataOrderConsignmentCC in '..\..\restClient\apiData\uDataOrderConsignmentCC.pas',
  uServicesCC in '..\..\restClient\ApiService\uServicesCC.pas',
  uServiceCM in '..\..\restClient\ApiService\uServiceCM.pas' {ServiceCM: TDataModule},
  api_receita_ws in '..\function\api_receita_ws.pas',
  ctrl_mob_financial_statement in '..\controller\ctrl_mob_financial_statement.pas',
  ctrl_mob_financial_bills in '..\controller\ctrl_mob_financial_bills.pas',
  ctrl_mob_financial_payment in '..\controller\ctrl_mob_financial_payment.pas',
  list_spl_financial_statement in '..\..\list\list_spl_financial_statement.pas',
  tblKickback in '..\..\model\tblKickback.pas',
  ctrl_mob_kickback in '..\controller\ctrl_mob_kickback.pas',
  sea_kickback in 'sea_kickback.pas' {SeaKickback},
  list_spl_kickback in '..\..\list\list_spl_kickback.pas',
  objFinancial in '..\..\DataObjetcs\objFinancial.pas',
  uDataKickbackCC in '..\..\restClient\apiData\uDataKickbackCC.pas',
  tas_take_picture in 'tas_take_picture.pas' {TasTakePicture},
  tblImages in '..\..\model\tblImages.pas',
  ControllerImages in '..\..\controller\ControllerImages.pas',
  Ctrl_mob_images in '..\controller\Ctrl_mob_images.pas',
  img_general in 'img_general.pas' {ImgGeneral},
  VertScrollBoxWithKBHandling in '..\Componentes\VertScrollBoxWithKBHandling.pas',
  lista_combo_state in 'lista_combo_state.pas' {ListaComboState},
  lista_combo_city in 'lista_combo_city.pas' {ListaComboCity},
  ctrl_mob_institution in '..\controller\ctrl_mob_institution.pas',
  objInstitution in '..\..\DataObjetcs\objInstitution.pas',
  list_spl_institution in '..\..\list\list_spl_institution.pas',
  BaseController in '..\..\controller\BaseController.pas',
  cad_user in '..\framework\cad_user.pas' {CadUser},
  tas_sincronize in 'tas_sincronize.pas' {TasSincronize},
  fm_sea_order_sale in 'fm_sea_order_sale.pas' {FmSeaOrderSale: TFrame},
  fm_sea_customer in 'fm_sea_customer.pas' {FmSeaCustomer: TFrame},
  fm_sea_product in 'fm_sea_product.pas' {FmSeaProduct: TFrame},
  sea_customer in 'sea_customer.pas' {SeaCustomer},
  sea_product in 'sea_product.pas' {SeaProduct};

{$R *.res}

begin
  Application.Initialize;

  {$IFDEF WIN32}
  {$IFDEF DEBUG}
  FullDebugModeScanMemoryPoolBeforeEveryOperation := True;
  ReportMemoryLeaksOnShutdown := True;
  SuppressMessageBoxes := FAlse;
  {$ENDIF}

  {$ENDIF }


  Application.CreateForm(TUMM, UMM);
  Application.CreateForm(Tsplash, splash);
  Application.CreateForm(TAuthCM, AuthCM);
  Application.CreateForm(TDataCM, DataCM);
  Application.Run;
end.


