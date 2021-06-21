unit MainModule;

interface

uses
  uniGUIMainModule, SysUtils, Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.MySQL,
  FireDAC.Phys.MySQLDef, FireDAC.VCLUI.Wait, Data.DB, FireDAC.Comp.Client,
  FireDAC.Comp.UI, FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf,
  FireDAC.DApt, FireDAC.Comp.DataSet,UnFunctions,IniFiles,
  Windows, Messages,  Variants, Graphics,fm_cfop,ControllerInstitution,
  Controls, Forms, Dialogs, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIFrame, uniMemo, uniButton, uniGUIBaseClasses, uniPanel,
  uniGUIDialogs,uniGUIApplication, Datasnap.Provider, Datasnap.DBClient,
  System.Actions, Vcl.ActnList, uniImageList, Vcl.AppEvnts;

type

  TUMM = class(TUniGUIMainModule)
    DB: TFDConnection;
    MysqlLink: TFDPhysMySQLDriverLink;
    WaitCursor: TFDGUIxWaitCursor;
    Qr_Crud: TFDQuery;
    DSP: TDataSetProvider;
    ds_StockList: TDataSource;
    DSP_StockList: TDataSetProvider;
    cds_stock_list: TClientDataSet;
    cds_stock_listid: TIntegerField;
    cds_stock_listdescription: TStringField;
    cds_stock_listkind: TStringField;
    actlstMenu: TActionList;
    ActAdmEstabelecimento: TAction;
    ActAdmUsuarios: TAction;
    ActSupModulos: TAction;
    ActSupInterface: TAction;
    ActSupPrivilégio: TAction;
    ActSupCstIcms: TAction;
    ActSupCsosnIcms: TAction;
    ActSupDesonIcms: TAction;
    ActSupDeterIcmsNr: TAction;
    ActDeterIcmsSt: TAction;
    ActSupCstIPI: TAction;
    ActSupCstPIS: TAction;
    ActSupCstCofins: TAction;
    ActSupEstabelecimentos: TAction;
    ActAdmRegraTributacao: TAction;
    ActAdmObservacao: TAction;
    ActAdmContabilidade: TAction;
    ActAdmTeleonesUteis: TAction;
    ActMedAgencia: TAction;
    ActMedAnunciante: TAction;
    ActMedVeiculo: TAction;
    ActMedTabela: TAction;
    ActMedMaterial: TAction;
    ActMedPosicao: TAction;
    ActMedContato: TAction;
    ActMedPI: TAction;
    ActMedOrcamento: TAction;
    ActPesColaborador: TAction;
    ActPesVendedor: TAction;
    ActAdmConfigNfe: TAction;
    uImg32: TUniImageList;
    ActAdmTrocaSenha: TAction;
    ActGrlFornecedor: TAction;
    ActGrlFormaPagto: TAction;
    ActGrlTransportadora: TAction;
    ActCpaOrdem: TAction;
    ActCpaImportaXML: TAction;
    ActCpaNotaFiscal: TAction;
    ActCpaRelEntidades: TAction;
    ActCpaRelNotas: TAction;
    ActCpaRelOrdem: TAction;
    ActGrlCliente: TAction;
    ActGrlServiço: TAction;
    ActAutTipoVeiculo: TAction;
    ActAutMarcaModelo: TAction;
    ActAutManutencaoVeiculo: TAction;
    ActBanBanco: TAction;
    ActBanContaBancaria: TAction;
    ActBanHistoricoBancario: TAction;
    ActBanCarteiraCobranca: TAction;
    ActBanCobrancaBoleto: TAction;
    ActBanLancamentoBancario: TAction;
    ActBanTipoCarteira: TAction;
    ActGrlSituacao: TAction;
    ActCtrRomaneio: TAction;
    ActCtrProducao: TAction;
    ActCtrObra: TAction;
    ActCxaLancamentoCaixa: TAction;
    ACtCxaControleCheque: TAction;
    ActExtCadastroExtintor: TAction;
    ActExtAGenteExtintor: TAction;
    ActExtTipoExintor: TAction;
    ActExtCdastroEnsaiador: TAction;
    ActExtMotivoCondenacao: TAction;
    ActExtCadastroSelo: TAction;
    ActExtManutencaoExtintor: TAction;
    ActExtEnsaioExintor: TAction;
    ActGrlControleLote: TAction;
    ActGrlControleSerie: TAction;
    ACtFinContasReceberTarefa: TAction;
    ACtFinFichaFinanceiraCR: TAction;
    ACtFinContasReceberRelatorio: TAction;
    ActFinContaGerencialRelatorio: TAction;
    ActFinContasPagarTarefa: TAction;
    ActFinContasPagarRelatorio: TAction;
    ActVdaOrdemVenda: TAction;
    ActVdaLojaVirtual: TAction;
    AcVdatEnvioemail: TAction;
    ActEstCategoriaProduto: TAction;
    ActEstEmbalagemProdutos: TAction;
    ActEstMedidaProdutos: TAction;
    ActEstMercadoria: TAction;
    ActEstListaEstoque: TAction;
    ActEstListaPreco: TAction;
    ActEstPlanoFinanceiro: TAction;
    ActEstMarcaProdutos: TAction;
    ActEstAjusteEstoque: TAction;
    ActEstNotaFiscalProdutos: TAction;
    ActEstTransferenciaEstoque: TAction;
    ActEstMovimentacaoProduto: TAction;
    ActEstAjustePrecoVenda: TAction;
    ActEstProducaoV2: TAction;
    ActEstRelatorioProdutos: TAction;
    ActEstRelatorioNotas: TAction;
    ActMedVisualizarPeca: TAction;
    ACtMedContasReceberTarefa: TAction;
    ActAdmChamados: TAction;
    ActEstPromocao: TAction;
    ActSupCadFiscal: TAction;
    ActVdaNotaFiscal: TAction;
    ActDevTeste: TAction;
    ActClinProfessional: TAction;
    ActClinModule: TAction;
    ActClinPatient: TAction;
    ActClinQuestionnaire: TAction;
    ActBanEspecieDocumento: TAction;
    ActCliSeaQuiz: TAction;
    ActClinTasQuiz: TAction;
    ActAdmLogOpercao: TAction;
    DB_Merconeti: TFDConnection;
    Qr_Triagem: TFDQuery;
    Qr_Cidade: TFDQuery;
    Qr_Triagemtb012_TIRAGEM: TIntegerField;
    Qr_TriagemTB002_CODIGO_IBGE: TIntegerField;
    Qr_TriagemTB003_CNPJ: TStringField;
    Qr_TriagemTB002_CODIGO: TIntegerField;
    Qr_TriagemTB002_DESCRICAO: TStringField;
    Qr_TriagemTB007_CODIGO: TIntegerField;
    Qr_TriagemTB002_POPULACAO: TIntegerField;
    Qr_TriagemTB002_DENSIDADE_DEMO: TSingleField;
    Qr_TriagemTB002_GENTILICO: TStringField;
    Qr_TriagemTB002_AREA: TSingleField;
    ActMedCotacaoOnline: TAction;
    ActPizCardapioPizza: TAction;
    ActPizCardapioBebidas: TAction;
    ActPizWhatsApp: TAction;
    ActPizTabelaEntrega: TAction;
    procedure cds_stock_listCalcFields(DataSet: TDataSet);
    procedure UniGUIMainModuleCreate(Sender: TObject);
    procedure StockList;
    procedure ActAdmUsuariosExecute(Sender: TObject);
    procedure ActAdmRegraTributacaoExecute(Sender: TObject);
    procedure ActAdmObservacaoExecute(Sender: TObject);
    procedure ActAdmContabilidadeExecute(Sender: TObject);
    procedure ActAdmTeleonesUteisExecute(Sender: TObject);
    procedure ActAdmConfigNfeExecute(Sender: TObject);
    procedure ActSupModulosExecute(Sender: TObject);
    procedure ActSupInterfaceExecute(Sender: TObject);
    procedure ActSupPrivilégioExecute(Sender: TObject);
    procedure ActSupCstIcmsExecute(Sender: TObject);
    procedure ActSupCsosnIcmsExecute(Sender: TObject);
    procedure ActSupDesonIcmsExecute(Sender: TObject);
    procedure ActSupDeterIcmsNrExecute(Sender: TObject);
    procedure ActDeterIcmsStExecute(Sender: TObject);
    procedure ActSupCstIPIExecute(Sender: TObject);
    procedure ActSupCstPISExecute(Sender: TObject);
    procedure ActSupCstCofinsExecute(Sender: TObject);
    procedure ActAdmTrocaSenhaExecute(Sender: TObject);
    procedure ActMedAgenciaExecute(Sender: TObject);
    procedure ActMedMaterialExecute(Sender: TObject);
    procedure ActMedPosicaoExecute(Sender: TObject);
    procedure ActMedTabelaExecute(Sender: TObject);
    procedure ActMedVeiculoExecute(Sender: TObject);
    procedure ActMedAnuncianteExecute(Sender: TObject);
    procedure ActMedPIExecute(Sender: TObject);
    procedure ActMedContatoExecute(Sender: TObject);
    procedure ActMedOrcamentoExecute(Sender: TObject);
    procedure ActGrlFornecedorExecute(Sender: TObject);
    procedure ActGrlFormaPagtoExecute(Sender: TObject);
    procedure ActGrlTransportadoraExecute(Sender: TObject);
    procedure ActCpaOrdemExecute(Sender: TObject);
    procedure ActCpaNotaFiscalExecute(Sender: TObject);
    procedure ActCpaImportaXMLExecute(Sender: TObject);
    procedure ActCpaRelEntidadesExecute(Sender: TObject);
    procedure ActCpaRelNotasExecute(Sender: TObject);
    procedure ActCpaRelOrdemExecute(Sender: TObject);
    procedure ActGrlServiçoExecute(Sender: TObject);
    procedure ActAutTipoVeiculoExecute(Sender: TObject);
    procedure ActAutMarcaModeloExecute(Sender: TObject);
    procedure ActAutManutencaoVeiculoExecute(Sender: TObject);
    procedure ACtLancamentoBancarioExecute(Sender: TObject);
    procedure ActBanContaBancariaExecute(Sender: TObject);
    procedure ActBanTipoCarteiraExecute(Sender: TObject);
    procedure ActBanCobrancaBoletoExecute(Sender: TObject);
    procedure ActBanCarteiraCobrancaExecute(Sender: TObject);
    procedure ActBanBancoExecute(Sender: TObject);
    procedure ActBanHistoricoBancarioExecute(Sender: TObject);
    procedure ActCtrRomaneioExecute(Sender: TObject);
    procedure ActCtrProducaoExecute(Sender: TObject);
    procedure ActCtrObraExecute(Sender: TObject);
    procedure ActGrlSituacaoExecute(Sender: TObject);
    procedure ActCxaLancamentoCaixaExecute(Sender: TObject);
    procedure ACtCxaControleChequeExecute(Sender: TObject);
    procedure ActPesColaboradorExecute(Sender: TObject);
    procedure ActPesVendedorExecute(Sender: TObject);
    procedure ActGrlControleSerieExecute(Sender: TObject);
    procedure ActGrlControleLoteExecute(Sender: TObject);
    procedure ActExtEnsaioExintorExecute(Sender: TObject);
    procedure ActExtManutencaoExtintorExecute(Sender: TObject);
    procedure ActExtCadastroSeloExecute(Sender: TObject);
    procedure ActExtMotivoCondenacaoExecute(Sender: TObject);
    procedure ActExtCdastroEnsaiadorExecute(Sender: TObject);
    procedure ActExtTipoExintorExecute(Sender: TObject);
    procedure ActExtAGenteExtintorExecute(Sender: TObject);
    procedure ActExtCadastroExtintorExecute(Sender: TObject);
    procedure ActFinContaGerencialRelatorioExecute(Sender: TObject);
    procedure ACtFinContasReceberRelatorioExecute(Sender: TObject);
    procedure ACtFinContasReceberTarefaExecute(Sender: TObject);
    procedure ACtFinFichaFinanceiraCRExecute(Sender: TObject);
    procedure ActFinContasPagarTarefaExecute(Sender: TObject);
    procedure ActFinContasPagarRelatorioExecute(Sender: TObject);
    procedure AcVdatEnvioemailExecute(Sender: TObject);
    procedure ActVdaLojaVirtualExecute(Sender: TObject);
    procedure ActVdaOrdemVendaExecute(Sender: TObject);
    procedure ActEstRelatorioNotasExecute(Sender: TObject);
    procedure ActEstTransferenciaEstoqueExecute(Sender: TObject);
    procedure ActEstListaEstoqueExecute(Sender: TObject);
    procedure ActEstMercadoriaExecute(Sender: TObject);
    procedure ActEstRelatorioProdutosExecute(Sender: TObject);
    procedure ActEstAjustePrecoVendaExecute(Sender: TObject);
    procedure ActEstAjusteEstoqueExecute(Sender: TObject);
    procedure ActEstPlanoFinanceiroExecute(Sender: TObject);
    procedure ActEstNotaFiscalProdutosExecute(Sender: TObject);
    procedure ActEstMovimentacaoProdutoExecute(Sender: TObject);
    procedure ActEstListaPrecoExecute(Sender: TObject);
    procedure ActEstEmbalagemProdutosExecute(Sender: TObject);
    procedure ActEstMedidaProdutosExecute(Sender: TObject);
    procedure ActEstCategoriaProdutoExecute(Sender: TObject);
    procedure ActEstMarcaProdutosExecute(Sender: TObject);
    procedure ActEstProducaoV2Execute(Sender: TObject);
    procedure ActEstPromocaoExecute(Sender: TObject);
    procedure ActSupEstabelecimentosExecute(Sender: TObject);
    procedure ActAdmEstabelecimentoExecute(Sender: TObject);
    procedure UniGUIMainModuleSessionTimeout(ASession: TObject;
      var ExtendTimeOut: Integer);
    procedure ACtMedContasReceberTarefaExecute(Sender: TObject);
    procedure ActMedVisualizarPecaExecute(Sender: TObject);
    procedure ActAdmChamadosExecute(Sender: TObject);
    procedure ActSupCadFiscalExecute(Sender: TObject);
    procedure ActVdaNotaFiscalExecute(Sender: TObject);
    procedure ActDevTesteExecute(Sender: TObject);
    procedure ActClinModuleExecute(Sender: TObject);
    procedure ActClinProfessionalExecute(Sender: TObject);
    procedure ActClinPatientExecute(Sender: TObject);
    procedure ActClinQuestionnaireExecute(Sender: TObject);
    procedure ActBanEspecieDocumentoExecute(Sender: TObject);
    procedure ActBanLancamentoBancarioExecute(Sender: TObject);
    procedure ActCliSeaQuizExecute(Sender: TObject);
    procedure ActClinTasQuizExecute(Sender: TObject);
    procedure ActAdmLogOpercaoExecute(Sender: TObject);
    procedure ActMedCotacaoOnlineExecute(Sender: TObject);
    procedure ActPizCardapioPizzaExecute(Sender: TObject);
    procedure ActPizCardapioBebidasExecute(Sender: TObject);
    procedure ActPizWhatsAppExecute(Sender: TObject);
    procedure ActPizTabelaEntregaExecute(Sender: TObject);
  private
    FGIntitution: TControllerInstitution;
    FCasaDecimal: Integer;
    FGInstitution: TControllerInstitution;
    procedure setFGIntitution(const Value: TControllerInstitution);
    procedure setFCasaDecimal(const Value: Integer);
    procedure setFGInstitution(const Value: TControllerInstitution);

  protected

  public
    //procedure ExecComando(SqlTxt: String);
    //procedure ExecConsulta(SqlTxt: String);
    procedure regUpdater(DataSet: TDataSet);
    function UF_Estabelecimento: Integer;
    procedure FiltrarCFOP(way:String;state_id:Integer;lista:TFmCFOP);
    property GInstitution : TControllerInstitution read FGInstitution write setFGInstitution;
    property CasaDecimal : Integer read FCasaDecimal write setFCasaDecimal;
  end;

function UMM: TUMM;
function getConnection(): TFDConnection;
procedure ExecSQlCommand(sql:String);

implementation

uses
  UniGUIVars,
  ServerModule,
  msg_form, openForms, openReports,
  UnitConstantes,
  ClasseUtil, sea_iteration, sea_promotion, cad_institution,
  tas_financial_bills;

{$R *.dfm}

function getConnection: TFDConnection;
begin
  Result := UMM.DB;
end;

procedure ExecSQlCommand(sql:String);
Begin
  UMM.DB.ExecSQL(sql);
end;

function UMM: TUMM;
begin
  Result := TUMM(UniApplication.UniMainModule)
end;

function TUMM.UF_Estabelecimento: Integer;
var
  LcEstabelecimento : TControllerInstitution;

begin
  LcEstabelecimento := TControllerInstitution.Create(self);
  with LcEstabelecimento.Fiscal.Endereco do
  Begin
    Registro.Codigo := GInstitution.registro.Codigo;
    Registro.Tipo := 'COMERCIAL';
    getByKey;
    Result := Registro.CodigoEstado;
  End;
  FreeAndNil(LcEstabelecimento);
end;

procedure TUMM.FiltrarCFOP(way:String;state_id:Integer;lista:TFmCFOP);
Begin
  if (state_id = 0) then
    Lista.Filtrar(way,'N')
  else
  if (state_id = UF_Estabelecimento) then
    Lista.Filtrar(way,'E')
  else
  if (state_id = 54) then
    Lista.Filtrar(way,'X')
  else
    Lista.Filtrar(way,'N');
end;

procedure TUMM.UniGUIMainModuleCreate(Sender: TObject);
begin
  GInstitution := TControllerInstitution.create(UniApplication);
  MysqlLink.VendorLib := 'C:\gestaoweb\libmysql.dll';
  Qr_Crud.Active := False;
end;

procedure TUMM.UniGUIMainModuleSessionTimeout(ASession: TObject;
  var ExtendTimeOut: Integer);
begin
  extendTimeout := 600000;
end;

procedure TUMM.regUpdater(DataSet: TDataSet);
Begin
  with Dataset do
  Begin
    case UpdateStatus of
      usModified:     FieldByName('reg_status').AsString := 'Modified';
      usUnModified:   FieldByName('reg_status').AsString := 'Unmodified';
      usInserted:     FieldByName('reg_status').AsString := 'Inserted';
      usDeleted:      FieldByName('reg_status').AsString := 'Deleted';
    end;
  End;
End;

procedure TUMM.setFCasaDecimal(const Value: Integer);
begin
  FCasaDecimal := Value;
end;

procedure TUMM.setFGInstitution(const Value: TControllerInstitution);
begin
  FGInstitution := Value;
end;

procedure TUMM.setFGIntitution(const Value: TControllerInstitution);
begin
  FGIntitution := Value;
end;

procedure TUMM.StockList;
begin
  with UMM.Qr_Crud do
  Begin
    Active := False;
    sql.Clear;
    sql.Add(concat(
            ' Select distinct sl.id, sl.description, sl.kind ',
            ' from tb_stock_list sl ',
            ' where sl.tb_institution_id =:tb_institution_id ',
            ' order by sl.description '
            ));

    ParamByName('tb_institution_id').AsInteger := GInstitution.registro.Codigo;
    Active := True;
    FetchAll;
  End;
  cds_stock_list.Active := True;
end;

procedure TUMM.ActAdmChamadosExecute(Sender: TObject);
var
  Form : TSeaIteration;
begin
  if Form = nil then
    Form := TSeaIteration.Create(UniApplication);
  Form.Show(
    Procedure(Sender: TComponent; AResult:Integer)
    begin
      Form := nil;
    end
  );
end;

procedure TUMM.ActAdmConfigNfeExecute(Sender: TObject);
begin
  openTasConfigNfe55;
end;

procedure TUMM.ActAdmContabilidadeExecute(Sender: TObject);
begin
  openSeaAccounting(nil);
end;

procedure TUMM.ActAdmEstabelecimentoExecute(Sender: TObject);
Var
  Form : TCadInstitution;
begin
  if Form = nil then
    Form := TCadInstitution.Create(UniApplication);
  Form.CodigoRegistro := GInstitution.Registro.Codigo;
  Form.InstitutionID := GInstitution.Registro.Codigo;
  Form.Show(
    Procedure(Sender: TComponent; AResult:Integer)
    begin
      Form := nil;
    end
  );
end;

procedure TUMM.ActAdmLogOpercaoExecute(Sender: TObject);
begin
  OpenLSeaLogOperation (nil);
end;

procedure TUMM.ActAdmObservacaoExecute(Sender: TObject);
begin
  openSeaObservation(nil);
end;

procedure TUMM.ActAdmRegraTributacaoExecute(Sender: TObject);
begin
  openSeaTaxRuler(nil);
end;

procedure TUMM.ActAdmTeleonesUteisExecute(Sender: TObject);
begin
  openTasUsefulPhone(nil);
end;

procedure TUMM.ActAdmTrocaSenhaExecute(Sender: TObject);
begin
 openTasChangePassword;
end;

procedure TUMM.ActAdmUsuariosExecute(Sender: TObject);
begin
  openSeaUser(GInstitution.registro.Codigo);
end;

procedure TUMM.ActExtAGenteExtintorExecute(Sender: TObject);
begin
  openSeaExtAgent(nil);
end;

procedure TUMM.ActEstAjusteEstoqueExecute(Sender: TObject);
begin
  openSeaOrderStockAdjust(nil);

end;

procedure TUMM.ActEstAjustePrecoVendaExecute(Sender: TObject);
begin
  openTasSetPrice(0);
end;

procedure TUMM.ActBanBancoExecute(Sender: TObject);
begin
  openSeaBank(nil);
end;

procedure TUMM.ActGrlFormaPagtoExecute(Sender: TObject);
begin
  openSeaPaymentTypes(nil);
end;

procedure TUMM.ActGrlFornecedorExecute(Sender: TObject);
begin
  openSeaProvider(Nil);
end;

procedure TUMM.ActBanHistoricoBancarioExecute(Sender: TObject);
begin
 openSeaBankHistoric(nil);
end;

procedure TUMM.ActBanLancamentoBancarioExecute(Sender: TObject);
begin
  openTasBankActivity(0);
end;

procedure TUMM.ACtLancamentoBancarioExecute(Sender: TObject);
begin
  openTasBankActivity(0);
end;

procedure TUMM.ActExtCadastroExtintorExecute(Sender: TObject);
begin
  openSeaExtintor();
end;

procedure TUMM.ActExtCadastroSeloExecute(Sender: TObject);
begin
  openSeaExtSeal(nil);
end;

procedure TUMM.ActBanCarteiraCobrancaExecute(Sender: TObject);
begin
  openSeaBankChargeTicket(nil);
end;

procedure TUMM.ActEstCategoriaProdutoExecute(Sender: TObject);
begin
  openCadCategory(0,nil);
end;

procedure TUMM.ActExtCdastroEnsaiadorExecute(Sender: TObject);
begin
  openSeaExtTester(nil);
end;

procedure TUMM.ActBanCobrancaBoletoExecute(Sender: TObject);
begin
  openSeaBankChargeSlip(nil);
end;

procedure TUMM.ActBanContaBancariaExecute(Sender: TObject);
begin
  openSeaBankAccount(nil);
end;

procedure TUMM.ActBanEspecieDocumentoExecute(Sender: TObject);
begin
  openSeaBankChargeKind(nil);
end;

procedure TUMM.ActFinContaGerencialRelatorioExecute(Sender: TObject);
begin
  openRepFinancialRealManager;
end;

procedure TUMM.ActFinContasPagarRelatorioExecute(Sender: TObject);
begin
  openRepFinancialPayment;
end;

procedure TUMM.ActFinContasPagarTarefaExecute(Sender: TObject);
begin
  openTasFinancialPayment(0);
end;

procedure TUMM.ACtFinContasReceberRelatorioExecute(Sender: TObject);
begin
  openRepFinancialBill;
end;

procedure TUMM.ACtFinContasReceberTarefaExecute(Sender: TObject);
begin
  openTasFinancialBills(0);
end;

procedure TUMM.ACtCxaControleChequeExecute(Sender: TObject);
begin
  openSeaCheckCtrl(nil);
end;

procedure TUMM.ActGrlControleLoteExecute(Sender: TObject);
begin
  openTasLotCtrl(0);
end;

procedure TUMM.ActGrlControleSerieExecute(Sender: TObject);
begin
  openSeaSerieCtrl(nil);
end;

procedure TUMM.ActClinModuleExecute(Sender: TObject);
begin
  openSeaClinModule(nil)
end;

procedure TUMM.ActClinPatientExecute(Sender: TObject);
begin
  openSeaClinPatient(nil);
end;

procedure TUMM.ActClinProfessionalExecute(Sender: TObject);
begin
  openSeaClinProfessional(nil);
end;

procedure TUMM.ActClinQuestionnaireExecute(Sender: TObject);
begin
  openSeaClinQuestionnaire(nil);
end;

procedure TUMM.ActClinTasQuizExecute(Sender: TObject);
begin
  openTasClinQuiz(nil);
end;

procedure TUMM.ActCpaImportaXMLExecute(Sender: TObject);
begin
  openTasXmlImportNfe(nil);
end;

procedure TUMM.ActCpaNotaFiscalExecute(Sender: TObject);
begin
  openSeaInvoiceMerchandise(nil);
end;

procedure TUMM.ActCpaOrdemExecute(Sender: TObject);
begin
  openSeaOrderPurchase(nil)
end;

procedure TUMM.ActBanTipoCarteiraExecute(Sender: TObject);
begin
  openSeaBankChargeKind(nil);
end;

procedure TUMM.ActExtTipoExintorExecute(Sender: TObject);
begin
  openSeaExtKind(nil);
end;

procedure TUMM.ActAutTipoVeiculoExecute(Sender: TObject);
begin
  openSeaVehicleKind(nil);
end;

procedure TUMM.ActEstTransferenciaEstoqueExecute(Sender: TObject);
begin
  openSeaOrderStockTransfer(nil);
end;

procedure TUMM.ActGrlTransportadoraExecute(Sender: TObject);
begin
  openseaCarrier(nil);
end;

procedure TUMM.ActPesVendedorExecute(Sender: TObject);
begin
  openSeaSalesman(nil);
end;

procedure TUMM.ActPizCardapioBebidasExecute(Sender: TObject);
begin
  openSeaRestMenuBeverage(nil);
end;

procedure TUMM.ActPizCardapioPizzaExecute(Sender: TObject);
begin
  openSeaRestMenuPizza(nil);
end;

procedure TUMM.ActPizTabelaEntregaExecute(Sender: TObject);
begin
  openCadDEliveryRange(nil);
end;

procedure TUMM.ActPizWhatsAppExecute(Sender: TObject);
begin
  OpenTasWhatsAppWEb;
end;

procedure TUMM.ActDeterIcmsStExecute(Sender: TObject);
begin
  openSeaDeterBaseTaxIcmsST(nil);
end;

procedure TUMM.ActDevTesteExecute(Sender: TObject);
begin
  openDevTeste;
end;

procedure TUMM.ActEstEmbalagemProdutosExecute(Sender: TObject);
begin
  openSeaPackage(nil);
end;

procedure TUMM.ActExtEnsaioExintorExecute(Sender: TObject);
begin
  openSeaExtOperatingTest(nil);
end;

procedure TUMM.AcVdatEnvioemailExecute(Sender: TObject);
begin
  openTasSendEmailMarketing(0);
end;

procedure TUMM.ACtFinFichaFinanceiraCRExecute(Sender: TObject);
begin
  openSeaFinancialStatement();
end;

procedure TUMM.ActCxaLancamentoCaixaExecute(Sender: TObject);
begin
  openTasCashier();
end;

procedure TUMM.ActEstListaEstoqueExecute(Sender: TObject);
begin
 openSeaStockList(nil);
end;

procedure TUMM.ActEstListaPrecoExecute(Sender: TObject);
begin
  openSeaPriceList(nil);
end;

procedure TUMM.ActVdaLojaVirtualExecute(Sender: TObject);
begin
  openTasVirtualShop(0);
end;

procedure TUMM.ActVdaNotaFiscalExecute(Sender: TObject);
begin
  openSeaInvoiceMerchandise(nil);
end;

procedure TUMM.ActExtManutencaoExtintorExecute(Sender: TObject);
begin
  openSeaExtMaintenance(nil);
end;

procedure TUMM.ActAutManutencaoVeiculoExecute(Sender: TObject);
begin
  openSeaVehicleMaintenance(nil);
end;

procedure TUMM.ActAutMarcaModeloExecute(Sender: TObject);
begin
  openSeaVehicleBrandModel(nil);
end;

procedure TUMM.ActEstMarcaProdutosExecute(Sender: TObject);
begin
  openSeaBrand(nil);
end;

procedure TUMM.ActMedAgenciaExecute(Sender: TObject);
begin
  openSeaAgency(nil);
end;

procedure TUMM.ActMedAnuncianteExecute(Sender: TObject);
begin
  openSeaAdvertiser(nil);
end;

procedure TUMM.ACtMedContasReceberTarefaExecute(Sender: TObject);
begin
  openTasFinancialBillsMedia(0);
end;

procedure TUMM.ActMedContatoExecute(Sender: TObject);
begin
  openSeaContact(nil,0);
end;

procedure TUMM.ActMedCotacaoOnlineExecute(Sender: TObject);
begin
  OpenSeaOrderBudgAdvertise(nil);
end;

procedure TUMM.ActEstMedidaProdutosExecute(Sender: TObject);
begin
  openSeaMeasure(nil);
end;

procedure TUMM.ActMedMaterialExecute(Sender: TObject);
begin
  openSeaMedMaterial(nil);
end;

procedure TUMM.ActMedOrcamentoExecute(Sender: TObject);
begin
  openSeaOrderBudgetPi(nil);
end;

procedure TUMM.ActMedPIExecute(Sender: TObject);
begin
  OpenSeaOrderPi(nil);
end;

procedure TUMM.ActMedPosicaoExecute(Sender: TObject);
begin
  openSeaMedPosProg(nil);
end;

procedure TUMM.ActMedTabelaExecute(Sender: TObject);
begin
  openCadMedPriceListJR(0);
end;

procedure TUMM.ActMedVeiculoExecute(Sender: TObject);
begin
  openSeaBroadcaster(nil);
end;

procedure TUMM.ActMedVisualizarPecaExecute(Sender: TObject);
begin
  openSeaMedParts(nil);
end;

procedure TUMM.ActEstMercadoriaExecute(Sender: TObject);
begin
  openSeaMerchandise(nil);
end;

procedure TUMM.ActExtMotivoCondenacaoExecute(Sender: TObject);
begin
  openSeaExtMotive(nil);
end;

procedure TUMM.ActEstMovimentacaoProdutoExecute(Sender: TObject);
begin
  openTasInOutProduct(nil)
end;

procedure TUMM.ActEstNotaFiscalProdutosExecute(Sender: TObject);
begin
 openSeaInvoiceMerchandise(nil);
end;

procedure TUMM.ActCtrObraExecute(Sender: TObject);
begin
  openSeaOrderJob(nil)
end;

procedure TUMM.ActVdaOrdemVendaExecute(Sender: TObject);
begin
  openSeaOrderSale(nil)
end;

procedure TUMM.ActPesColaboradorExecute(Sender: TObject);
begin
 openSeaCollaborator(nil);
end;

procedure TUMM.ActEstPlanoFinanceiroExecute(Sender: TObject);
begin
  openCadFinancialPlans(0,nil)
end;

procedure TUMM.ActCtrProducaoExecute(Sender: TObject);
begin
  openSeaOrderProduction(nil)
end;

procedure TUMM.ActEstProducaoV2Execute(Sender: TObject);
begin
  openSeaOrderProductionV2(nil)
end;

procedure TUMM.ActEstPromocaoExecute(Sender: TObject);
var
  Form : TSeaPromotion;
begin
  if Form = nil then
    Form := TSeaPromotion.Create(UniApplication);
  Form.Show(
    Procedure(Sender: TComponent; AResult:Integer)
    begin
      Form := nil;
    end
  );
end;

procedure TUMM.ActEstRelatorioNotasExecute(Sender: TObject);
begin
  openRepInvoice;
end;

procedure TUMM.ActEstRelatorioProdutosExecute(Sender: TObject);
begin
  openRepProduct;
end;

procedure TUMM.ActCpaRelEntidadesExecute(Sender: TObject);
begin
  openRepCompany;
end;

procedure TUMM.ActCpaRelNotasExecute(Sender: TObject);
begin
  openRepInvoice;
end;

procedure TUMM.ActCpaRelOrdemExecute(Sender: TObject);
begin
  openSeaCustomer(nil);
end;

procedure TUMM.ActCtrRomaneioExecute(Sender: TObject);
begin
  openSeaOrderPacking(nil);
end;

procedure TUMM.ActGrlServiçoExecute(Sender: TObject);
begin
  openSeaService(nil);
end;

procedure TUMM.ActGrlSituacaoExecute(Sender: TObject);
begin
  openSeaSituation(nil);
end;

procedure TUMM.ActCliSeaQuizExecute(Sender: TObject);
begin
  openSeaClinQuiz(nil);
end;

procedure TUMM.ActSupCadFiscalExecute(Sender: TObject);
BEgin
  openCadEntityFiscal(0);
End;

procedure TUMM.ActSupCsosnIcmsExecute(Sender: TObject);
begin
   openSeaTaxIcmsSn(nil);
end;

procedure TUMM.ActSupCstCofinsExecute(Sender: TObject);
begin
  openSeaTaxCofins(nil);
end;

procedure TUMM.ActSupCstIcmsExecute(Sender: TObject);
begin
  openSeaTaxIcmsNr(nil);
end;

procedure TUMM.ActSupCstIPIExecute(Sender: TObject);
begin
  openSeaTaxIpi(nil);
end;

procedure TUMM.ActSupCstPISExecute(Sender: TObject);
begin
  openSeaTaxPis(nil)
end;

procedure TUMM.ActSupDesonIcmsExecute(Sender: TObject);
begin
  openSeaDischargeIcms(nil);
end;

procedure TUMM.ActSupDeterIcmsNrExecute(Sender: TObject);
begin
  openSeaDeterBaseTaxIcms(nil);
end;

procedure TUMM.ActSupEstabelecimentosExecute(Sender: TObject);
begin
  openSeaInstitution(GInstitution.Registro.Codigo);
end;

procedure TUMM.ActSupInterfaceExecute(Sender: TObject);
begin
  openSeaInface(nil);
end;

procedure TUMM.ActSupModulosExecute(Sender: TObject);
begin

  openSeaModule(nil);
end;

procedure TUMM.ActSupPrivilégioExecute(Sender: TObject);
begin
  openSeaPrivilege(nil);
end;

procedure TUMM.cds_stock_listCalcFields(DataSet: TDataSet);
begin
  regUpdater(DataSet);
end;

{
procedure TUMM.ExecComando(SqlTxt: String);
begin
  with Qr_Crud do
  Begin
    active := False;
    sql.Clear;
    SQL.Add(SqlTxt);
    ExecSQL;
  End;
end;

procedure TUMM.ExecConsulta(SqlTxt: String);
begin
  with Qr_Crud do
  Begin
    active := False;
    sql.Clear;
    SQL.Add(SqlTxt);
    Active := True;
    FetchAll;
    First;
  End;
end;
}

initialization
  RegisterMainModuleClass(TUMM);
end.
