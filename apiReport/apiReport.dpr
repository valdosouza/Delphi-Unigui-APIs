program apiReport;
{$APPTYPE GUI}

uses
  {$IFDEF DEBUG}
  FastMM4,
  {$ENDIF }
  Vcl.Forms,
  Web.WebReq,
  IdHTTPWebBrokerBridge,
  uMain in 'uMain.pas' {Main},
  uSM in 'uSM.pas' {SM: TDSServerModule},
  prm_rep_order in '..\parameter\prm_rep_order.pas',
  base_report in 'repository\base_report.pas' {BaseReport},
  base_report_list in 'repository\base_report_list.pas' {BaseReportList},
  tblInstitution in '..\model\tblInstitution.pas',
  ControllerInstitution in '..\controller\ControllerInstitution.pas',
  BaseController in '..\controller\BaseController.pas',
  CAtribEntity in '..\framework\CAtribEntity.pas',
  GenericDao in '..\framework\GenericDao.pas',
  GenericEntity in '..\framework\GenericEntity.pas',
  ControllerAddress in '..\controller\ControllerAddress.pas',
  tblAddress in '..\model\tblAddress.pas',
  ControllerCountry in '..\controller\ControllerCountry.pas',
  tblCountry in '..\model\tblCountry.pas',
  ControllerState in '..\controller\ControllerState.pas',
  tblState in '..\model\tblState.pas',
  ControllerCity in '..\controller\ControllerCity.pas',
  tblCity in '..\model\tblCity.pas',
  ControllerCompany in '..\controller\ControllerCompany.pas',
  tblCompany in '..\model\tblCompany.pas',
  tblEntity in '..\model\tblEntity.pas',
  ControllerPerson in '..\controller\ControllerPerson.pas',
  tblPerson in '..\model\tblPerson.pas',
  ControllerEntity in '..\controller\ControllerEntity.pas',
  tblInstitutionHasEntity in '..\model\tblInstitutionHasEntity.pas',
  ControllerPhone in '..\controller\ControllerPhone.pas',
  tblPhone in '..\model\tblPhone.pas',
  UnFunctions in 'function\UnFunctions.pas',
  msg_form in 'repository\msg_form.pas' {MsgForm},
  unmessages in 'function\unmessages.pas',
  ControllerMailing in '..\controller\ControllerMailing.pas',
  tblMailing in '..\model\tblMailing.pas',
  ControllerMailingGroup in '..\controller\ControllerMailingGroup.pas',
  tblMailingGroup in '..\model\tblMailingGroup.pas',
  ControllerEntityHasMailing in '..\controller\ControllerEntityHasMailing.pas',
  tblEntityHasMailing in '..\model\tblEntityHasMailing.pas',
  ControllerSocialMedia in '..\controller\ControllerSocialMedia.pas',
  tblSocialMedia in '..\model\tblSocialMedia.pas',
  ControllerLineBusiness in '..\controller\ControllerLineBusiness.pas',
  tblLinebusiness in '..\model\tblLinebusiness.pas',
  tblInstitutionHasPaymentTypes in '..\model\tblInstitutionHasPaymentTypes.pas',
  tblInstitutionHasLineBusiness in '..\model\tblInstitutionHasLineBusiness.pas',
  ControllerInstitutionHasEntity in '..\controller\ControllerInstitutionHasEntity.pas',
  ControllerInstitutionHasModule in '..\controller\ControllerInstitutionHasModule.pas',
  tblInstitutionHasModule in '..\model\tblInstitutionHasModule.pas',
  ControllerModule in '..\controller\ControllerModule.pas',
  tblModule in '..\model\tblModule.pas',
  ControllerInterface in '..\controller\ControllerInterface.pas',
  tblInterfaceHasPrivilege in '..\model\tblInterfaceHasPrivilege.pas',
  tblInterface in '..\model\tblInterface.pas',
  ControllerInterfaceHasPrivilege in '..\controller\ControllerInterfaceHasPrivilege.pas',
  ControllerPrivilege in '..\controller\ControllerPrivilege.pas',
  tblPrivilege in '..\model\tblPrivilege.pas',
  ControllerModuleHasInterface in '..\controller\ControllerModuleHasInterface.pas',
  tblModuleHasInterface in '..\model\tblModuleHasInterface.pas',
  rep_order_purchase_01 in 'purchase\rep_order_purchase_01.pas' {RepOrderPurchase_01},
  ControllerOrderPurchase in '..\controller\ControllerOrderPurchase.pas',
  tblorderpurchase in '..\model\tblorderpurchase.pas',
  ControllerProvider in '..\controller\ControllerProvider.pas',
  ControllerPaymentTypes in '..\controller\ControllerPaymentTypes.pas',
  tblPaymentTypes in '..\model\tblPaymentTypes.pas',
  tblProvider in '..\model\tblProvider.pas',
  ControllerOrder in '..\controller\ControllerOrder.pas',
  tblOrder in '..\model\tblOrder.pas',
  ControllerOrderTotalizer in '..\controller\ControllerOrderTotalizer.pas',
  tblOrderTotalizer in '..\model\tblOrderTotalizer.pas',
  ControllerOrderItem in '..\controller\ControllerOrderItem.pas',
  tblOrderItem in '..\model\tblOrderItem.pas',
  ControllerMerchandise in '..\controller\ControllerMerchandise.pas',
  tblMerchandise in '..\model\tblMerchandise.pas',
  ControllerBrand in '..\controller\ControllerBrand.pas',
  tblBrand in '..\model\tblBrand.pas',
  tblInstitutionHasBrand in '..\model\tblInstitutionHasBrand.pas',
  ControllerProduct in '..\controller\ControllerProduct.pas',
  tblProduct in '..\model\tblProduct.pas',
  ControllerCategory in '..\controller\ControllerCategory.pas',
  tblCategory in '..\model\tblCategory.pas',
  ControllerStock in '..\controller\ControllerStock.pas',
  tblStock in '..\model\tblStock.pas',
  ControllerPackage in '..\controller\ControllerPackage.pas',
  ControllerMeasure in '..\controller\ControllerMeasure.pas',
  ControllerColor in '..\controller\ControllerColor.pas',
  tblColor in '..\model\tblColor.pas',
  tblPackage in '..\model\tblPackage.pas',
  tblMeasure in '..\model\tblMeasure.pas',
  tblInstitutionHasPackage in '..\model\tblInstitutionHasPackage.pas',
  tblInstitutionHasMeasure in '..\model\tblInstitutionHasMeasure.pas',
  tblInstitutionHasColor in '..\model\tblInstitutionHasColor.pas',
  ControllerPrice in '..\controller\ControllerPrice.pas',
  tblPrice in '..\model\tblPrice.pas',
  ControllerStockBalance in '..\controller\ControllerStockBalance.pas',
  tblStockBalance in '..\model\tblStockBalance.pas',
  ControllerStockList in '..\controller\ControllerStockList.pas',
  tblStockList in '..\model\tblStockList.pas',
  ControllerMerchandiseHasProvider in '..\controller\ControllerMerchandiseHasProvider.pas',
  tblMerchandiseHasProvider in '..\model\tblMerchandiseHasProvider.pas',
  ControllerOrderItemdetail in '..\controller\ControllerOrderItemdetail.pas',
  tblOrderItemDetail in '..\model\tblOrderItemDetail.pas',
  ControllerCarrier in '..\controller\ControllerCarrier.pas',
  tblCarrier in '..\model\tblCarrier.pas',
  tblOrderShipping in '..\model\tblOrderShipping.pas',
  ControllerOrderShipping in '..\controller\ControllerOrderShipping.pas',
  ControllerOrderBilling in '..\controller\ControllerOrderBilling.pas',
  tblOrderBudget in '..\model\tblOrderBudget.pas',
  tblOrderBilling in '..\model\tblOrderBilling.pas',
  rep_order_stock_transfer_01 in 'StockTransfer\rep_order_stock_transfer_01.pas' {RepOrderStockTransfer_01},
  rep_order_job_01 in 'OrderJob\rep_order_job_01.pas' {RepOrderJob_01},
  ControllerOrderStockTransfer in '..\controller\ControllerOrderStockTransfer.pas',
  tblOrderStockTransfer in '..\model\tblOrderStockTransfer.pas',
  ControllerSituation in '..\controller\ControllerSituation.pas',
  tblSituation in '..\model\tblSituation.pas',
  ControllerCustomer in '..\controller\ControllerCustomer.pas',
  tblCustomer in '..\model\tblCustomer.pas',
  ControllerSalesman in '..\controller\ControllerSalesman.pas',
  tblSalesman in '..\model\tblSalesman.pas',
  ControllerEntityFiscal in '..\controller\ControllerEntityFiscal.pas',
  ControllerOrderJob in '..\controller\ControllerOrderJob.pas',
  tblOrderJob in '..\model\tblOrderJob.pas',
  rep_order_stock_adjust_01 in 'StockAdjust\rep_order_stock_adjust_01.pas' {RepOrderStockAdjust_01},
  ControllerFreightMode in '..\controller\ControllerFreightMode.pas',
  tblFreightMode in '..\model\tblFreightMode.pas',
  ControllerStockReserved in '..\controller\ControllerStockReserved.pas',
  tblStockReserved in '..\model\tblStockReserved.pas',
  ControllerOrderJobHasReserved in '..\controller\ControllerOrderJobHasReserved.pas',
  tblOrderJobHasReserved in '..\model\tblOrderJobHasReserved.pas',
  ControllerOrderToProduction in '..\controller\ControllerOrderToProduction.pas',
  tblOrderToProduction in '..\model\tblOrderToProduction.pas',
  ControllerOrderHasProduction in '..\controller\ControllerOrderHasProduction.pas',
  tblOrderHasProduction in '..\model\tblOrderHasProduction.pas',
  ControllerOrderStockAdjust in '..\controller\ControllerOrderStockAdjust.pas',
  tblOrderStockAdjust in '..\model\tblOrderStockAdjust.pas',
  Controllerorderpacking in '..\controller\Controllerorderpacking.pas',
  tblorderpacking in '..\model\tblorderpacking.pas',
  ControllerOrderPi in '..\controller\ControllerOrderPi.pas',
  tblOrderPi in '..\model\tblOrderPi.pas',
  tblMedPartsJr in '..\model\tblMedPartsJr.pas',
  ControllerAgency in '..\controller\ControllerAgency.pas',
  tblAgency in '..\model\tblAgency.pas',
  ControllerAdvertiser in '..\controller\ControllerAdvertiser.pas',
  tblAdvertiser in '..\model\tblAdvertiser.pas',
  ControllerBroadcaster in '..\controller\ControllerBroadcaster.pas',
  tblBroadcaster in '..\model\tblBroadcaster.pas',
  ControllerMedPartsJr in '..\controller\ControllerMedPartsJr.pas',
  tblMedParts in '..\model\tblMedParts.pas',
  ControllerMedMaterial in '..\controller\ControllerMedMaterial.pas',
  tblMedMaterial in '..\model\tblMedMaterial.pas',
  ControllerMedPosProg in '..\controller\ControllerMedPosProg.pas',
  tblMedPosProg in '..\model\tblMedPosProg.pas',
  ControllerMedInsertDate in '..\controller\ControllerMedInsertDate.pas',
  tblMedInsertDate in '..\model\tblMedInsertDate.pas',
  rep_product in 'product\rep_product.pas' {RepProduct},
  rep_product_file in 'product\rep_product_file.pas' {RepProductFile},
  rep_financial in 'financial\rep_financial.pas' {RepFinancial},
  rep_financial_bills in 'financial\rep_financial_bills.pas' {RepFinancialBills},
  rep_financial_payment in 'financial\rep_financial_payment.pas' {RepFinancialPayment},
  rep_invoice in 'invoice\rep_invoice.pas' {RepInvoice},
  rep_invoice_list in 'invoice\rep_invoice_list.pas' {RepInvoiceList},
  prm_base_report in '..\repository\prm_base_report.pas',
  rep_carrier_file in 'carrier\rep_carrier_file.pas' {RepCarrierFile},
  rep_customer_file in 'customer\rep_customer_file.pas' {RepCustomerFile},
  rep_provider_file in 'provider\rep_provider_file.pas' {RepProviderFile},
  rep_entity in 'entity\rep_entity.pas' {RepEntity},
  rep_order_list in 'order\rep_order_list.pas' {RepOrderList},
  rep_order_list_purchase in 'purchase\rep_order_list_purchase.pas' {RepOrderListPurchase},
  rep_order_list_sale in 'sale\rep_order_list_sale.pas' {RepOrderListSale},
  rep_order_list_adjust in 'StockAdjust\rep_order_list_adjust.pas' {RepOrderListAdjust},
  rep_order_list_job in 'OrderJob\rep_order_list_job.pas' {RepOrderListJob},
  rep_order_list_stock_transfer in 'StockTransfer\rep_order_list_stock_transfer.pas' {RepOrderListStockTransfer02},
  rep_order_list_packing in 'packing\rep_order_list_packing.pas' {RepOrderListPacking},
  rep_order_packing_01 in 'packing\rep_order_packing_01.pas' {RepOrderPacking_01},
  ControllerInstitutionHasPaymentTypes in '..\controller\ControllerInstitutionHasPaymentTypes.pas',
  ControllerPriceList in '..\controller\ControllerPriceList.pas',
  tblPriceList in '..\model\tblPriceList.pas',
  tblOrderToBuy in '..\model\tblOrderToBuy.pas',
  ControllerOrderToBuy in '..\controller\ControllerOrderToBuy.pas',
  rep_order_pi_01 in 'OrderPi\rep_order_pi_01.pas' {RL_PI},
  rep_order_pi_02 in 'OrderPi\rep_order_pi_02.pas' {RepOrderPi_02},
  ControllerMedPartsRt in '..\controller\ControllerMedPartsRt.pas',
  tblMedPartsRt in '..\model\tblMedPartsRt.pas',
  ControllerMedParts in '..\controller\ControllerMedParts.pas',
  UnitConstantes in '..\Classes\UnitConstantes.pas',
  ClasseUtil in '..\Classes\ClasseUtil.pas',
  un_frx_base_report in 'repository\un_frx_base_report.pas' {FrxBaseReport},
  un_frx_base_report_list in 'repository\un_frx_base_report_list.pas' {FrxBaseReportList},
  ControllerFinancialStatement in '..\controller\ControllerFinancialStatement.pas',
  un_frx_report_financial_manager in 'financial\un_frx_report_financial_manager.pas' {FrxReportFinancialManager},
  Md5 in '..\share\function\Md5.pas',
  un_frx_report_media_parts in 'OrderPi\un_frx_report_media_parts.pas' {FrxReportMediaParts},
  rep_financial_media_to_receive in 'OrderPi\rep_financial_media_to_receive.pas' {RepFinancialMediaToReceive},
  rep_financial_media_to_receive_open in 'OrderPi\rep_financial_media_to_receive_open.pas' {RepFinancialMediaToRreceiveOpen},
  rep_financial_media_to_receive_closed in 'OrderPi\rep_financial_media_to_receive_closed.pas' {RepFinancialMediaToRreceiveClosed},
  rep_financial_media_to_receive_all in 'OrderPi\rep_financial_media_to_receive_all.pas' {RepFinancialMediaToRreceiveAll},
  uWM in 'uWM.pas' {WM: TWebModule},
  tblDskPromotion in 'D:\Gestao2016\module\tblDskPromotion.pas',
  tblDskPromotionItems in 'D:\Gestao2016\module\tblDskPromotionItems.pas',
  uDataCM in '..\restClient\apiData\uDataCM.pas' {DataCM: TDataModule},
  uAuthCM in '..\restClient\autentica\uAuthCM.pas' {AuthCM: TDataModule},
  un_frx_bud_advertise in 'media\un_frx_bud_advertise.pas' {FrxBudAdvertise},
  MainModule in 'MainModule.pas' {SC: TDataModule},
  uSMMedia in 'uSMMedia.pas',
  prm_rep_budg_advertise in '..\parameter\prm_rep_budg_advertise.pas',
  un_qrp_bud_advertise in 'media\un_qrp_bud_advertise.pas' {QrpBudAdvertise},
  uSMFinancial in 'uSMFinancial.pas',
  uSMGeneral in 'uSMGeneral.pas';

{$R *.res}

begin
  {$IFDEF DEBUG}
    FullDebugModeScanMemoryPoolBeforeEveryOperation := True;
    ReportMemoryLeaksOnShutdown := True;
    SuppressMessageBoxes := FAlse;
  {$ENDIF}

  if WebRequestHandler <> nil then
    WebRequestHandler.WebModuleClass := WebModuleClass;
  Application.Initialize;
  Application.CreateForm(TMain, Main);
  Application.Run;
end.
