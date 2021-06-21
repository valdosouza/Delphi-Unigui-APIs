program ApiNFe;

uses
  Vcl.Forms,
  Web.WebReq,
  IdHTTPWebBrokerBridge,
  Main in 'Main.pas' {MainForm},
  uSC in 'uSC.pas' {SC: TDataModule},
  prm_rep_order in '..\parameter\prm_rep_order.pas',
  msg_form in 'repository\msg_form.pas' {MsgForm},
  unmessages in 'function\unmessages.pas',
  Md5 in '..\function\Md5.pas',
  UnFunctions in 'function\UnFunctions.pas',
  prm_to_invoice in '..\parameter\prm_to_invoice.pas',
  CAtribEntity in '..\framework\CAtribEntity.pas',
  GenericEntity in '..\framework\GenericEntity.pas',
  GenericDao in '..\framework\GenericDao.pas',
  tblOrderItemIpi in '..\model\tblOrderItemIpi .pas',
  prm_invoice_merchandise in '..\parameter\prm_invoice_merchandise.pas',
  prm_invoice_shipping in '..\parameter\prm_invoice_shipping.pas',
  UnGestao in 'function\UnGestao.pas',
  BaseController in '..\controller\BaseController.pas',
  ControllerAccounting in '..\controller\ControllerAccounting.pas',
  ControllerAddress in '..\controller\ControllerAddress.pas',
  ControllerAdvertiser in '..\controller\ControllerAdvertiser.pas',
  ControllerAgency in '..\controller\ControllerAgency.pas',
  ControllerBank in '..\controller\ControllerBank.pas',
  ControllerBankAccount in '..\controller\ControllerBankAccount.pas',
  ControllerBankChangeKind in '..\controller\ControllerBankChangeKind.pas',
  ControllerBankChargeKind in '..\controller\ControllerBankChargeKind.pas',
  ControllerBankChargeSlip in '..\controller\ControllerBankChargeSlip.pas',
  ControllerBankChargeTicket in '..\controller\ControllerBankChargeTicket.pas',
  ControllerBankHistoric in '..\controller\ControllerBankHistoric.pas',
  ControllerBrand in '..\controller\ControllerBrand.pas',
  ControllerBroadcaster in '..\controller\ControllerBroadcaster.pas',
  ControllerCarrier in '..\controller\ControllerCarrier.pas',
  ControllerCategory in '..\controller\ControllerCategory.pas',
  ControllerCfop in '..\controller\ControllerCfop.pas',
  ControllerCfopToCfop in '..\controller\ControllerCfopToCfop.pas',
  ControllerChartAccounts in '..\controller\ControllerChartAccounts.pas',
  ControllerCheckCtrl in '..\controller\ControllerCheckCtrl.pas',
  ControllerCity in '..\controller\ControllerCity.pas',
  ControllerCollaborator in '..\controller\ControllerCollaborator.pas',
  ControllerColor in '..\controller\ControllerColor.pas',
  ControllerCompany in '..\controller\ControllerCompany.pas',
  ControllerConfigNef65 in '..\controller\ControllerConfigNef65.pas',
  ControllerConfigNfe in '..\controller\ControllerConfigNfe.pas',
  ControllerConfigNfe55 in '..\controller\ControllerConfigNfe55.pas',
  ControllerConfigNfe65 in '..\controller\ControllerConfigNfe65.pas',
  ControllerContact in '..\controller\ControllerContact.pas',
  ControllerCountry in '..\controller\ControllerCountry.pas',
  ControllerCustomer in '..\controller\ControllerCustomer.pas',
  ControllerDeterBaseTaxIcms in '..\controller\ControllerDeterBaseTaxIcms.pas',
  ControllerDeterBaseTaxIcmsST in '..\controller\ControllerDeterBaseTaxIcmsST.pas',
  ControllerDischargeIcms in '..\controller\ControllerDischargeIcms.pas',
  ControllerEntity in '..\controller\ControllerEntity.pas',
  ControllerEntityFiscal in '..\controller\ControllerEntityFiscal.pas',
  ControllerEntityHasMailing in '..\controller\ControllerEntityHasMailing.pas',
  ControllerExtAgent in '..\controller\ControllerExtAgent.pas',
  ControllerExtKind in '..\controller\ControllerExtKind.pas',
  ControllerExtMotive in '..\controller\ControllerExtMotive.pas',
  ControllerExtMotivos in '..\controller\ControllerExtMotivos.pas',
  ControllerExtSeal in '..\controller\ControllerExtSeal.pas',
  ControllerExtTester in '..\controller\ControllerExtTester.pas',
  ControllerFinancial in '..\controller\ControllerFinancial.pas',
  ControllerFinancialBills in '..\controller\ControllerFinancialBills.pas',
  ControllerFinancialPayment in '..\controller\ControllerFinancialPayment.pas',
  ControllerFinancialPlans in '..\controller\ControllerFinancialPlans.pas',
  ControllerFreightMode in '..\controller\ControllerFreightMode.pas',
  ControllerConfig in '..\controller\ControllerConfig.pas',
  ControllerInstitution in '..\controller\ControllerInstitution.pas',
  ControllerInstitutionHasEntity in '..\controller\ControllerInstitutionHasEntity.pas',
  ControllerInstitutionHasModule in '..\controller\ControllerInstitutionHasModule.pas',
  ControllerInstitutionHasPaymentTypes in '..\controller\ControllerInstitutionHasPaymentTypes.pas',
  ControllerInstitutionHasUser in '..\controller\ControllerInstitutionHasUser.pas',
  ControllerInterface in '..\controller\ControllerInterface.pas',
  ControllerInterfaceHasPrivilege in '..\controller\ControllerInterfaceHasPrivilege.pas',
  ControllerinvoceCtrlFlow in '..\controller\ControllerinvoceCtrlFlow.pas',
  Controllerinvoice in '..\controller\Controllerinvoice.pas',
  Controllerinvoicemerchandise in '..\controller\Controllerinvoicemerchandise.pas',
  ControllerInvoicePurchase in '..\controller\ControllerInvoicePurchase.pas',
  ControllerInvoiceReturn55 in '..\controller\ControllerInvoiceReturn55.pas',
  ControllerInvoiceReturn65 in '..\controller\ControllerInvoiceReturn65.pas',
  ControllerInvoiceReturnService in '..\controller\ControllerInvoiceReturnService.pas',
  ControllerInvoiceSale in '..\controller\ControllerInvoiceSale.pas',
  ControllerInvoiceService in '..\controller\ControllerInvoiceService.pas',
  ControllerInvoiceShipping in '..\controller\ControllerInvoiceShipping.pas',
  ControllerItemISSqn in '..\controller\ControllerItemISSqn.pas',
  ControllerLineBusiness in '..\controller\ControllerLineBusiness.pas',
  ControllerMailing in '..\controller\ControllerMailing.pas',
  ControllerMailingGroup in '..\controller\ControllerMailingGroup.pas',
  ControllerMeasure in '..\controller\ControllerMeasure.pas',
  ControllerMedInsertDate in '..\controller\ControllerMedInsertDate.pas',
  ControllerMedMaterial in '..\controller\ControllerMedMaterial.pas',
  ControllerMedParts in '..\controller\ControllerMedParts.pas',
  ControllerMedPartsJr in '..\controller\ControllerMedPartsJr.pas',
  ControllerMedPartsRt in '..\controller\ControllerMedPartsRt.pas',
  ControllerMedPosProg in '..\controller\ControllerMedPosProg.pas',
  ControllerMerchandise in '..\controller\ControllerMerchandise.pas',
  ControllerMerchandiseHasProvider in '..\controller\ControllerMerchandiseHasProvider.pas',
  ControllerMerchandiseHasSelf in '..\controller\ControllerMerchandiseHasSelf.pas',
  ControllerModule in '..\controller\ControllerModule.pas',
  ControllerModuleHasInterface in '..\controller\ControllerModuleHasInterface.pas',
  ControllerObservation in '..\controller\ControllerObservation.pas',
  ControllerOrdemItemcofins in '..\controller\ControllerOrdemItemcofins.pas',
  ControllerOrder in '..\controller\ControllerOrder.pas',
  ControllerOrderBilling in '..\controller\ControllerOrderBilling.pas',
  ControllerOrderBudgedMedia in '..\controller\ControllerOrderBudgedMedia.pas',
  ControllerOrderBudget in '..\controller\ControllerOrderBudget.pas',
  ControllerOrderCost in '..\controller\ControllerOrderCost.pas',
  ControllerOrderHasProduction in '..\controller\ControllerOrderHasProduction.pas',
  ControllerOrderHasPurchase in '..\controller\ControllerOrderHasPurchase.pas',
  ControllerOrderItem in '..\controller\ControllerOrderItem.pas',
  ControllerOrderItemCofins in '..\controller\ControllerOrderItemCofins.pas',
  ControllerOrderItemdetail in '..\controller\ControllerOrderItemdetail.pas',
  ControllerOrderItemIcms in '..\controller\ControllerOrderItemIcms.pas',
  ControllerOrderItemII in '..\controller\ControllerOrderItemII.pas',
  ControllerOrderItemIpi in '..\controller\ControllerOrderItemIpi.pas',
  ControllerOrderItemISSqn in '..\controller\ControllerOrderItemISSqn.pas',
  ControllerOrderItemLoose in '..\controller\ControllerOrderItemLoose.pas',
  ControllerOrderItemPacking in '..\controller\ControllerOrderItemPacking.pas',
  ControllerOrderItemPis in '..\controller\ControllerOrderItemPis.pas',
  ControllerOrderJob in '..\controller\ControllerOrderJob.pas',
  ControllerOrderJobHasBought in '..\controller\ControllerOrderJobHasBought.pas',
  ControllerOrderJobHasReserved in '..\controller\ControllerOrderJobHasReserved.pas',
  ControllerOrderJobToDelivery in '..\controller\ControllerOrderJobToDelivery.pas',
  Controllerorderpacking in '..\controller\Controllerorderpacking.pas',
  ControllerOrderPi in '..\controller\ControllerOrderPi.pas',
  ControllerOrderProduction in '..\controller\ControllerOrderProduction.pas',
  ControllerOrderProductionProcess in '..\controller\ControllerOrderProductionProcess.pas',
  ControllerOrderPurchase in '..\controller\ControllerOrderPurchase.pas',
  ControllerOrderSale in '..\controller\ControllerOrderSale.pas',
  ControllerOrderShipping in '..\controller\ControllerOrderShipping.pas',
  ControllerOrderStockAdjust in '..\controller\ControllerOrderStockAdjust.pas',
  ControllerOrderStockTransfer in '..\controller\ControllerOrderStockTransfer.pas',
  ControllerOrderToProduction in '..\controller\ControllerOrderToProduction.pas',
  ControllerOrderTotalizer in '..\controller\ControllerOrderTotalizer.pas',
  ControllerPackage in '..\controller\ControllerPackage.pas',
  ControllerPaymentTypes in '..\controller\ControllerPaymentTypes.pas',
  ControllerPerson in '..\controller\ControllerPerson.pas',
  ControllerPhone in '..\controller\ControllerPhone.pas',
  ControllerPrice in '..\controller\ControllerPrice.pas',
  ControllerPriceList in '..\controller\ControllerPriceList.pas',
  ControllerPrivilege in '..\controller\ControllerPrivilege.pas',
  ControllerProduct in '..\controller\ControllerProduct.pas',
  ControllerProject in '..\controller\ControllerProject.pas',
  ControllerProvider in '..\controller\ControllerProvider.pas',
  ControllerSalesman in '..\controller\ControllerSalesman.pas',
  ControllerSituation in '..\controller\ControllerSituation.pas',
  ControllerSocialMedia in '..\controller\ControllerSocialMedia.pas',
  ControllerState in '..\controller\ControllerState.pas',
  ControllerStock in '..\controller\ControllerStock.pas',
  ControllerStockBalance in '..\controller\ControllerStockBalance.pas',
  ControllerStockCtrl in '..\controller\ControllerStockCtrl.pas',
  ControllerStockList in '..\controller\ControllerStockList.pas',
  ControllerStockReserved in '..\controller\ControllerStockReserved.pas',
  ControllerStockStatement in '..\controller\ControllerStockStatement.pas',
  ControllerTaxaxion in '..\controller\ControllerTaxaxion.pas',
  ControllerTaxCofins in '..\controller\ControllerTaxCofins.pas',
  ControllerTaxIcmsNR in '..\controller\ControllerTaxIcmsNR.pas',
  ControllerTaxIcmsSN in '..\controller\ControllerTaxIcmsSN.pas',
  ControllerTaxIPI in '..\controller\ControllerTaxIPI.pas',
  ControllerTaxPIS in '..\controller\ControllerTaxPIS.pas',
  ControllerTaxRuler in '..\controller\ControllerTaxRuler.pas',
  ControllerUser in '..\controller\ControllerUser.pas',
  ControllerUserHasPrivilege in '..\controller\ControllerUserHasPrivilege.pas',
  DeterBaseTaxIcmsST in '..\controller\DeterBaseTaxIcmsST.pas',
  tblExtAgent in '..\model\tblExtAgent.pas',
  tblExtKind in '..\model\tblExtKind.pas',
  tblExtMotive in '..\model\tblExtMotive.pas',
  tblExtMotivos in '..\model\tblExtMotivos.pas',
  tblExtSeal in '..\model\tblExtSeal.pas',
  tblExtTester in '..\model\tblExtTester.pas',
  tblInstitutionHasExtAgent in '..\model\tblInstitutionHasExtAgent.pas',
  tblinvoiceMerchandise in '..\model\tblinvoiceMerchandise.pas',
  tblAccounting in '..\model\tblAccounting.pas',
  tblBankChargeSlip in '..\model\tblBankChargeSlip.pas',
  tblCheckCtrl in '..\model\tblCheckCtrl.pas',
  tblOrderBudgedMedia in '..\model\tblOrderBudgedMedia.pas',
  tblCompany in '..\model\tblCompany.pas',
  tblMedInsertDate in '..\model\tblMedInsertDate.pas',
  tblTaxRuler in '..\model\tblTaxRuler.pas',
  tblDeterBaseTaxIcmsST in '..\model\tblDeterBaseTaxIcmsST.pas',
  tblDeterBaseTaxIcms in '..\model\tblDeterBaseTaxIcms.pas',
  tblTaxPIS in '..\model\tblTaxPIS.pas',
  tblTaxIPI in '..\model\tblTaxIPI.pas',
  tblTaxIcmsSN in '..\model\tblTaxIcmsSN.pas',
  tblTaxIcmsNR in '..\model\tblTaxIcmsNR.pas',
  tblTaxCofins in '..\model\tblTaxCofins.pas',
  tblBankChargeKind in '..\model\tblBankChargeKind.pas',
  tblAddress in '..\model\tblAddress.pas',
  tblAdivertiser in '..\model\tblAdivertiser.pas',
  tblAdvertiser in '..\model\tblAdvertiser.pas',
  tblAgency in '..\model\tblAgency.pas',
  tblBrand in '..\model\tblBrand.pas',
  tblBroadcaster in '..\model\tblBroadcaster.pas',
  tblCarrier in '..\model\tblCarrier.pas',
  tblCategory in '..\model\tblCategory.pas',
  tblCfop in '..\model\tblCfop.pas',
  tblCfopToCfop in '..\model\tblCfopToCfop.pas',
  tblChartAccounts in '..\model\tblChartAccounts.pas',
  tblCity in '..\model\tblCity.pas',
  tblCollaborator in '..\model\tblCollaborator.pas',
  tblColor in '..\model\tblColor.pas',
  tblConfigNfe in '..\model\tblConfigNfe.pas',
  tblConfigNfe55 in '..\model\tblConfigNfe55.pas',
  tblConfigNfe65 in '..\model\tblConfigNfe65.pas',
  tblContact in '..\model\tblContact.pas',
  tblCountry in '..\model\tblCountry.pas',
  tblCustomer in '..\model\tblCustomer.pas',
  tblDischargeIcms in '..\model\tblDischargeIcms.pas',
  tblEntity in '..\model\tblEntity.pas',
  tblEntityHasMailing in '..\model\tblEntityHasMailing.pas',
  tblFinancial in '..\model\tblFinancial.pas',
  tblFinancialBills in '..\model\tblFinancialBills.pas',
  tblFinancialPayment in '..\model\tblFinancialPayment.pas',
  tblFinancialPlans in '..\model\tblFinancialPlans.pas',
  tblInstitution in '..\model\tblInstitution.pas',
  tblInstitutionHasBrand in '..\model\tblInstitutionHasBrand.pas',
  tblInstitutionHasColor in '..\model\tblInstitutionHasColor.pas',
  tblInstitutionHasEntity in '..\model\tblInstitutionHasEntity.pas',
  tblInstitutionHasLineBusiness in '..\model\tblInstitutionHasLineBusiness.pas',
  tblInstitutionHasMeasure in '..\model\tblInstitutionHasMeasure.pas',
  tblInstitutionHasModule in '..\model\tblInstitutionHasModule.pas',
  tblInstitutionHasPackage in '..\model\tblInstitutionHasPackage.pas',
  tblInstitutionHasPaymentTypes in '..\model\tblInstitutionHasPaymentTypes.pas',
  tblInstitutionHasUser in '..\model\tblInstitutionHasUser.pas',
  tblInterface in '..\model\tblInterface.pas',
  tblInterfaceHasPrivilege in '..\model\tblInterfaceHasPrivilege.pas',
  tblinvoceCtrlFlow in '..\model\tblinvoceCtrlFlow.pas',
  tblInvoice in '..\model\tblInvoice.pas',
  tblinvoiceReturn55 in '..\model\tblinvoiceReturn55.pas',
  tblinvoiceReturn65 in '..\model\tblinvoiceReturn65.pas',
  tblinvoiceReturnService in '..\model\tblinvoiceReturnService.pas',
  tblinvoiceService in '..\model\tblinvoiceService.pas',
  tblInvoiceShipping in '..\model\tblInvoiceShipping.pas',
  tblLinebusiness in '..\model\tblLinebusiness.pas',
  tblMailing in '..\model\tblMailing.pas',
  tblMailingGroup in '..\model\tblMailingGroup.pas',
  tblMeasure in '..\model\tblMeasure.pas',
  tblMedMaterial in '..\model\tblMedMaterial.pas',
  tblMedParts in '..\model\tblMedParts.pas',
  tblMedPartsJr in '..\model\tblMedPartsJr.pas',
  tblMedPartsRt in '..\model\tblMedPartsRt.pas',
  tblMedPosProg in '..\model\tblMedPosProg.pas',
  tblMerchandise in '..\model\tblMerchandise.pas',
  tblMerchandiseHasProvider in '..\model\tblMerchandiseHasProvider.pas',
  tblMerchandiseHasSelf in '..\model\tblMerchandiseHasSelf.pas',
  tblModule in '..\model\tblModule.pas',
  tblModuleHasInterface in '..\model\tblModuleHasInterface.pas',
  tblObservation in '..\model\tblObservation.pas',
  tblOrder in '..\model\tblOrder.pas',
  tblOrderBilling in '..\model\tblOrderBilling.pas',
  tblOrderBudget in '..\model\tblOrderBudget.pas',
  TblOrderCost in '..\model\TblOrderCost.pas',
  tblOrderHasProduction in '..\model\tblOrderHasProduction.pas',
  tblOrderItem in '..\model\tblOrderItem.pas',
  tblOrderItemDetail in '..\model\tblOrderItemDetail.pas',
  tblOrderItemIcms in '..\model\tblOrderItemIcms.pas',
  tblOrderItemII in '..\model\tblOrderItemII.pas',
  tblOrderItemISSqn in '..\model\tblOrderItemISSqn.pas',
  tblOrderItemLoose in '..\model\tblOrderItemLoose .pas',
  tblOrderItemPacking in '..\model\tblOrderItemPacking.pas',
  tblOrderItemPis in '..\model\tblOrderItemPis.pas',
  tblOrderJob in '..\model\tblOrderJob.pas',
  tblOrderJobHasBought in '..\model\tblOrderJobHasBought.pas',
  tblOrderJobHasReserved in '..\model\tblOrderJobHasReserved.pas',
  tblorderpacking in '..\model\tblorderpacking.pas',
  tblOrderPi in '..\model\tblOrderPi.pas',
  tblOrderProduction in '..\model\tblOrderProduction.pas',
  tblOrderProductionProcess in '..\model\tblOrderProductionProcess.pas',
  tblorderpurchase in '..\model\tblorderpurchase.pas',
  tblOrderSale in '..\model\tblOrderSale.pas',
  tblOrderShipping in '..\model\tblOrderShipping.pas',
  tblOrderStockAdjust in '..\model\tblOrderStockAdjust.pas',
  tblOrderStockTransfer in '..\model\tblOrderStockTransfer.pas',
  tblOrderToProduction in '..\model\tblOrderToProduction.pas',
  tblPackage in '..\model\tblPackage.pas',
  tblPaymentTypes in '..\model\tblPaymentTypes.pas',
  tblPerson in '..\model\tblPerson.pas',
  tblPhone in '..\model\tblPhone.pas',
  tblPrice in '..\model\tblPrice.pas',
  tblPriceList in '..\model\tblPriceList.pas',
  tblPrivilege in '..\model\tblPrivilege.pas',
  tblProduct in '..\model\tblProduct.pas',
  tblProject in '..\model\tblProject.pas',
  tblProvider in '..\model\tblProvider.pas',
  tblSalesman in '..\model\tblSalesman.pas',
  tblSituation in '..\model\tblSituation.pas',
  tblSocialMedia in '..\model\tblSocialMedia.pas',
  tblState in '..\model\tblState.pas',
  tblStock in '..\model\tblStock.pas',
  tblStockBalance in '..\model\tblStockBalance.pas',
  tblStockCtrl in '..\model\tblStockCtrl.pas',
  tblStockList in '..\model\tblStockList.pas',
  tblStockReserved in '..\model\tblStockReserved.pas',
  tblStockStatement in '..\model\tblStockStatement.pas',
  tblUser in '..\model\tblUser.pas',
  tblUserHasPrivilege in '..\model\tblUserHasPrivilege.pas',
  tblBank in '..\model\tblBank.pas',
  tblBankAcccount in '..\model\tblBankAcccount.pas',
  tblBankAccount in '..\model\tblBankAccount.pas',
  tblBankChargeTicket in '..\model\tblBankChargeTicket.pas',
  tblBankHistoric in '..\model\tblBankHistoric.pas',
  tblFreightMode in '..\model\tblFreightMode.pas',
  tblInstitutionHasBank in '..\model\tblInstitutionHasBank.pas',
  tblOrderHasPurchase in '..\model\tblOrderHasPurchase.pas',
  tblOrderJobToDelivery in '..\model\tblOrderJobToDelivery.pas',
  tblOrderTotalizer in '..\model\tblOrderTotalizer.pas',
  tblConfig in '..\model\tblConfig.pas',
  tblOrderItemCofins in '..\model\tblOrderItemCofins.pas',
  uSM in 'uSM.pas' {SM: TDSServerModule},
  MainModule in 'MainModule.pas' {UMM: TDataModule},
  ControllerOrderBudgedItemPiJr in '..\controller\ControllerOrderBudgedItemPiJr.pas',
  tblOrderBudgedItemPi in '..\model\tblOrderBudgedItemPi.pas',
  prm_simple in '..\parameter\prm_simple.pas',
  prm_nfe in '..\parameter\prm_nfe.pas',
  ControllerInvoiceObs in '..\controller\ControllerInvoiceObs.pas',
  tblInvoiceObs in '..\model\tblInvoiceObs.pas',
  prm_call_invoice in '..\parameter\prm_call_invoice.pas',
  prm_base_report in '..\repository\prm_base_report.pas',
  tblOrderToBuy in '..\model\tblOrderToBuy.pas',
  ControllerOrderToBuy in '..\controller\ControllerOrderToBuy.pas',
  TypesCollection in '..\controller\TypesCollection.pas',
  ControllerNfeEventsSent in '..\controller\ControllerNfeEventsSent.pas',
  ClasseUtil in '..\Classes\ClasseUtil.pas',
  UnitConstantes in '..\Classes\UnitConstantes.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TMainForm, MainForm);
  Application.CreateForm(TSC, SC);
  Application.CreateForm(TUMM, UMM);
  Application.Run;
end.

