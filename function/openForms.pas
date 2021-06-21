unit openForms;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, Dialogs, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIRegClasses, uniGUIForm, uniGUIBaseClasses, uniEdit,
  uniButton, uniLabel, uniBitBtn, uniPanel, Vcl.Menus, uniMainMenu,
  uniGUIVars, MainModule, uniGUIApplication,  cad_entity, cad_entity_fiscal, cad_provider, cad_payment_types,
  cad_brand, cad_package, cad_measure, cad_category, cad_product, cad_color,
  cad_merchandise,cad_carrier,cad_salesman,cad_price_list,tas_changePassWord,
  sea_brand,sea_package,sea_measure,sea_color,sea_entity,sea_entity_fiscal,sea_institution,sea_customer,sea_provider,sea_city,
  sea_country,sea_linebusiness,sea_merchandise,sea_payment_types,sea_state,sea_product,
  sea_stock_list, cad_stock_list, sea_price_list, sea_order, tas_Order, tas_xml_import_nfe,
  super_module, cad_module, sea_module, sea_interface, cad_interface, sea_privilege,
  cad_privilege, tas_order_purchase, sea_order_purchase,sea_advertiser,sea_agency,sea_broadcaster,
  cad_advertiser,cad_agency,cad_broadcaster,cad_med_pos_prog,sea_med_pos_prog,cad_med_material,
  sea_med_material, sea_tax_icms_nr, cad_tax_icms_nr, cad_discharge_icms, sea_discharge_icms,
  sea_tax_icms_sn,cad_tax_icms_sn, cad_deter_base_tax_icms, sea_deter_base_tax_icms, sea_tax_ipi,
  cad_tax_ipi, cad_tax_pis, sea_tax_pis,cad_observation,sea_observation,sea_user,
  sea_deter_base_tax_icms_st,cad_deter_base_tax_icms_st,
  cad_cfop,sea_cfop,cad_tax_cofins,sea_tax_cofins, sea_tax_ruler, cad_tax_ruler,
  sea_order_pi,tas_order_pi, sea_carrier, cad_collaborator, sea_collaborator,
  tas_order_pi_jr, tas_order_pi_rt,employee_module,	tas_to_invoice, tas_order_packing,
  sea_order_packing, UniDBLookupComboBox,	sea_order_job,tas_order_job, tas_order_production,
  sea_order_production, cad_situation, sea_situation, sea_salesman, tas_order_sale, sea_order_sale,
  sale_module, tas_order_stock_adjust, sea_order_stock_adjust, tas_config_nfe_55,
  sea_invoice_merchandise, cad_su_institution, sea_ncm,
  sea_cest, sea_address_delivery, sea_contact, cad_contact,
  cad_merchandise_has_self,cad_financial_plans, sea_order_stock_transfer,
  tas_order_stock_transfer, tas_order_list_to_buy, tas_in_out_product, tas_nf_55,
  UnFunctions, tas_order_list_to_delivery, sea_extintor, cad_extintor, financial_bills_module,
  financial_payment_module, tas_financial_bills, tas_financial_payment, extintor_module,
  bank_module, cad_bank, sea_bank, cad_bank_account, sea_bank_account, cad_bank_historic,
  sea_bank_historic, cad_bank_charge_ticket, sea_bank_charge_ticket, cad_bank_charge_kind,
  sea_bank_charge_kind, cad_bank_charge_slip, sea_bank_charge_slip, cad_accounting,
  sea_accounting, tas_order_budget_pi, sea_order_budget_pi, cashier_module, tas_cashier,
  tas_check_ctrl, sea_check_ctrl, tas_useful_phone, sea_financial_statement, tas_technical_assistance,
  sea_technical_assistance, tas_set_price, cad_ext_agent, sea_ext_agent, cad_ext_kind, sea_ext_kind,
  cad_ext_tester, sea_ext_tester, cad_ext_motive, sea_ext_motive, cad_ext_seal, sea_ext_seal,
  sea_ext_maintenance, tas_ext_maintenance, tas_ext_maintenance_items,
  tas_generate_nfe_55, sea_ext_operating_test, sea_service, auto_center_module,
  cad_service, tas_ext_operating_test, tas_lot_ctrl, sea_serie_ctrl, tas_virtual_shop,
  tas_send_email_marketing,sea_veh_kind,cad_veh_kind, sea_veh_brand_model, cad_veh_brand_model,
  tas_bank_activity, tas_config_order_sale,tas_config_g_product, sea_veh_maintenance, prm_call_invoice, prm_nfe,
  cad_financial, cad_financial_bills, cad_financial_payment, edi_financial, cad_med_price_list_jr,
  cad_med_price_list_rt, cad_med_price_list_ol, tas_order_budget_item_pi_jr, tas_order_budget_item_pi_rt,
  cad_work_front, sea_work_front, sea_order_production_v2,
  tas_order_production_v2, sea_med_parts, project_module, cad_kind, sea_kind,
  cad_project, sea_project, cad_priority, sea_priority, cad_promotion, sea_promotion,
  tas_financial_bills_general, test_module, clinic_module, cad_clin_module,
  sea_clin_patient, cad_clin_patient, sea_clin_questionnaire,
  cad_clin_questionnaire, sea_clin_quiz, tas_clin_quiz, tas_user_has_privilege,
  cad_med_broadcaster_circulation, sea_order_budg_advertise,
  tas_order_budg_advertise, tas_whatsapp_web, sea_rest_menu_pizza,
  sea_rest_menu_beverage, pizzaria_module, cad_delivery_range;


type
  TOpenForm = class
    class procedure get<F: TUniForm>(Field:TUniEdit);
  end;

  procedure ShowCallBack(Sender: TComponent; AResult:Integer);

  function openDevTeste:Boolean;


  function openBaseModule(Parente:TWinControl):Boolean;
  function openEmployeeModule(Parente:TWinControl):Boolean;
  function openProjectModule(Parente:TWinControl):Boolean;
  function openMidiaModule(Parente:TWinControl):Boolean;
  function openAdmModule(Parente:TWinControl):Boolean;
  function openPurchaseModule(Parente:TWinControl):Boolean;
  function openSaleModule(Parente:TWinControl):Boolean;
  function openStockModule(Parente:TWinControl):Boolean;
  function openBuilderModule(Parente:TWinControl):Boolean;
  function openTestModule(Parente:TWinControl):Boolean;
  function openSuperModule(Parente:TWinControl):Boolean;
  function openSeaDischargeIcms(Field:TUniDBLookupComboBox):Boolean;
  function openSeaTaxIcmsNr(Field:TUniDBLookupComboBox):Boolean;
  function openSeaOrderPurchase(Field:TUniEdit):Boolean;
  function openFinancialBillsModule(Parente:TWinControl):Boolean;
  function openFinancialPaymentModule(Parente:TWinControl):Boolean;
  function openExtintorModule(Parente:TWinControl):Boolean;
  function openBankModule(Parente:TWinControl):Boolean;
  function openAutoCenter(Parente:TWinControl):Boolean;
  function openCashierModule(Parente:TWinControl):Boolean;
  function openClinicModule(Parente:TWinControl):Boolean;
  function openPizzariaModule(Parente:TWinControl):Boolean;

  //Sea - Pesquisa

  function openSeaVehicleMaintenance(Field:TUniEdit):Boolean;
  function openSeaVehicleBrandModel(Field:TUniEdit):Boolean;
  function openSeaVehicleKind(Field:TUniEdit):Boolean;
  function openSeaOrderBudgetPi(Field:TUniEdit):Boolean;
  function openSeaCollaborator(Field:TUniDBLookupComboBox):Boolean;
  function openSeaTaxRuler(Field:TUniEdit):Boolean;
  function openSeaObservation(Field:TUniDBLookupComboBox):Boolean;
  function openSeaTaxPis(Field:TUniDBLookupComboBox):Boolean;
  function openSeaTaxIpi(Field:TUniDBLookupComboBox):Boolean;
  function openSeaDeterBaseTaxIcms(Field:TUniDBLookupComboBox):Boolean;
  function openSeaRestMenu(Field:TUniDBLookupComboBox):Boolean;
  function openSeaRestMenuPizza(Field:TUniDBLookupComboBox):Boolean;
  function openSeaRestMenuBeverage(Field:TUniDBLookupComboBox):Boolean;

  function openSeaAddressDelivery(Field:TUniDBLookupComboBox):Boolean;
  function openCadDEliveryRange(Field:TUniDBLookupComboBox):Boolean;
  function openSeaCest(Field:TUniEdit):Boolean;
  function openSeaNcm(Field:TUniEdit):Boolean;
  function openSeaOrderProduction(Field:TUniEdit):Boolean;
  function openSeaOrderProductionV2(Field:TUniEdit):Boolean;

  function openSeaOrderJob(Field:TUniEdit):Boolean;
  function openSeaCarrier(Field:TUniDBLookupComboBox):Boolean;
  function openSeaPrivilege(Field:TUniEdit):Boolean;
  function openSeaInface(Field:TUniEdit):Boolean;
  function openSeaModule(Field:TUniEdit):Boolean;
  function openSeaStockList(Field:TUniDBLookupComboBox):Boolean;
  function openSeaBrand(Field:TUniDBLookupComboBox):Boolean;
  function openSeaWorkFront(Field:TUniDBLookupComboBox):Boolean;
  function openSeaPackage(Field:TUniDBLookupComboBox):Boolean;
  function openSeaMeasure(Field:TUniDBLookupComboBox):Boolean;
  function openSeaColors(Field:TUniDBLookupComboBox):Boolean;
  function openSeaEntity(Field:TUniDBLookupComboBox):Boolean;
  function openSeaEntityFiscal(Field:TUniDBLookupComboBox):Boolean;
  function openSeaInstitution(Institution:Integer):Boolean;
  function openSeaCustomer(Field:TUniDBLookupComboBox):Boolean;
  function openSeaProvider(Field:TUniDBLookupComboBox):Boolean;
  function openSeaCity(Field:TUniDBLookupComboBox):Boolean;
  function openSeaCountry(Field:TUniDBLookupComboBox):Boolean;
  function openSeaLineBusiness(Field:TUniDBLookupComboBox):Boolean;
  function openSeaMerchandise(Field:TUniDBLookupComboBox):Boolean;
  function openSeaPaymentTypes(Field:TUniDBLookupComboBox):Boolean;
  function openSeaState(Field:TUniedit):Boolean;
  function openSeaService(Field:TUniedit):Boolean;
  function openSeaUser(Institution:Integer):Boolean;
  function OpenToInvoice(pr:TPrmCallInvoice):Boolean;
  function OpenAuthorizeNfe55(Pr :TPrmNFe):Boolean;
  function openSeaClinProfessional(Field:TUniDBLookupComboBox):Boolean;
  function openSeaClinModule(Field:TUniDBLookupComboBox):Boolean;
  function openSeaClinPatient(Field:TUniDBLookupComboBox):Boolean;
  function openSeaClinQuestionnaire(Field:TUniDBLookupComboBox):Boolean;
  function openSeaClinQuiz(Field:TUniDBLookupComboBox):Boolean;
  function openTasClinQuiz(Field:TUniDBLookupComboBox):Boolean;
  function OpenTasUserHasPrivilege(Field:TUniDBLookupComboBox):Boolean;

  function OpenEdiFinancial(CodeId,Parcela:Integer):Boolean;
  function OpenCadFinancialBills(CodID:Integer):Boolean;
  function OpenCadFinancialPayment():Boolean;

  function openSeaProduct(Field:TUniDBLookupComboBox):Boolean;
  function openSeaPriceList(Field:TUniDBLookupComboBox):Boolean;
  function openSeaAdvertiser(Field:TUniDBLookupComboBox):Boolean;
  function openSeaAgency(Field:TUniDBLookupComboBox):Boolean;
  function openSeaBroadcaster(Field:TUniDBLookupComboBox):Boolean;
  function openSeaMedPosProg(Field:TUniDBLookupComboBox):Boolean;
  function openSeaMedMaterial(Field:TUniDBLookupComboBox):Boolean;
  function openSeaTaxIcmsSN(Field:TUniDBLookupComboBox):Boolean;
  function openSeaDeterBaseTaxIcmsST(Field:TUniDBLookupComboBox):Boolean;
  function openSeaCfop(Field:TUniDBLookupComboBox):Boolean;
  function openSeaTaxCofins(Field:TUniDBLookupComboBox):Boolean;
  function openSeaOrderPi(Field:TUniEdit):Boolean;
  function openSeaMedParts(Field:TUniEdit):Boolean;
  function openSeaOrderPacking(Field:TUniEdit):Boolean;
  function openSeaSituation(Field:TUniDBLookupComboBox):Boolean;
  function openSeaKind(Field:TUniDBLookupComboBox):Boolean;
  function openSeaProject(Field:TUniDBLookupComboBox):Boolean;
  function openSeapriority(Field:TUniDBLookupComboBox):Boolean;
  function OpenSeaSalesman (Field:TUniDBLookupComboBox) :Boolean;
  function openSeaOrderSale(Field:TUniedit):Boolean;
  function openSeaOrderStockAdjust(Field:TUniedit):Boolean;
  function openSeaInvoiceMerchandise(Field: TUniedit):Boolean;
  function openSeaContact(Field:TUniDBLookupComboBox;EntityOwner:Integer):Boolean;
  function openSeaOrderStockTransfer(Field:TUniDBLookupComboBox):Boolean;
  function openSeaExtintor():Boolean;
  function openSeaBank(Field:TUniDBLookupComboBox):Boolean;
  function OpenLSeaLogOperation(Field:TUniDBLookupComboBox):Boolean;

  function OpenSeaOrderBudgAdvertise(Field:TUniDBLookupComboBox):Boolean;
  function OpenTasOrderBudgAdvertise(Field:TUniDBLookupComboBox):Boolean;

  function OpenTasWhatsAppWEb():Boolean;

  function openSeaPromotion(Field:TUniDBLookupComboBox):Boolean;
  function openSeaBankAccount(Field:TUniDBLookupComboBox):Boolean;
  function openSeaBankHistoric(Field:TUniDBLookupComboBox):Boolean;
  function openSeaBankChargeTicket(Field:TUniDBLookupComboBox):Boolean;
  function openSeaBankChargeKind(Field:TUniDBLookupComboBox):Boolean;
  function openSeaBankChargeSlip(Field:TUniDBLookupComboBox):Boolean;
  function openSeaAccounting(Field:TUniDBLookupComboBox):Boolean;
  function openSeaCheckCtrl(Field:TUniDBLookupComboBox):Boolean;
  function openSeaFinancialStatement():Boolean;
  function openSeaTechnicalAssistance(Field:TUniDBLookupComboBox):Boolean;
  function openSeaExtAgent(Field:TUniDBLookupComboBox):Boolean;
  function openSeaExtKind(Field:TUniDBLookupComboBox):Boolean;
  function openSeaExtTester(Field:TUniDBLookupComboBox):Boolean;
  function openSeaExtMotive(Field:TUniDBLookupComboBox):Boolean;
  function openSeaExtSeal(Field:TUniDBLookupComboBox):Boolean;
  function openSeaExtMaintenance(Field:TUniDBLookupComboBox):Boolean;
  function openSeaExtOperatingTest(Field:TUniDBLookupComboBox):Boolean;
  function openSeaSerieCtrl(Field:TUniDBLookupComboBox):Boolean;

   //Cad - Cadastros
  function openCadVehicleBrandModel(Field:TUniEdit):Boolean;

  function openCadVehicleKind(Field:TUniEdit):Boolean;

  function openCadService(Field:TUniEdit):Boolean;

  function openCadMerchandiseItems(codigoMestre:Integer):Boolean;

  function openCadCollaborator(CodeId:Integer;Field:TUniDBLookupComboBox):Boolean;

  function openCadTaxRuler(Field:TUniEdit):Boolean;

  function openCadObservation (CodeId:Integer;Field:TUniDBLookupComboBox):Boolean;

  function openCadTaxPis (CodeId:Integer;Field:TUniDBLookupComboBox):Boolean;

  function openCadTaxIpi(CodeId:Integer;Field:TUniDBLookupComboBox):Boolean;

  function openCadDeterBaseTaxIcms(CodeId:Integer;Field:TUniDBLookupComboBox):Boolean;

  function openCadDischargeIcms(CodeId:Integer;Field:TUniDBLookupComboBox):Boolean;

  function openCadTaxIcmsNr(CodeId:Integer;Field:TUniDBLookupComboBox) :Boolean;

  function openCadPrivilege(Field:TUniEdit) :Boolean;

  function openCadInterface(Field:TUniEdit) :Boolean;

  function openCadModule(Field:TUniEdit) :Boolean;

  function openCadOrder(Field:TUniEdit) :Boolean;

  function openCadStockList(CodeId:Integer;Field:TUniDBLookupComboBox):Boolean;

  function openCadLineBusiness(CodeId:Integer;Field:TUniDBLookupComboBox):Boolean;

  function openCadCarrier(CodeId:Integer;Field:TUniDBLookupComboBox):Boolean;

  function openCadCountry(CodeId:Integer;Field:TUniDBLookupComboBox):Boolean;

  function openCadState(Field:TUniDBLookupComboBox):Boolean;

  function openCadCity(CodeId:Integer;Field:TUniDBLookupComboBox):Boolean;

  function openCadUser(Field:TUniEdit;Institution:Integer):Boolean;

  function openCadInstitution(Field:TUniEdit;Institution:Integer):Boolean;

  function openCadSuInstitution(Field:TUniEdit;Institution:Integer):Boolean;

  function openCadCustomer(CodeId:Integer;Field:TUniDBLookupComboBox):Boolean;

  function openCadClinProfessional(CodeId:Integer;Field:TUniDBLookupComboBox):Boolean;

  function openCadClinPatient(CodeId:Integer;Field:TUniDBLookupComboBox):Boolean;

  function opencadclinQuestionnaire(CodeId:Integer;Field:TUniDBLookupComboBox):Boolean;

  function openCadProvider(CodeId:Integer;Field:TUniDBLookupComboBox):Boolean;

  function openCadPaymentTypes(CodeId:Integer;Field:TUniDBLookupComboBox):Boolean;

  function openCadCategory(CodeId:Integer;Field:TUniDBLookupComboBox):Boolean;

  function openCadBrand(CodeId:Integer;Field:TUniDBLookupComboBox):Boolean;

  function openCadPackage(CodeId:Integer;Field:TUniDBLookupComboBox):Boolean;

  function openCadColor(CodeId:Integer;Field:TUniDBLookupComboBox):Boolean;

  function openCadMeasure(CodeId:Integer;Field:TUniDBLookupComboBox):Boolean;

  function openCadMerchandise(CodeId:Integer;Field:TUniDBLookupComboBox):Boolean;

  function openCadEntity(Field:TUniEdit):Boolean;

  function openCadEntityFiscal(code_id:Integer):Boolean;

  function openCadSalesman(CodeId:Integer;Field:TUniDBLookupComboBox):Boolean;

  function openCadPriceList(CodeId:Integer;Field:TUniDBLookupComboBox):Boolean;

  function openCadAdvertiser(CodeId:Integer;Field:TUniDBLookupComboBox):Boolean;

  function openCadAgency(CodeId:Integer;Field:TUniDBLookupComboBox):Boolean;

  function openCadBroadcaster(CodeId:Integer;Field:TUniDBLookupComboBox):Boolean;

  function openCadMedPosProg(CodeId:Integer;Field:TUniDBLookupComboBox):Boolean;

  function openCadMedMaterial(CodeId:Integer;Field:TUniDBLookupComboBox):Boolean;

  function openCadTaxIcmsSN(CodeId:Integer;Field:TUniDBLookupComboBox):Boolean;

  function openCadDeterBaseTaxIcmsST(CodeId:Integer;Field:TUniDBLookupComboBox):Boolean;

  function openCadCfop(CodeId:Integer;Field:TUniDBLookupComboBox):Boolean;

  function openCadTaxCofins(CodeId:Integer;Field:TUniDBLookupComboBox):Boolean;

  function openCadOrderPi(Field:TUniEdit):Boolean;

  function openCadSituation(CodeId:Integer;Field:TUniDBLookupComboBox):Boolean;

  function openCadKind(CodeId:Integer;Field:TUniDBLookupComboBox):Boolean;

  function openCadProject(CodeId:Integer;Field:TUniDBLookupComboBox):Boolean;

  function openCadPriority(CodeId:Integer;Field:TUniDBLookupComboBox):Boolean;

  function openCadContact(CodeId:Integer;Field:TUniDBLookupComboBox):Boolean;

  function openCadFinancialPlans(CodeId:Integer;Field:TUniDBLookupComboBox):Boolean;

  function openCadExtintor(Field:TUniEdit):Boolean;

  function openCadBank(CodeId:Integer;Field:TUniDBLookupComboBox):Boolean;

  function openCadPromotion(CodeId:Integer;Field:TUniDBLookupComboBox):Boolean;

  function openCadBankAccount(CodeId:Integer;Field:TUniDBLookupComboBox):Boolean;

  function openCadBankHistoric(CodeId:Integer;
                               BankId : Integer;
                               Field:TUniDBLookupComboBox):Boolean;

  function openCadBankChargeTicket(CodeId:Integer;
                                   BankId : Integer;
                                   ChargeId : String;
                                   Field:TUniDBLookupComboBox):Boolean;
  function openCadBankChargeKind(CodeId:Integer;
                                 BankId : Integer;
                                 Field:TUniDBLookupComboBox):Boolean;
  function openCadBankChargeSlip(CodeId:Integer;Field:TUniDBLookupComboBox):Boolean;

  function openCadAccounting(CodeId:Integer;Field:TUniDBLookupComboBox):Boolean;

  function openCadExtAgent(CodeId:Integer;Field:TUniDBLookupComboBox):Boolean;

  function openCadExtKind(CodeId:Integer;Field:TUniDBLookupComboBox):Boolean;

  function openCadExtTester(CodeId:Integer;Field:TUniDBLookupComboBox):Boolean;

  function openCadExtMotive(CodeId:Integer;Field:TUniDBLookupComboBox):Boolean;

  function openCadExtSeal(CodeId:Integer;Field:TUniDBLookupComboBox):Boolean;

  function openCadMedPriceListJR(CodeBroad:Integer):Boolean;
  function openCadMedPriceListRT(CodeBroad:Integer):Boolean;
  function openCadMedPriceListON(CodeBroad:Integer):Boolean;
  function openCadMedBroadCasterCoverage(BroadcasterID:Integer):Boolean;

  function openCadMedCopyEdition(BroadcasterID:Integer):Boolean;

  function openCadWorkFront(Codigo:Integer;Field:TUniDBLookupComboBox):Boolean;

  function openCadClinModule(CodeId:Integer;Field:TUniDBLookupComboBox):Boolean;
  //Tas - Task - Tarefas
  function openTasUsefulPhone(Field:TUniEdit):Boolean;
  function openTasInOutProduct(Field:TUniEdit):Boolean;

  function openTasOrderBudgetPi(Field:TUniEdit):Boolean;
  function openTasOrderListToDelivery(Field:TUniEdit):Boolean;
  function openTasOrderListToBuy(Field:TUniEdit):Boolean;
  function openTasOrderStockTransfer(Field:TUniEdit) :Boolean;
  function openTasOrderStockAdjust(Field:TUniEdit) :Boolean;

  function openTasOrderProduction(Field:TUniEdit):Boolean;
  function openTasOrderProductionV2(Field:TUniEdit):Boolean;

  function openTasOrderJob(CodeId:Integer):Boolean;
  function openTasChangePassword():Boolean;
  function openTasXmlImportNfe(Field:TUniEdit) :Boolean;
  function openTasOrderPurchase(Field:TUniEdit) :Boolean;
  function openTasOrderPiJr(Id:Integer) :Boolean;
  function openTasOrderPiRt(Id:Integer) :Boolean;
  function openTasOrderPacking(Field:TUniEdit) :Boolean;
  function openTasConfigNfe55() :Boolean;
  function openTasFinancialBills(Code:Integer):Boolean;
  function openTasFinancialBillsMedia(Code:Integer):Boolean;
  function openTasFinancialPayment(Code:Integer):Boolean;
  function openTasCashier():Boolean;
  function openTasCheckCtrl(CodeId:Integer):Boolean;
  function openTasTechnicalAssistance(CodeId:Integer):Boolean;
  function openTasSetPrice(CodeId:Integer):Boolean;
  function openTasExtMaintenance(CodeId:Integer):Boolean;
  function openTasExtMaintenanceItems(CodeId:Integer):Boolean;
  function openTasExtOperatingTest(CodeId:Integer):Boolean;
  function openTasLotCtrl(CodeId:Integer):Boolean;
  function openTasVirtualShop(CodeId:Integer):Boolean;
  function openTasSendEmailMarketing(CodeId:Integer):Boolean;
  function openTasBankActivity(CodeId:Integer):Boolean;
  function openTasConfigOrderSale(CodeId:Integer):Boolean;
  function openTasConfigGProduct(CodeId:Integer):Boolean;
  function openTasOrderBudgetItemPiJr(Id:Integer) :Boolean;
  function openTasOrderBudgetItemPiRt(Id:Integer) :Boolean;

  implementation

uses  base_form, base_module, Rtti,
  midia_module, adm_module,  base_registry, cad_country, cad_state, cad_city,
  cad_linebusiness, cad_customer, purchase_module,
  stock_module, builder_module, cad_user, cad_institution,
  ServerModule, Main, tas_financial_bills_media, cad_clin_professional,
  sea_clin_professional, sea_clin_module, sea_log_operation, sea_rest_menu;

{TFuncoes}

class procedure TOpenForm.get<F>(Field:TUniEdit);
var
  form: F;
begin
  if Form = nil then
    Form := F.Create(UniApplication);
  Form.Show(
    Procedure(Sender: TComponent; AResult:Integer)
    begin
      if Field <> nil then
      Begin
        //Field.Tag   := form .CodigoRegistro;
        //Field.Text  := form.DescricaoREgitro;
      End;
      Form := nil;
    end
  );
end;

//Sea - Pesquisa
function openSeaVehicleMaintenance(Field:TUniEdit):Boolean;
Var
  Form : TSeaVehMaintenance;
begin
  if Form = nil then
    Form := TSeaVehMaintenance.Create(UniApplication);
  Form.Show(
    Procedure(Sender: TComponent; AResult:Integer)
    begin
      if Field <> nil then
      Begin
        //Field.Tag     := form.cds_searchid.AsInteger;
        //Field.Text    := Form.cds_searchname_company.AsString;
      End;
      Form := nil;
    end
  );
  Result := True;
End;

function openSeaVehicleBrandModel(Field:TUniEdit):Boolean;
Var
  Form : TSeaVehBrandModel;
begin
  if Form = nil then
    Form := TSeaVehBrandModel.Create(UniApplication);
  Form.Show(
    Procedure(Sender: TComponent; AResult:Integer)
    begin
      if Field <> nil then
      Begin
        //Field.Tag     := form.cds_searchid.AsInteger;
        //Field.Text    := Form.cds_searchname_company.AsString;
      End;
      Form := nil;
    end
  );
  Result := True;
End;

function openSeaVehicleKind(Field:TUniEdit):Boolean;
Var
  Form : TSeaVehKind;
begin
  if Form = nil then
    Form := TSeaVehKind.Create(UniApplication);
  Form.Show(
    Procedure(Sender: TComponent; AResult:Integer)
    begin
      if Field <> nil then
      Begin
        //Field.Tag     := form.cds_searchid.AsInteger;
        //Field.Text    := Form.cds_searchname_company.AsString;
      End;
      Form := nil;
    end
  );
  Result := True;
End;

function openSeaOrderBudgetPi(Field:TUniEdit):Boolean;
Var
  Form : TSeaOrderBudgetPi;
begin
  if Form = nil then
    Form := TSeaOrderBudgetPi.Create(UniApplication);
  Form.Show(
    Procedure(Sender: TComponent; AResult:Integer)
    begin
      if Field <> nil then
      Begin
        Field.Tag     := form.cds_searchid.AsInteger;
        //Field.Text    := Form.cds_searchname_company.AsString;
      End;
      Form := nil;
    end
  );
  Result := True;
End;



function openSeaCollaborator(Field:TUniDBLookupComboBox):Boolean;
Var
  Form : TSeaCollaborator;
begin
  if Form = nil then
    Form := TSeaCollaborator.Create(UniApplication);
  Form.Show(
    Procedure(Sender: TComponent; AResult:Integer)
    begin
      if Field <> nil then
      Begin
        Field.KeyValue  := form.cds_searchid.AsInteger;
        Field.Text      := concat( StrZero( form.cds_searchid.AsInteger,3,0) ,' - ', form.cds_searchname_company.AsString );
      End;
      Form := nil;
    end
  );
  Result := True;
End;


function openSeaTaxRuler(Field:TUniEdit):Boolean;
Var
  Form : TSeaTaxRuler;
begin
  if Form = nil then
    Form := TSeaTaxRuler.Create(UniApplication);
  Form.Show(
    Procedure(Sender: TComponent; AResult:Integer)
    begin
      if Field <> nil then
      Begin
        Field.Text  := form.cds_searchtb_cfop_id.AsString;
      End;
      Form := nil;
    end
  );
  Result := True;
End;

function openSeaObservation(Field:TUniDBLookupComboBox):Boolean;
Var
  Form : TSeaObservation;
begin
  if Form = nil then
    Form := TSeaObservation.Create(UniApplication);
  Form.Show(
    Procedure(Sender: TComponent; AResult:Integer)
    begin
      if Field <> nil then
      Begin
        Field.KeyValue  := form.cds_searchid.AsInteger;
        Field.Text      := concat( StrZero( form.cds_searchid.AsInteger,3,0) ,' - ', form.cds_searchdescription.AsString );
      End;
      Form := nil;
    end
  );
  Result := True;
End;


function openSeaTaxPis(Field:TUniDBLookupComboBox):Boolean;
Var
  Form : TSeaTaxPis;
begin
  if Form = nil then
    Form := TSeaTaxPis.Create(UniApplication);
  Form.Show(
    Procedure(Sender: TComponent; AResult:Integer)
    begin
      if Field <> nil then
      Begin
        Field.KeyValue  := form.cds_searchid.AsInteger;
        Field.Text      := concat( StrZero( form.cds_searchid.AsInteger,3,0),' - ', form.cds_searchdescription.AsString );
      End;
      Form := nil;
    end
  );
  Result := True;
End;

function openSeaTaxIpi(Field:TUniDBLookupComboBox):Boolean;
Var
  Form : TSeaTaxIpi;
begin
  if Form = nil then
    Form := TSeaTaxIpi.Create(UniApplication);
  Form.Show(
    Procedure(Sender: TComponent; AResult:Integer)
    begin
      if Field <> nil then
      Begin
        Field.KeyValue  := form.cds_searchid.AsInteger;
        Field.Text      := concat(StrZero( form.cds_searchid.AsInteger,3,0),' - ', form.cds_searchdescription.AsString );
      End;
      Form := nil;
    end
  );
  Result := True;
End;

function openSeaDeterBaseTaxIcms(Field:TUniDBLookupComboBox):Boolean;
Var
  Form : TSeaDeterBaseTaxIcms;
begin
  if Form = nil then
    Form := TSeaDeterBaseTaxIcms.Create(UniApplication);
  Form.Show(
    Procedure(Sender: TComponent; AResult:Integer)
    begin
      if Field <> nil then
      Begin
        Field.KeyValue  := form.cds_searchid.AsInteger;
        Field.Text      := concat(StrZero( form.cds_searchid.AsInteger,3,0),' - ', form.cds_searchdescription.AsString);
      End;
      Form := nil;
    end
  );
  Result := True;
End;


function openSeaDischargeIcms(Field:TUniDBLookupComboBox):Boolean;
Var
  Form : TSeadischargeIcms;
begin
  if Form = nil then
    Form := TSeadischargeIcms.Create(UniApplication);
  Form.Show(
    Procedure(Sender: TComponent; AResult:Integer)
    begin
      if Field <> nil then
      Begin
        Field.KeyValue  := form.cds_searchid.AsInteger;
        Field.Text      := concat(StrZero( form.cds_searchid.AsInteger,3,0),' - ', form.cds_searchdescription.AsString);
      End;
      Form := nil;
    end
  );
  Result := True;
End;



function openSeaTaxIcmsNr(Field:TUniDBLookupComboBox):Boolean;
Var
  Form : TSeaTaxIcmsNr;
begin
  if Form = nil then
    Form := TSeaTaxIcmsNr.Create(UniApplication);
  if Field <> nil then
    Form.CodigoRegistro := Field.KeyValue;
  Form.Show(
    Procedure(Sender: TComponent; AResult:Integer)
    begin
      if Field <> nil then
      Begin
        Field.KeyValue    := form.cds_searchid.AsInteger;
        Field.Text        := concat(StrZero( form.cds_searchid.AsInteger,3,0),' - ', form.cds_searchdescription.AsString);
      End;
      Form := nil;
    end
  );
  Result := True;
End;

function openSeaAddressDelivery(Field:TUniDBLookupComboBox):Boolean;
Var
  Form : TSeaAddressDelivery;
begin
  if Form = nil then
    Form := TSeaAddressDelivery.Create(UniApplication);
  Form.Show(
    Procedure(Sender: TComponent; AResult:Integer)
    begin
      if Field <> nil then
      Begin
        Field.KeyValue    := form.cds_searchid.AsInteger;
        Field.Text        := concat(StrZero( form.cds_searchid.AsInteger,3,0),' - ', form.cds_searchname_company.AsString);
      End;
      Form := nil;
    end
  );
  Result := True;
End;

function openCadDEliveryRange(Field:TUniDBLookupComboBox):Boolean;
Var
  Form : TCadDeliveryRange;
begin
  if Form = nil then
    Form := TCadDeliveryRange.Create(UniApplication);
  Form.Show(
    Procedure(Sender: TComponent; AResult:Integer)
    begin
      Form := nil;
    end
  );
  Result := True;
End;

function openSeaCest(Field:TUniEdit):Boolean;
Var
  Form : TSeaCest;
begin
  if Form = nil then
    Form := TSeaCest.Create(UniApplication);
  Form.Show(
    Procedure(Sender: TComponent; AResult:Integer)
    begin
      if Field <> nil then
      Begin
        Field.Text   := IntToStr(form.cds_searchcest.AsInteger);
      End;
      Form := nil;
    end
  );
  Result := True;
End;

function openSeaNcm(Field:TUniEdit):Boolean;
Var
  Form : TSeaNcm;
begin
  if Form = nil then
    Form := TSeaNcm.Create(UniApplication);
  Form.Show(
    Procedure(Sender: TComponent; AResult:Integer)
    begin
      if Field <> nil then
      Begin
        Field.Text   := IntToStr(form.cds_searchnumber.AsInteger);
      End;
      Form := nil;
    end
  );
  Result := True;
End;

function openSeaOrderProduction(Field:TUniEdit):Boolean;
Var
  Form : TSeaOrderProduction;
begin
  if Form = nil then
    Form := TSeaOrderProduction.Create(UniApplication);
  Form.Show(
    Procedure(Sender: TComponent; AResult:Integer)
    begin
      if Field <> nil then
      Begin
        Field.Tag   := form.cds_searchid.AsInteger;
        Field.Text  := form.cds_searchnumber.AsString;
      End;
      Form := nil;
    end
  );
  Result := True;
End;

function openSeaOrderProductionV2(Field:TUniEdit):Boolean;
Var
  Form : TSeaOrderProductionV2;
begin
  if Form = nil then
    Form := TSeaOrderProductionV2.Create(UniApplication);
  Form.Show(
    Procedure(Sender: TComponent; AResult:Integer)
    begin
      if Field <> nil then
      Begin
        Field.Tag   := form.cds_searchid.AsInteger;
        Field.Text  := form.cds_searchnumber.AsString;
      End;
      Form := nil;
    end
  );
  Result := True;
End;

function openSeaOrderJob(Field:TUniEdit):Boolean;
Var
  Form : TSeaOrderJob;
begin
  if Form = nil then
    Form := TSeaOrderJob.Create(UniApplication);
  Form.Show(
    Procedure(Sender: TComponent; AResult:Integer)
    begin
      if Field <> nil then
      Begin
        Field.Tag   := form.cds_searchid.AsInteger;
        Field.Text  := form.cds_searchnumber.AsString;
      End;
      Form := nil;
    end
  );
  Result := True;
End;

function openSeaOrderPurchase(Field:TUniEdit):Boolean;
Var
  Form : TSeaOrderPurchase;
begin
  if Form = nil then
    Form := TSeaOrderPurchase.Create(UniApplication);
  Form.Show(
    Procedure(Sender: TComponent; AResult:Integer)
    begin
      if Field <> nil then
      Begin
        Field.Tag   := form.cds_searchid.AsInteger;
        Field.Text  := form.cds_searchnumber.AsString;
      End;
      Form := nil;
    end
  );
  Result := True;
End;

function openSeaCarrier(Field:TUniDBLookupComboBox):Boolean;
Var
  Form : TSeaCarrier;
begin
  if Form = nil then
    Form := TSeaCarrier.Create(UniApplication);
  Form.Show(
    Procedure(Sender: TComponent; AResult:Integer)
    begin
      if Field <> nil then
      Begin
        Field.KeyValue   := form.cds_searchid.AsInteger;
        Field.Text  := concat(StrZero( form.cds_searchid.AsInteger,3,0),' - ', form.cds_searchname_company.AsString);
      End;
      Form := nil;
    end
  );
  Result := True;
End;

function openSeaPrivilege(Field:TUniEdit):Boolean;
Var
  Form : TSeaPrivilege;
begin
  if Form = nil then
    Form := TSeaPrivilege.Create(UniApplication);
  Form.Show(
    Procedure(Sender: TComponent; AResult:Integer)
    begin
      if Field <> nil then
      Begin
        Field.Tag   := form.cds_searchid.AsInteger;
        Field.Text  := form.cds_searchdescription.AsString;
      End;
      Form := nil;
    end
  );
  Result := True;
End;

function openSeaInface(Field:TUniEdit):Boolean;
Var
  Form : TSeaInterface;
begin
  if Form = nil then
    Form := TSeaInterface.Create(UniApplication);
  Form.Show(
    Procedure(Sender: TComponent; AResult:Integer)
    begin
      if Field <> nil then
      Begin
        Field.Tag   := form.cds_searchid.AsInteger;
        Field.Text  := form.cds_searchdescription.AsString;
      End;
      Form := nil;
    end
  );
  Result := True;
End;

function openSeaModule(Field:TUniEdit):Boolean;
Var
Form: TSeaModule;
begin
  //TOpenForm.get<TSeaModule>(Field);
    
  if Form = nil then
    Form := TSeaModule.Create(UniApplication);

  Form.Show(
    Procedure(Sender: TComponent; AResult:Integer)
    begin
      if Field <> nil then
      Begin
        Field.Tag   := form.cds_searchid.AsInteger;
        Field.Text  := form.cds_searchdescription.AsString;
      End;
      Form := nil;
    end
  );
  Result := True;
End;


function openSeaStockList (Field:TUniDBLookupComboBox):Boolean;
Var
  Form : TSeaStockList;
begin
  if Form = nil then
    Form := TSeaStockList.Create(UniApplication);
  Form.Show(
    Procedure(Sender: TComponent; AResult:Integer)
    begin
      if Field <> nil then
      Begin
        Field.KeyValue   := form.cds_searchid.AsInteger;
        Field.Text   := concat(StrZero( form.cds_searchid.AsInteger,3,0),' - ', form.cds_searchdescription.AsString);
      End;
      Form := nil;
    end
  );
  Result := True;
End;

//Cad - Cadastros
procedure ShowCallBack(Sender: TComponent; AResult:Integer);
Begin
  //Tratar o retorno
End;

function openSeaBrand(Field:TUniDBLookupComboBox):Boolean;
Var
  Form : TSeaBrand;
begin
  if Form = nil then
    Form := TSeaBrand.Create(UniApplication);
  Form.Show(
    Procedure(Sender: TComponent; AResult:Integer)
    begin
      if Field <> nil then
      Begin
        Field.KeyValue   := form.cds_searchid.AsInteger;
        Field.Text  := concat(StrZero( form.cds_searchid.AsInteger,3,0),' - ', form.cds_searchdescription.AsString);
      End;
      Form := nil;
    end
  );
  Result := True;
End;

function openSeaWorkFront(Field:TUniDBLookupComboBox):Boolean;
Var
  Form : TSeaWorkFront;
begin
  if Form = nil then
    Form := TSeaWorkFront.Create(UniApplication);
  Form.Show(
    Procedure(Sender: TComponent; AResult:Integer)
    begin
      if Field <> nil then
      Begin
        Field.KeyValue   := form.cds_searchid.AsInteger;
        Field.Text  := concat(StrZero( form.cds_searchid.AsInteger,3,0),' - ', form.cds_searchdescription.AsString);
      End;
      Form := nil;
    end
  );
  Result := True;
End;


function openSeaPackage(Field:TUniDBLookupComboBox):Boolean;
Var
  Form : TSeaPackage;
begin
  if Form = nil then
    Form := TSeaPackage.Create(UniApplication);
  Form.Show(
    Procedure(Sender: TComponent; AResult:Integer)
    begin
      if Field <> nil then
      Begin
        Field.KeyValue  := form.cds_searchid.AsInteger;
        Field.Text      := concat( StrZero( form.cds_searchid.AsInteger,3,0),' - ', form.cds_searchdescription.AsString);
      End;
      Form := nil;
    end
  );
  Result := True;
End;

function openSeaMeasure(Field:TUniDBLookupComboBox):Boolean;
Var
  Form : TSeaMeasure;
begin
  if Form = nil then
    Form := TSeaMeasure.Create(UniApplication);
  Form.Show(
    Procedure(Sender: TComponent; AResult:Integer)
    begin
      if Field <> nil then
      Begin
        Field.KeyValue  := form.cds_searchid.AsInteger;
        Field.Text      := concat( StrZero( form.cds_searchid.AsInteger,3,0),' - ', form.cds_searchdescription.AsString);
      End;
      Form := nil;
    end
  );
  Result := True;
End;

function openSeaColors(Field:TUniDBLookupComboBox):Boolean;
Var
  Form : TSeaColor;
begin
  if Form = nil then
    Form := TSeaColor.Create(UniApplication);
  Form.Show(
    Procedure(Sender: TComponent; AResult:Integer)
    begin
      if Field <> nil then
      Begin
        Field.KeyValue   := form.cds_searchid.AsInteger;
        Field.Text  := concat( StrZero( form.cds_searchid.AsInteger,3,0),' - ', form.cds_searchdescription.AsString);
      End;
      Form := nil;
    end
  );
  Result := True;
End;
function openSeaEntity(Field:TUniDBLookupComboBox):Boolean;
Var
  Form : TSeaEntity;
begin
  if Form = nil then
    Form := TSeaEntity.Create(UniApplication);
  Form.Show(
    Procedure(Sender: TComponent; AResult:Integer)
    begin
      if Field <> nil then
      Begin
        Field.KeyValue  := form.cds_searchid.AsInteger;
        Field.Text      := concat( StrZero( form.cds_searchid.AsInteger,3,0),' - ', form.cds_searchname_company.AsString);
      End;
      Form := nil;
    end
  );
  Result := True;
End;

function openSeaEntityFiscal(Field:TUniDBLookupComboBox):Boolean;
Var
  Form : TSeaEntityFiscal;
begin
  if Form = nil then
    Form := TSeaEntityFiscal.Create(UniApplication);
  Form.Show(
    Procedure(Sender: TComponent; AResult:Integer)
    begin
      if Field <> nil then
      Begin
        Field.KeyValue  := form.cds_searchid.AsInteger;
        Field.Text      := concat( StrZero( form.cds_searchid.AsInteger,3,0),' - ', form.cds_searchname_company.AsString);
      End;
      Form := nil;
    end
  );
  Result := True;
End;


function openSeaInstitution(Institution:Integer):Boolean;
Var
  Form : TSeaInstitution;
begin
  result := True;
  if Form = nil then
    Form := TSeaInstitution.Create(UniApplication);
  Form.InstitutionID := Institution;
  Form.Show(
    Procedure(Sender: TComponent; AResult:Integer)
    begin
      Form := nil;
    end
  );
end;

function openSeaExtintor():Boolean;
Var
  Form : TSeaExtintor;
begin
  result := True;
  if Form = nil then
    Form := TSeaExtintor.Create(UniApplication);
  Form.Show(
    Procedure(Sender: TComponent; AResult:Integer)
    begin
      Form := nil;
    end
  );
end;

function openSeaBank(Field:TUniDBLookupComboBox):Boolean;
Var
  Form : TSeaBank;
begin
  if Form = nil then
    Form := TSeaBank.Create(UniApplication);
  Form.Show(
    Procedure(Sender: TComponent; AResult:Integer)
    begin
      if Field <> nil then
      Begin
        Field.KeyValue   := form.cds_searchid.AsInteger;
        Field.Text  := concat(StrZero( form.cds_searchid.AsInteger,3,0),' - ', form.cds_searchname_company.AsString);
      End;
      Form := nil;
    end
  );
  Result := True;
End;

function OpenLSeaLogOperation(Field:TUniDBLookupComboBox):Boolean;
Var
  Form : TSeaLogOperation;
begin
  if Form = nil then
    Form := TSeaLogOperation.Create(UniApplication);
  Form.Show(
    Procedure(Sender: TComponent; AResult:Integer)
    begin
      Form := nil;
    end
  );
  Result := True;
End;

function OpenSeaOrderBudgAdvertise(Field:TUniDBLookupComboBox):Boolean;
Var
  Form : TSeaOrderBudgAdvertise;
begin
  if Form = nil then
    Form := TSeaOrderBudgAdvertise.Create(UniApplication);
  Form.Show(
    Procedure(Sender: TComponent; AResult:Integer)
    begin
      Form := nil;
    end
  );
  Result := True;
End;

function OpenTasOrderBudgAdvertise(Field:TUniDBLookupComboBox):Boolean;
Var
  Form : TTasOrderBudgAdvertise;
begin
  if Form = nil then
    Form := TTasOrderBudgAdvertise.Create(UniApplication);
  Form.Show(
    Procedure(Sender: TComponent; AResult:Integer)
    begin
      Form := nil;
    end
  );
  Result := True;
End;

function OpenTasWhatsAppWEb():Boolean;
Var
  Form : TTasWhatsappWeb;
begin
  if Form = nil then
    Form := TTasWhatsappWeb.Create(UniApplication);
  Form.Show(
    Procedure(Sender: TComponent; AResult:Integer)
    begin
      Form := nil;
    end
  );
  Result := True;
End;

function openSeaBankAccount(Field:TUniDBLookupComboBox):Boolean;
Var
  Form : TSeaBankAccount;
begin
  if Form = nil then
    Form := TSeaBankAccount.Create(UniApplication);
  Form.Show(
    Procedure(Sender: TComponent; AResult:Integer)
    begin
      if Field <> nil then
      Begin
        Field.KeyValue   := form.cds_searchid.AsInteger;
        Field.Text  := concat(StrZero( form.cds_searchid.AsInteger,3,0),' - ', form.cds_searchbank.AsString);
      End;
      Form := nil;
    end
  );
  Result := True;
End;

function openSeaPromotion(Field:TUniDBLookupComboBox):Boolean;
//Var
//  Form : TSeaPromotion;
begin
//  if Form = nil then
//    Form := TSeaPromotion.Create(UniApplication);
//  Form.Show(
//    Procedure(Sender: TComponent; AResult:Integer)
//    begin
//      if Field <> nil then
//      Begin
//        Field.KeyValue   := form.cds_searchid.AsInteger;
//        Field.Text  := concat(StrZero( form.cds_searchid.AsInteger,3,0),' - ', form.cds_searchPromotion.AsString);
//      End;
//      Form := nil;
//    end
//  );
//  Result := True;
End;

function openSeaBankHistoric(Field:TUniDBLookupComboBox):Boolean;
Var
  Form : TSeaBankHistoric;
begin
  if Form = nil then
    Form := TSeaBankHistoric.Create(UniApplication);
  Form.Show(
    Procedure(Sender: TComponent; AResult:Integer)
    begin
      if Field <> nil then
      Begin
        Field.KeyValue   := form.cds_searchid.AsInteger;
        Field.Text  := concat(StrZero( form.cds_searchid.AsInteger,3,0),' - ', form.cds_searchbank.AsString);
      End;
      Form := nil;
    end
  );
  Result := True;
End;

function openSeaBankChargeTicket(Field:TUniDBLookupComboBox):Boolean;
Var
  Form : TSeaBankChargeTicket;
begin
  if Form = nil then
    Form := TSeaBankChargeTicket.Create(UniApplication);
  Form.Show(
    Procedure(Sender: TComponent; AResult:Integer)
    begin
      if Field <> nil then
      Begin
        Field.KeyValue   := form.cds_searchid.AsInteger;
        Field.Text  := concat(StrZero( form.cds_searchid.AsInteger,3,0),' - ', form.cds_searchbank.AsString);
      End;
      Form := nil;
    end
  );
  Result := True;
End;

function openSeaBankChargeKind(Field:TUniDBLookupComboBox):Boolean;
Var
  Form : TSeaBankChargeKind;
begin
  if Form = nil then
    Form := TSeaBankChargeKind.Create(UniApplication);
  Form.Show(
    Procedure(Sender: TComponent; AResult:Integer)
    begin
      if Field <> nil then
      Begin
        Field.KeyValue   := form.cds_searchid.AsInteger;
        Field.Text  := concat(StrZero( form.cds_searchid.AsInteger,3,0),' - ', form.cds_searchid.AsString);
      End;
      Form := nil;
    end
  );
  Result := True;
End;

function openSeaBankChargeSlip(Field:TUniDBLookupComboBox):Boolean;
Var
  Form : TSeaBankChargeSlip;
begin
  if Form = nil then
    Form := TSeaBankChargeSlip.Create(UniApplication);
  Form.Show(
    Procedure(Sender: TComponent; AResult:Integer)
    begin
      if Field <> nil then
      Begin
        Field.KeyValue   := form.cds_searchid.AsInteger;
        Field.Text  := concat(StrZero( form.cds_searchid.AsInteger,3,0),' - ', form.cds_searchbank.AsString);
      End;
      Form := nil;
    end
  );
  Result := True;
End;


function openSeaCustomer(Field:TUniDBLookupComboBox):Boolean;
Var
  Form : TSeaCustomer;
begin
  if Form = nil then
    Form := TSeaCustomer.Create(UniApplication);
  Form.Show(
    Procedure(Sender: TComponent; AResult:Integer)
    begin
      if Field <> nil then
      Begin
        Field.KeyValue  := form.cds_searchid.AsInteger;
        Field.Text      := concat( StrZero( form.cds_searchid.AsInteger,3,0),' - ', form.cds_searchname_company.AsString);
      End;
      Form := nil;
    end
  );
  Result := True;
End;


function openSeaProvider(Field:TUniDBLookupComboBox):Boolean;
Var
  Form : TSeaProvider;
begin
  if Form = nil then
    Form := TSeaProvider.Create(UniApplication);
  Form.Show(
    Procedure(Sender: TComponent; AResult:Integer)
    begin
      if Field <> nil then
      Begin
        Field.KeyValue  := form.cds_searchid.AsInteger;
        Field.Text      := concat( StrZero( form.cds_searchid.AsInteger,3,0),' - ', form.cds_searchname_company.AsString );
      End;
      Form := nil;
    end
  );
  Result := True;
End;

function openSeaAccounting(Field:TUniDBLookupComboBox):Boolean;
Var
  Form : TSeaAccounting;
begin
  if Form = nil then
    Form := TSeaAccounting.Create(UniApplication);
  Form.Show(
    Procedure(Sender: TComponent; AResult:Integer)
    begin
      if Field <> nil then
      Begin
        Field.KeyValue  := form.cds_searchid.AsInteger;
        Field.Text      := concat( StrZero( form.cds_searchid.AsInteger,3,0),' - ', form.cds_searchname_company.AsString );
      End;
      Form := nil;
    end
  );
  Result := True;
End;

function openSeaCheckCtrl(Field:TUniDBLookupComboBox):Boolean;
Var
  Form : TSeaCheckCtrl;
begin
  if Form = nil then
    Form := TSeaCheckCtrl.Create(UniApplication);
  Form.Show(
    Procedure(Sender: TComponent; AResult:Integer)
    begin
      if Field <> nil then
      Begin
        Field.KeyValue  := form.cds_searchid.AsInteger;
        //Field.Text      := concat( StrZero( form.cds_searchid.AsInteger,3,0),' - ', form.cds_searchname_company.AsString );
      End;
      Form := nil;
    end
  );
  Result := True;
End;

function openSeaTechnicalAssistance(Field:TUniDBLookupComboBox):Boolean;
Var
  Form : TSeaTechnicalAssistance;
begin
  if Form = nil then
    Form := TSeaTechnicalAssistance.Create(UniApplication);
  Form.Show(
    Procedure(Sender: TComponent; AResult:Integer)
    begin
      if Field <> nil then
      Begin
        //Field.KeyValue  := form.cds_searchid.AsInteger;
        //Field.Text      := concat( StrZero( form.cds_searchid.AsInteger,3,0),' - ', form.cds_searchname_company.AsString );
      End;
      Form := nil;
    end
  );
  Result := True;
End;

function openSeaExtAgent(Field:TUniDBLookupComboBox):Boolean;
Var
  Form : TSeaExtAgent;
begin
  if Form = nil then
    Form := TSeaExtAgent.Create(UniApplication);
  Form.Show(
    Procedure(Sender: TComponent; AResult:Integer)
    begin
      if Field <> nil then
      Begin
        //Field.KeyValue  := form.cds_searchid.AsInteger;
        //Field.Text      := concat( StrZero( form.cds_searchid.AsInteger,3,0),' - ', form.cds_searchname_company.AsString );
      End;
      Form := nil;
    end
  );
  Result := True;
End;

function openSeaExtKind(Field:TUniDBLookupComboBox):Boolean;
Var
  Form : TSeaExtKind;
begin
  if Form = nil then
    Form := TSeaExtKind.Create(UniApplication);
  Form.Show(
    Procedure(Sender: TComponent; AResult:Integer)
    begin
      if Field <> nil then
      Begin
        //Field.KeyValue  := form.cds_searchid.AsInteger;
        //Field.Text      := concat( StrZero( form.cds_searchid.AsInteger,3,0),' - ', form.cds_searchname_company.AsString );
      End;
      Form := nil;
    end
  );
  Result := True;
End;

function openSeaExtTester(Field:TUniDBLookupComboBox):Boolean;
Var
  Form : TSeaExtTester;
begin
  if Form = nil then
    Form := TSeaExtTester.Create(UniApplication);
  Form.Show(
    Procedure(Sender: TComponent; AResult:Integer)
    begin
      if Field <> nil then
      Begin
        //Field.KeyValue  := form.cds_searchid.AsInteger;
        //Field.Text      := concat( StrZero( form.cds_searchid.AsInteger,3,0),' - ', form.cds_searchname_company.AsString );
      End;
      Form := nil;
    end
  );
  Result := True;
End;

function openSeaExtMotive(Field:TUniDBLookupComboBox):Boolean;
Var
  Form : TSeaExtMotive;
begin
  if Form = nil then
    Form := TSeaExtMotive.Create(UniApplication);
  Form.Show(
    Procedure(Sender: TComponent; AResult:Integer)
    begin
      if Field <> nil then
      Begin
        //Field.KeyValue  := form.cds_searchid.AsInteger;
        //Field.Text      := concat( StrZero( form.cds_searchid.AsInteger,3,0),' - ', form.cds_searchname_company.AsString );
      End;
      Form := nil;
    end
  );
  Result := True;
End;

function openSeaExtSeal(Field:TUniDBLookupComboBox):Boolean;
Var
  Form : TSeaExtSeal;
begin
  if Form = nil then
    Form := TSeaExtSeal.Create(UniApplication);
  Form.Show(
    Procedure(Sender: TComponent; AResult:Integer)
    begin
      if Field <> nil then
      Begin
        //Field.KeyValue  := form.cds_searchid.AsInteger;
        //Field.Text      := concat( StrZero( form.cds_searchid.AsInteger,3,0),' - ', form.cds_searchname_company.AsString );
      End;
      Form := nil;
    end
  );
  Result := True;
End;

function openSeaExtMaintenance(Field:TUniDBLookupComboBox):Boolean;
Var
  Form : TSeaExtMaintenance;
begin
  if Form = nil then
    Form := TSeaExtMaintenance.Create(UniApplication);
  Form.Show(
    Procedure(Sender: TComponent; AResult:Integer)
    begin
      if Field <> nil then
      Begin
        //Field.KeyValue  := form.cds_searchid.AsInteger;
        //Field.Text      := concat( StrZero( form.cds_searchid.AsInteger,3,0),' - ', form.cds_searchname_company.AsString );
      End;
      Form := nil;
    end
  );
  Result := True;
End;

function openSeaExtOperatingTest(Field:TUniDBLookupComboBox):Boolean;
Var
  Form : TSeaExtOperatingTest;
begin
  if Form = nil then
    Form := TSeaExtOperatingTest.Create(UniApplication);
  Form.Show(
    Procedure(Sender: TComponent; AResult:Integer)
    begin
      if Field <> nil then
      Begin
        //Field.KeyValue  := form.cds_searchid.AsInteger;
        //Field.Text      := concat( StrZero( form.cds_searchid.AsInteger,3,0),' - ', form.cds_searchname_company.AsString );
      End;
      Form := nil;
    end
  );
  Result := True;
End;

function openSeaSerieCtrl(Field:TUniDBLookupComboBox):Boolean;
Var
  Form : TSeaSerieCtrl;
begin
  if Form = nil then
    Form := TSeaSerieCtrl.Create(UniApplication);
  Form.Show(
    Procedure(Sender: TComponent; AResult:Integer)
    begin
      if Field <> nil then
      Begin
        //Field.KeyValue  := form.cds_searchid.AsInteger;
        //Field.Text      := concat( StrZero( form.cds_searchid.AsInteger,3,0),' - ', form.cds_searchname_company.AsString );
      End;
      Form := nil;
    end
  );
  Result := True;
  
  if Form = nil then
   Form := TSeaSerieCtrl.Create(UniApplication);
  Form.Show(
    Procedure(Sender: TComponent; AResult:Integer)
    begin
      if Field <> nil then
      Begin
        //Field.KeyValue  := form.cds_searchid.AsInteger;
       //Field.Text      := concat( StrZero( form.cds_searchid.AsInteger,3,0),' - ', form.cds_searchname_company.AsString );
      End;
      Form := nil;
    end
  );
  Result := True;
End;

function openSeaFinancialStatement():Boolean;
Var
  Form : TSeaFinancialStatement;
begin
  result := True;
  if Form = nil then
    Form := TSeaFinancialStatement.Create(UniApplication);
  Form.Show(
    Procedure(Sender: TComponent; AResult:Integer)
    begin
      Form := nil;
    end
  );
end;


function openSeaCity(Field:TUniDBLookupComboBox):Boolean;
Var
  Form : TSeaCity;
begin
  result := True;
  if Form = nil then
    Form := TSeaCity.Create(UniApplication);
  Form.Show(
    Procedure(Sender: TComponent; AResult:Integer)
    begin
      if Field <> nil then
      Begin
        Field.KeyValue  := form.cds_searchid.AsInteger;
        Field.Text      := concat( StrZero( form.cds_searchid.AsInteger,3,0),' - ', form.cds_searchname.AsString );
      End;
      Form := nil;
    end
  );
end;
function openSeaCountry(Field:TUniDBLookupComboBox):Boolean;
Var
  Form : TSeaCountry;
begin
  result := True;
  if Form = nil then
    Form := TSeaCountry.Create(UniApplication);
  Form.Show(
    Procedure(Sender: TComponent; AResult:Integer)
    begin
      if form.cds_search.Active then
      Begin
        if form.cds_search.RecordCount > 0 then
        BEgin
          Field.Text := form.cds_searchname.AsString;
          Field.KeyValue := Form.cds_searchid.AsInteger ;
        End;
      End;

      Form := nil;
    end
  );
end;
function openSeaLineBusiness(Field:TUniDBLookupComboBox):Boolean;
Var
  Form : TSeaLinebusiness;
begin
  result := True;
  if Form = nil then
    Form := TSeaLinebusiness.Create(UniApplication);
  Form.Show(
    Procedure(Sender: TComponent; AResult:Integer)
    begin
      if Field <> nil then
      Begin
        Field.KeyValue := Form.cds_searchid.AsInteger;
        Field.Text := concat(StrZero( form.cds_searchid.AsInteger,3,0),' - ' , Form.cds_searchdescription.AsString);
      End;

      Form := nil;
    end
  );
end;

function openSeaMerchandise(Field:TUniDBLookupComboBox):Boolean;
Var
  Form : TSeaMerchandise;
begin
  if Form = nil then
    Form := TSeaMerchandise.Create(UniApplication);
  Form.Show(
    Procedure(Sender: TComponent; AResult:Integer)
    begin
      if Field <> nil then
      Begin
        Field.KeyValue  := form.cds_search.fieldByName('id').AsInteger;
      End;
      Form := nil;
    end
  );
  Result := True;
End;

function openSeaPaymentTypes(Field:TUniDBLookupComboBox):Boolean;
Var
  Form : TSeaPaymentTypes;
begin
  if Form = nil then
    Form := TSeaPaymentTypes.Create(UniApplication);
  Form.Show(
    Procedure(Sender: TComponent; AResult:Integer)
    begin
      if Field <> nil then
      Begin
        Field.KeyValue  := form.cds_searchid.AsInteger;
        Field.Text      := concat(StrZero( form.cds_searchid.AsInteger,3,0),' - ',form.cds_searchdescription.AsString );
      End;
      Form := nil;
    end
  );
  Result := True;
End;



function openSeaState(Field:TUniedit):Boolean;
Var
  Form : TSeaState;
begin
  result := True;
  if Form = nil then
    Form := TSeaState.Create(UniApplication);
  Form.Show(
    Procedure(Sender: TComponent; AResult:Integer)
    begin
      if form.cds_search.Active then
      Begin
        if form.cds_search.RecordCount > 0 then
        BEgin
          Field.Text := form.cds_searchabbreviation.AsString;
          Field.Tag := Form.cds_searchid.AsInteger;
        End;
      End;

      Form := nil;
    end
  );
end;

function openSeaService(Field:TUniedit):Boolean;
Var
  Form : TSeaService;
begin
  result := True;
  if Form = nil then
    Form := TSeaService.Create(UniApplication);
  Form.Show(
    Procedure(Sender: TComponent; AResult:Integer)
    begin
      if form.cds_search.Active then
      Begin
        if form.cds_search.RecordCount > 0 then
        BEgin
          Field.Text := form.cds_searchdescription.AsString;
          Field.Tag := Form.cds_searchid.AsInteger;
        End;
      End;

      Form := nil;
    end
  );
end;

function openSeaUser(Institution:Integer):Boolean;
Var
  Form : TSeaUser;
begin
  result := True;
  if Form = nil then
    Form := TSeaUser.Create(UniApplication);
  Form.InstitutionID := Institution;
  Form.Show(
    Procedure(Sender: TComponent; AResult:Integer)
    begin
      Form := nil;
    end
  );
end;


function OpenToInvoice(pr:TPrmCallInvoice):Boolean;
Var
  Form : TTasToInvoice;
begin
  result := True;
  if Form = nil then
    Form := TTasToInvoice.Create(UniApplication);
  Form.callInvoice := pr;
  Form.Show(
    Procedure(Sender: TComponent; AResult:Integer)
    begin
      Form := nil;
    end
  );
end;

function OpenAuthorizeNfe55(Pr :TPrmNFe):Boolean;
Var
  Form : TTasGenerateNfe55;
begin
  result := True;
  if Form = nil then
    Form := TTasGenerateNfe55.Create(UniApplication);
  Form.ParamNfe := Pr;
  Form.Show(
    Procedure(Sender: TComponent; AResult:Integer)
    begin
      Form := nil;
    end
  );
end;

function openSeaClinProfessional(Field:TUniDBLookupComboBox):Boolean;
Var
  Form : TSeaClinProfessional;
begin
  if Form = nil then
    Form := TSeaClinProfessional.Create(UniApplication);
  Form.Show(
    Procedure(Sender: TComponent; AResult:Integer)
    begin
      if Field <> nil then
      Begin
        Field.KeyValue  := form.cds_searchid.AsInteger;
        Field.Text      := concat( StrZero( form.cds_searchid.AsInteger,3,0),' - ', form.cds_searchname_company.AsString);
      End;
      Form := nil;
    end
  );
  Result := True;
end;

function openSeaClinModule(Field:TUniDBLookupComboBox):Boolean;
Var
  Form : TSeaClinModule;
begin
  if Form = nil then
    Form := TSeaClinModule.Create(UniApplication);
  Form.Show(
    Procedure(Sender: TComponent; AResult:Integer)
    begin
      if Field <> nil then
      Begin
        Field.KeyValue  := form.cds_searchid.AsInteger;
        Field.Text      := concat( StrZero( form.cds_searchid.AsInteger,3,0),' - ', form.cds_searchdescription.AsString);
      End;
      Form := nil;
    end
  );
  Result := True;
end;

function openSeaClinPatient(Field:TUniDBLookupComboBox):Boolean;
Var
  Form : TSeaClinPatient;
begin
  if Form = nil then
    Form := TSeaClinPAtient.Create(UniApplication);
  Form.Show(
    Procedure(Sender: TComponent; AResult:Integer)
    begin
      if Field <> nil then
      Begin
        Field.KeyValue  := form.cds_searchid.AsInteger;
        Field.Text      := concat( StrZero( form.cds_searchid.AsInteger,3,0),' - ', form.cds_searchname_company.AsString);
      End;
      Form := nil;
    end
  );
  Result := True;
end;

function openSeaClinQuestionnaire(Field:TUniDBLookupComboBox):Boolean;
Var
  Form : TSeaClinQuestionnaire;
begin
  if Form = nil then
    Form := TSeaClinQuestionnaire.Create(UniApplication);
  Form.Show(
    Procedure(Sender: TComponent; AResult:Integer)
    begin
      if Field <> nil then
      Begin
        //Field.KeyValue  := form.cds_searchid.AsInteger;
        //Field.Text      := concat( StrZero( form.cds_searchid.AsInteger,3,0),' - ', form.cds_searchname_company.AsString);
      End;
      Form := nil;
    end
  );
  Result := True;
end;

function openSeaClinQuiz(Field:TUniDBLookupComboBox):Boolean;
Var
  Form : TSeaClinQuiz;
begin
  if Form = nil then
    Form := TSeaClinQuiz.Create(UniApplication);
  Form.Show(
    Procedure(Sender: TComponent; AResult:Integer)
    begin
      if Field <> nil then
      Begin
        //Field.KeyValue  := form.cds_searchid.AsInteger;
        //Field.Text      := concat( StrZero( form.cds_searchid.AsInteger,3,0),' - ', form.cds_searchname_company.AsString);
      End;
      Form := nil;
    end
  );
  Result := True;
end;

function openTasClinQuiz(Field:TUniDBLookupComboBox):Boolean;
Var
  Form : TTasClinQuiz;
begin
  if Form = nil then
    Form := TTasClinQuiz.Create(UniApplication);
  Form.Show(
    Procedure(Sender: TComponent; AResult:Integer)
    begin
      if Field <> nil then
      Begin
        //Field.KeyValue  := form.cds_searchid.AsInteger;
        //Field.Text      := concat( StrZero( form.cds_searchid.AsInteger,3,0),' - ', form.cds_searchname_company.AsString);
      End;
      Form := nil;
    end
  );
  Result := True;
end;

function OpenTasUserHasPrivilege(Field:TUniDBLookupComboBox):Boolean;
Var
  Form : TTasUserHasPrivilege;
begin
  if Form = nil then
    Form := TTasUserHasPrivilege.Create(UniApplication);
  Form.Show(
    Procedure(Sender: TComponent; AResult:Integer)
    begin
      if Field <> nil then
      Begin
        //Field.KeyValue  := form.cds_searchid.AsInteger;
        //Field.Text      := concat( StrZero( form.cds_searchid.AsInteger,3,0),' - ', form.cds_searchname_company.AsString);
      End;
      Form := nil;
    end
  );
  Result := True;



End;


function OpenEdiFinancial(CodeId,Parcela:Integer):Boolean;
Var
  Form : TEdiFinancial;
begin
  result := True;
  if Form = nil then
    Form := TEdiFinancial.Create(UniApplication);
  Form.CodigoRegistro := CodeId;
  Form.Parcela := Parcela;
  Form.Show(
    Procedure(Sender: TComponent; AResult:Integer)
    begin
      Form := nil;
    end
  );
end;

function OpenCadFinancialBills(CodID:Integer):Boolean;
Var
  Form : TCadFinancialBills;
begin
  result := True;
  if Form = nil then
    Form := TCadFinancialBills.Create(UniApplication);
  Form.CodigoRegistro := CodID;
  Form.Show(
    Procedure(Sender: TComponent; AResult:Integer)
    begin
      Form := nil;
    end
  );
end;

function OpenCadFinancialPayment():Boolean;
Var
  Form : TCadFinancialPayment;
begin
  result := True;
  if Form = nil then
    Form := TCadFinancialPayment.Create(UniApplication);
  Form.Show(
    Procedure(Sender: TComponent; AResult:Integer)
    begin
      Form := nil;
    end
  );
end;

function openSeaProduct(Field:TUniDBLookupComboBox):Boolean;
Var
  Form : TSeaProduct;
begin
  if Form = nil then
    Form := TSeaProduct.Create(UniApplication);
  Form.Show(
    Procedure(Sender: TComponent; AResult:Integer)
    begin
      if Field <> nil then
      Begin
        //Field.KeyValue  := form.cds_searchid.AsInteger;
        //Field.Text      := concat(form.cds_searchid.AsString,' - ',form.cds_searchdescription.AsString);
      End;
      Form := nil;
    end
  );
  Result := True;
End;



function openSeaPriceList(Field:TUniDBLookupComboBox):Boolean;
Var
  Form : TSeaPriceList;
begin
  if Form = nil then
    Form := TSeaPriceList.Create(UniApplication);
  Form.Show(
    Procedure(Sender: TComponent; AResult:Integer)
    begin
      if Field <> nil then
      Begin
        Field.Tag   := form.cds_searchid.AsInteger;
        Field.Text  := concat(StrZero( form.cds_searchid.AsInteger,3,0),' - ',form.cds_searchdescription.AsString);
      End;
      Form := nil;
    end
  );
  Result := True;
End;
function openSeaAdvertiser(Field:TUniDBLookupComboBox):Boolean;
Var
  Form : TSeaAdvertiser;
begin
  if Form = nil then
    Form := TSeaAdvertiser.Create(UniApplication);
  Form.Show(
    Procedure(Sender: TComponent; AResult:Integer)
    begin
      if Field <> nil then
      Begin
        Field.Tag   := form.cds_searchid.AsInteger;
        Field.Text  := concat(StrZero( form.cds_searchid.AsInteger,3,0),' - ',form.cds_searchname_company.AsString);
      End;
      Form := nil;
    end
  );
  Result := True;
End;
function openSeaAgency(Field:TUniDBLookupComboBox):Boolean;
Var
  Form : TSeaAgency;
begin
  if Form = nil then
    Form := TSeaAgency.Create(UniApplication);
  Form.Show(
    Procedure(Sender: TComponent; AResult:Integer)
    begin
      if Field <> nil then
      Begin
        Field.KeyValue   := form.cds_searchid.AsInteger;
        Field.Text  := concat(StrZero( form.cds_searchid.AsInteger,3,0),' - ',form.cds_searchname_company.AsString);
      End;
      Form := nil;
    end
  );
  Result := True;
End;

function openSeaBroadcaster(Field:TUniDBLookupComboBox):Boolean;
Var
  Form : TSeaBroadcaster;
begin
  if Form = nil then
    Form := TSeaBroadcaster.Create(UniApplication);
  Form.Show(
    Procedure(Sender: TComponent; AResult:Integer)
    begin
      if Field <> nil then
      Begin
        Field.KeyValue   := form.cds_searchid.AsInteger;
        Field.Text  := concat(StrZero( form.cds_searchid.AsInteger,3,0),' - ',form.cds_searchname_company.AsString);
      End;
      Form := nil;
    end
  );
  Result := True;
End;

function openSeaMedPosProg(Field:TUniDBLookupComboBox):Boolean;
Var
  Form : TSeaMedPosProg;
begin
  if Form = nil then
    Form := TSeaMedPosProg.Create(UniApplication);
  Form.Show(
    Procedure(Sender: TComponent; AResult:Integer)
    begin
      if Field <> nil then
      Begin
        Field.KeyValue  := form.cds_searchid.AsInteger;
        Field.Text      := concat(StrZero( form.cds_searchid.AsInteger,3,0),' - ',form.cds_searchdescription.AsString);
      End;
      Form := nil;
    end
  );
  Result := True;
End;

function openSeaMedMaterial(Field:TUniDBLookupComboBox):Boolean;
Var
  Form : TSeaMedMaterial;
begin
  if Form = nil then
    Form := TSeaMedMaterial.Create(UniApplication);
  Form.Show(
    Procedure(Sender: TComponent; AResult:Integer)
    begin
      if Field <> nil then
      Begin
        Field.KeyValue  := form.cds_searchid.AsInteger;
        Field.Text      := concat(StrZero( form.cds_searchid.AsInteger,3,0),' - ',form.cds_searchdescription.AsString );
      End;
      Form := nil;
    end
  );
  Result := True;
End;


function openSeaTaxIcmsSn(Field:TUniDBLookupComboBox):Boolean;
Var
  Form : TSeaTaxIcmsSn;
begin
  if Form = nil then
    Form := TSeaTaxIcmsSn.Create(UniApplication);
  Form.Show(
    Procedure(Sender: TComponent; AResult:Integer)
    begin
      if Field <> nil then
      Begin
        Field.KeyValue  := form.cds_searchid.AsInteger;
        Field.Text      := concat(StrZero( form.cds_searchid.AsInteger,3,0),' - ',form.cds_searchdescription.AsString );
      End;
      Form := nil;
    end
  );
  Result := True;
End;


function openSeaDeterBaseTaxIcmsST(Field:TUniDBLookupComboBox):Boolean;
Var
  Form : TSeaDeterBaseTaxIcmsST;
begin
  if Form = nil then
    Form := TSeaDeterBaseTaxIcmsST.Create(UniApplication);
  Form.Show(
    Procedure(Sender: TComponent; AResult:Integer)
    begin
      if Field <> nil then
      Begin
        Field.KeyValue  := form.cds_searchid.AsInteger;
        Field.Text      := concat(StrZero( form.cds_searchid.AsInteger,3,0),' - ',form.cds_searchdescription.AsString);
      End;
      Form := nil;
    end
  );
  Result := True;
End;

function openSeaCfop(Field:TUniDBLookupComboBox):Boolean;
Var
  Form : TSeaCfop;
begin
  result := True;
  if Form = nil then
    Form := TSeaCfop.Create(UniApplication);
  Form.Show(
    Procedure(Sender: TComponent; AResult:Integer)
    begin
      if Field <> nil then
        Begin
          Field.KeyValue := StrToIntDef(form.cds_searchid.AsString,0);
          Field.Text  := concat(form.cds_searchid.AsString,' - ',form.cds_searchdescription.AsString);
        End;
        Form := nil;
    end
  );
end;

function openSeaTaxCofins(Field:TUniDBLookupComboBox):Boolean;
Var
  Form : TSeaTaxCofins;
begin
  if Form = nil then
    Form := TSeaTaxCofins.Create(UniApplication);
  Form.Show(
    Procedure(Sender: TComponent; AResult:Integer)
    begin
      if Field <> nil then
      Begin
        Field.KeyValue  := form.cds_searchid.AsInteger;
        Field.Text      := concat(StrZero( form.cds_searchid.AsInteger,3,0),' - ',form.cds_searchdescription.AsString);
      End;
      Form := nil;
    end
  );
  Result := True;
End;

function openSeaOrderPi(Field:TUniEdit):Boolean;
Var
  Form : TSeaOrderPi;
begin
  if Form = nil then
    Form := TSeaOrderPi.Create(UniApplication);
  Form.Show(
    Procedure(Sender: TComponent; AResult:Integer)
    begin
      if Field <> nil then
      Begin
        Field.Tag   := form.cds_searchid.AsInteger;
        //Field.Text  := form.cds_searchnumber.AsString;
      End;
      Form := nil;
    end
  );
  Result := True;
End;

function openSeaMedParts(Field:TUniEdit):Boolean;
Var
  Form : TSeaMedParts;
begin
  if Form = nil then
    Form := TSeaMedParts.Create(UniApplication);
  Form.Show(
    Procedure(Sender: TComponent; AResult:Integer)
    begin
      if Field <> nil then
      Begin
        Field.Tag   := form.cds_searchid.AsInteger;
      End;
      Form := nil;
    end
  );
  Result := True;
End;
function openSeaOrderPacking (Field:TUniEdit):Boolean;
Var
  Form : TSeaOrderPacking ;
begin
  if Form = nil then
    Form := TSeaOrderPacking.Create(UniApplication);
  Form.Show(
    Procedure(Sender: TComponent; AResult:Integer)
    begin
      if Field <> nil then
      Begin
        Field.Tag   := form.cds_searchid.AsInteger;
        Field.Text  := form.cds_searchnumber.AsString;
      End;
      Form := nil;
    end
  );
  Result := True;
End;

function openSeaSituation(Field:TUniDBLookupComboBox):Boolean;
Var
  Form : TSeaSituation;
begin
  if Form = nil then
    Form := TSeaSituation.Create(UniApplication);
  Form.Show(
    Procedure(Sender: TComponent; AResult:Integer)
    begin
      if Field <> nil then
      Begin
        Field.KeyValue  := form.cds_searchid.AsInteger;
        Field.Text      := concat(StrZero( form.cds_searchid.AsInteger,3,0),' - ',form.cds_searchdescription.AsString);
      End;
      Form := nil;
    end
  );
  Result := True;
End;

function openSeaKind(Field:TUniDBLookupComboBox):Boolean;
Var
  Form : TSeaKind;
begin
  if Form = nil then
    Form := TSeaKind.Create(UniApplication);
  Form.Show(
    Procedure(Sender: TComponent; AResult:Integer)
    begin
      if Field <> nil then
      Begin
        Field.KeyValue  := form.cds_searchid.AsInteger;
        Field.Text      := concat(StrZero( form.cds_searchid.AsInteger,3,0),' - ',form.cds_searchdescription.AsString);
      End;
      Form := nil;
    end
  );
  Result := True;
End;

function openSeaProject(Field:TUniDBLookupComboBox):Boolean;
Var
  Form : TSeaProject;
begin
  if Form = nil then
    Form := TSeaProject.Create(UniApplication);
  Form.Show(
    Procedure(Sender: TComponent; AResult:Integer)
    begin
      if Field <> nil then
      Begin
        Field.KeyValue  := form.cds_searchid.AsInteger;
        Field.Text      := concat(StrZero( form.cds_searchid.AsInteger,3,0),' - ',form.cds_searchdescription.AsString);
      End;
      Form := nil;
    end
  );
  Result := True;
End;

function openSeapriority(Field:TUniDBLookupComboBox):Boolean;
Var
  Form : TSeapriority;
begin
  if Form = nil then
    Form := TSeapriority.Create(UniApplication);
  Form.Show(
    Procedure(Sender: TComponent; AResult:Integer)
    begin
      if Field <> nil then
      Begin
        Field.KeyValue  := form.cds_searchid.AsInteger;
        Field.Text      := concat(StrZero( form.cds_searchid.AsInteger,3,0),' - ',form.cds_searchdescription.AsString);
      End;
      Form := nil;
    end
  );
  Result := True;
End;

function openSeaSalesman(Field:TUniDBLookupComboBox):Boolean;
Var
  Form : TSeaSalesman;
begin
  if Form = nil then
    Form := TSeaSalesman.Create(UniApplication);
  Form.Show(
    Procedure(Sender: TComponent; AResult:Integer)
    begin
      if Field <> nil then
      Begin
        Field.Tag  := form.cds_searchid.AsInteger;
        Field.Text := concat(StrZero( form.cds_searchid.AsInteger,3,0),' - ',form.cds_searchname_company.AsString);
      End;
      Form := nil;
    end
  );
  Result := True;
End;

function openSeaOrderSale(Field:TUniedit):Boolean;
Var
  Form : TSeaOrderSale;
begin
  if Form = nil then
    Form := TSeaOrderSale.Create(UniApplication);
  Form.Show(
    Procedure(Sender: TComponent; AResult:Integer)
    begin
      if Field <> nil then
      Begin
        Field.tag  := form.cds_searchid.AsInteger;
        //Field.Text := form.cds_searchdescription.AsString;
      End;
      Form := nil;
    end
  );
  Result := True;
End;

function openSeaOrderStockAdjust(Field:TUniedit):Boolean;
Var
  Form : TSeaOrderStockAdjust;
begin
  if Form = nil then
    Form := TSeaOrderStockAdjust.Create(UniApplication);
  Form.Show(
    Procedure(Sender: TComponent; AResult:Integer)
    begin
      if Field <> nil then
      Begin
        Field.Tag   := form.cds_searchid.AsInteger;
        Field.Text  := form.cds_searchname_company.AsString;
      End;
      Form := nil;
    end
  );
  Result := True;
End;

function openSeaOrderStockTransfer(Field:TUniDBLookupComboBox):Boolean;
Var
  Form : TSeaOrderStockTransfer;
begin
  if Form = nil then
    Form := TSeaOrderStockTransfer.Create(UniApplication);
  Form.Show(
    Procedure(Sender: TComponent; AResult:Integer)
    begin
      if Field <> nil then
      Begin
        Field.Tag  := form.cds_searchid.AsInteger;
        Field.Text := concat(StrZero( form.cds_searchid.AsInteger,3,0),' - ',form.cds_searchnumber.AsString );
      End;
      Form := nil;
    end
  );
  Result := True;
End;

function openSeaInvoiceMerchandise(Field:TUniedit):Boolean;
Var
  Form : TSeaInvoiceMerchandise;
begin
  if Form = nil then
    Form := TSeaInvoiceMerchandise.Create(UniApplication);
  Form.Show(
    Procedure(Sender: TComponent; AResult:Integer)
    begin
      if Field <> nil then
      Begin
        Field.Tag   := form.cds_searchid.AsInteger;
        Field.Text  := concat(StrZero( form.cds_searchid.AsInteger,3,0),' - ',form.cds_searchname_company.AsString);
      End;
      Form := nil;
    end
  );
  Result := True;
End;

function openSeaContact(Field:TUniDBLookupComboBox;EntityOwner:Integer):Boolean;
Var
  Form : TSeaContact;
begin
  if Form = nil then
    Form := TSeaContact.Create(UniApplication);
  Form.EntityOwnerID := EntityOwner;
  Form.Show(
    Procedure(Sender: TComponent; AResult:Integer)
    begin
      if Field <> nil then
      Begin
        Field.KeyValue  := form.cds_searchid.AsInteger;
        Field.Text      := concat(StrZero( form.cds_searchid.AsInteger,3,0),' - ',form.cds_searchname_company.AsString );
      End;
      Form := nil;
    end
  );
  Result := True;
End;

function openDevTeste:Boolean;
Var
  Form : TTasFinancialBillsGeneral;
Begin
  Form := TTasFinancialBillsGeneral.Create(UniApplication);
  Form.Show(
  Procedure(Sender: TComponent; AResult:Integer)
  begin
    Form := nil;
  end
);
End;
function openBaseModule(Parente:TWinControl):Boolean;
Var
  Form : TBasemodule;
begin
  result := True;
  Form := TBasemodule.Create(Parente);
  Form.Parent := Parente;
  Form.Show;
End;

function openEmployeeModule(Parente:TWinControl):Boolean;
Var
  Form : TEmployeeModule;
begin
  result := True;
  Form := TEmployeeModule.Create(Parente);
  Form.Parent := Parente;
  Form.Show;
End;

function openProjectModule(Parente:TWinControl):Boolean;
Var
  Form : TProjectModule;
begin
  result := True;
  Form := TProjectModule.Create(Parente);
  Form.Parent := Parente;
  Form.Show;
End;



function openMidiaModule(Parente:TWinControl):Boolean;
Var
  Form : TMidiamodule;
begin
  result := True;
  Form := TMidiamodule.Create(Parente);
  Form.Parent := Parente;
  Form.Show;
End;

function openAdmModule(Parente:TWinControl):Boolean;
Var
  Form : TAdmModule;
begin
  result := True;
  Form := TAdmModule.Create(Parente);
  Form.Parent := Parente;
  Form.Show;
End;

function openSaleModule(Parente:TWinControl):Boolean;
Var
  Form : TSaleModule;
begin
  result := True;
  Form := TSaleModule.Create(Parente);
  Form.Parent := Parente;
  Form.Show;
End;

function openPurchaseModule(Parente:TWinControl):Boolean;
Var
  Form : TPurchaseModule;
begin
  result := True;
  Form := TPurchaseModule.Create(Parente);
  Form.Parent := Parente;
  Form.Show;
End;

function openStockModule(Parente:TWinControl):Boolean;
Var
  Form : TStockModule;
begin
  result := True;
  Form := TStockModule.Create(Parente);
  Form.Parent := Parente;
  Form.Show;
End;

function openBuilderModule(Parente:TWinControl):Boolean;
Var
  Form : TBuilderModule;
begin
  result := True;
  Form := TBuilderModule.Create(Parente);
  Form.Parent := Parente;
  Form.Show;
End;

function openTestModule(Parente:TWinControl):Boolean;
Var
  Form : TTestmodule;
begin
  result := True;
  Form := TTestModule.Create(Parente);
  Form.Parent := Parente;
  Form.Show;
End;

function openSuperModule(Parente:TWinControl):Boolean;
Var
  Form : TSupermodule;
begin
  result := True;
  Form := TSuperModule.Create(Parente);
  Form.Parent := Parente;
  Form.Show;
End;

function openFinancialBillsModule(Parente:TWinControl):Boolean;
Var
  Form : TFinancialBillsModule;
begin
  result := True;
  Form := TFinancialBillsModule.Create(Parente);
  Form.Parent := Parente;
  Form.Show;
End;

function openFinancialPaymentModule(Parente:TWinControl):Boolean;
Var
  Form : TFinancialPaymentModule;
begin
  result := True;
  Form := TFinancialPaymentModule.Create(Parente);
  Form.Parent := Parente;
  Form.Show;
End;

function openExtintorModule(Parente:TWinControl):Boolean;
Var
  Form : TExtintorModule;
begin
  result := True;
  Form := TExtintorModule.Create(Parente);
  Form.Parent := Parente;
  Form.Show;
End;

function openBankModule(Parente:TWinControl):Boolean;
Var
  Form : TBankModule;
begin
  result := True;
  Form := TBankModule.Create(Parente);
  Form.Parent := Parente;
  Form.Show;
End;

function openAutoCenter(Parente:TWinControl):Boolean;
Var
  Form : TAutoCenterModule;
begin
  result := True;
  Form := TAutoCenterModule.Create(Parente);
  Form.Parent := Parente;
  Form.Show;
End;

function openCashierModule(Parente:TWinControl):Boolean;
Var
  Form : TCashierModule;
begin
  result := True;
  Form := TCashierModule.Create(Parente);
  Form.Parent := Parente;
  Form.Show;
End;

function openClinicModule(Parente:TWinControl):Boolean;
Var
  Form : TClinicModule;
begin
  result := True;
  Form := TClinicModule.Create(Parente);
  Form.Parent := Parente;
  Form.Show;
End;

function openPizzariaModule(Parente:TWinControl):Boolean;
Var
  Form : TPizzariaModule;
begin
  result := True;
  Form := TPizzariaModule.Create(Parente);
  Form.Parent := Parente;
  Form.Show;
End;


function openSeaRestMenu(Field:TUniDBLookupComboBox):Boolean;
Var
  Form : TSeaRestMenu;
begin
  if Form = nil then
    Form := TSeaRestMenu.Create(UniApplication);
  Form.Show(
    Procedure(Sender: TComponent; AResult:Integer)
    begin
      Form := nil;
    end
  );
  Result := True;
End;

function openSeaRestMenuPizza(Field:TUniDBLookupComboBox):Boolean;
Var
  Form : TSeaRestMenuPizza;
begin
  if Form = nil then
    Form := TSeaRestMenuPizza.Create(UniApplication);
  Form.Show(
    Procedure(Sender: TComponent; AResult:Integer)
    begin
      Form := nil;
    end
  );
  Result := True;
End;

function openSeaRestMenuBeverage(Field:TUniDBLookupComboBox):Boolean;
Var
  Form : TSeaRestMenuBeverage;
begin
  if Form = nil then
    Form := TSeaRestMenuBeverage.Create(UniApplication);
  Form.Show(
    Procedure(Sender: TComponent; AResult:Integer)
    begin
      Form := nil;
    end
  );
  Result := True;
End;


// cads
function openCadVehicleBrandModel(Field:TUniEdit):Boolean;
var
  Form : TCadVehBrandModel;
begin
if Form = nil then
    Form := TCadVehBrandModel.Create(UniApplication);
  if Field <> nil then
    Form.CodigoRegistro := Field.tag;
  Form.Show(
    Procedure(Sender: TComponent; AResult:Integer)
    begin
      if Field <> nil then
      Begin
        Field.Tag   := form.VehicleBrand.Registro.Codigo;
        Field.Text  := form.VehicleBrand.Registro.Descricao;
      End;
      Form := nil;
    end
  );
  Result := True;
End;

function openCadVehicleKind(Field:TUniEdit):Boolean;
var
  Form : TCadVehKind;
begin
if Form = nil then
    Form := TCadVehKind.Create(UniApplication);
  if Field <> nil then
    Form.CodigoRegistro := Field.tag;
  Form.Show(
    Procedure(Sender: TComponent; AResult:Integer)
    begin
      if Field <> nil then
      Begin
        Field.Tag   := form.VehKind.Registro.Codigo;
        Field.Text  := form.VehKind.Registro.Descricao;
      End;
      Form := nil;
    end
  );
  Result := True;
End;

function openCadService(Field:TUniEdit):Boolean;
var
  Form : TCadService;
begin
if Form = nil then
    Form := TCadService.Create(UniApplication);
  if Field <> nil then
    Form.CodigoRegistro := Field.tag;
  Form.Show(
    Procedure(Sender: TComponent; AResult:Integer)
    begin
      if Field <> nil then
      Begin
        Field.Tag   := form.E_Codigo.Tag;
        Field.Text  := form.E_Description.Text;
      End;
      Form := nil;
    end
  );
  Result := True;
End;

function openCadDischargeIcms(CodeId:Integer;Field:TUniDBLookupComboBox):Boolean;
var
  Form : TCadDischargeIcms;
begin
  if Form = nil then
    Form := TCadDischargeIcms.Create(UniApplication);
  Form.CodigoRegistro := CodeId;
  if (Field <> nil) and (Field.KeyValue <> null) then
    Form.CodigoRegistro :=  Field.KeyValue;

  Form.Show(
    Procedure(Sender: TComponent; AResult:Integer)
    begin
      if Field <> nil then
      Begin
        Field.KeyValue   := form.DischargeIcms.Registro.Codigo;
        Field.Text       := form.DischargeIcms.Registro.Descricao;
      End;
      Form := nil;
    end
  );
  Result := True;
End;



function openCadMerchandiseItems(codigoMestre:Integer):Boolean;
var
  Form : TCadMerchandiseHasSelf;
begin
  if Form = nil then
    Form := TCadMerchandiseHasSelf.Create(UniApplication);
  Form.CodigoRegistro := codigoMestre;
  Form.Show(
    Procedure(Sender: TComponent; AResult:Integer)
    begin
      Form := nil;
    end
  );
  Result := True;
End;

function openCadCollaborator(CodeId:Integer;Field:TUniDBLookupComboBox):Boolean;
var
  Form : TCadCollaborator;
begin
  if Form = nil then
    Form := TCadCollaborator.Create(UniApplication);
  Form.CodigoRegistro := CodeId;
  if (Field <> nil) and (Field.KeyValue <> null) then
    Form.CodigoRegistro :=  Field.KeyValue;
  Form.Show(
    Procedure(Sender: TComponent; AResult:Integer)
    begin
      if Field <> nil then
      Begin
        Field.KeyValue    := form.Collaborator.Registro.Codigo;
        //Field.Text        := form.Collaborator.Entity.;
      End;
      Form := nil;
    end
  );
  Result := True;
End;


function openCadTaxRuler(Field:TUniEdit):Boolean;
var
  Form : TCadTaxRuler;
begin
  if Form = nil then
    Form := TCadTaxRuler.Create(UniApplication);
  Form.CodigoRegistro := 0;
  if Field <> nil then
    Form.CodigoRegistro := Field.tag;
  Form.Show(
    Procedure(Sender: TComponent; AResult:Integer)
    begin
      if Field <> nil then
      Begin
        //Field.Tag   := form.TaxRuler.Registro.Codigo;
        //Field.Text  := form.Observation.Registro.Descricao;
      End;
      Form := nil;
    end
  );
  Result := True;
End;

function openCadObservation (CodeId:Integer;Field:TUniDBLookupComboBox):Boolean;
var
  Form : TCadObservation;
begin
  if Form = nil then
    Form := TCadObservation.Create(UniApplication);
  Form.CodigoRegistro := CodeId;
  if (Field <> nil) and (Field.KeyValue <> null) then
    Form.CodigoRegistro :=  Field.KeyValue;
  Form.Show(
    Procedure(Sender: TComponent; AResult:Integer)
    begin
      if Field <> nil then
      Begin
        Field.KeyValue    := form.Observation.Registro.Codigo;
        Field.Text        := form.Observation.Registro.Descricao;
      End;
      Form := nil;
    end
  );
  Result := True;
End;


function openCadTaxPis (CodeId:Integer;Field:TUniDBLookupComboBox):Boolean;
Var
  Form : TcadTaxPis;
begin
  if Form = nil then
    Form := TcadTaxPis.Create(UniApplication);
  Form.CodigoRegistro := CodeId;
  if (Field <> nil) and (Field.KeyValue <> null) then
    Form.CodigoRegistro :=  Field.KeyValue;
  Form.Show(
    Procedure(Sender: TComponent; AResult:Integer)
    begin
      if Field <> nil then
      Begin
        Field.KeyValue   := form.TaxPis.Registro.Codigo;
        Field.Text  := form.TaxPis.Registro.Descricao;
      End;
      Form := nil;
    end
  );
  Result := True;
End;

function openCadTaxIpi(CodeId:Integer;Field:TUniDBLookupComboBox):Boolean;
Var
  Form : TcadTaxIpi;
begin
  if Form = nil then
    Form := TcadTaxIpi.Create(UniApplication);
  Form.CodigoRegistro := CodeId;
  if (Field <> nil) and (Field.KeyValue <> null) then
    Form.CodigoRegistro :=  Field.KeyValue;
  Form.Show(
    Procedure(Sender: TComponent; AResult:Integer)
    begin
      if Field <> nil then
      Begin
        Field.KeyValue   := form.TaxIpi.Registro.Codigo;
        Field.Text  := form.TaxIpi.Registro.Descricao;
      End;
      Form := nil;
    end
  );
  Result := True;
End;


function openCadDeterBaseTaxIcms(CodeId:Integer;Field:TUniDBLookupComboBox):Boolean;
var
  Form : TCadDeterBaseTaxIcms;
begin
  if Form = nil then
    Form := TCadDeterBaseTaxIcms.Create(UniApplication);
  Form.CodigoRegistro := CodeId;
  if (Field <> nil) and (Field.KeyValue <> null) then
    Form.CodigoRegistro :=  Field.KeyValue;
  Form.Show(
    Procedure(Sender: TComponent; AResult:Integer)
    begin
      if Field <> nil then
      Begin
        Field.KeyValue  := form.DeterBaseTaxIcms.Registro.Codigo;
        Field.Text      := form.DeterBaseTaxIcms.Registro.Descricao;
      End;
      Form := nil;
    end
  );
  Result := True;
End;


function openCadTaxIcmsNr(CodeId:Integer;Field:TUniDBLookupComboBox) :Boolean;
Var
  Form : TCadTaxIcmsNr;
begin
  if Form = nil then
    Form := TCadTaxIcmsNr.Create(UniApplication);
  Form.CodigoRegistro := CodeId;
  if (Field <> nil) and (Field.KeyValue <> null) then
    Form.CodigoRegistro :=  Field.KeyValue;
  Form.Show(
    Procedure(Sender: TComponent; AResult:Integer)
    begin
      if Field <> nil then
      Begin
        Field.KeyValue   := form.TaxIcmsNr.Registro.Codigo;
        Field.Text       := form.TaxIcmsNr.Registro.Descricao;
      End;
      Form := nil;
    end
  );
  Result := True;
End;





function openCadPrivilege(Field:TUniEdit) :Boolean;
var
  Form : TCadPrivilege;
begin
  if Form = nil then
    Form := TCadPrivilege.Create(UniApplication);
  if Field <> nil then
    Form.CodigoRegistro := Field.tag;
  Form.Show(
    Procedure(Sender: TComponent; AResult:Integer)
    begin
      if Field <> nil then
      Begin
        Field.Tag   := form.Privilege.Registro.Codigo;
        Field.Text  := form.Privilege.Registro.Descricao;
      End;
      Form := nil;
    end
  );
  Result := True;
End;

function openCadInterface(Field:TUniEdit) :Boolean;
var
  Form : TCadInterface;
begin
  if Form = nil then
    Form := TCadInterface.Create(UniApplication);
  if Field <> nil then
    Form.CodigoRegistro := Field.tag;
  Form.Show(
    Procedure(Sender: TComponent; AResult:Integer)
    begin
      if Field <> nil then
      Begin
        Field.Tag   := form.Interfaces.Registro.Codigo;
        Field.Text  := form.Interfaces.Registro.Descricao;
      End;
      Form := nil;
    end
  );
  Result := True;
End;

function openCadModule(Field:TUniEdit) :Boolean;
var
  Form : TCadModule;
begin
  if Form = nil then
    Form := TCadModule.Create(UniApplication);
  if Field <> nil then
    Form.CodigoRegistro := Field.tag;
  Form.Show(
    Procedure(Sender: TComponent; AResult:Integer)
    begin
      if Field <> nil then
      Begin
        Field.Tag   := form.Module.Registro.Codigo;
        Field.Text  := form.Module.Registro.Descricao;
      End;
      Form := nil;
    end
  );
  Result := True;
End;


function openCadOrder (Field:TUniEdit):Boolean;
var
  Form : TTasOrder;
begin
  if Form = nil then
    Form := TTasOrder.Create(UniApplication);
  if Field <> nil then
    Form.CodigoRegistro := Field.tag;
  Form.Show(
    Procedure(Sender: TComponent; AResult:Integer)
    begin
      if Field <> nil then
      Begin
        //Field.Tag   := form.Order.Registro.Codigo;
        //Field.Text  := form.Order.Registro.Descricao;
      End;
      Form := nil;
    end
  );
  Result := True;
End;

function openCadStockList(CodeId:Integer;Field:TUniDBLookupComboBox):Boolean;
var
  Form : TCadStockList;
begin
  if Form = nil then
    Form := TCadStockList.Create(UniApplication);
  Form.CodigoRegistro := CodeId;
  if (Field <> nil) and (Field.KeyValue <> null) then
    Form.CodigoRegistro :=  Field.KeyValue;
  Form.Show(
    Procedure(Sender: TComponent; AResult:Integer)
    begin
      if Field <> nil then
      Begin
        Field.KeyValue   := form.StockList.Registro.Codigo;
        Field.Text  := form.StockList.Registro.Descricao;
      End;
      Form := nil;
    end
  );
  Result := True;
End;

function openCadLineBusiness(CodeId:Integer;Field:TUniDBLookupComboBox):Boolean;
Var
  Form : TCadLinebusiness;
begin
  result := True;
  if Form = nil then
    Form := TCadLinebusiness.Create(UniApplication);
  Form.CodigoRegistro := CodeId;
  if (Field <> nil) and (Field.KeyValue <> null) then
    Form.CodigoRegistro :=  Field.KeyValue;
  Form.Show(
    Procedure(Sender: TComponent; AResult:Integer)
    begin
      if Field <> nil then
      Begin
        Field.KeyValue := Form.LineBusiness.Registro.Codigo;
        Field.Text := UpperCase( Form.LineBusiness.Registro.Descricao );
      End;
      Form := nil;
    end
  );

End;
function openCadCarrier(CodeId:Integer;Field:TUniDBLookupComboBox):Boolean;
Var
  Form : TCadCarrier;
begin
  if Form = nil then
    Form := TCadCarrier.Create(UniApplication);
  Form.CodigoRegistro := CodeId;
  if (Field <> nil) and (Field.KeyValue <> null) then
    Form.CodigoRegistro :=  Field.KeyValue;
  Form.Show(
    Procedure(Sender: TComponent; AResult:Integer)
    begin
      if Field <> nil then
      Begin
        Field.KeyValue  := form.Carrier.Registro.Codigo;
        Field.Text      := concat(StrZero(form.Carrier.Registro.Codigo,3,0),' - ',
                                  form.carrier.Fiscal.Registro.NomeRazao);
      End;
      Form := nil;
    end
  );
  Result := True;
End;

function openCadCountry(CodeId:Integer;Field:TUniDBLookupComboBox):Boolean;
Var
  Form : TCadCountry;
begin
  result := True;
  if Form = nil then
    Form := TCadCountry.Create(UniApplication);
  Form.CodigoRegistro := CodeId;
  if (Field <> nil) and (Field.KeyValue <> null) then
    Form.CodigoRegistro :=  Field.KeyValue;
  Form.Show(
    Procedure(Sender: TComponent; AResult:Integer)
    begin
      if Field <> nil then
      Begin
        Field.KeyValue := Form.Country.Registro.Codigo;
        Field.Text := UpperCase( Form.Country.Registro.Nome );
      End;
      Form := nil;
    end
  );
End;

function openCadState(Field:TUniDBLookupComboBox):Boolean;
Var
  Form : TCadState;
begin
  result := True;
  if Form = nil then
    Form := TCadState.Create(UniApplication);
  if (Field <> nil) and (Field.KeyValue <> null) then
    Form.CodigoRegistro := Field.KeyValue;
  Form.Show(
    Procedure(Sender: TComponent; AResult:Integer)
    begin
      if Field <> nil then
      Begin
        Field.KeyValue := Form.State.Registro.Codigo;
      End;
      Form := nil;
    end
  );
End;

function openCadCity(CodeId:Integer;Field:TUniDBLookupComboBox):Boolean;
Var
  Form : TCadCity;
begin
  if Form = nil then
    Form := TCadCity.Create(UniApplication);
  Form.CodigoRegistro := CodeId;
  if (Field <> nil) and (Field.KeyValue <> null) then
    Form.CodigoRegistro :=  Field.KeyValue;
  Form.Show(
    Procedure(Sender: TComponent; AResult:Integer)
    begin
      if Field <> nil then
      Begin
        Field.KeyValue   := form.City.Registro.Codigo;
        Field.Text  := form.City.Name;
      End;
      Form := nil;
    end
  );
  Result := True;
End;

function openCadUser(Field:TUniEdit;Institution:Integer):Boolean;
Var
  Form : TCadUser;
begin
  if Form = nil then
    Form := TCadUser.Create(UniApplication);
  if Field <> nil then
    Form.CodigoRegistro := Field.Tag;
  Form.InstitutionID := Institution;
  Form.Show(
    Procedure(Sender: TComponent; AResult:Integer)
    begin
      if Field <> nil then
      Begin
        Field.Tag   := form.User.Registro.Codigo;
        Field.Text  := form.User.Entity.Registro.NomeRazao;
      End;
      Form := nil;
    end
  );
  Result := True;
End;

function openCadInstitution(Field:TUniEdit;Institution:Integer):Boolean;
Var
  Form : TCadInstitution;
begin
  if Form = nil then
    Form := TCadInstitution.Create(UniApplication);
  Form.CodigoRegistro := Institution;
  Form.InstitutionID := Institution;
  Form.Show(
    Procedure(Sender: TComponent; AResult:Integer)
    begin
      if Field <> nil then
      Begin
        //Field.Tag   := form.Entidade.Registro.Codigo;
        //Field.Text  := form.Entidade.Registro.NomeRazao;
      End;
      Form := nil;
    end
  );
  Result := True;
End;

function openCadExtintor(Field:TUniEdit):Boolean;
Var
  Form : TCadExtintor;
begin
  if Form = nil then
    Form := TCadExtintor.Create(UniApplication);
  if Field <> nil then
    Form.CodigoRegistro := Field.tag;
  Form.Show(
    Procedure(Sender: TComponent; AResult:Integer)
    begin
      if Field <> nil then
      Begin
        //Field.Tag   := form.Entidade.Registro.Codigo;
        //Field.Text  := form.Entidade.Registro.NomeRazao;
      End;
      Form := nil;
    end
  );
  Result := True;
End;

function openCadBank(CodeId:Integer;Field:TUniDBLookupComboBox):Boolean;
Var
  Form : TCadBank;
begin
  if Form = nil then
    Form := TCadBank.Create(UniApplication);
  Form.CodigoRegistro := CodeId;
  if (Field <> nil) and (Field.KeyValue <> null) then
    Form.CodigoRegistro :=  Field.KeyValue;
  Form.Show(
    Procedure(Sender: TComponent; AResult:Integer)
    begin
      if Field <> nil then
      Begin
        Field.KeyValue   := form.Bank.Registro.Codigo;
        Field.Text  := form.Bank.Entity.Registro.NomeRazao;
      End;
      Form := nil;
    end
  );
  Result := True;
End;

function openCadPromotion(CodeId:Integer;Field:TUniDBLookupComboBox):Boolean;
//Var
//  Form : TCadPromotion;
begin
//  if Form = nil then
//    Form := TCadPromotion.Create(UniApplication);
//  Form.CodigoRegistro := CodeId;
//  if (Field <> nil) and (Field.KeyValue <> null) then
//    Form.CodigoRegistro :=  Field.KeyValue;
//  Form.Show(
//    Procedure(Sender: TComponent; AResult:Integer)
//    begin
//      if Field <> nil then
//      Begin
//        Field.KeyValue   := form.Promotion.Registro.Codigo;
//        Field.Text  := form.Promotion.Registro.Estabelecimento;
//      End;
//      Form := nil;
//    end
//  );
//  Result := True;
End;

function openCadBankAccount(CodeId:Integer;Field:TUniDBLookupComboBox):Boolean;
Var
  Form : TCadBankAccount;
begin
  if Form = nil then
    Form := TCadBankAccount.Create(UniApplication);
  Form.CodigoRegistro := CodeId;
  if (Field <> nil) and (Field.KeyValue <> null) then
    Form.CodigoRegistro :=  Field.KeyValue;
  Form.Show(
    Procedure(Sender: TComponent; AResult:Integer)
    begin
      if Field <> nil then
      Begin
        Field.KeyValue   := form.BankAccount.Registro.Codigo;
        //Field.Text  := form.BankAccount.Entity.Registro.NomeRazao;
      End;
      Form := nil;
    end
  );
  Result := True;
End;

function openCadBankHistoric(CodeId:Integer;
                             BankId : Integer;
                             Field:TUniDBLookupComboBox):Boolean;
Var
  Form : TCadBankHistoric;
begin
  if Form = nil then
    Form := TCadBankHistoric.Create(UniApplication);
  Form.CodigoRegistro := CodeId;
  Form.Bank_id := BankId;
  if (Field <> nil) and (Field.KeyValue <> null) then
    Form.CodigoRegistro :=  Field.KeyValue;
  Form.Show(
    Procedure(Sender: TComponent; AResult:Integer)
    begin
      if Field <> nil then
      Begin
        Field.KeyValue   := form.BankHistoric.Registro.Codigo;
        Field.Text  := form.BankHistoric.Registro.Descricao;
      End;
      Form := nil;
    end
  );
  Result := True;
End;

function openCadBankChargeTicket(CodeId:Integer;
                                 BankId : Integer;
                                 ChargeId : String;
                                 Field:TUniDBLookupComboBox):Boolean;
Var
  Form : TCadBankChargeTicket;
begin
  if Form = nil then
    Form := TCadBankChargeTicket.Create(UniApplication);
  Form.CodigoRegistro := CodeId;
  Form.Bank_id := BankId;
  Form.Charge_id := ChargeId;
  if (Field <> nil) and (Field.KeyValue <> null) then
    Form.CodigoRegistro :=  Field.KeyValue;
  Form.Show(
    Procedure(Sender: TComponent; AResult:Integer)
    begin
      if Field <> nil then
      Begin
        Field.KeyValue   := form.BankChargeTicket.Registro.Codigo;
        Field.Text       := form.BankChargeTicket.Entity.Registro.NomeRazao;
      End;
      Form := nil;
    end
  );
  Result := True;
End;

function openCadBankChargeKind(CodeId:Integer;
                                 BankId : Integer;
                                 Field:TUniDBLookupComboBox):Boolean;
Var
  Form : TCadBankChargeKind;
begin
  if Form = nil then
    Form := TCadBankChargeKind.Create(UniApplication);
  Form.CodigoRegistro := CodeId;
  Form.Bank_id := BankId;
  if (Field <> nil) and (Field.KeyValue <> null) then
    Form.CodigoRegistro :=  Field.KeyValue;
  Form.Show(
    Procedure(Sender: TComponent; AResult:Integer)
    begin
      if Field <> nil then
      Begin
        Field.KeyValue   := form.BankChargeKind.Registro.Codigo;
        Field.Text       := form.BankChargeKind.Registro.Descricao;
        Field.Text       := form.BankChargeKind.Registro.Abreviacao;
      End;
      Form := nil;
    end
  );
  Result := True;
End;

function openCadBankChargeSlip(CodeId:Integer;Field:TUniDBLookupComboBox):Boolean;
Var
  Form : TCadBankChargeSlip;
begin
  if Form = nil then
    Form := TCadBankChargeSlip.Create(UniApplication);
  Form.CodigoRegistro := CodeId;
  if (Field <> nil) and (Field.KeyValue <> null) then
    Form.CodigoRegistro :=  Field.KeyValue;
  Form.Show(
    Procedure(Sender: TComponent; AResult:Integer)
    begin
      if Field <> nil then
      Begin
        Field.KeyValue   := form.BankChargeSlip.Registro.Codigo;
        Field.Text       := form.BankChargeSlip.Entity.Registro.NomeRazao;
      End;
      Form := nil;
    end
  );
  Result := True;
End;

function openCadContact(CodeId:Integer;Field:TUniDBLookupComboBox):Boolean;
Var
  Form : TCadContact;
begin
  if Form = nil then
    Form := TCadContact.Create(UniApplication);
  Form.CodigoRegistro := CodeId;

  if (Field <> nil) and (Field.KeyValue <> null) then
    Form.CodigoRegistro :=  Field.KeyValue;
  Form.Show(
    Procedure(Sender: TComponent; AResult:Integer)
    begin
      if Field <> nil then
      Begin
        Field.KeyValue  := form.Contact.Registro.Codigo;
        Field.Text      := form.Contact.Entidade.Registro.NomeRazao;
      End;
      Form := nil;
    end
  );
  Result := True;
End;


function openCadSuInstitution(Field:TUniEdit;Institution:Integer):Boolean;
Var
  Form : TCadSuInstitution;
begin
  if Form = nil then
    Form := TCadSuInstitution.Create(UniApplication);
  if Field <> nil then
    Form.CodigoRegistro := Field.tag;
  Form.InstitutionID := Institution;
  Form.Show(
    Procedure(Sender: TComponent; AResult:Integer)
    begin
      if Field <> nil then
      Begin
        //Field.Tag   := form.Entidade.Registro.Codigo;
        //Field.Text  := form.Entidade.Registro.NomeRazao;
      End;
      Form := nil;
    end
  );
  Result := True;
End;

function openCadProvider(CodeId:Integer;Field:TUniDBLookupComboBox):Boolean;
Var
  Form : TCadProvider;
begin
  if Form = nil then
    Form := TCadProvider.Create(UniApplication);
  Form.CodigoRegistro := CodeId;
  if (Field <> nil) and (Field.KeyValue <> null) then
    Form.CodigoRegistro :=  Field.KeyValue;
  Form.Show(
    Procedure(Sender: TComponent; AResult:Integer)
    begin
      if Field <> nil then
      Begin
        Field.KeyValue  := form.provider.Registro.Codigo;
        Field.Text      := form.provider.Fiscal.Registro.NomeRazao;
      End;
      Form := nil;
    end
  );
  Result := True;
End;

function openCadAccounting(CodeId:Integer;Field:TUniDBLookupComboBox):Boolean;
Var
  Form : TCadAccounting;
begin
  if Form = nil then
    Form := TCadAccounting.Create(UniApplication);
  Form.CodigoRegistro := CodeId;
  if (Field <> nil) and (Field.KeyValue <> null) then
    Form.CodigoRegistro :=  Field.KeyValue;
  Form.Show(
    Procedure(Sender: TComponent; AResult:Integer)
    begin
      if Field <> nil then
      Begin
        Field.KeyValue  := form.Accounting.Registro.Codigo;
        Field.Text      := form.Accounting.Fiscal.Registro.NomeRazao;
      End;
      Form := nil;
    end
  );
  Result := True;
End;

function openCadExtAgent(CodeId:Integer;Field:TUniDBLookupComboBox):Boolean;
Var
  Form : TCadExtAgent;
begin
  if Form = nil then
    Form := TCadExtAgent.Create(UniApplication);
  Form.CodigoRegistro := CodeId;
  if (Field <> nil) and (Field.KeyValue <> null) then
    Form.CodigoRegistro :=  Field.KeyValue;
  Form.Show(
    Procedure(Sender: TComponent; AResult:Integer)
    begin
      if Field <> nil then
      Begin
        //Field.KeyValue  := form.Accounting.Registro.Codigo;
        //Field.Text      := form.Accounting.EntityFiscal.Registro.NomeRazao;
      End;
      Form := nil;
    end
  );
  Result := True;
End;

function openCadExtKind(CodeId:Integer;Field:TUniDBLookupComboBox):Boolean;
Var
  Form : TCadExtKind;
begin
  if Form = nil then
    Form := TCadExtKind.Create(UniApplication);
  Form.CodigoRegistro := CodeId;
  if (Field <> nil) and (Field.KeyValue <> null) then
    Form.CodigoRegistro :=  Field.KeyValue;
  Form.Show(
    Procedure(Sender: TComponent; AResult:Integer)
    begin
      if Field <> nil then
      Begin
        //Field.KeyValue  := form.Accounting.Registro.Codigo;
        //Field.Text      := form.Accounting.EntityFiscal.Registro.NomeRazao;
      End;
      Form := nil;
    end
  );
  Result := True;
End;

function openCadExtTester(CodeId:Integer;Field:TUniDBLookupComboBox):Boolean;
Var
  Form : TCadExtTester;
begin
  if Form = nil then
    Form := TCadExtTester.Create(UniApplication);
  Form.CodigoRegistro := CodeId;
  if (Field <> nil) and (Field.KeyValue <> null) then
    Form.CodigoRegistro :=  Field.KeyValue;
  Form.Show(
    Procedure(Sender: TComponent; AResult:Integer)
    begin
      if Field <> nil then
      Begin
        //Field.KeyValue  := form.Accounting.Registro.Codigo;
        //Field.Text      := form.Accounting.EntityFiscal.Registro.NomeRazao;
      End;
      Form := nil;
    end
  );
  Result := True;
End;

function openCadExtMotive(CodeId:Integer;Field:TUniDBLookupComboBox):Boolean;
Var
  Form : TCadExtMotive;
begin
  if Form = nil then
    Form := TCadExtMotive.Create(UniApplication);
  Form.CodigoRegistro := CodeId;
  if (Field <> nil) and (Field.KeyValue <> null) then
    Form.CodigoRegistro :=  Field.KeyValue;
  Form.Show(
    Procedure(Sender: TComponent; AResult:Integer)
    begin
      if Field <> nil then
      Begin
        //Field.KeyValue  := form.Accounting.Registro.Codigo;
        //Field.Text      := form.Accounting.EntityFiscal.Registro.NomeRazao;
      End;
      Form := nil;
    end
  );
  Result := True;
End;

function openCadExtSeal(CodeId:Integer;Field:TUniDBLookupComboBox):Boolean;
Var
  Form : TCadExtSeal;
begin
  if Form = nil then
    Form := TCadExtSeal.Create(UniApplication);
  Form.CodigoRegistro := CodeId;
  if (Field <> nil) and (Field.KeyValue <> null) then
    Form.CodigoRegistro :=  Field.KeyValue;
  Form.Show(
    Procedure(Sender: TComponent; AResult:Integer)
    begin
      if Field <> nil then
      Begin
        //Field.KeyValue  := form.Accounting.Registro.Codigo;
        //Field.Text      := form.Accounting.EntityFiscal.Registro.NomeRazao;
      End;
      Form := nil;
    end
  );
  Result := True;
End;

function openCadMedPriceListJR(CodeBroad:Integer):Boolean;
Var
  Form : TCadMedPriceListJR;
begin
  if Form = nil then
    Form := TCadMedPriceListJR.Create(UniApplication);
    Form.CodigoRegistro :=  CodeBroad;
  Form.Show(
    Procedure(Sender: TComponent; AResult:Integer)
    begin
      Form := nil;
    end
  );
  Result := True;
End;

function openCadMedPriceListRT(CodeBroad:Integer):Boolean;
Var
  Form : TCadMedPriceListRT;
begin
  if Form = nil then
    Form := TCadMedPriceListRt.Create(UniApplication);
    Form.CodigoRegistro :=  CodeBroad;
  Form.Show(
    Procedure(Sender: TComponent; AResult:Integer)
    begin
      Form := nil;
    end
  );
  Result := True;
End;

function openCadMedPriceListON(CodeBroad:Integer):Boolean;
Var
  Form : TCadMedPriceListOl;
begin
  if Form = nil then
    Form := TCadMedPriceListOl.Create(UniApplication);
    Form.CodigoRegistro :=  CodeBroad;
  Form.Show(
    Procedure(Sender: TComponent; AResult:Integer)
    begin
      Form := nil;
    end
  );
  Result := True;
End;

function openCadMedBroadCasterCoverage(BroadcasterID:Integer):Boolean;
Var
  Form : TCadMedBroadcasterCirculation;
begin
  if Form = nil then
    Form := TCadMedBroadcasterCirculation.Create(UniApplication);
    Form.CodigoRegistro :=  BroadcasterID;
  Form.Show(
    Procedure(Sender: TComponent; AResult:Integer)
    begin
      Form := nil;
    end
  );
  Result := True;
End;

function openCadMedCopyEdition(BroadcasterID:Integer):Boolean;
Var
  Form : TCadMedPriceListOl;
begin
  if Form = nil then
    Form := TCadMedPriceListOl.Create(UniApplication);
    Form.CodigoRegistro :=  BroadcasterID;
  Form.Show(
    Procedure(Sender: TComponent; AResult:Integer)
    begin
      Form := nil;
    end
  );
  Result := True;
End;

function openCadWorkFront(Codigo:Integer;Field:TUniDBLookupComboBox):Boolean;
Var
  Form : TCadWorkFront;
begin
  if Form = nil then
    Form := TCadWorkFront.Create(UniApplication);
  Form.CodigoRegistro := Codigo;
  if (Field <> nil) and (Field.KeyValue <> null) then
    Form.CodigoRegistro :=  Field.KeyValue;
  Form.Show(
    Procedure(Sender: TComponent; AResult:Integer)
    begin
      if Field <> nil then
      Begin
        Field.KeyValue   := form.Work.Registro.Codigo;
        Field.Text  := form.Work.Registro.Descricao;
      End;
      Form := nil;
    end
  );
  Result := True;
End;

function openCadClinModule(CodeId:Integer;Field:TUniDBLookupComboBox):Boolean;
Var
  Form : TCadClinModule;
begin
  if Form = nil then
    Form := TCadClinModule.Create(UniApplication);
  Form.CodigoRegistro := CodeId;
  if (Field <> nil) and (Field.KeyValue <> null) then
    Form.CodigoRegistro :=  Field.KeyValue;
  Form.Show(
    Procedure(Sender: TComponent; AResult:Integer)
    begin
      if Field <> nil then
      Begin
        Field.KeyValue   := form.ClinModule.Registro.Codigo;
        Field.Text  := form.ClinModule.Registro.Descricao;
      End;
      Form := nil;
    end
  );
  Result := True;
end;

function openCadPaymentTypes(CodeId:Integer;Field:TUniDBLookupComboBox):Boolean;
var
  Form : TCadPaymentTypes;
begin
  if Form = nil then
    Form := TCadPaymentTypes.Create(UniApplication);
  Form.CodigoRegistro := CodeId;
  if (Field <> nil) and (Field.KeyValue <> null) then
    Form.CodigoRegistro :=  Field.KeyValue;
  Form.Show(
    Procedure(Sender: TComponent; AResult:Integer)
    begin
      if Field <> nil then
      Begin
        Field.KeyValue  := form.PaymentTypes.Registro.Codigo;
        Field.Text      := form.PaymentTypes.Registro.Descricao;
      End;
      Form := nil;
    end
  );
  Result := True;
End;

function openCadCategory(CodeId:Integer;Field:TUniDBLookupComboBox):Boolean;
var
  Form : TCadCategory;
begin
  if Form = nil then
    Form := TCadCategory.Create(UniApplication);
  Form.CodigoRegistro := CodeId;
  if (Field <> nil) and (Field.KeyValue <> null) then
    Form.CodigoRegistro :=  Field.KeyValue;
  Form.Show(
    Procedure(Sender: TComponent; AResult:Integer)
    begin
      if Field <> nil then
      Begin
        Field.KeyValue    := form.Category.Registro.Codigo;
        Field.Text        := form.Category.Registro.Descricao;
      End;
      Form := nil;
    end
  );
  Result := True;
End;

function openCadFinancialPlans(CodeId:Integer;Field:TUniDBLookupComboBox):Boolean;
var
  Form : TCadFinancialPlans;
begin
  if Form = nil then
    Form := TCadFinancialPlans.Create(UniApplication);
  Form.CodigoRegistro := CodeId;
  if (Field <> nil) and (Field.KeyValue <> null) then
    Form.CodigoRegistro :=  Field.KeyValue;
  Form.Show(
    Procedure(Sender: TComponent; AResult:Integer)
    begin
      if Field <> nil then
      Begin
        Field.KeyValue    := form.FinancialPlans.Registro.Codigo;
        Field.Text        := form.FinancialPlans.Registro.Descricao;
      End;
      Form := nil;
    end
  );
  Result := True;
End;

function openCadBrand(CodeId:Integer;Field:TUniDBLookupComboBox):Boolean;
Var
  Form : TCadBrand;
begin
  if Form = nil then
    Form := TCadBrand.Create(UniApplication);
  Form.CodigoRegistro := CodeId;
  if (Field <> nil) and (Field.KeyValue <> null) then
    Form.CodigoRegistro :=  Field.KeyValue;
  Form.Show(
    Procedure(Sender: TComponent; AResult:Integer)
    begin
      if Field <> nil then
      Begin
        Field.KeyValue   := form.Brand.Registro.Codigo;
        Field.Text  := form.Brand.Registro.Descricao;
      End;
      Form := nil;
    end
  );
  Result := True;
End;

function openCadPackage(CodeId:Integer;Field:TUniDBLookupComboBox):Boolean;
var
  Form : TCadPackage;
begin
  if Form = nil then
    Form := TCadPackage.Create(UniApplication);
  Form.CodigoRegistro := CodeId;
  if (Field <> nil) and (Field.KeyValue <> null) then
    Form.CodigoRegistro :=  Field.KeyValue;
  Form.Show(
    Procedure(Sender: TComponent; AResult:Integer)
    begin
      if Field <> nil then
      Begin
        Field.KeyValue  := form.Package.Registro.Codigo;
        Field.Text      := form.Package.Registro.Descricao;
      End;
      Form := nil;
    end
  );
  Result := True;
End;

function openCadColor(CodeId:Integer;Field:TUniDBLookupComboBox):Boolean;
Var
  Form : TCadColor;
begin
  if Form = nil then
    Form := TCadColor.Create(UniApplication);
  Form.CodigoRegistro := CodeId;
  if (Field <> nil) and (Field.KeyValue <> null) then
    Form.CodigoRegistro :=  Field.KeyValue;
  Form.Show(
    Procedure(Sender: TComponent; AResult:Integer)
    begin
      if Field <> nil then
      Begin
        Field.KeyValue   := form.Color.Registro.Codigo;
        Field.Text  := form.Color.Registro.Descricao;
      End;
      Form := nil;
    end
  );
  Result := True;
End;

function openCadMeasure(CodeId:Integer;Field:TUniDBLookupComboBox):Boolean;
var
  Form : TCadMeasure;
begin
  if Form = nil then
    Form := TCadMeasure.Create(UniApplication);
  Form.CodigoRegistro := CodeId;
  if (Field <> nil) and (Field.KeyValue <> null) then
    Form.CodigoRegistro :=  Field.KeyValue;
  Form.Show(
    Procedure(Sender: TComponent; AResult:Integer)
    begin
      if Field <> nil then
      Begin
        Field.KeyValue  := form.Measure.Registro.Codigo;
        Field.Text      := form.Measure.Registro.Descricao;
      End;
      Form := nil;
    end
  );
  Result := True;
End;

function openCadMerchandise(CodeId:Integer;Field:TUniDBLookupComboBox):Boolean;
var
  Form : TCadMerchandise;
begin
  if Form = nil then
    Form := TCadMerchandise.Create(UniApplication);
  if (CodeId > 0 ) then
  Begin
    Form.CodigoRegistro := CodeId;
  End
  else
  if Field <> nil then
  Begin
    if Field.KeyValue <> null then
      Form.CodigoRegistro := Field.KeyValue
    else
      Form.CodigoRegistro := CodeId;
  End;

  Form.Show(
    Procedure(Sender: TComponent; AResult:Integer)
    begin
      if Field <> nil then
      Begin
//        Field.KeyValue  := form.Mercadoria.Registro.Codigo;
//        Field.Text      := concat(StrZero(form.Mercadoria.Registro.Codigo,3,0),' - ',
//                                        form.Mercadoria.Produto.Registro.Descricao
//                                        );
      End;
      Form := nil;
    end
  );
  Result := True;
End;


function openCadEntity(Field:TUniEdit):Boolean;
Var
  Form : TCadEntity;
Begin
  if Form = nil then
    Form := TCadEntity.Create(UniApplication);
  if Field <> nil then
    begin
    Form.CodigoRegistro := Field.tag;
    end;
  Form.Show(
    Procedure(Sender: TComponent; AResult:Integer)
    begin
      if Field <> nil then
      Begin
        //Field.Tag   := form.Entidade.Registro.Codigo;
        //Field.Text  := form.Entidade.Registro.NomeRazao;
      End;
      Form := nil;
    end
  );
  Result := True;
End;



function openCadEntityFiscal(code_id:Integer):Boolean;
Var
  Form : TCadEntity;
Begin
  if Form = nil then
    Form := TCadEntityFiscal.Create(UniApplication);
  Form.CodigoRegistro := code_id;
  Form.Show(
    Procedure(Sender: TComponent; AResult:Integer)
    begin
      Form := nil;
    end
  );
  Result := True;
End;

function openCadCustomer(CodeId:Integer;Field:TUniDBLookupComboBox):Boolean;
var
  Form : TCadCustomer;
begin
  if Form = nil then
    Form := TCadCustomer.Create(UniApplication);
  Form.CodigoRegistro := CodeId;
  if (Field <> nil) and (Field.KeyValue <> null) then
    Form.CodigoRegistro :=  Field.KeyValue;
  Form.Show(
    Procedure(Sender: TComponent; AResult:Integer)
    begin
      if Field <> nil then
      Begin
        Field.KeyValue   := form.Customer.Fiscal.Registro.Codigo;
        Field.Text  := form.Customer.Fiscal.Registro.NomeRazao;
      End;
      Form := nil;
    end
  );
  Result := True;
End;

function openCadClinProfessional(CodeId:Integer;Field:TUniDBLookupComboBox):Boolean;
var
  Form : TCadClinProfessional;
begin
  if Form = nil then
    Form := TCadClinProfessional.Create(UniApplication);
  Form.CodigoRegistro := CodeId;
  if (Field <> nil) and (Field.KeyValue <> null) then
    Form.CodigoRegistro :=  Field.KeyValue;
  Form.Show(
    Procedure(Sender: TComponent; AResult:Integer)
    begin
      if Field <> nil then
      Begin
        Field.KeyValue   := form.Professional.Fiscal.Registro.Codigo;
        Field.Text  := form.Professional.Fiscal.Registro.NomeRazao;
      End;
      Form := nil;
    end
  );
  Result := True;
End;

function openCadClinPatient(CodeId:Integer;Field:TUniDBLookupComboBox):Boolean;
var
  Form : TCadClinPatient;
begin
  if Form = nil then
    Form := TCadClinPatient.Create(UniApplication);
  Form.CodigoRegistro := CodeId;
  if (Field <> nil) and (Field.KeyValue <> null) then
    Form.CodigoRegistro :=  Field.KeyValue;
  Form.Show(
    Procedure(Sender: TComponent; AResult:Integer)
    begin
      if Field <> nil then
      Begin
        Field.KeyValue   := form.Patient.Fiscal.Registro.Codigo;
        Field.Text  := form.Patient.Fiscal.Registro.NomeRazao;
      End;
      Form := nil;
    end
  );
  Result := True;
End;

function opencadclinQuestionnaire(CodeId:Integer;Field:TUniDBLookupComboBox):Boolean;
var
  Form : TCadClinQuestionnaire;
begin
  if Form = nil then
    Form := TCadClinQuestionnaire.Create(UniApplication);
  Form.CodigoRegistro := CodeId;
  if (Field <> nil) and (Field.KeyValue <> null) then
    Form.CodigoRegistro :=  Field.KeyValue;
  Form.Show(
    Procedure(Sender: TComponent; AResult:Integer)
    begin
      if Field <> nil then
      Begin
        //Field.KeyValue   := form.Patient.Fiscal.Registro.Codigo;
        //Field.Text  := form.Patient.Fiscal.Registro.NomeRazao;
      End;
      Form := nil;
    end
  );
  Result := True;
End;

function openCadSalesman(CodeId:Integer;Field:TUniDBLookupComboBox):Boolean;
Var
  Form : TCadSalesman;
Begin
  if Form = nil then
    Form := TCadSalesman.Create(UniApplication);
  Form.CodigoRegistro := CodeId;
  if (Field <> nil) and (Field.KeyValue <> null) then
    Form.CodigoRegistro :=  Field.KeyValue;
  Form.Show(
    Procedure(Sender: TComponent; AResult:Integer)
    begin
      if Field <> nil then
      Begin
        Field.Tag   := form.Salesman.Registro.Codigo;
        //Field.Text  := form.salesman.Registro.NomeRazao;
      End;
      Form := nil;
    end
  );
  Result := True;
End;

function openCadPriceList(CodeId:Integer;Field:TUniDBLookupComboBox):Boolean;
Var
  Form : TCadPriceList;
Begin
  if Form = nil then
    Form := TCadPriceList.Create(UniApplication);
  Form.CodigoRegistro := CodeId;
  if (Field <> nil) and (Field.KeyValue <> null) then
    Form.CodigoRegistro :=  Field.KeyValue;
  Form.Show(
    Procedure(Sender: TComponent; AResult:Integer)
    begin
      if Field <> nil then
      Begin
        Field.Tag   := form.PriceList.Registro.Codigo;
        //Field.Text  := form.salesman.Registro.NomeRazao;
      End;
      Form := nil;
    end
  );
  Result := True;
End;

function openCadAdvertiser(CodeId:Integer;Field:TUniDBLookupComboBox):Boolean;
Var
  Form : TCadAdvertiser;
begin
  if Form = nil then
    Form := TCadAdvertiser.Create(UniApplication);
  Form.CodigoRegistro := CodeId;
  if (Field <> nil) and (Field.KeyValue <> null) then
    Form.CodigoRegistro :=  Field.KeyValue;
  Form.Show(
    Procedure(Sender: TComponent; AResult:Integer)
    begin
      if Field <> nil then
      Begin
        Field.KeyValue := form.Advertiser.Registro.Codigo;
       //Field.Text  := form.Advertiser.Registro.Estabelecimento;
      End;
      Form := nil;
    end
  );
  Result := True;
End;
function openCadAgency(CodeId:Integer;Field:TUniDBLookupComboBox):Boolean;
Var
  Form : TCadAgency;
begin
  if Form = nil then
    Form := TCadAgency.Create(UniApplication);
  Form.CodigoRegistro := CodeId;
  if (Field <> nil) and (Field.KeyValue <> null) then
    Form.CodigoRegistro :=  Field.KeyValue;
  Form.Show(
    Procedure(Sender: TComponent; AResult:Integer)
    begin
      if Field <> nil then
      Begin
        Field.KeyValue   := form.Agency.Registro.Codigo;
        //Field.Text  := form.Agency.Registro.Estabelecimento;
      End;
      Form := nil;
    end
  );
  Result := True;
End;
function openCadBroadcaster(CodeId:Integer;Field:TUniDBLookupComboBox):Boolean;
Var
  Form : TCadBroadcaster;
begin
  if Form = nil then
    Form := TCadBroadcaster.Create(UniApplication);
  Form.CodigoRegistro := CodeId;
  if (Field <> nil) and (Field.KeyValue <> null) then
    Form.CodigoRegistro :=  Field.KeyValue;
  Form.Show(
    Procedure(Sender: TComponent; AResult:Integer)
    begin
      if Field <> nil then
      Begin
        Field.KeyValue   := form.Broadcaster.Registro.Codigo;
       //Field.Text  := form.Entidade.Registro.NomeRazao;
      End;
      Form := nil;
    end
  );
  Result := True;
End;

function openCadMedPosProg(CodeId:Integer;Field:TUniDBLookupComboBox):Boolean;
var
  Form : TCadMedPosProg;
begin
  if Form = nil then
    Form := TCadMedPosProg.Create(UniApplication);
  Form.CodigoRegistro := CodeId;
  if (Field <> nil) and (Field.KeyValue <> null) then
    Form.CodigoRegistro :=  Field.KeyValue;
  Form.Show(
    Procedure(Sender: TComponent; AResult:Integer)
    begin
      if Field <> nil then
      Begin
        Field.KeyValue  := form.MedPosProg.Registro.Codigo;
        Field.Text      := form.MedPosProg.Registro.Descricao;
      End;
      Form := nil;
    end
  );
  Result := True;
End;

function openCadMedMaterial(CodeId:Integer;Field:TUniDBLookupComboBox):Boolean;
var
  Form : TCadMedMaterial;
begin
  if Form = nil then
    Form := TCadMedMaterial.Create(UniApplication);
  Form.CodigoRegistro := CodeId;
  if (Field <> nil) and (Field.KeyValue <> null) then
    Form.CodigoRegistro :=  Field.KeyValue;
  Form.Show(
    Procedure(Sender: TComponent; AResult:Integer)
    begin
      if Field <> nil then
      Begin
        Field.KeyValue  := form.MedMaterial.Registro.Codigo;
        Field.Text      := form.MedMaterial.Registro.Descricao;
      End;
      Form := nil;
    end
  );
  Result := True;
End;

function openCadTaxIcmsSN(CodeId:Integer;Field:TUniDBLookupComboBox):Boolean;
Var
  Form : TCadTaxIcmsSN;
begin
  if Form = nil then
    Form := TCadTaxIcmsSN.Create(UniApplication);
  Form.CodigoRegistro := CodeId;
  if (Field <> nil) and (Field.KeyValue <> null) then
    Form.CodigoRegistro :=  Field.KeyValue;
  Form.Show(
    Procedure(Sender: TComponent; AResult:Integer)
    begin
      if Field <> nil then
      Begin
        Field.KeyValue  := form.TaxIcmsSN.Registro.Codigo;
        Field.Text      := form.TaxIcmsSN.Registro.Descricao;
      End;
      Form := nil;
    end
  );
  Result := True;
End;

function openCadDeterBaseTaxIcmsST(CodeId:Integer;Field:TUniDBLookupComboBox):Boolean;
var
  Form : TCadDeterBaseTaxIcmsST;
begin
  if Form = nil then
    Form := TCadDeterBaseTaxIcmsST.Create(UniApplication);
  Form.CodigoRegistro := CodeId;
  if (Field <> nil) and (Field.KeyValue <> null) then
    Form.CodigoRegistro :=  Field.KeyValue;
  Form.Show(
    Procedure(Sender: TComponent; AResult:Integer)
    begin
      if Field <> nil then
      Begin
        Field.KeyValue    := form.DeterBaseTaxIcmsST.Registro.Codigo;
        Field.Text        := form.DeterBaseTaxIcmsST.Registro.Descricao;
      End;
      Form := nil;
    end
  );
  Result := True;
End;

function openCadCfop(CodeId:Integer;Field:TUniDBLookupComboBox):Boolean;
Var
  Form : TCadCfop;
Begin
  if Form = nil then
    Form := TCadCfop.Create(UniApplication);
  Form.CodigoRegistro := CodeId;
  if (Field <> nil) and (Field.KeyValue <> null) then
    Form.CodigoRegistro :=  Field.KeyValue;
  Form.Show(
    Procedure(Sender: TComponent; AResult:Integer)
    begin
      if Field <> nil then
      Begin
        Field.Tag   := StrToIntDef(form.Cfop.Registro.Codigo,0);
        Field.Text  := form.Cfop.Registro.Descricao;
      End;
      Form := nil;
    end
  );
  Result := True;
End;
function openCadTaxCofins(CodeId:Integer;Field:TUniDBLookupComboBox):Boolean;
Var
  Form : TCadTaxCofins;
begin
  if Form = nil then
    Form := TCadTaxCofins.Create(UniApplication);
  Form.CodigoRegistro := CodeId;
  if (Field <> nil) and (Field.KeyValue <> null) then
    Form.CodigoRegistro :=  Field.KeyValue;
  Form.Show(
    Procedure(Sender: TComponent; AResult:Integer)
    begin
      if Field <> nil then
      Begin
        Field.KeyValue    := form.TaxCofins.Registro.Codigo;
        Field.Text        := form.TaxCofins.Registro.Descricao;
      End;
      Form := nil;
    end
  );
  Result := True;
End;

function openCadOrderPi(Field:TUniEdit):Boolean;
var
  Form : TTasOrderPi;
begin
  if Form = nil then
    Form := TTasOrderPi.Create(UniApplication);
  if Field <> nil then
    Form.CodigoRegistro := Field.tag;
  Form.Show(
    Procedure(Sender: TComponent; AResult:Integer)
    begin
      Form := nil;
    end
  );
  Result := True;
End;

function openCadSituation(CodeId:Integer;Field:TUniDBLookupComboBox):Boolean;
Var
  Form : TCadSituation;
begin
  if Form = nil then
    Form := TCadSituation.Create(UniApplication);
  Form.CodigoRegistro := CodeId;
  if (Field <> nil) and (Field.KeyValue <> null) then
    Form.CodigoRegistro :=  Field.KeyValue;
  Form.Show(
    Procedure(Sender: TComponent; AResult:Integer)
    begin
      if Field <> nil then
      Begin
        Field.KeyValue    := form.Situation.Registro.Codigo;
        Field.Text        := form.Situation.Registro.Descricao;
      End;
      Form := nil;
    end
  );
  Result := True;
End;

function openCadKind(CodeId:Integer;Field:TUniDBLookupComboBox):Boolean;
Var
  Form : TCadKind;
begin
  if Form = nil then
    Form := TCadKind.Create(UniApplication);
  Form.CodigoRegistro := CodeId;
  if (Field <> nil) and (Field.KeyValue <> null) then
    Form.CodigoRegistro :=  Field.KeyValue;
  Form.Show(
    Procedure(Sender: TComponent; AResult:Integer)
    begin
      if Field <> nil then
      Begin
        Field.KeyValue    := form.Kind.Registro.Codigo;
        Field.Text        := form.Kind.Registro.Descricao;
      End;
      Form := nil;
    end
  );
  Result := True;
End;

function openCadProject(CodeId:Integer;Field:TUniDBLookupComboBox):Boolean;
Var
  Form : TCadProject;
begin
  if Form = nil then
    Form := TCadProject.Create(UniApplication);
  Form.CodigoRegistro := CodeId;
  if (Field <> nil) and (Field.KeyValue <> null) then
    Form.CodigoRegistro :=  Field.KeyValue;
  Form.Show(
    Procedure(Sender: TComponent; AResult:Integer)
    begin
      if Field <> nil then
      Begin
        Field.KeyValue    := form.Project.Registro.Codigo;
        Field.Text        := form.Project.Registro.Descricao;
      End;
      Form := nil;
    end
  );
  Result := True;
End;

function openCadPriority(CodeId:Integer;Field:TUniDBLookupComboBox):Boolean;
Var
  Form : TCadPriority;
begin
  if Form = nil then
    Form := TCadPriority.Create(UniApplication);
  Form.CodigoRegistro := CodeId;
  if (Field <> nil) and (Field.KeyValue <> null) then
    Form.CodigoRegistro :=  Field.KeyValue;
  Form.Show(
    Procedure(Sender: TComponent; AResult:Integer)
    begin
      if Field <> nil then
      Begin
        Field.KeyValue    := form.Priority.Registro.Codigo;
        Field.Text        := form.Priority.Registro.Descricao;
      End;
      Form := nil;
    end
  );
  Result := True;
End;


//Tas - Task - Tarefas
function openTasOrderStockAdjust(Field:TUniEdit) :Boolean;
var
  Form : TTasOrderStockAdjust;
begin
  if Form = nil then
    Form := TTasOrderStockAdjust.Create(UniApplication);
  if Field <> nil then
    Form.CodigoRegistro := Field.tag;
  Form.Show(
    Procedure(Sender: TComponent; AResult:Integer)
    begin
      if Field <> nil then
      Begin
        Field.Tag   := form.OrderStockAdjust.Registro.Codigo;
        Field.Text  := IntToStr(form.OrderStockAdjust.Registro.Numero);
      End;
      Form := nil;
    end
  );
  Result := True;
End;

function openTasUsefulPhone(Field:TUniEdit):Boolean;
var
  Form : TTasUsefulPhone;
begin
  if Form = nil then
    Form := TTasUsefulPhone.Create(UniApplication);
  if Field <> nil then
    Form.CodigoRegistro := Field.tag;
  Form.Show(
    Procedure(Sender: TComponent; AResult:Integer)
    begin
      if Field <> nil then
      Begin
        //Field.Tag   := form.OrderStockTransfer.Registro.Codigo;
        //Field.Text  := IntToStr(form.OrderStockTransfer.Registro.Numero);
      End;
      Form := nil;
    end
  );
  Result := True;
End;

function openTasInOutProduct(Field:TUniEdit):Boolean;
var
  Form : TTasInOutProduct;
begin
  if Form = nil then
    Form := TTasInOutProduct.Create(UniApplication);
  if Field <> nil then
    Form.CodigoRegistro := Field.tag;
  Form.Show(
    Procedure(Sender: TComponent; AResult:Integer)
    begin
      if Field <> nil then
      Begin
        //Field.Tag   := form.OrderStockTransfer.Registro.Codigo;
        //Field.Text  := IntToStr(form.OrderStockTransfer.Registro.Numero);
      End;
      Form := nil;
    end
  );
  Result := True;
End;

function openTasOrderBudgetPi(Field:TUniEdit):Boolean;
var
  Form : TTasOrderBudgetPi;
begin
  if Form = nil then
    Form := TTasOrderBudgetPi.Create(UniApplication);
  if Field <> nil then
    Form.CodigoRegistro := Field.tag;
  Form.Show(
    Procedure(Sender: TComponent; AResult:Integer)
    begin
      if Field <> nil then
      Begin
        //Field.Tag   := form.OrderStockTransfer.Registro.Codigo;
        //Field.Text  := IntToStr(form.OrderStockTransfer.Registro.Numero);
      End;
      Form := nil;
    end
  );
  Result := True;
End;

function openTasOrderListToDelivery(Field:TUniEdit):Boolean;
var
  Form : TTasOrderListToDelivery;
begin
  if Form = nil then
    Form := TTasOrderListToDelivery.Create(UniApplication);
  if Field <> nil then
    Form.CodigoRegistro := Field.tag;
  Form.Show(
    Procedure(Sender: TComponent; AResult:Integer)
    begin
      if Field <> nil then
      Begin
        //Field.Tag   := form.OrderStockTransfer.Registro.Codigo;
        //Field.Text  := IntToStr(form.OrderStockTransfer.Registro.Numero);
      End;
      Form := nil;
    end
  );
  Result := True;
End;

function openTasOrderListToBuy(Field:TUniEdit):Boolean;
var
  Form : TTasOrderListToBuy;
begin
  if Form = nil then
    Form := TTasOrderListToBuy.Create(UniApplication);
  if Field <> nil then
    Form.CodigoRegistro := Field.tag;
  Form.Show(
    Procedure(Sender: TComponent; AResult:Integer)
    begin
      if Field <> nil then
      Begin
        //Field.Tag   := form.OrderStockTransfer.Registro.Codigo;
        //Field.Text  := IntToStr(form.OrderStockTransfer.Registro.Numero);
      End;
      Form := nil;
    end
  );
  Result := True;
End;

function openTasOrderStockTransfer(Field:TUniEdit) :Boolean;
var
  Form : TTasOrderStockTransfer;
begin
  if Form = nil then
    Form := TTasOrderStockTransfer.Create(UniApplication);
  if Field <> nil then
    Form.CodigoRegistro := Field.tag;
  Form.Show(
    Procedure(Sender: TComponent; AResult:Integer)
    begin
      if Field <> nil then
      Begin
        //Field.Tag   := form.OrderStockTransfer.Registro.Codigo;
        //Field.Text  := IntToStr(form.OrderStockTransfer.Registro.Numero);
      End;
      Form := nil;
    end
  );
  Result := True;
End;

function openTasOrderProduction(Field:TUniEdit):Boolean;
var
  Form : TTasOrderProduction;
begin
  if Form = nil then
    Form := TTasOrderProduction.Create(UniApplication);
  if Field <> nil then
    Form.CodigoRegistro := Field.tag;
  Form.Show(
    Procedure(Sender: TComponent; AResult:Integer)
    begin
      if Field <> nil then
      Begin
        //Field.Tag   := form.Entidade.Registro.Codigo;
        //Field.Text  := form.Entidade.Registro.NomeRazao;
      End;
      Form := nil;
    end
  );
  Result := True;
End;

function openTasOrderProductionV2(Field:TUniEdit):Boolean;
var
  Form : TTasOrderProductionV2;
begin
  if Form = nil then
    Form := TTasOrderProductionV2.Create(UniApplication);
  if Field <> nil then
    Form.CodigoRegistro := Field.tag;
  Form.Show(
    Procedure(Sender: TComponent; AResult:Integer)
    begin
      if Field <> nil then
      Begin
        //Field.Tag   := form.Entidade.Registro.Codigo;
        //Field.Text  := form.Entidade.Registro.NomeRazao;
      End;
      Form := nil;
    end
  );
  Result := True;
End;

function openTasOrderJob(CodeId:Integer):Boolean;
var
  Form : TTasOrderJob;
begin
  if Form = nil then
    Form := TTasOrderJob.Create(UniApplication);
  Form.CodigoRegistro := CodeId;
  Form.Show(
    Procedure(Sender: TComponent; AResult:Integer)
    begin
      Form := nil;
    end
  );
  Result := True;
End;

function openTasConfigNfe55():Boolean;
var
  Form : TTasConfigNfe55;
begin
  if Form = nil then
    Form := TTasConfigNfe55.Create(UniApplication);
  Form.CodigoRegistro := 55;
  Form.Show(
    Procedure(Sender: TComponent; AResult:Integer)
    begin
      Form := nil;
    end
  );
  Result := True;
End;

function openTasCashier():Boolean;
var
  Form : TTasCashier;
begin
  if Form = nil then
    Form := TTasCashier.Create(UniApplication);
  Form.CodigoRegistro := 55;
  Form.Show(
    Procedure(Sender: TComponent; AResult:Integer)
    begin
      Form := nil;
    end
  );
  Result := True;
End;


function openTasTechnicalAssistance(CodeId:Integer):Boolean;
var
  Form : TTasTechnicalAssistance;
begin
  if Form = nil then
    Form := TTasTechnicalAssistance.Create(UniApplication);
  Form.CodigoRegistro := CodeId;
  Form.Show(
    Procedure(Sender: TComponent; AResult:Integer)
    begin
      Form := nil;
    end
  );
  Result := True;
End;

function openTasSetPrice(CodeId:Integer):Boolean;
var
  Form : TTasSetPrice;
begin
  if Form = nil then
    Form := TTasSetPrice.Create(UniApplication);
  Form.CodigoRegistro := CodeId;
  Form.Show(
    Procedure(Sender: TComponent; AResult:Integer)
    begin
      Form := nil;
    end
  );
  Result := True;
End;

function openTasExtMaintenance(CodeId:Integer):Boolean;
var
  Form : TTasExtMaintenance;
begin
  if Form = nil then
    Form := TTasExtMaintenance.Create(UniApplication);
  Form.CodigoRegistro := CodeId;
  Form.Show(
    Procedure(Sender: TComponent; AResult:Integer)
    begin
      Form := nil;
    end
  );
  Result := True;
End;

function openTasExtMaintenanceItems(CodeId:Integer):Boolean;
var
  Form : TTasExtMaintenanceItems;
begin
  if Form = nil then
    Form := TTasExtMaintenanceItems.Create(UniApplication);
  Form.CodigoRegistro := CodeId;
  Form.Show(
    Procedure(Sender: TComponent; AResult:Integer)
    begin
      Form := nil;
    end
  );
  Result := True;
End;

function openTasExtOperatingTest(CodeId:Integer):Boolean;
var
  Form : TTasExtOperatingTest;
begin
  if Form = nil then
    Form := TTasExtOperatingTest.Create(UniApplication);
  Form.CodigoRegistro := CodeId;
  Form.Show(
    Procedure(Sender: TComponent; AResult:Integer)
    begin
      Form := nil;
    end
  );
  Result := True;
End;

function openTasLotCtrl(CodeId:Integer):Boolean;
var
  Form : TTasLotCtrl;
begin
  if Form = nil then
    Form := TTasLotCtrl.Create(UniApplication);
  Form.CodigoRegistro := CodeId;
  Form.Show(
    Procedure(Sender: TComponent; AResult:Integer)
    begin
      Form := nil;
    end
  );
  Result := True;
End;

function openTasVirtualShop(CodeId:Integer):Boolean;
var
  Form : TTasVirtualShop;
begin
  if Form = nil then
    Form := TTasVirtualShop.Create(UniApplication);
  Form.CodigoRegistro := CodeId;
  Form.Show(
    Procedure(Sender: TComponent; AResult:Integer)
    begin
      Form := nil;
    end
  );
  Result := True;
End;

function openTasSendEmailMarketing(CodeId:Integer):Boolean;
var
  Form : TTasSendEmailMarketing;
begin
  if Form = nil then
    Form := TTasSendEmailMarketing.Create(UniApplication);
  Form.CodigoRegistro := CodeId;
  Form.Show(
    Procedure(Sender: TComponent; AResult:Integer)
    begin
      Form := nil;
    end
  );
  Result := True;
End;

function openTasCheckCtrl(CodeId:Integer):Boolean;
var
  Form : TTasCheckCtrl;
begin
  if Form = nil then
    Form := TTasCheckCtrl.Create(UniApplication);
  Form.CodigoRegistro := CodeId;
  Form.Show(
    Procedure(Sender: TComponent; AResult:Integer)
    begin
      Form := nil;
    end
  );
  Result := True;
End;

function openTasBankActivity(CodeId:Integer):Boolean;
var
  Form : TTasBankActivity;
begin
  if Form = nil then
    Form := TTasBankActivity.Create(UniApplication);
  Form.CodigoRegistro := CodeId;
  Form.Show(
    Procedure(Sender: TComponent; AResult:Integer)
    begin
      Form := nil;
    end
  );
  Result := True;
End;

function openTasConfigOrderSale(CodeId:Integer):Boolean;
var
  Form : TTasConfigOrderSale;
begin
  if Form = nil then
    Form := TTasConfigOrderSale.Create(UniApplication);
  Form.CodigoRegistro := CodeId;
  Form.Show(
    Procedure(Sender: TComponent; AResult:Integer)
    begin
      Form := nil;
    end
  );
  Result := True;
End;

function openTasConfigGProduct(CodeId:Integer):Boolean;
var
  Form : TTasConfigGProduct;
begin
  if Form = nil then
    Form := TTasConfigGProduct.Create(UniApplication);
  Form.CodigoRegistro := CodeId;
  Form.Show(
    Procedure(Sender: TComponent; AResult:Integer)
    begin
      Form := nil;
    end
  );
  Result := True;
End;


function openTasFinancialBills(Code:Integer):Boolean;
var
  Form : TTasFinancialBillsGeneral;
begin
  if Form = nil then
    Form := TTasFinancialBillsGeneral.Create(UniApplication);
  Form.CodigoRegistro := Code;
  Form.Show(
    Procedure(Sender: TComponent; AResult:Integer)
    begin
      Form := nil;
    end
  );
  Result := True;
End;

function openTasFinancialBillsMedia(Code:Integer):Boolean;
var
  Form : TTasFinancialBillsMedia;
begin
  if Form = nil then
    Form := TTasFinancialBillsMedia.Create(UniApplication);
  Form.CodigoRegistro := Code;
  Form.Show(
    Procedure(Sender: TComponent; AResult:Integer)
    begin
      Form := nil;
    end
  );
  Result := True;
End;

function openTasFinancialPayment(Code:Integer):Boolean;
var
  Form : TTasFinancialPayment;
begin
  if Form = nil then
    Form := TTasFinancialPayment.Create(UniApplication);
  Form.CodigoRegistro := Code;
  Form.Show(
    Procedure(Sender: TComponent; AResult:Integer)
    begin
      Form := nil;
    end
  );
  Result := True;
End;

function openTasOrderPurchase(Field:TUniEdit) :Boolean;
var
  Form : TTasOrderPurchase;
begin
  if Form = nil then
    Form := TTasOrderPurchase.Create(UniApplication);
  if Field <> nil then
    Form.CodigoRegistro := Field.tag;
  Form.Show(
    Procedure(Sender: TComponent; AResult:Integer)
    begin
      if Field <> nil then
      Begin
        Field.Tag   := form.OrderPurchase.Registro.Codigo;
        Field.Text  := IntToStr(form.OrderPurchase.Registro.Numero);
      End;
      Form := nil;
    end
  );
  Result := True;
End;

function openTasChangePassword():Boolean;
Var
  Form : TTasChangePassWord;
Begin
  if Form = nil then
    Form := TTasChangePassWord.Create(UniApplication);
  Form.Show(
    Procedure(Sender: TComponent; AResult:Integer)
    begin
      Form := nil;
    end
  );
  Result := True;
End;

function openTasXmlImportNfe(Field:TUniEdit) :Boolean;
Var
  Form : TTasXmlImportNfe;
Begin
  if Form = nil then
    Form := TTasXmlImportNfe.Create(UniApplication);
  Form.Show(
    Procedure(Sender: TComponent; AResult:Integer)
    begin
      Form := nil;
    end
  );
  Result := True;
End;

function openTasOrderPiJr(Id:Integer) :Boolean;
var
  Form : TTasOrderPiJr;
begin
  if Form = nil then
    Form := TTasOrderPiJr.Create(UniApplication);
  Form.CodigoRegistro := Id;
  Form.EditionState := 'I';
  Form.Show(
    Procedure(Sender: TComponent; AResult:Integer)
    begin
      Form := nil;
    end
  );
  Result := True;
End;

function openTasOrderBudgetItemPiJr(Id:Integer) :Boolean;
var
  Form : TTasOrderBudgetItemPiJr;
begin
  if Form = nil then
    Form := TTasOrderBudgetItemPiJr.Create(UniApplication);
  Form.CodigoRegistro := Id;
  Form.EditionState := 'I';
  Form.Show(
    Procedure(Sender: TComponent; AResult:Integer)
    begin
      Form := nil;
    end
  );
  Result := True;
End;

function openTasOrderBudgetItemPiRt(Id:Integer) :Boolean;
var
  Form : TTasOrderBudgetItemPiRt;
begin
  if Form = nil then
    Form := TTasOrderBudgetItemPiRt.Create(UniApplication);
  Form.CodigoRegistro := Id;
  Form.EditionState := 'I';
  Form.Show(
    Procedure(Sender: TComponent; AResult:Integer)
    begin
      Form := nil;
    end
  );
  Result := True;
End;

function openTasOrderPiRt(Id:Integer) :Boolean;
var
  Form : TTasOrderPiRt;
begin
  if Form = nil then
    Form := TTasOrderPiRt.Create(UniApplication);
  Form.CodigoRegistro := Id;
  Form.Show(
    Procedure(Sender: TComponent; AResult:Integer)
    begin
      Form := nil;
    end
  );
  Result := True;
End;

function openTasOrderPacking(Field:TUniEdit) :Boolean;
var
  Form : TTasOrderPacking;
begin
  if Form = nil then
    Form := TTasOrderPacking.Create(UniApplication);
  if Field <> nil then
    Form.CodigoRegistro := Field.tag;
  Form.Show(
    Procedure(Sender: TComponent; AResult:Integer)
    begin
      if Field <> nil then
      Begin
        Field.Tag   := form.OrderPacking.Order.Registro.Codigo;
        //Field.Text  := form.OrderJob.;
      End;
      Form := nil;
    end
  );
  Result := True;
End;

end.

