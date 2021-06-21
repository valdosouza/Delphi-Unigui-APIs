program Gerencia;

uses
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
  lista_combo_institution in 'lista_combo_institution.pas' {ListaComboInstitution},
  usplash in '..\framework\usplash.pas' {splash},
  MainModule in '..\framework\MainModule.pas' {UMM: TDataModule},
  uMain in 'uMain.pas' {Main},
  uLoginApp in 'uLoginApp.pas' {LoginApp},
  openForms in 'openForms.pas',
  uAuthCM in '..\..\restClient\autentica\uAuthCM.pas' {AuthCM: TDataModule},
  UnFunctions in '..\function\UnFunctions.pas',
  DownTables in '..\function\DownTables.pas',
  ControllerOrderSale in '..\..\controller\ControllerOrderSale.pas',
  ControllerFinancial in '..\..\controller\ControllerFinancial.pas',
  list_spl_order_sale in '..\..\list\list_spl_order_sale.pas',
  list_spl_order_sale_items in '..\..\list\list_spl_order_sale_items.pas',
  Network in '..\function\Network.pas',
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
  ControllerBrand in '..\..\controller\ControllerBrand.pas',
  ControllerMerchandise in '..\..\controller\ControllerMerchandise.pas',
  ControllerPriceList in '..\..\controller\ControllerPriceList.pas',
  ControllerProduct in '..\..\controller\ControllerProduct.pas',
  ControllerStock in '..\..\controller\ControllerStock.pas',
  ControllerStockBalance in '..\..\controller\ControllerStockBalance.pas',
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
  tas_sincronize in 'tas_sincronize.pas' {TasSincronize},
  sea_web_order_sale in 'sea_web_order_sale.pas' {SeaWebOrderSale},
  list_spl_base in '..\..\list\list_spl_base.pas',
  list_spl_Value in '..\..\list\list_spl_Value.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TUMM, UMM);
  Application.CreateForm(Tsplash, splash);
  Application.CreateForm(TAuthCM, AuthCM);
  Application.CreateForm(TDataCM, DataCM);
  Application.Run;
end.
