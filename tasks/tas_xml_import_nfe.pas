unit tas_xml_import_nfe;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, base_form, uniGUIClasses, uniPanel,
  DBXJSON,REST.Json,System.Json,REST.JsonReflect,DBXJSONReflect, 
  uniPageControl, uniGUIBaseClasses, uniCheckBox, uniMultiItem, uniComboBox,pcnConversaoNFe,
  uniLabel, uniEdit, uniButton, uniBitBtn, uniSpeedButton, uniGroupBox, uniMemo,
  uniBasicGrid, uniDBGrid, ControllerEletronicInvoice, Data.DB,System.Math,
  Datasnap.DBClient,pcnConversao,ControllerCfop, uniDBComboBox,pcnNFe,
  uniDBLookupComboBox, Datasnap.Provider,ControllerMerchandise,uniGUITypes,
  ControllerFinancialBills,MainModule, Vcl.Menus, uniMainMenu, sea_merchandise,
  Vcl.Imaging.jpeg, uniImage, ControllerOrderItem,ControllerInvoiceHasPurchase,
  ControllerOrderItemdetail, uniFileUpload, fm_nfe_events, ControllerState,
  ControllerNfeEventsSent, prm_nfe, ClientProxy, ControllerInstitution;

type
  TTasXmlImportNfe = class(TBaseForm)
    pg_geral: TUniPageControl;
    UniTabSheet1: TUniTabSheet;
    tbs_Items: TUniTabSheet;
    UniPageControl2: TUniPageControl;
    UniTabSheet3: TUniTabSheet;
    UniTabSheet4: TUniTabSheet;
    UniCheckBox1: TUniCheckBox;
    M_Note: TUniMemo;
    UniTabSheet5: TUniTabSheet;
    UniTabSheet6: TUniTabSheet;
    UniTabSheet7: TUniTabSheet;
    tbs_process: TUniTabSheet;
    chbx_Charging: TUniCheckBox;
    UniLabel22: TUniLabel;
    chbx_Manual_Charging: TUniCheckBox;
    chbx_Credits: TUniCheckBox;
    dbg_Cfop: TUniDBGrid;
    UniGroupBox4: TUniGroupBox;
    UniLabel40: TUniLabel;
    E_NF_Origin: TUniEdit;
    UniGroupBox5: TUniGroupBox;
    UniLabel41: TUniLabel;
    E_Vl_Freight_Extra: TUniEdit;
    UniGroupBox6: TUniGroupBox;
    UniLabel42: TUniLabel;
    E_extra_Cost: TUniEdit;
    UniPanel1: TUniPanel;
    UniLabel9: TUniLabel;
    E_Cfop: TUniEdit;
    E_Invoice: TUniEdit;
    UniLabel10: TUniLabel;
    UniGroupBox2: TUniGroupBox;
    UniLabel7: TUniLabel;
    E_company: TUniEdit;
    UniLabel8: TUniLabel;
    E_Street: TUniEdit;
    l_city: TUniLabel;
    E_City: TUniEdit;
    UniLabel13: TUniLabel;
    E_Phone: TUniEdit;
    UniLabel14: TUniLabel;
    E_Neighborhood: TUniEdit;
    UniLabel17: TUniLabel;
    E_State: TUniEdit;
    UniLabel18: TUniLabel;
    E_IE: TUniEdit;
    UniLabel19: TUniLabel;
    E_ZipCode: TUniEdit;
    UniLabel21: TUniLabel;
    E_Cnpj_Cpf: TUniEdit;
    UniGroupBox3: TUniGroupBox;
    UniLabel15: TUniLabel;
    E_DT_Emission: TUniEdit;
    UniLabel16: TUniLabel;
    E_DT_Exit: TUniEdit;
    UniPanel2: TUniPanel;
    UniLabel23: TUniLabel;
    E_BC_ICMS: TUniEdit;
    E_VL_ICMS: TUniEdit;
    UniLabel24: TUniLabel;
    E_BC_ICMS_ST: TUniEdit;
    UniLabel25: TUniLabel;
    E_VL_ICMS_ST: TUniEdit;
    UniLabel26: TUniLabel;
    UniLabel27: TUniLabel;
    E_Vl_Product: TUniEdit;
    UniLabel28: TUniLabel;
    E_Vl_freight: TUniEdit;
    E_Vl_Assurance: TUniEdit;
    UniLabel29: TUniLabel;
    UniLabel30: TUniLabel;
    E_VL_Expenses: TUniEdit;
    E_VL_IPI: TUniEdit;
    UniLabel31: TUniLabel;
    E_VL_Discount: TUniEdit;
    UniLabel32: TUniLabel;
    UniLabel33: TUniLabel;
    E_Vl_Invoice: TUniEdit;
    UniLabel20: TUniLabel;
    E_Amount: TUniEdit;
    UniLabel35: TUniLabel;
    E_Kind: TUniEdit;
    UniLabel36: TUniLabel;
    E_Brand: TUniEdit;
    E_Number: TUniEdit;
    UniLabel37: TUniLabel;
    E_Gross_Weight: TUniEdit;
    UniLabel38: TUniLabel;
    UniLabel39: TUniLabel;
    E_Net_Weight: TUniEdit;
    UniPanel3: TUniPanel;
    Sb_XML: TUniSpeedButton;
    Sb_Confirm: TUniSpeedButton;
    Sb_Close: TUniSpeedButton;
    UniPanel4: TUniPanel;
    chbx_Other: TUniCheckBox;
    UniGroupBox1: TUniGroupBox;
    E_NFE_Key: TUniEdit;
    Lb_Nr_Caracteres: TUniLabel;
    UniGroupBox7: TUniGroupBox;
    M_Process: TUniMemo;
    cds_nfeItems: TClientDataSet;
    ds_nfeItems: TDataSource;
    ds_cfop: TDataSource;
    cds_cfop: TClientDataSet;
    cds_cfopnfeCfop: TStringField;
    cds_cfopnfeIdCfop: TStringField;
    cds_cfopintCfop: TStringField;
    cds_cfopintIdCfop: TStringField;
    cds_merchandise: TClientDataSet;
    ds_merchandise: TDataSource;
    dsp_Merchandise: TDataSetProvider;
    cds_merchandiseid: TIntegerField;
    cds_merchandisedescription: TStringField;
    dsp_stock: TDataSetProvider;
    cds_stock: TClientDataSet;
    ds_stock: TDataSource;
    cds_stockid: TIntegerField;
    cds_stockdescription: TStringField;
    cds_stockkind: TStringField;
    cds_nfeItemsnfeProduct: TStringField;
    cds_nfeItemsnfeUnidade: TStringField;
    cds_nfeItemsnfeQtde: TFloatField;
    cds_nfeItemsnfeUnitValue: TFloatField;
    cds_nfeItemsnfeDiscountValue: TFloatField;
    cds_nfeItemsnfeBarCode: TStringField;
    cds_nfeItemsIntIdProduct: TIntegerField;
    cds_nfeItemsintProduct: TStringField;
    cds_nfeItemsintIdStock: TIntegerField;
    cds_nfeItemsintStock: TStringField;
    cds_nfeItemsnfeNCM: TStringField;
    cds_nfeItemsnfeSubTrib: TStringField;
    cds_nfeItemsnfeTotalValue: TFloatField;
    cds_nfeItemsnfeOrigin: TStringField;
    cds_nfeItemsnfeIdProduct: TStringField;
    cds_nfeItemsnfeNrITem: TStringField;
    UniHiddenPanel2: TUniHiddenPanel;
    Dblcb_Hdd_List_Cfop: TUniDBLookupComboBox;
    UniLabel1: TUniLabel;
    dsp_cfop_list: TDataSetProvider;
    cds_cfop_list: TClientDataSet;
    ds_cfop_list: TDataSource;
    cds_cfop_listid: TStringField;
    cds_cfop_listdescription: TStringField;
    cds_nfeItemsduplicate: TStringField;
    pnl_itens: TUniPanel;
    Dbg_Itens: TUniDBGrid;
    UniHiddenPanel1: TUniHiddenPanel;
    Dblcb_Hdd_List_Merchandise: TUniDBLookupComboBox;
    UniLabel2: TUniLabel;
    Dblcb_Hdd_List_Stock: TUniDBLookupComboBox;
    sb_reload_Items: TUniSpeedButton;
    sb_duplica_Item: TUniSpeedButton;
    pop_upd_Merchandise: TUniPopupMenu;
    UpdMercVincular: TUniMenuItem;
    openMerchandise: TUniMenuItem;
    O: TUniLabel;
    M_Order_Note: TUniMemo;
    img_ok: TUniImage;
    img_not_ok: TUniImage;
    cds_nfeItemsconferido: TStringField;
    cds_nfeItemsOrderPuchase: TIntegerField;
    Grb_Nr_Pedido: TUniGroupBox;
    L_Nr_OrderPuchase: TUniLabel;
    E_Nr_OrderPuchase: TUniEdit;
    UniFileUpload: TUniFileUpload;
    ctn_NfeEvents: TUniContainerPanel;


    procedure setImages;Override;
    procedure InitVariable;Override;
    procedure setVariable;Override;
    procedure formatScreen;Override;
    procedure FormaGridItems;
    procedure Sb_XMLClick(Sender: TObject);
    procedure Sb_ConfirmClick(Sender: TObject);
    procedure pg_geralChange(Sender: TObject);
    procedure Dbg_ItensSetCellValue(Sender: TObject; ACol, ARow: Integer;
      AField: TField; var Value: Variant);
    procedure E_NFE_KeyChange(Sender: TObject);
    procedure dbg_CfopSetCellValue(Sender: TObject; ACol, ARow: Integer;
      AField: TField; var Value: Variant);
    procedure Sb_CloseClick(Sender: TObject);
    procedure dbg_CfopDrawColumnCell(Sender: TObject; ACol, ARow: Integer;
      Column: TUniDBGridColumn; Attribs: TUniCellAttribs);
    procedure sb_duplica_ItemClick(Sender: TObject);
    procedure sb_reload_ItemsClick(Sender: TObject);
    procedure cds_nfeItemsAfterScroll(DataSet: TDataSet);
    procedure UpdMercVincularClick(Sender: TObject);
    procedure Dblcb_Hdd_List_MerchandiseMouseDown(Sender: TObject;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure openMerchandiseClick(Sender: TObject);
    procedure Dbg_ItensFieldImage(const Column: TUniDBGridColumn;
      const AField: TField; var OutImage: TGraphic; var DoNotDispose: Boolean;
      var ATransparent: TUniTransparentOption);
    procedure cds_nfeItemsCalcFields(DataSet: TDataSet);
    procedure UniFileUploadCompleted(Sender: TObject; AStream: TFileStream);
  private
    { Private declarations }
    SetesNfe : TControllerEletronicInvoice;
    Financeiro : TControllerFinancialBills;
    XmlFile : String;
    FrNfeEvents : TFmNfeEvents;
    Justif_Manisfestacao : String;
    procedure ShowNfeEvents;

    procedure setManifestation;
    procedure getNfeOnLine;

    function Validate:Boolean;
    function ValidateManifestation:Boolean;



    function setfill:Boolean;
    function showIssuer:Boolean;
    function showNfe:Boolean;
    function showNfeItems:Boolean;
    function defineInstallment:Boolean;
    function showCFOP:Boolean;

    //Validates
    function ValidateProductReferences:Boolean;
    function ValidateProductValues:Boolean;
    function ValidateCfopReferences:Boolean;
    function ValidatePurchaseReferences:Boolean;

    procedure getNFeByHand;
    function validateGetNfeByHand:Boolean;

    //Cadastros bases
    function saveEntity(dados:TEmit):Boolean;
    function saveCommpany(dados:TEmit):Boolean;
    function savePerson(dados:TEmit):Boolean;
    function saveAddress(dados:TEmit):Boolean;
    function savePhone(dados:TEmit):Boolean;
    function saveProvider(dados:TEmit):Boolean;
    function saveCarrier(dados:TEmit):Boolean;
    //Faturamento
    function autoProductRecord:Boolean;
    Function validateInvoice:boolean;
    function saveOrder:Boolean;
    function saveInvoice:Boolean;
    function saveEmitente:Integer;
    function saverReTurn55:Boolean;
    function saveInvoiceMerchandise:Boolean;
    function saveInvoiceShipping:Boolean;
    function SaveInvoiceItems:Boolean;
    function ProductProviderBonded:Boolean;
    function CfopToCFopBonded:Boolean;
    function SaveInvoiceItemsIcms(Idx:Integer):Boolean;
    function SaveInvoiceItemsIpi(Idx:Integer):Boolean;
    function SaveInvoiceItemsPis(Idx:Integer):Boolean;
    function SaveInvoiceItemsCofins(Idx:Integer):Boolean;
    function SaveInvoiceItemsII(Idx:Integer):Boolean;
    function updateStock(Idx:Integer):Boolean;
    function createInstallments:Boolean;
    function createFinancial:Boolean;

    function calculateCost:Boolean;
    function calculateTagPrice:Boolean;
    function activeProductByStock:Boolean;
    function finishDocumetbonded:Boolean;
    function bondOrderPurchase:Boolean;

    //Vinculos
    procedure ShowMerchandiseList;
    procedure ShowStockList;
    procedure ShowCfopList(way:String);

    function validaDuplicaItem:boolean;
    procedure CloneRecord(Cds: TClientDataSet);
    procedure DuplicaItem;

  protected
    ParamNfe :TPrmNfe;    
    function getparameter: TPrmNfe;  
    procedure createCallBacks;
  type
    TMessageCallback = class(TDBXCallback)
    private
      FCallBackMethod: TDSCallbackMethod;
    public
      constructor Create(CallBackMethod: TDSCallbackMethod);
      function Execute(const Arg: TJSONValue): TJSONValue; override;
    end;
          
  public
    { Public declarations }
    messageReturn: TMessageCallback;
  end;

var
  TasXmlImportNfe: TTasXmlImportNfe;

implementation

{$R *.dfm}

uses unMessages, UnFunctions, msg_form, Main, ServerModule;

{ TTasMsgProcess.TChatCallback }

constructor TTasXmlImportNfe.TMessageCallback.Create(CallBackMethod: TDSCallbackMethod);
begin
  FCallBackMethod := CallBackMethod;
end;

function TTasXmlImportNfe.TMessageCallback.Execute(const Arg: TJSONValue): TJSONValue;
begin
  Result := FCallbackMethod(Arg);
end;

{ TTasXmlImportNfe }
procedure TTasXmlImportNfe.setManifestation;
var
  LcJSon : String;
  M : TJSONMarshal;
  jv : TJSONValue;
  p: TCProxy;
begin
  TRY
    ShowMask('Manifestação do Destinatário...');
    MainForm.SQLConnect.Open;
    createCallBacks;
    ParamNfe := self.getparameter;
    p := TCProxy.Create(MainForm.SQLConnect.DBXConnection);
    M := TJSONMarshal.Create(TJSONConverter.Create);
    jv := M.Marshal(ParamNfe);
    LcJSon := jv.ToString;
    p.setManifestation(LcJSon,messageReturn);
    UniSession.Synchronize;
  finally
    FreeAndNil(M);
    FreeAndNil(jv);
    FreeAndNil(p);
    HideMask;
  end;
end;

procedure TTasXmlImportNfe.getNFeByHand;
begin
  if validateGetNfeByHand then
  Begin
    M_Process.Lines.Clear;
    //Inicia o componenente
    SetesNfe.Estabelecimento.Registro.Codigo := UMM.GInstitution.registro.Codigo;
    SetesNfe.Estabelecimento.getByKey;
    // Efetua a Consulta da nota antes de continuar
    M_Process.Lines.Add('Carregando a nota via arquivo local.');
    SetesNfe.NotaMercadoria.Nota.Estabelecimento.Registro.Codigo := UMM.GInstitution.registro.Codigo;
    SetesNfe.Inicialize;

    UniFileUpload.Title := 'Informe o Arquivo XML da Nota Fiscal Eletrônica';
    UniFileUpload.Execute;

  End;
end;


procedure TTasXmlImportNfe.getNfeOnLine;
Var
  LcMsg : String;
   LcJSon : String;
    M : TJSONMarshal;
    jv : TJSONValue;
    p: TCProxy;

begin
  ShowMask('Iniciando processo para importação dp XML...');
  if not FileExists( SetesNfe.PathNameFileXML ) then
  BEgin
    try
      ShowMask('Processo de Manifestação da Nfe');
      MainForm.SQLConnect.Open;
      createCallBacks;
      ParamNfe := self.getparameter;
      p := TCProxy.Create(MainForm.SQLConnect.DBXConnection);
      M := TJSONMarshal.Create(TJSONConverter.Create);
      jv := M.Marshal(ParamNfe);
      LcJSon := jv.ToString;
      p.getDownloadXML(LcJSon,messageReturn);
      UniSession.Synchronize;
    finally
      FreeAndNil(M);
      FreeAndNil(jv);
      FreeAndNil(p);
    end;
  End;
  ShowMask('Carregando o arquivo XML');
  if SetesNfe.loadComponent then
  Begin
    setfill;
    UniSession.Synchronize;
    HideMask;
    MensageAlert(['A T E N Ç Ã O!.',
                  '',
                  'Arquivo carregado com Sucesso.',
                  'Clique para continuar.'
                  ]);
  End
  else
  Begin
    HideMask;
    MensageAlert(['A T E N Ç Ã O!.',
                  '',
                  'Não foi possível carregar o arquivo.',
                  'Verifique.'
                  ]);
  End;
end;

function TTasXmlImportNfe.getparameter: TPrmNfe;
begin
  result := TPrmNfe.create;
  result.Estabelecimento := UMM.GInstitution.registro.Codigo;
  result.Ordem := 0;
  result.Chave := E_NFE_Key.Text;
  result.Evento := FrNfeEvents.DBLCB_Lista.KeyValue;
  result.Justificativa := Self.Justif_Manisfestacao;
end;

procedure TTasXmlImportNfe.pg_geralChange(Sender: TObject);
begin
  case pg_geral.ActivePageIndex of
    1:Begin
        ShowMerchandiseList;
        ShowStockList;
        ShowCfopList('E');
      End;
  end;
end;

function TTasXmlImportNfe.ProductProviderBonded: Boolean;
Begin
  cds_nfeItems.First;
  While not cds_nfeItems.Eof do
  Begin
    WITH SetesNfe.NotaMercadoria.Itens.Mercadoria.HadProvider.Registro DO
    Begin
      Estabelecimento   := SetesNfe.NotaMercadoria.Registro.Estabelecimento;
      Mercadoria        := cds_nfeItemsIntIdProduct.AsInteger;
      Fornecedor        := SetesNfe.NotaMercadoria.Nota.Emitente.Registro.Codigo;
      ProdutoFornecedor := cds_nfeItemsnfeIdProduct.AsString;
    End;
    SetesNfe.NotaMercadoria.Itens.Mercadoria.HadProvider.save;
    cds_nfeItems.Next;
  end;

end;

procedure TTasXmlImportNfe.InitVariable;
begin
  inherited;
  SetesNfe := TControllerEletronicInvoice.create(Self);
  SetesNfe.Estabelecimento.Registro.Codigo := UMM.GInstitution.registro.Codigo;

  Financeiro := TControllerFinancialBills.create(Self);
  ParamNfe := TPrmNFe.Create;
end;

procedure TTasXmlImportNfe.UpdMercVincularClick(Sender: TObject);
begin
  ShowMask('Atualizando lista das mercadorias a vincular.');
  ShowMerchandiseList;
  UniSession.Synchronize;
  HideMask;
end;

function TTasXmlImportNfe.saveAddress(dados: TEmit): Boolean;
begin
  with SetesNfe.NotaMercadoria.Nota.Emitente.Endereco.Registro do
  Begin
    Codigo        := SetesNfe.NotaMercadoria.Nota.Emitente.Registro.Codigo;
    Logradouro    := dados.EnderEmit.xLgr;
    NumeroPredial := dados.EnderEmit.nro;
    Complemento   := dados.EnderEmit.xCpl;
    Bairro        := dados.EnderEmit.xBairro;
    Tipo          := 'COMERCIAL';
    Cep           := IntToStr( dados.EnderEmit.CEP );
    CodigoPais    := dados.EnderEmit.cPais;
    SetesNfe.NotaMercadoria.Nota.Emitente.Endereco.Estado.Registro.Abreviatura := dados.EnderEmit.UF;
    SetesNfe.NotaMercadoria.Nota.Emitente.Endereco.Estado.getByAbbreviation;
    CodigoEstado  := SetesNfe.NotaMercadoria.Nota.Emitente.Endereco.Estado.Registro.Codigo;
    SetesNfe.NotaMercadoria.Nota.Emitente.Endereco.Cidade.Registro.IBGE := IntToStr(dados.EnderEmit.cMun);
    SetesNfe.NotaMercadoria.Nota.Emitente.Endereco.Cidade.getByIBGE;
    CodigoCidade  := SetesNfe.NotaMercadoria.Nota.Emitente.Endereco.Cidade.Registro.Codigo;
    Principal     := 'S';
  End;
  SetesNfe.NotaMercadoria.Nota.Emitente.Endereco.save;
end;

function TTasXmlImportNfe.saveCarrier(dados: TEmit): Boolean;
begin

end;

function TTasXmlImportNfe.saveCommpany(dados: TEmit): Boolean;
begin
  with SetesNfe.NotaMercadoria.Nota.Emitente.Juridica.Registro do
  Begin
    Codigo:= SetesNfe.NotaMercadoria.Nota.Emitente.Registro.Codigo;
    CNPJ:= dados.CNPJCPF;
    InscricaoEstadual:= dados.IE;
    InscricaoMunicipal:= dados.IM;
  End;
  SetesNfe.NotaMercadoria.Nota.Emitente.Juridica.save;
end;

function TTasXmlImportNfe.saveEmitente: Integer;
Var
  Lc_Aux: Integer;
  Lc_Aux_Text: String;
begin
  WITH SetesNfe.Nfe.NotasFiscais.Items[0].Nfe, SetesNfe.NotaMercadoria DO
  Begin
    Nota.Emitente.Registro.Codigo := Nota.Emitente.Juridica.getIDbyCNPJ(Emit.CNPJCPF);
    if ( Nota.Emitente.Registro.Codigo = 0 ) then
      Nota.Emitente.Registro.Codigo := Nota.Emitente.Fisica.getIDbyCPF(Emit.CNPJCPF);
    if ( Nota.Emitente.Registro.Codigo = 0 ) then
    Begin
      saveEntity(Emit);
      if Length(Emit.CNPJCPF) = 11 then
        savePerson(Emit)
      else
        saveCommpany(Emit);
      saveAddress(Emit);
      savePhone(Emit);
    End;
    saveProvider(emit);
  End;
end;


function TTasXmlImportNfe.saveEntity(dados: TEmit): Boolean;
begin
  {
  with SetesNfe.NotaMercadoria.Nota do
  Begin
    with Entity.Registro do
    Begin
      NomeRazao           := UpperCase(UTF8Decode(dados.xNome));
      ApelidoFantasia     := UpperCase(UTF8Decode(dados.xFant));
    End;
    Entity.save;
  End;
  }
end;

function TTasXmlImportNfe.saveInvoice: Boolean;
Begin
  {
  WITH SetesNfe.NotaMercadoria.Nota.Registro,SetesNfe.Nfe.NotasFiscais.Items[0].Nfe DO
  Begin
    Codigo              := SetesNfe.NotaMercadoria.Pedido.Registro.Codigo;
    Estabelecimento     := SetesNfe.NotaMercadoria.Pedido.Registro.Estabelecimento;
    if Ide.tpNF = tnSaida then
      TipoEmissao       := 'EE'
    else
      TipoEmissao       := 'SE';
    Finalidade          := FinNFeToStr( Ide.finNFe);
    if Ide.nNF > 0 then
      Numero              := StrZero(Ide.nNF, 6, 0)
    else
      Numero              := StrZero(Ide.cNF, 6, 0);
    Serie               := IntToStr( Ide.serie );
    Cfop                := cds_cfopnfeIdCfop.AsString;
    Emitente            := SetesNfe.NotaMercadoria.Compra.Registro.Fornecedor;
    Destinatario        := SetesNfe.NotaMercadoria.Pedido.Registro.Estabelecimento;
    Data_emissao        := StrToDateDEf(E_DT_Emission.Text, Ide.dEmi);
    Valor               := Total.ICMSTot.vNF;
    Modelo              := InttoStr( Ide.modelo );
    Observacao          := M_Note.Text;
    Status              := 'F';
  end;
  SetesNfe.NotaMercadoria.Nota.save;
  }
end;

function TTasXmlImportNfe.SaveInvoiceItems: Boolean;
Var
  I: Integer;
Begin
  {
  cds_nfeItems.First;
  I := 1;
  While not cds_nfeItems.Eof do
  Begin
    WITH SetesNfe.NotaMercadoria.PedidoItens DO
    Begin
      with Registro do
      Begin
        Codigo              := I;
        Estabelecimento     := SetesNfe.NotaMercadoria.Registro.Estabelecimento;
        Ordem               := SetesNfe.NotaMercadoria.Pedido.Registro.Codigo;
        Produto             := cds_nfeItemsIntIdProduct.AsInteger;
        Estoque             := cds_nfeItemsintIdStock.AsInteger;
        Quantidade          := cds_nfeItemsnfeQtde.AsFloat;
        ValorUnitario       := cds_nfeItemsnfeUnitValue.AsFloat;
        if cds_nfeItemsnfeDiscountValue.AsFloat > 0 then
          AliquotaDesconto  := ( cds_nfeItemsnfeDiscountValue.AsFloat / cds_nfeItemsnfeTotalValue.AsFloat ) *100
        else
          AliquotaDesconto  := 0;
        ValorDesconto       := cds_nfeItemsnfeDiscountValue.AsFloat;
      End;
      insert;
      with Detalhes do
      Begin
        with Registro do
        Begin
          Codigo              := I;
          Estabelecimento     := SetesNfe.NotaMercadoria.Registro.Estabelecimento;
          Ordem               := SetesNfe.NotaMercadoria.Pedido.Registro.Codigo;
          FrenteTrabalho      := '';
          Detalhes            := '';
          DataPrevista        := Date;
          Status              :=  'F'
        End;
        insert;
      End;
    end;

    // Grava os impostos
    SaveInvoiceItemsIcms(I);
    SaveInvoiceItemsIpi(I);
    SaveInvoiceItemsPis(I);
    SaveInvoiceItemsCofins(I);
    SaveInvoiceItemsII(I);
    //Atualizar Estoque
    updateStock(I);
    cds_nfeItems.Next;
    inc(I);
  end;
  }
end;

function TTasXmlImportNfe.SaveInvoiceItemsCofins(Idx: Integer): Boolean;
begin
  {
  //Ajusta o Indice para percorrer a Nota
  Idx := Idx - 1;
  WITH SetesNfe.Nfe.NotasFiscais.Items[0].Nfe DO
  Begin
    with Det.Items[Idx].Imposto.COFINS do
    Begin
      IF (vBC > 0) then
      Begin
        WITH SetesNfe.NotaMercadoria.PedidoItensCofins do
        Begin
          with Registro DO
          Begin
            ItemOrdem           := SetesNfe.NotaMercadoria.PedidoItens.Registro.Codigo;
            Ordem               := SetesNfe.NotaMercadoria.Pedido.Registro.Codigo;
            Estabelecimento     := SetesNfe.NotaMercadoria.PedidoItens.Registro.Estabelecimento;
            Registro.Cst        := CSTCOFINSToStr(Det.Items[Idx].Imposto.COFINS.CST);
            ValorBase           := vBC;
            ValorBase       := pCOFINS;
            Valor               := vCOFINS;
            QuantVendas         := qBCProd;
            QuantValorAliquota  := vAliqProd;
          End;
          save;
        End;
      end;
    end;
  end;
  }
end;

function TTasXmlImportNfe.SaveInvoiceItemsIcms(Idx: Integer): Boolean;
vAR
  Lc_CFOP: String;
  Lc_CST: String;
  Lc_CSOSN: String;
  Lc_Nr_Itens: Integer;

Begin
  {
  //Ajusta o Indice para percorrer a Nota
  Idx := Idx - 1;
  WITH SetesNfe.Nfe.NotasFiscais.Items[0].Nfe do
  Begin
    with Det.Items[idx] DO
    Begin
      // Trata as Variaveis do CFOP
      cds_cfop.First;
      if cds_cfop.Locate('nfeCfop',Prod.CFOP,[])then
        Lc_CFOP := cds_cfopintIdCfop.AsString;
      Lc_CST := CSTICMSToStr(Imposto.ICMS.CST);
      Lc_CSOSN := CSOSNIcmsToStr(Imposto.ICMS.CSOSN);

      WITH SetesNfe.NotaMercadoria.PedidoItensIcms.Registro DO
      Begin
        ItemOrdem         := SetesNfe.NotaMercadoria.PedidoItens.Registro.Codigo;
        Ordem               := SetesNfe.NotaMercadoria.Pedido.Registro.Codigo;
        Estabelecimento   := SetesNfe.NotaMercadoria.PedidoItens.Registro.Estabelecimento;
        Origem            := OrigToStr(Imposto.ICMS.orig);
        if ( Trim(Lc_CST) <>  '' ) then
          cst             := Lc_CST
        else
          cst             := Lc_CSOSN;
        DetermincaoBase   := modBCToStr(Imposto.ICMS.modBC);
        DetermincaoBaseST := modBCSTToStr(Imposto.ICMS.modBCST);
        Desoneracao       := StrtoInt(motDesICMSToStr(Imposto.ICMS.motDesICMS));
        AliqReducaoBase   := Imposto.ICMS.pRedBC;
        ValorBase         := Imposto.ICMS.vBC;
        Aliquota          := Imposto.ICMS.pICMS;
        ReducaoAliquota   := 0;
        Valor             := Imposto.ICMS.vICMS;
        AliqReducaoBaseST := Imposto.ICMS.pRedBCST;
        ValorBaseST       := Imposto.ICMS.vBCST;
        AliquotaST        := Imposto.ICMS.pICMSST;
        ReducaoAliquotaST := 0;
        ValorST           := Imposto.ICMS.vICMSST;
        MVA               := Imposto.ICMS.pMVAST;
        ValorBaseRetido   := 0;
        ValorRetido       := 0;
        ValorBaseRetidoST := Imposto.ICMS.vBCSTRet;
        ValorRetidoST     := Imposto.ICMS.vICMSSTRet;
        Aliquota_CalcCred := 0;
        Valor_CredExpl    := 0;
        ValorFrete        := Prod.vFrete;
        ValorSeguro       := Prod.vSeg;
        ValorDespesas     := Prod.vOutro;
        Cfop              := Lc_CFOP;
      end;
      SetesNfe.NotaMercadoria.PedidoItensIcms.save;
    end;
  End;
  }
end;

function TTasXmlImportNfe.SaveInvoiceItemsII(Idx: Integer): Boolean;
begin
  {
  //Ajusta o Indice para percorrer a Nota
  Idx := Idx - 1;
  WITH SetesNfe.Nfe.NotasFiscais.Items[0].Nfe DO
  Begin
    with Det.Items[Idx].Imposto.II do
    Begin
      IF (vBC > 0) then
      Begin
        WITH SetesNfe.NotaMercadoria.PedidoItensII do
        Begin
          with Registro DO
          Begin
            ItemOrdem           := SetesNfe.NotaMercadoria.PedidoItens.Registro.Codigo;
            Ordem               := SetesNfe.NotaMercadoria.Pedido.Registro.Codigo;
            Estabelecimento     := SetesNfe.NotaMercadoria.PedidoItens.Registro.Estabelecimento;
            ValorBase          := vBC;
            Despesas           := vDespAdu;
            Valor              := vII;
            ValorIOF           := vIOF;
          End;
          save;
        End;
      end;
    end;
  end;
  }
end;

function TTasXmlImportNfe.SaveInvoiceItemsIpi(Idx: Integer): Boolean;
begin
  {
  //Ajusta o Indice para percorrer a Nota
  Idx := Idx - 1;
  WITH SetesNfe.Nfe.NotasFiscais.Items[0].Nfe DO
  Begin
    with Det.Items[Idx].Imposto.IPI do
    Begin
      IF (vBC > 0) then
      Begin
        WITH SetesNfe.NotaMercadoria.PedidoItensIpi do
        Begin
          with Registro DO
          Begin
            ItemOrdem         := SetesNfe.NotaMercadoria.PedidoItens.Registro.Codigo;
            Ordem               := SetesNfe.NotaMercadoria.Pedido.Registro.Codigo;
            Estabelecimento   := SetesNfe.NotaMercadoria.PedidoItens.Registro.Estabelecimento;
            Registro.Cst      := CSTIPIToStr(Det.Items[Idx].Imposto.IPI.CST);
            Classe_Frame      := clEnq;
            CnpjFabricante    := CnpjFabricante;
            Selo_ctrl         := cSelo;
            Selo_Quant        := qSelo;
            Classe_FrameCode  := cEnq;
            ValorBase         := vBC;
            ValorAliquota     := pIPI;
            QuantUnidade      := qUnid;
            ValorUnitario     := vUnid;
          End;
          save;
        End;
      end;
    end;
  end;
  }
end;

function TTasXmlImportNfe.SaveInvoiceItemsPis(Idx: Integer): Boolean;
begin
  {
  //Ajusta o Indice para percorrer a Nota
  Idx := Idx - 1;
  WITH SetesNfe.Nfe.NotasFiscais.Items[0].Nfe DO
  Begin
    with Det.Items[Idx].Imposto.PIS do
    Begin
      IF (vBC > 0) then
      Begin
        WITH SetesNfe.NotaMercadoria.PedidoItensPis do
        Begin
          with Registro DO
          Begin
            ItemOrdem           := SetesNfe.NotaMercadoria.PedidoItens.Registro.Codigo;
            Ordem               := SetesNfe.NotaMercadoria.Pedido.Registro.Codigo;
            Estabelecimento     := SetesNfe.NotaMercadoria.PedidoItens.Registro.Estabelecimento;
            Registro.Cst        := CSTPISToStr(Det.Items[Idx].Imposto.PIS.CST);
            ValorBase           := vBC;
            Valor       := pPIS;
            Valor               := vPIS;
            QuantVendas         := qBCProd;
            QuantValorAliquota  := vAliqProd;
          End;
          save;
        End;
      end;
    end;
  end;
  }
end;

function TTasXmlImportNfe.saveInvoiceMerchandise: Boolean;
begin
  WITH SetesNfe.NotaMercadoria.Registro,SetesNfe.Nfe.NotasFiscais.Items[0].Nfe DO
  Begin
    Codigo              := SetesNfe.NotaMercadoria.Nota.Registro.Codigo;
    Estabelecimento     := SetesNfe.NotaMercadoria.Nota.Registro.Estabelecimento;
    DataSaida           := StrToDateDEf(E_DT_Exit.Text, Ide.dSaiEnt);
    HoraSaida           := Ide.dSaiEnt;
    ValorBaseICMS       := Total.ICMSTot.vBC;
    ValorIcms           := Total.ICMSTot.vICMS;
    ValorBaseIcmsSt     := Total.ICMSTot.vBCST;
    ValorIcmsSt         := Total.ICMSTot.vST;
    ValorTotal          := Total.ICMSTot.vProd;
    ValorFrete          := Total.ICMSTot.vFrete;
    ValorSeguro         := Total.ICMSTot.vSeg;
    ValorDespesas       := Total.ICMSTot.vOutro;
    ValorIpi            := Total.ICMSTot.vIPI;
  End;
  SetesNfe.NotaMercadoria.save;
end;

function TTasXmlImportNfe.saveInvoiceShipping: Boolean;
begin
  {
  WITH SetesNfe.NotaMercadoria.NotaEntrega.Registro,SetesNfe.Nfe.NotasFiscais.Items[0].Nfe DO
  Begin
    if (Transp.Vol.Count > 0) then
    Begin
      Codigo              := SetesNfe.NotaMercadoria.Registro.Codigo;
      Estabelecimento     := SetesNfe.NotaMercadoria.Registro.Estabelecimento;
      Quantidade          := Transp.Vol.Items[0].qVol;
      Classificacao       := Copy(Transp.Vol.Items[0].esp,1,10);
      Marca               := Copy(Transp.Vol.Items[0].marca,1,10);
      PesoBruto          := FloatToStrF(Transp.Vol.Items[0].pesoB, ffFixed, 10, 4);
      PesoLiquido        := FloatToStrF(Transp.Vol.Items[0].pesoL, ffFixed, 10, 4);
      NumeroVolume       := Copy(Transp.Vol.Items[0].nVol,1,8);
      PlacaVeiculo       := Transp.veicTransp.placa;
      PlacaEstado        := Transp.veicTransp.UF;
      PlacaRntc          := Transp.veicTransp.RNTC;
      SetesNfe.NotaMercadoria.NotaEntrega.save;
    end;
  End;
  }
end;

function TTasXmlImportNfe.saveOrder: Boolean;
Var
  I : Integer;
  Qt:Real;
Begin
  {
  WITH SetesNfe.NotaMercadoria.Pedido.Registro DO
  Begin
    Codigo          := 0;
    Estabelecimento := UMM.GInstitution.registro.Codigo;
    Data            := Date;
    Observacao      := M_Order_Note.text;
    Usuario         := UMM.GInstitution.User.Registro.Codigo;
    Origem          := 'I';
    Status          := 'F';
  End;
  SetesNfe.NotaMercadoria.Pedido.save;
  //Soma Quantidade de produto
  cds_nfeItems.First;
  Qt := 0;
  while not cds_nfeItems.Eof do
  Begin
    Qt := Qt  + cds_nfeItemsnfeQtde.AsFloat;
    cds_nfeItems.Next;
  End;

  WITH SetesNfe.NotaMercadoria.PedidoTotalizer.Registro,SetesNfe.Nfe.NotasFiscais.Items[0].Nfe DO
  Begin
    Codigo            := SetesNfe.NotaMercadoria.Pedido.Registro.Codigo;
    Estabelecimento   := SetesNfe.NotaMercadoria.Pedido.Registro.Estabelecimento;
    ItemsQuantidade   := cds_nfeItems.RecordCount;
    ProdutoQuantidade := qt;
    ValorProduto      := Total.ICMSTot.vProd;
    IPIValor          := 0;
    AlíquotaDesconto  := 0;
    ValorDesconto     := 0;
    ValorDespesas     := 0;
    ValorTotal        := Total.ICMSTot.vProd;
  End;
  SetesNfe.NotaMercadoria.PedidoTotalizer.save;

  //Este codigo servira para gravar a ordem ao final do faturamento
  //definindo assim se será uma compra ou ajuste
  WITH SetesNfe.Nfe.NotasFiscais.Items[0].Nfe DO
  Begin
    if (Cobr.Dup.Count > 0) OR (chbx_Charging.Checked) then
    Begin
      with SetesNfe.NotaMercadoria.Compra.Registro do
      Begin
        Codigo          := SetesNfe.NotaMercadoria.Pedido.Registro.Codigo;
        Estabelecimento := SetesNfe.NotaMercadoria.Pedido.Registro.Estabelecimento;
        Aprovado        := 'S';
        Fornecedor      := SetesNfe.NotaMercadoria.Nota.Entity.Registro.Codigo;
      End;
      SetesNfe.NotaMercadoria.Compra.save;
    End
    else
    Begin
      with SetesNfe.NotaMercadoria.Ajuste.Registro do
      Begin
        Codigo          := SetesNfe.NotaMercadoria.Pedido.Registro.Codigo;
        Estabelecimento := SetesNfe.NotaMercadoria.Pedido.Registro.Estabelecimento;
        Entidade        := SetesNfe.NotaMercadoria.Nota.Entity.Registro.Codigo;
      End;
      SetesNfe.NotaMercadoria.Ajuste.save;
    End;
  end;
  }
end;


function TTasXmlImportNfe.savePerson(dados: TEmit): Boolean;
begin
  {
  with SetesNfe.NotaMercadoria.Nota do
  Begin
    with Estabelecimento.Fiscal.Fisica do
    Begin
      Registro.Codigo:= Entity.Registro.Codigo;
      Registro.CPF:= dados.CNPJCPF;
      save;
    End;
  End;
  }
end;

function TTasXmlImportNfe.savePhone(dados: TEmit): Boolean;
begin
  {
  //Phone
  if (dados.EnderEmit.fone <> '') then
  Begin
    with SetesNfe.NotaMercadoria.Nota.Entity.Telefone.Registro do
    Begin
      Codigo        := SetesNfe.NotaMercadoria.Nota.Entity.Registro.Codigo;
      Tipo := 'Fone';
      Numero    := dados.EnderEmit.fone;
    End;
    SetesNfe.NotaMercadoria.Nota.Entity.Telefone.save;
  End;
  }
end;

function TTasXmlImportNfe.saveProvider(dados: TEmit): Boolean;
begin
  {
  with  SetesNfe.NotaMercadoria.Nota.Emitente do
  Begin
    Registro.codigo := SetesNfe.NotaMercadoria.Nota.Emitente.Registro.Codigo;
    Registro.Estabelecimento := UMM.GInstitution.registro.Codigo;
    Registro.Ativo := 'S';
    save;
  End;
  }
end;


function TTasXmlImportNfe.saverReTurn55: Boolean;
begin
  {
  WITH SetesNfe.NotaMercadoria.Retorno.Registro,SetesNfe.Nfe.NotasFiscais.Items[0].Nfe DO
  Begin
    Codigo          := SetesNfe.NotaMercadoria.Pedido.Registro.Codigo;
    Estabelecimento := SetesNfe.NotaMercadoria.Pedido.Registro.Estabelecimento;
    Status := 2;
    NomeArquivo := concat( Copy(infNFe.ID,(Length(infNFe.ID) - 44) + 1, 44) ,'-NFe.xml');
    Motivo := '';
  end;
  SetesNfe.NotaMercadoria.Retorno.save;
  }
end;

procedure TTasXmlImportNfe.Sb_CloseClick(Sender: TObject);
begin
  Close;
end;

procedure TTasXmlImportNfe.Sb_ConfirmClick(Sender: TObject);
begin
  if validateInvoice then
  Begin
    //Emitente
    ShowMask('Importando Nota pelo XML');
    saveEmitente;
    UniSession.Synchronize;
    //Pedido
    saveOrder;
    UniSession.Synchronize;
    //Invoice
    saveInvoice;
    UniSession.Synchronize;
    //Controle de Retorno da Nota de entrada (para registro e emisssão no futuro)
    saverReTurn55;
    UniSession.Synchronize;
    //Invoice Merchandise
    saveInvoiceMerchandise;
    UniSession.Synchronize;
    //Invoice Shipping
    saveInvoiceShipping;
    UniSession.Synchronize;
    //Vincula Itens Sistema e Fornecedor
    ProductProviderBonded;
    UniSession.Synchronize;
    //Invoice Items
    SaveInvoiceItems;
    UniSession.Synchronize;
    //Vincula CFop da nota e e de entrada no sistema
    CfopToCFopBonded;
    UniSession.Synchronize;
    //*******Pc_AlteraStatusPedido(DM.IB_Transacao, It_Cd_Pedido, 'S');
    //Parcelamento
    createInstallments;
    UniSession.Synchronize;
    //Financeiro
    createFinancial;
    UniSession.Synchronize;
    //*******Pc_FormataModeloNFE;
    //Calcular o Custo
    calculateCost;
    UniSession.Synchronize;
    //Calcula o Preço de Venda
    calculateTagPrice;
    UniSession.Synchronize;
    // Ativa produtos caso estejam inativos
    activeProductByStock;
    UniSession.Synchronize;
    // Atualiza o estoque na internet
    //******Pc_AtualizaEstoqueComercioEletronico(It_Cd_Pedido);
    //Baixar Documento vinculado
    finishDocumetbonded;
    UniSession.Synchronize;
    //Vincular se a nota tem pedido de compra
    hideMask;
    MensageAlert(['A T E N Ç Ã O!.',
                  '',
                  'Importação do XML efetuada com sucesso.']);
  End;
end;

procedure TTasXmlImportNfe.sb_duplica_ItemClick(Sender: TObject);
begin
  if validaDuplicaItem then
    DuplicaItem;
end;

procedure TTasXmlImportNfe.sb_reload_ItemsClick(Sender: TObject);
begin
  MensageYesNo(['C O N F I R M A Ç Ã O!',
                '',
                'Deseja realmente recarregar os itens na lista?',
                'clique em SIM para confirmar.'],mpAlerta);
  FormMsg.ShowModal(
  Procedure(Sender: TComponent; AResult:Integer)
  begin
    if (Sender as TMsgForm).BotaoEscolhido > 0 then
    Begin
      Self.showNfeItems;
      Self.FormaGridItems;
    End;
  end
  );
end;

procedure TTasXmlImportNfe.Sb_XMLClick(Sender: TObject);
Var
  LcJSon : String;
  M : TJSONMarshal;
  jv : TJSONValue;
Begin
  if Trim(E_NFE_Key.Text) <> '' then
  Begin
    if Validate then
    Begin
      if ValidateManifestation then
        setManifestation ;
      getNfeOnLine
    End;
  End
  else
  Begin
    getNFeByHand;
  End;
end;

function TTasXmlImportNfe.setfill: Boolean;
begin
  //Dados Emitente
  showIssuer;
  //Dados da nota
  showNfe;
  //Dados Itens da Nota
  showNfeItems;
  FormaGridItems;
  //DEfine Parcelamento
  defineInstallment;
  //Dados do CFOP
  showCFOP;
end;

procedure TTasXmlImportNfe.setImages;
begin
  inherited;
  buttonIcon(Sb_XML,'process.bmp');
  buttonIcon(Sb_Confirm,'confirm.bmp');
  buttonIcon(Sb_Close,'close.bmp');

end;

procedure TTasXmlImportNfe.setVariable;
begin
  {Esta sendo setado dentro do inicializar do componente - 11/08/2017 - 01:04
  NotaMercadoria.Institution.Registro.Codigo := UMM.GInstitution.registro.Codigo;
  NotaMercadoria.Institution.getByKey;
  }
end;

function TTasXmlImportNfe.activeProductByStock: Boolean;
Var
  Lc_SqlTxt: string;
  Lc_cd_Produto : String;
  Lc_ComercioEletronico : boolean;
Begin
  {
  Lc_Qry := TIBQuery.Create(Application);
  with Lc_Qry do
    Begin
    Database := DM.IBD_Gestao;
    Transaction := DM.IBT_Estoque;
    Active := False;
    SQL.Clear;
    Lc_SqlTxt := 'SELECT PRO_ATIVO, ITF_CODPRO '+
                 'FROM TB_ITENS_NFL Tb_itens_nfl '+
                 '   INNER JOIN TB_PEDIDO Tb_pedido '+
                 '   ON  (Tb_itens_nfl.ITF_CODPED = Tb_pedido.PED_CODIGO) '+
                 '   INNER JOIN TB_PRODUTO Tb_produto '+
                 '   ON  (Tb_produto.PRO_CODIGO = Tb_itens_nfl.ITF_CODPRO) '+
                 '   INNER JOIN TB_MEDIDA tb_medida '+
                 '   ON  (tb_medida.MED_CODIGO = tb_produto.PRO_CODMED) '+
                 'WHERE (ITF_CODPED =:PED_CODIGO) AND (PRO_TIPO <>''S'') ';
    SQL.Add(Lc_SqlTxt);
    ParamByName('PED_CODIGO').AsInteger := Pc_Cd_Pedido;
    Active := True;
    FetchAll;
    end;

  Lc_Qry_Upd := TIBQuery.Create(Application);
  with Lc_Qry_Upd do
    Begin
    Application.ProcessMessages;
    Database := DM.IBD_Gestao;
    Transaction := DM.IBT_Estoque;
    Active := False;
    SQL.Clear;
    Lc_SqlTxt := 'UPDATE TB_PRODUTO SET '+
                 'PRO_ATIVO = ''S'', '+
                 'PRO_FORA_LINHA = ''N'' '+
                 'WHERE PRO_CODIGO=:PRO_CODIGO ';
    SQL.Add(Lc_SqlTxt);
    Lc_Qry.First;
    while not Lc_Qry.Eof do
      Begin
      Application.ProcessMessages;
      if (Lc_Qry.FieldByname('PRO_ATIVO').AsAnsiString = 'N') Then
        Begin
        Active := False;
        ParamByName('PRO_CODIGO').AsInteger := Lc_Qry.FieldByname('ITF_CODPRO').AsInteger;
        ExecSQL;
        end;
      Lc_Qry.Next;
      end;
    end;
  Lc_Qry.Close;
  Lc_Qry_Upd.Close;
  FreeAndNil(Lc_Qry);
  FreeAndNil(Lc_Qry_Upd);
  }
end;

function TTasXmlImportNfe.autoProductRecord: Boolean;
Var
  Lc_I: Integer;
  Lc_Cd_Produto, Lc_Cd_Grupo, Lc_Cd_SubGrupo, Lc_cd_Medida, Lc_Cd_Embalagem,
    Lc_Cd_Marca: Integer;
  Lc_VL_Custo: Real;
  //Lc_Produto : TControllerProduto;
Begin
  {
  Lc_Produto := TControllerProduto.Create(self);
  Lc_Cd_Grupo := Fc_CriaGrupoAuto('IMPORTACAO XML');
  Application.ProcessMessages;
  Lc_Cd_SubGrupo := Fc_CriaSubGrupoAuto(Lc_Cd_Grupo, 'GERAL');
  Application.ProcessMessages;
  Lc_cd_Medida := Fc_CriaMedidaAuto('UNIDADE', 'UND');
  Application.ProcessMessages;
  Lc_Cd_Embalagem := Fc_CriaEmbalagemAuto('NORMAL', 'NRL');
  Application.ProcessMessages;
  Lc_Cd_Marca := Fc_CriaMarca_ProdutoAuto('NÃO INFORMADA');
  Application.ProcessMessages;
  with StrGrd_ItensNota do
  Begin
    For Lc_I := 1 to (RowCount - 1) do
    Begin
      if Trim(Cells[9, Lc_I]) = '' then
      Begin
        Lc_Produto.Clear;
        with Lc_Produto.Registro do
        Begin
          Codigo := 0;
          CodigoEstabelecimento := Gb_CodMha;
          CodigoFabrica := '';
          CodigoBarras := Cells[10, Lc_I];
          CodigoNCM := Cells[14, Lc_I];
          Descricao := Cells[2, Lc_I];
          CodigoMedida := Lc_cd_Medida;
          CodigoEmbalagem := Lc_Cd_Embalagem;
          CodigoGrupo := Lc_Cd_Grupo;
          CodigoSubgrupo := Lc_Cd_SubGrupo;
          Divisor := 1;
          Origem := Cells[15, Lc_I];
          Tipo := 'P';
          ValorFabrica :=  StrToFloatdef(Cells[6, Lc_I],0);
          ValorCustoMedio :=  StrToFloatdef(Cells[6, Lc_I],0);
          ValorCustoMedioAnt :=  StrToFloatdef(Cells[6, Lc_I],0);
          ValorCusto :=  StrToFloatdef(Cells[6, Lc_I],0);
          ValorCustoAnt :=  StrToFloatdef(Cells[6, Lc_I],0);
          SubsTrib := Cells[16, Lc_I];
          Campanha := 'N';
          Destaque := 'N';
          Ativo := 'S';
          Imprime := 'S';
          EstoqueNegativo := 'S';
          Exclusivo := 'N';
          Internet := 'N';
          MaisVendido := 'N';
          Composicao := '1';
          CodigoMarca := Lc_Cd_Marca;
          FinalidadeTributacao := '1';
          UtilizaSerie := 'N';
          Venda := 'S';
          ForaLinha := 'N';
          CEST := '';
        End;
        Lc_Produto.save;
        Lc_Cd_Produto := Lc_Produto.Registro.Codigo;

        Pc_CriaRegistroTabelas(Lc_Cd_Produto, StrToFloatDef(Cells[6, Lc_I], 0),
          StrToFloatDef(Cells[6, Lc_I], 0));
        Pc_CriaRegistroEstoque(Lc_Cd_Produto);
        // Preenche a Grade mostrando que o vinculo foi feito
        if (StrToIntDef(Cells[8, Lc_I], 0) > 0) then
        Begin
          Pc_VincularCodigoProdutoFornecedor(IntToStr(Lc_Cd_Produto),
            IntToStr(Self.It_cd_Empresa), Cells[8, Lc_I]);
        end;
        Cells[9, Lc_I] := IntToStr(Lc_Cd_Produto);
        Cells[11, Lc_I] := IntToStr(Lc_Cd_Produto) + ' - ' + Cells[2, Lc_I];
      end;
    end;
  end;
  }

end;

function TTasXmlImportNfe.bondOrderPurchase: Boolean;
Var
  I: Integer;
  LcItensPurchase : TControllerOrderItem;
  LcItensDetail   : TControllerOrderItemDetail;
  LcInvHasPurchase : TControllerInvoiceHasPurchase;
  LcFound : Boolean;
  LcSaldo : Real;
  VinculoDireto : Boolean;
  LcNrPurchase : Integer;
Begin
  Result := True;
  {Esta varival vai controlar se utilizaremos o mesmo pedido feito durante a importação ou pedido feito anteriormente}
  VinculoDireto := True;
  LcItensPurchase := TControllerOrderItem.create(Self);
  LcItensDetail   := TControllerOrderItemDetail.create(Self);
  LcInvHasPurchase := TControllerInvoiceHasPurchase.create(Self);
  I := 1;
  cds_nfeItems.First;
  while not cds_nfeItems.Eof do
  BEgin
    //Verifica se foi informado no item
    LcNrPurchase := StrToIntDef(cds_nfeItemsOrderPuchase.AsString,0);
    //Verifica se foi informado no ambito geral na aba de outras informações
    if ( LcNrPurchase = 0 )  then
      LcNrPurchase := StrToIntDef(E_Nr_OrderPuchase.Text,0);
    if ( LcNrPurchase > 0 )  then
    Begin
      { Localizar o item do pedido de compra }
      with LcItensPurchase do
      Begin
        clear;
        Registro.Estabelecimento  := UMM.GInstitution.registro.Codigo;
        Registro.Produto          := cds_nfeItemsIntIdProduct.AsInteger;
        Registro.Ordem            := cds_nfeItemsOrderPuchase.AsInteger;
        LcFound := readByField;
      End;
      { Se encontrar um pedido vinculado }
      if LcFound then
      Begin
        VinculoDireto := False;
        { Tratar a situação do item no pedido de compra como [F]ATURADO }
        with LcItensDetail.Registro do
        Begin
          Estabelecimento  := LcItensPurchase.Registro.Estabelecimento;
          Codigo           := LcItensPurchase.Registro.Codigo;
          Ordem            := LcItensPurchase.Registro.Ordem;
//          Status           := 'F';
//          LcItensDetail.updateStatus;
        End;
       { Vinculo do pedido de compra com a importação xml }
        with LcInvHasPurchase.Registro do
        Begin
          Estabelecimento := UMM.GInstitution.registro.Codigo;
          NotaFiscal      := SetesNfe.NotaMercadoria.Registro.Codigo;
          NotaFiscalItem  := I;
          OrdemCompra     := LcItensPurchase.Registro.Ordem;
          OrdemCompraItem := LcItensPurchase.Registro.Codigo;
          LcInvHasPurchase.Insert;
        End;
        { Verificar quantidade de mercadoria de origem e destino }
        if ( cds_nfeItemsnfeQtde.AsFloat < LcItensPurchase.Registro.Quantidade ) then
        Begin
					{ Se Invoice for menor do que purchase. Altera a quantidade do item de compra  }
          LcSaldo := LcItensPurchase.Registro.Quantidade - cds_nfeItemsnfeQtde.AsFloat;
          LcItensPurchase.Registro.Quantidade := cds_nfeItemsnfeQtde.AsFloat;
          LcItensPurchase.update;
          { Inclui um novo registro do mesmo item com a diferença da quantidade}
          LcItensPurchase.Registro.Codigo := 0;
          LcItensPurchase.Registro.Quantidade := LcSaldo;
          LcItensPurchase.insert;
          { Cria o detalhe do Item  }
          LcItensDetail.Registro.Estabelecimento  := LcItensPurchase.Registro.Estabelecimento;
          LcItensDetail.Registro.Codigo           := LcItensPurchase.Registro.Codigo;
          LcItensDetail.Registro.Ordem            := LcItensPurchase.Registro.Ordem;
//          LcItensDetail.Registro.Status := 'A';
          LcItensDetail.insert;
        End;
      End;
    End;
    cds_nfeItems.Next;
  end;
end;

procedure TTasXmlImportNfe.openMerchandiseClick(Sender: TObject);
Var
  Form : TSeaMerchandise;
begin
  if Form = nil then
    Form := TSeaMerchandise.Create(UniApplication);
  Form.Show(
    Procedure(Sender: TComponent; AResult:Integer)
    begin
      self.UpdMercVincularClick(Self);
      Form := nil;
    end
  );
end;

function TTasXmlImportNfe.calculateCost: Boolean;
begin
  {
  WITH fr_principal.Nfe.NotasFiscais.Items[0].Nfe DO
  Begin
    if (Cobr.Dup.Count > 0) or ChBx_FinManual.Checked then
      Pc_AtualizaCustosProdutos(It_Cd_Pedido,'');
  end;
  }
end;

function TTasXmlImportNfe.calculateTagPrice: Boolean;
Var
  Lc_Atualiza : String;
Begin
  {
  Lc_Atualiza := FC_Tb_Geral('L', 'PRO_G_ATUAL_PRECO_COMPRA', '') ;
  if ( Lc_Atualiza = 'A') then
    Pc_AtualizarPreco(It_Cd_Nota)
  else if ( Lc_Atualiza  = 'M') then
    Pc_AtualizarPrecoManual(It_Cd_Pedido);
  }
end;

procedure TTasXmlImportNfe.cds_nfeItemsAfterScroll(DataSet: TDataSet);
begin
  //Caso o item tenha sido duplicado então permite a alteração do valor unitario
  Dbg_Itens.Columns[5].ReadOnly := (cds_nfeItemsduplicate.AsString = 'N');
end;

procedure TTasXmlImportNfe.cds_nfeItemsCalcFields(DataSet: TDataSet);
Var
  LcValid : Boolean;
begin
  LcValid := False;
  LcValid := ( DataSet.FieldByName('IntIdProduct').AsInteger = 0 );
  if not LcValid then
    LcValid := ( DataSet.FieldByName('intIdStock').AsInteger = 0 );
  if LcValid then
    DataSet.FieldByName('conferido').AsString := '0'
  else
    DataSet.FieldByName('conferido').AsString := '1';
end;

function TTasXmlImportNfe.CfopToCFopBonded: Boolean;
begin
  cds_cfop.First;
  While not cds_cfop.Eof do
  Begin
    WITH SetesNfe.NotaMercadoria.Nota.Cfop.CfopDePara.Registro DO
    Begin
      CfopOrigem := cds_cfopnfeIdCfop.AsString;
      CfopDestino :=cds_cfopintIdCfop.AsString;
    End;
    SetesNfe.NotaMercadoria.Nota.Cfop.CfopDePara.save;
    cds_cfop.Next;
  end;
end;

procedure TTasXmlImportNfe.createCallBacks;
begin
  messageReturn := TMessageCallback.Create( function(const Args: TJSONValue) : TJSONValue
  var
    LJSONObject: TJSONObject; I: Integer;
    LMessage: string;
  begin
    // Extract information about the transformation from Json
    LJSONObject := TJSONObject(Args);

    for I := 0 to LJSONObject.Size - 1 do
    begin
      with LJSONObject.Get(I) do
      Begin
        SELF.M_Process.Lines.Add(concat(JSonString.Value, ' - ' , JsonValue.Value ));
        Result := TJSONTrue.Create;
      End;
    end;
  end);
end;

function TTasXmlImportNfe.createFinancial: Boolean;
var
   Lc_I: Integer;
   Lc_Qt_Parcelas: Integer;
   Lc_Nr_Duplicata : String;
begin
  {
  if (Chbx_Financeiro.checked) or (ChBx_FinManual.checked) then
  Begin
    Lc_Form := TFr_Fatura_fin.Create(self);
    Lc_Form.It_Confirma := False;
    Lc_Form.It_cd_Nota := It_Cd_Nota;
    if Chbx_CreditoFinanceiro.checked  then
    Begin
      Lc_Form.It_Tipo_Finaceiro := 'RA';
    End
    else
    Begin
      Lc_Form.It_Tipo_Finaceiro := 'PA';
    End;
    Lc_Form.It_Oper_Financeiro := 'D';
    Lc_Form.PegaContaGerencialAuto := False;
    Lc_Form.It_Hist_Caixa := 'COMPRA NF Nº ' + It_Nr_Nota;
    Lc_Form.ShowModal;
    FreeAndNil(Lc_Form);
  End;
  }
end;

function TTasXmlImportNfe.createInstallments: Boolean;
Var
  I : Integer;
  Lc_Cd_FormaPagamento : Integer;
Begin
  //Define o codigo de forma de pagamento
  Financeiro.PaymentType.Registro.Codigo := 0;
  Financeiro.PaymentType.Registro.Descricao := 'CARTEIRA';
  Financeiro.PaymentType.Institution.Estabelecimento := UMM.GInstitution.registro.Codigo;
  Financeiro.PaymentType.getByDescripton;

  WITH SetesNfe.Nfe.NotasFiscais.Items[0].NFe DO
  Begin
    if (Cobr.Dup.Count > 0) then
    Begin
      for I := 0 to (Cobr.Dup.Count - 1) do
      Begin
        with Financeiro.Financial.Registro do
        Begin
          Ordem               := SetesNfe.NotaMercadoria.Nota.Pedido.Registro.Codigo;
          Estabelecimento     := SetesNfe.NotaMercadoria.Nota.Pedido.Registro.Estabelecimento;
          Parcela             := I + 1;
          DataExpiracao       := Cobr.Dup.Items[I].dVenc;
          TipoPagamento       := Financeiro.PaymentType.Registro.Codigo;
          Valor               := Cobr.Dup.Items[I].vDup;
        End;
        Financeiro.Financial.save;

        with Financeiro.Registro do
        Begin
          Ordem               := SetesNfe.NotaMercadoria.Nota.Pedido.Registro.Codigo;
          Estabelecimento     := SetesNfe.NotaMercadoria.Nota.Pedido.Registro.Estabelecimento;
          Parcela             := I + 1;
          PlanoContas         := 0;
          if Ide.nNF > 0 then
            Numero              := Concat(StrZero(Ide.nNF, 6, 0), '/',IntToStr(I + 1))
          else
            Numero              := Concat(StrZero(Ide.cNF, 6, 0), '/',IntToStr(I + 1));
          Tipo                := 'PA';
          Situacao            := 'N';
          Operacao            := 'D';
          Fase                := 'N';
        End;
        Financeiro.save;
      End;
    End;
  End;
end;

procedure TTasXmlImportNfe.dbg_CfopDrawColumnCell(Sender: TObject; ACol,
  ARow: Integer; Column: TUniDBGridColumn; Attribs: TUniCellAttribs);
Var
  LcValid : Boolean;
begin
  LcValid := False;
  LcValid := ( Column.Field.DataSet.FieldByName('intIdCfop').AsString = '' );

  if LcValid then
    Attribs.Color := clRed
  else
    Attribs.Color := clWindow;

end;

procedure TTasXmlImportNfe.dbg_CfopSetCellValue(Sender: TObject; ACol,
  ARow: Integer; AField: TField; var Value: Variant);
Var
  LcIn_aux:Integer;
  LcVl_aux : Real;
begin
  if Acol = 3 then
  BEgin
    //Codigo do Estoque ela DBlooxUp
    if (Length(value) > 0) then
    Begin
      LcIn_aux := pos(' ',Value) - 1;
      cds_cfop.Edit;
      cds_cfopintIdCfop.AsString := Copy(Value,1,LcIn_aux);
      //LcIn_aux := LcIn_aux + 2;
      //cds_cfopintCfop.AsString := Copy(Value,LcIn_aux,(Length(Value) -LcIn_aux));
      cds_cfopintCfop.AsString := Copy(Value,1,100);
      cds_cfop.Post;
    End;
  End;

end;

procedure TTasXmlImportNfe.Dbg_ItensFieldImage(const Column: TUniDBGridColumn;
  const AField: TField; var OutImage: TGraphic; var DoNotDispose: Boolean;
  var ATransparent: TUniTransparentOption);
begin
  if SameText(AField.FieldName, 'conferido') then
  begin
    DoNotDispose := True; // we provide an static image so do not free it.
    if AField.AsString = '1' then
      OutImage := img_ok.Picture.Graphic
    else
      OutImage := img_not_ok.Picture.Graphic;
  end;
end;

procedure TTasXmlImportNfe.Dbg_ItensSetCellValue(Sender: TObject; ACol,
  ARow: Integer; AField: TField; var Value: Variant);
Var
  LcIn_aux:Integer;
begin
  case Acol of
    4:BEgin
        cds_nfeItems.Edit;
        if not (Value >  0) then Value := 1;
        cds_nfeItemsnfeQtde.AsFloat := Value;
        if (cds_nfeItemsduplicate.AsString = 'N') then
          cds_nfeItemsnfeUnitValue.AsFloat := (cds_nfeItemsnfeTotalValue.AsFloat / Value)
        else
          cds_nfeItemsnfeTotalValue.AsFloat := (cds_nfeItemsnfeUnitValue.AsFloat * Value);
        cds_nfeItems.Post;
    End;
    5:BEgin
        if (cds_nfeItemsduplicate.AsString = 'S') then
        Begin
          cds_nfeItems.Edit;
          if not (Value > 0) then Value := 1;
          cds_nfeItemsnfeUnitValue.AsFloat := Value;
          cds_nfeItemsnfeTotalValue.AsFloat := (cds_nfeItemsnfeQtde.AsFloat * value);
          cds_nfeItems.Post;
        End;
      End;
    11:BEgin
        LcIn_aux := pos(' ',Value) - 1;
        cds_nfeItems.Edit;
        cds_nfeItemsIntIdProduct.AsInteger := StrToIntDef(Copy(Value,1,LcIn_aux),0);
        cds_nfeItemsIntProduct.AsString    := Value;
        cds_nfeItems.Post;
    End;
    13:BEgin
        LcIn_aux := pos(' ',Value) - 1;
        cds_nfeItems.Edit;
        cds_nfeItemsintIdStock.AsInteger := StrToIntDef(Copy(Value,1,LcIn_aux),0);
        cds_nfeItemsintStock.AsString    := Value;
        cds_nfeItems.Post;
    End;
  end;
end;

procedure TTasXmlImportNfe.Dblcb_Hdd_List_MerchandiseMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  if Button=mbRight then
  begin
    pop_upd_Merchandise.Popup(X, Y, Dblcb_Hdd_List_Merchandise);
  end;
end;

function TTasXmlImportNfe.DefineInstallment: Boolean;
Var
  LC_I : Integer;
  Lc_Cd_FormaPagto:Integer;
  Lc_VL_Total : Real;
  Lc_Linha : Integer;
Begin
  WITH SetesNfe.Nfe.NotasFiscais.Items[0].NFe DO
  Begin
    if (Cobr.Dup.Count > 0) then
    Begin
      chbx_Charging.Checked := True;
      chbx_Charging.enabled := False;
      chbx_Manual_Charging.Checked := False;
      chbx_Manual_Charging.enabled := False;
      chbx_Credits.Checked := False;
      chbx_Credits.enabled := False;
    end
    else
    BEgin
      chbx_Charging.Checked := False;
      chbx_Charging.enabled := False;
      chbx_Manual_Charging.Checked := False;
      chbx_Manual_Charging.enabled := True;
      chbx_Credits.Checked := False;
      chbx_Credits.enabled := True;
    End;
  End;
end;

procedure TTasXmlImportNfe.CloneRecord(Cds: TClientDataSet);
var
  CdsClone: TClientDataSet;
  i: integer;
begin
  CdsClone := TClientDataSet.Create(self);
  try
    CdsClone.CloneCursor(Cds, True);
    Cds.Append;
    for i := 0 to Cds.FieldCount-1 do
    Cds.Fields[i].Value := CdsClone.Fields[i].Value;
    CdsClone.Close;
  finally
    CdsClone.Free;
  end;
end;

procedure TTasXmlImportNfe.DuplicaItem;
var
  Cds: TClientDataSet;
  LcItem : String;
begin
  LcItem := cds_nfeItemsnfeNrITem.AsString;
  //Marca o item como duplicado
  cds_nfeItems.Edit;
  cds_nfeItemsduplicate.AsString := 'S';
  cds_nfeItems.Post;
  Cds := TClientDataSet.Create(self);
  try
    Cds.Data := cds_nfeItems.data;
    Cds.Filter := concat('( nfeNrITem = ',LcItem,')');
    Cds.Filtered := True;
//    cds_nfeItems.Append;
    cds_nfeItems.Insert;
    cds_nfeItemsnfeNrITem.AsString        :=  Cds.FieldByName('nfeNrITem').AsString;
    cds_nfeItemsnfeProduct.AsString       :=  Cds.FieldByName('nfeProduct').AsString;
    cds_nfeItemsnfeUnidade.AsString       :=  Cds.FieldByName('nfeUnidade').AsString;
    cds_nfeItemsnfeQtde.AsFloat           :=  Cds.FieldByName('nfeQtde').AsFloat;
    cds_nfeItemsnfeUnitValue.AsFloat      :=  Cds.FieldByName('nfeUnitValue').AsFloat;
    cds_nfeItemsnfeTotalValue.AsFloat     :=  Cds.FieldByName('nfeTotalValue').AsFloat;
    cds_nfeItemsnfeDiscountValue.AsFloat  :=  Cds.FieldByName('nfeDiscountValue').AsFloat;
    cds_nfeItemsnfeIdProduct.AsString     :=  Cds.FieldByName('nfeIdProduct').AsString;
    cds_nfeItemsIntIdProduct.AsInteger    :=  Cds.FieldByName('IntIdProduct').AsInteger;
    cds_nfeItemsintProduct.AsString       :=  Cds.FieldByName('intProduct').AsString;
    cds_nfeItemsintIdStock.AsInteger      :=  Cds.FieldByName('intIdStock').AsInteger;
    cds_nfeItemsintStock.AsString         :=  Cds.FieldByName('intStock').AsString;
    cds_nfeItemsnfeBarCode.AsString       :=  Cds.FieldByName('nfeBarCode').AsString;
    cds_nfeItemsnfeNcm.AsString           :=  Cds.FieldByName('nfeNcm').AsString;
    cds_nfeItemsnfeOrigin.AsString        :=  Cds.FieldByName('nfeOrigin').AsString;
    cds_nfeItemsnfeSubTrib.AsString       :=  Cds.FieldByName('nfeSubTrib').AsString;
    cds_nfeItemsduplicate.AsString        :=  Cds.FieldByName('duplicate').AsString;
    cds_nfeItems.Post;
  finally
    Cds.Free;
  end;
end;

procedure TTasXmlImportNfe.E_NFE_KeyChange(Sender: TObject);
begin
  Lb_Nr_Caracteres.Caption := 'Número de Caracteres : ' + IntToStr( Length(E_NFE_Key.Text) )
end;

function TTasXmlImportNfe.finishDocumetbonded: Boolean;
Begin
  {
  Lc_Qry := TIBQuery.Create(Application);
  with Lc_Qry do
    Begin
    Lc_Qry.Database := DM.IBD_Gestao;
    Lc_Qry.Transaction := DM.IB_Transacao;
    ForcedRefresh := True;
    Active := False;
    SQL.Clear;
    SQL.Add('UPDATE TB_NOTA_FISCAL SET NFL_CTRL_RETORNO = ''N'' WHERE (NFL_NFL_VINCULO=:NFL_NFL_VINCULO) ');
    ParamByName('NFL_NFL_VINCULO').AsString := Pc_DocVinculado;
    ExecSQL;
    if DM.IB_Transacao.InTransaction then DM.IB_Transacao.CommitRetaining;
    MensagemPadrao('Mensagem ','S U C E S S O!.'+EOLN+EOLN+
                   'A atualização de Retorno foi executada com sucesso.'+EOLN+
                   'O Documento '+ Pc_DocVinculado + ' está baixado.'+EOLN,
                  ['OK'],[bEscape],mpInformacao);
    end;
  Lc_Qry.Close;
  FreeAndNil(Lc_Qry);
  }
end;

procedure TTasXmlImportNfe.formatScreen;
begin
  inherited;
  pg_geral.ActivePageIndex := 0;
  ShowNfeEvents;
end;

procedure TTasXmlImportNfe.FormaGridItems;
Begin
  with Dbg_Itens do
  Begin
    Columns[0].Width := 25;
    Columns[1].Width := 64;
    Columns[2].Width := 336;
    Columns[3].Width := 70;
    Columns[4].Width := 68;
    Columns[5].Width := 89;
    Columns[6].Width := 81;
    Columns[7].Width := 79;
    Columns[8].Width := 154;
    Columns[9].Width := 99;
    Columns[10].Width := 76;
    Columns[11].Width := 305;
    Columns[12].Width := 77;
    Columns[13].Width := 262;
    Columns[14].Width := 52;
    Columns[15].Width := 38;
    Columns[16].Width := 45;
    Columns[17].Width := 47;
    Columns[18].Width := 115;
  End;
end;

function TTasXmlImportNfe.showCFOP: Boolean;
Var
  I: Integer;
  Lc_ListarResult: TStringList;
  Lc_ListarCFOP: TStringList;
  Lc_Cfop: String;
  Lc_Linha: Integer;
Begin
  Lc_ListarResult := TStringList.Create;
  Lc_ListarCFOP := TStringList.Create;
  // Pega todos os CFOPs da Nota
  WITH SetesNfe.Nfe.NotasFiscais.Items[0].Nfe DO
  Begin
    For I := 0 to (Det.Count - 1) do
      Lc_ListarCFOP.Add(Det.Items[I].Prod.CFOP);
    // Preenche a Grade de CFOP sem as duplicidades
    Lc_ListarCFOP.Sorted := True;
    Lc_Cfop := '';
    Lc_Linha := 0;
    if not cds_cfop.Active then cds_cfop.CreateDataSet;
    cds_cfop.LogChanges := False;
    cds_cfop.EmptyDataSet;
    For I := 0 to (Lc_ListarCFOP.Count - 1) do
    BEgin
      if (Lc_Cfop <> Lc_ListarCFOP.Strings[I]) then
      Begin
        cds_cfop.Append;
        with SetesNfe.NotaMercadoria.Nota do
        Begin
          Cfop.Registro.Codigo := Det.Items[I].Prod.CFOP;
          Cfop.getByKey;
          cds_cfopnfeIdCfop.AsString := Cfop.Registro.Codigo;
          cds_cfopnfeCfop.AsString := Cfop.Registro.Descricao;
          //Verifica o vinculo
          Cfop.CfopDePara.Registro.CfopOrigem := Cfop.Registro.Codigo;
          Cfop.CfopDePara.getByKey;
          if ( Cfop.CfopDePara.exist) then
          Begin
            Cfop.clear;
            Cfop.Registro.Codigo := Cfop.CfopDePara.Registro.CfopDestino;
            Cfop.getByKey;
            cds_cfopintIdCfop.AsString := Cfop.Registro.Codigo;
            cds_cfopintCfop.AsString := Cfop.Registro.Descricao;
          End;
          cds_cfop.Post;
        end;
      End;
      Lc_Cfop := Lc_ListarCFOP.Strings[I];
    end;
  End;

End;


procedure TTasXmlImportNfe.ShowCfopList(way:String);
begin
  cds_cfop_list.Active := false;
  with UMM.Qr_Crud do
  Begin
    Active := False;
    sql.Clear;
    sql.Add(concat(
            ' Select c.id, c.description ',
            ' from tb_cfop c ',
            'where ( way =:way ) ',
            ' order by c.description '
            ));
    ParamByName('way').AsString := way;
    Active := True;
    FetchAll;
  End;
  cds_cfop_list.Active := True;
  cds_cfop_list.LogChanges := false;
end;

function TTasXmlImportNfe.showIssuer: Boolean;
Var
  Lc_Aux: Integer;
  Lc_Aux_Text: String;
  Lc_cd_Endereco: Integer;
begin
  { ========================== E - Identificação do Destinatário da Nota Fiscal eletrônica ========================== }
  // dados da tb_empresa
  WITH SetesNfe.Nfe.NotasFiscais.Items[0].Nfe DO
  Begin
    E_company.Text := UpperCase(UTF8Decode(Emit.xNome));
    E_Cnpj_CPf.Text := Emit.CNPJCPF;
    if Length(Emit.CNPJCPF) = 11 then
      MaskCPF(E_Cnpj_CPf)
    else
      MaskCNPJ(E_Cnpj_CPf);
    E_IE.Text := Emit.IE;
    E_Street.Text := Concat(
                        UpperCase(UTF8Decode(Emit.EnderEmit.xLgr)) ,', ' , Emit.EnderEmit.nro
                      );
    E_Neighborhood.Text := UpperCase(UTF8Decode(Emit.EnderEmit.xBairro));
    E_ZipCode.Text := IntToStr(Emit.EnderEmit.CEP);
    MaskCep(E_ZipCode);
    E_City.Text := UpperCase(Emit.EnderEmit.xMun);
    E_State.Text := UpperCase(Emit.EnderEmit.UF);
    E_Phone.Text := Emit.EnderEmit.Fone;
    MaskPhone(E_Phone);
  end;
end;

procedure TTasXmlImportNfe.ShowMerchandiseList;
begin
  cds_merchandise.Active := False;
  with UMM.Qr_Crud do
  Begin
    Active := False;
    sql.Clear;
    sql.Add(concat(
              ' select  pr.id, pr.description ',
              ' from tb_product pr ',
              ' inner join tb_merchandise m',
              ' on ( m.id = pr.id )',
              ' where ( pr.tb_institution_id = :tb_institution_id ) ',
              ' order by pr.description '
            ));
    ParamByName('tb_institution_id').AsInteger := UMM.GInstitution.registro.Codigo;
    Active := True;
    FetchAll;
  End;
  cds_merchandise.Active := True;
  cds_merchandise.LogChanges := False;
end;

function TTasXmlImportNfe.showNfe: Boolean;
BEgin
  WITH SetesNfe.Nfe.NotasFiscais.Items[0].Nfe DO
  Begin
    E_Cfop.Text := UTF8Decode(Ide.natOp);
    if Ide.nNF > 0 then
      E_Invoice.Text := StrZero(Ide.nNF, 6, 0)
    else
      E_Invoice.Text := StrZero(Ide.cNF, 6, 0);
    E_Vl_Invoice.Text := FloatToStrF(Total.ICMSTot.vNF, ffFixed, 10, 2);
    E_DT_Emission.Text := DateToStr(Ide.dEmi);
    if (Ide.dSaiEnt > 0) then
      E_DT_Exit.Text := DateToStr(Ide.dSaiEnt)
    else
      E_DT_Exit.Text := DateToStr(Ide.dEmi);
    // Totais
    E_BC_ICMS.Text      := FloatToStrF(Total.ICMSTot.vBC, ffFixed, 10, 2);
    E_Vl_Icms.Text      := FloatToStrF(Total.ICMSTot.vICMS, ffFixed, 10, 2);
    E_Bc_Icms_St.Text   := FloatToStrF(Total.ICMSTot.vBCST, ffFixed, 10, 2);
    E_Vl_Icms_St.Text   := FloatToStrF(Total.ICMSTot.vST, ffFixed, 10, 2);
    E_Vl_Product.Text   := FloatToStrF(Total.ICMSTot.vProd, ffFixed, 10, 2);
    E_Vl_freight.Text   := FloatToStrF(Total.ICMSTot.vFrete, ffFixed, 10, 2);
    E_Vl_Assurance.Text := FloatToStrF(Total.ICMSTot.vSeg, ffFixed, 10, 2);
    E_VL_Expenses.Text  := FloatToStrF(Total.ICMSTot.vOutro, ffFixed, 10, 2);
    E_Vl_IPI.Text       := FloatToStrF(Total.ICMSTot.vIPI, ffFixed, 10, 2);
    E_VL_Discount.Text  := FloatToStrF(Total.ICMSTot.vDesc, ffFixed, 10, 2);
    E_Vl_Invoice.Text   := FloatToStrF(Total.ICMSTot.vNF, ffFixed, 10, 2);
    // Informações de Transportes
    if Transp.Vol.Count > 0 then
    Begin
      with Transp.Vol.Items[0] do
      Begin
        E_Amount.Text       := floatToStr(qVol);
        E_Kind.Text         := esp;
        E_Brand.Text        := marca;
        E_Number.Text       := nVol;
        E_Gross_Weight.Text := FloatToStrF(pesoB, ffFixed, 10, 4);
        E_Net_Weight.Text   := FloatToStrF(pesoL, ffFixed, 10, 4);
      end;
    end;
    M_Note.Lines.Clear;
    M_Note.Lines.Text := InfAdic.infCpl;
  end;
end;

procedure TTasXmlImportNfe.ShowNfeEvents;
begin
  FrNfeEvents := TFmNfeEvents.Create(Self);
  FrNfeEvents.Parent := ctn_NfeEvents;
  FrNfeEvents.Align := alclient;
  FrNfeEvents.listar;
  FrNfeEvents.Show;
end;

function TTasXmlImportNfe.showNfeItems: Boolean;
Var
  Lc_I: Integer;
Begin
  WITH SetesNfe.Nfe.NotasFiscais.Items[0].Nfe DO
  Begin
    if not cds_nfeItems.Active then cds_nfeItems.CreateDataSet;
    cds_nfeItems.LogChanges := False;
    cds_nfeItems.EmptyDataSet;
    cds_nfeItems.AutoCalcFields := False;
    For Lc_I := 0 to (Det.Count - 1) do
    Begin
      cds_nfeItems.Append;
      cds_nfeItemsnfeNrITem.AsString        :=  StrZero(Det.Items[Lc_I].Prod.nItem, 3, 0);
      cds_nfeItemsnfeProduct.AsString       :=  Det.Items[Lc_I].Prod.xProd;
      cds_nfeItemsnfeUnidade.AsString       :=  Det.Items[Lc_I].Prod.uCom;
      cds_nfeItemsnfeQtde.AsFloat           :=  Det.Items[Lc_I].Prod.qCom;
      cds_nfeItemsnfeUnitValue.AsFloat      :=  Det.Items[Lc_I].Prod.vUnTrib;
      cds_nfeItemsnfeTotalValue.AsFloat     :=  Det.Items[Lc_I].Prod.vProd;
      cds_nfeItemsnfeDiscountValue.AsFloat  :=  Det.Items[Lc_I].Prod.vDesc;
      cds_nfeItemsnfeIdProduct.AsString     :=  Det.Items[Lc_I].Prod.cProd;
      //Fazer a função que busca o produto vinculado - 11/08/2017 - 01: 49
      with SetesNfe.NotaMercadoria.Itens do
      Begin
        Mercadoria.Registro.Estabelecimento := UMM.GInstitution.registro.Codigo;
        Mercadoria.Registro.Codigo := Mercadoria.getIdByProvider(unMaskField(E_Cnpj_CPf.Text),Det.Items[Lc_I].Prod.cProd);
        if Mercadoria.Registro.Codigo > 0 then
        Begin
          Mercadoria.Produto.Registro.Estabelecimento := Mercadoria.Registro.Estabelecimento;
          Mercadoria.Produto.Registro.Codigo := Mercadoria.Registro.Codigo;
          Mercadoria.Produto.getByKey;
          cds_nfeItemsIntIdProduct.AsInteger := Mercadoria.Produto.Registro.Codigo;
          cds_nfeItemsintProduct.AsString    := concat(
                                                  StrZero(Mercadoria.Produto.Registro.Codigo, 3, 0),
                                                  ' - ',
                                                  Mercadoria.Produto.Registro.Descricao);
        End;
        with Mercadoria.ListaEstoque do
        Begin
          Registro.Codigo := UMM.GInstitution.Estoque;
          Registro.Estabelecimento := UMM.GInstitution.registro.Codigo;
          getByKey;
          cds_nfeItemsintIdStock.AsInteger := Registro.Codigo;
          cds_nfeItemsintStock.AsString := concat(
                                             StrZero(Registro.Codigo, 3, 0),
                                             ' - ',
                                             Registro.Descricao);
        End;
      End;
      cds_nfeItemsnfeBarCode.AsString       :=  Det.Items[Lc_I].Prod.cEAN;
      cds_nfeItemsnfeNcm.AsString           :=  Det.Items[Lc_I].Prod.NCM;
      cds_nfeItemsnfeOrigin.AsString        :=  OrigToStr(Det.Items[Lc_I].Imposto.ICMS.orig);

        if (CSTICMSToStr(Det.Items[Lc_I].Imposto.ICMS.CST) = '10') or
          (CSTICMSToStr(Det.Items[Lc_I].Imposto.ICMS.CST) = '60') or
          (CSTICMSToStr(Det.Items[Lc_I].Imposto.ICMS.CST) = '201') or
          (CSTICMSToStr(Det.Items[Lc_I].Imposto.ICMS.CST) = '202') or
          (CSTICMSToStr(Det.Items[Lc_I].Imposto.ICMS.CST) = '500') then
      cds_nfeItemsnfeSubTrib.AsString       :=  'S'
        else
      cds_nfeItemsnfeSubTrib.AsString       :=  'N';
      cds_nfeItemsduplicate.AsString       :=  'N';
      cds_nfeItems.Post;
    end;
    cds_nfeItems.AutoCalcFields := True;
  end;
end;

procedure TTasXmlImportNfe.ShowStockList;
begin
  cds_stock.Active := False;
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

    ParamByName('tb_institution_id').AsInteger := UMM.GInstitution.registro.Codigo;
    Active := True;
    FetchAll;
  End;
  cds_stock.Active := True;
  cds_stock.LogChanges := False;
end;

procedure TTasXmlImportNfe.UniFileUploadCompleted(Sender: TObject;
  AStream: TFileStream);
var
  DestName : string;
  LcNewFile : String;
  DestFolder : String;
begin
  Try
    if SetesNfe.Estabelecimento.PathPublico = '' then
      SetesNfe.Estabelecimento.getRepository(True,'');
    DestFolder := concat(SetesNfe.Estabelecimento.PathPublico,'nfe\');
    DestName := concat(DestFolder , ExtractFileName(UniFileUpload.FileName));
    CopyFile(PChar(AStream.FileName), PChar(DestName), False);
    SetesNfe.PathNameFileXML := DestName;
    if not SetesNfe.loadComponent then
    Begin
      M_Process.Lines.Add( 'Arquivo XML não encontrado.' );
      M_Process.Lines.Add( 'Não foi possível carregá-lo.' );
      MensageAlert(['A T E N Ç Ã O!.',
                    '',
                    'Arquivo XML não encontrado.',
                    'Não foi possível carregá-lo.'
                    ]);
    End;
    SetesNfe.ChaveXML := SetesNfe.Nfe.NotasFiscais[0].NFe.procNFe.chNFe;
    LcNewFile := concat(DestFolder, SetesNfe.getNameXmlFile);
    RenameFile(DestName,LcNewFile);
    setfill;
    MensageAlert(['A T E N Ç Ã O!.',
                  '',
                  'Arquivo carregado com Sucesso.',
                  'Clique para continuar.'
                  ]);
  except
    MensageAlert(['A T E N Ç Ã O!.',
                  '',
                  'Erro ao carregar Arquivo.',
                  'Verifique e tente novamente.'
                  ]);
  End;
end;

function TTasXmlImportNfe.updateStock(Idx:Integer):Boolean;
begin
  with SetesNfe.NotaMercadoria.Itens.MovimentoEstoque.Registro do
  Begin
    Estabelecimento   := SetesNfe.NotaMercadoria.Itens.Registro.Estabelecimento;
    Ordem             := SetesNfe.NotaMercadoria.Itens.Registro.Ordem;
    OrdemItem         := SetesNfe.NotaMercadoria.Itens.Registro.Codigo;
    Estoque           := SetesNfe.NotaMercadoria.Itens.Registro.Estoque;
    Local             := 'Matriz';
    Tipo              := 'ImportXml';
    DataRegistro      := Date;
    Direcao           := 'E';
    Mercadoria        := SetesNfe.NotaMercadoria.Itens.Registro.Produto;
    Quantidade        := SetesNfe.NotaMercadoria.Itens.Registro.Quantidade;
  End;
  SetesNfe.NotaMercadoria.itens.MovimentoEstoque.save;
end;

function TTasXmlImportNfe.validaDuplicaItem: boolean;
begin
  Result := True;
  if (cds_nfeItems.RecordCount = 0 ) then
  Begin
    MensageAlert(['A T E N Ç Ã O!.',
                  '',
                  'Items para duplicar não encontrado.',
                  'Verifique e tente novamente.'
                  ]);
    Result := false;
    exit;
  End;
end;

function TTasXmlImportNfe.Validate: Boolean;
begin
  Result := True;
  if (Trim(E_NFE_Key.Text) = '') then
  Begin
    MensageAlert(['A T E N Ç Ã O!.',
                  '',
                  'Campo chave não informado.',
                  'Verifique antes de continuar.'
                  ]);
    Result := False;
    exit;
  end;

  if (Length(Trim(E_NFE_Key.Text)) <> 44) then
  Begin
    MensageAlert(['A T E N Ç Ã O!.',
                  '',
                  'Campo chave não está no padrão de 44 números.',
                  'Verifique antes de continuar.'
                  ]);
    Result := False;
    exit;
  end;
end;

function TTasXmlImportNfe.ValidateCfopReferences: Boolean;
begin
  Result := True;
  cds_cfop.First;
  while not cds_cfop.Eof do
  Begin
    if ( Trim(cds_cfopintIdCfop.AsString) = '' ) then
    Begin
      MensageAlert(['A T E N Ç Ã O!.',
                    '',
                    'Revise a lista de CFOP da nota.',
                    'Existe CFOP sem referência vinculada ao sistema.'
                    ]);
      Result := False;
      Break;
    end;
    cds_cfop.next;
  end;
end;

function TTasXmlImportNfe.validateGetNfeByHand: Boolean;
Var
  LcMsg : String;
  Lc_Cnpj : String;
  Lc_CNpj_Dest : String;
Begin
  Result := True;
  {
  if not chbx_Other.Checked then
  Begin
    // Verifica se o XML É DO CLIENTE
    WITH SetesNfe.Nfe.NotasFiscais.Items[0].Nfe DO
    Begin
      Lc_Cnpj := SetesNfe.Estabelecimento.Fiscal.Company.Registro.CNPJ;
      Lc_CNpj_Dest := Dest.CNPJCPF;
      if (Lc_Cnpj <> Lc_CNpj_Dest) then
      Begin
        MensageAlert(['A T E N Ç Ã O!.',
                      '',
                      'Esta nota não foi emitida para este estabelecimento.',
                      'Verifique antes de continuar.'
                      ]);
        Result := False;
        exit;
      end;
    end;
  End;
  }
end;


function TTasXmlImportNfe.validateInvoice: boolean;
Begin
  Result := True;
  if StrToIntDef(E_Invoice.Text,0) = 0 then
  begin
    MensageAlert(['A T E N Ç Ã O!.',
                  '',
                  'A Leitura do XML ainda não foi efetuada.',
                  'Clique em ler XML antes de continuar']);
    Result := False;
    exit;
  end;

  with SetesNfe.NotaMercadoria.Nota.Registro do
  Begin
    Estabelecimento := UMM.GInstitution.registro.Codigo;
    TipoEmissao := 'E';
    Numero := E_Invoice.Text;
    if (Length(SetesNfe.Nfe.NotasFiscais.Items[0].Nfe.Emit.CNPJCPF) = 14) then
      Emitente := SetesNfe.NotaMercadoria.Nota.Estabelecimento.Fiscal.Juridica.getIDbyCNPJ(SetesNfe.Nfe.NotasFiscais.Items[0].Nfe.Emit.CNPJCPF)
    else
      Emitente := SetesNfe.NotaMercadoria.Nota.Estabelecimento.Fiscal.Fisica.getIDbyCPF(SetesNfe.Nfe.NotasFiscais.Items[0].Nfe.Emit.CNPJCPF);

    if Estabelecimento = Emitente then
    begin
      MensageAlert(['A T E N Ç Ã O!.',
                    '',
                    'Operação inválida.',
                    'Não é permitido importar notas de emissão própria.',
                    'Verifique e tente novamente']);
      Result := False;
      exit;
    end;
  End;

  if SetesNfe.NotaMercadoria.Nota.existNumber then
  begin
    MensageAlert(['A T E N Ç Ã O!.',
                  '',
                  concat('A nota ',E_Number.Text, ' já está registrada no sistema.'),
                  'Verifique e tente novamente']);
    Result := False;
    exit;
  end;

  if not ValidateProductValues() then
  Begin
    Result := False;
    exit;
  end;
  if not ValidateProductReferences() then
  Begin
    Result := False;
    exit;
  end;

  if not ValidateCfopReferences() then
  Begin
    Result := False;
    exit;
  end;

  if not ValidatePurchaseReferences() then
  Begin
    Result := False;
    exit;
  end;
end;

function TTasXmlImportNfe.ValidateManifestation: Boolean;
Var
  LcMsg : String;
Begin
  Result := True;
  SetesNfe.ChaveXML := E_NFE_Key.Text;
  SetesNfe.getNameXmlFile;
  if FileExists( SetesNfe.PathNameFileXML ) then
  BEgin
    Result := False;
    exit;
  End;

  if FrNfeEvents.DBLCB_Lista.Text = '' then
  BEgin
    MensageAlert(['A T E N Ç Ã O!.',
                  '',
                  'Sem a Manifestação do Destinatário não será possivel fazer o Download.',
                  'Verifique antes de continuar.'
                  ]);
    Result := False;
    exit;
  End;

  if FrNfeEvents.DBLCB_Lista.KeyValue = 210240 then
  Begin
    if not(InputQuery('WebServices Manifestação Destinatário',
                        'Justificativa', Justif_Manisfestacao)) then
    Begin
      MensageAlert(['A T E N Ç Ã O!.',
                      '',
                      'Para este tipo de manifestação a justificativa é obrigatória.',
                      'Verifique antes de continuar.']);
      Result := False;
      exit;
    end;
  end;
end;

function TTasXmlImportNfe.ValidateProductReferences: Boolean;
begin
  Result := True;
  cds_nfeItems.First;
  while not cds_nfeItems.Eof do
  Begin
    if StrToIntDef(cds_nfeItemsIntIdProduct.AsString,0) = 0 then
    Begin
      MensageAlert(['A T E N Ç Ã O!.',
                    '',
                    'Revise a lista de itens da nota.',
                    'Existe item não vinculado ao cadastro do produto.'
                    ]);
      Result := False;
      Break;
    end;
    cds_nfeItems.next;
  end;
end;


function TTasXmlImportNfe.ValidateProductValues: Boolean;
Var
  Lc_I: Integer;
  Lc_Str_Vl_Produto, Lc_Str_Vl_Soma: String;
  Lc_Vl_Soma: Real;
Begin
  Lc_Vl_Soma := 0;
  Result := True;
  cds_nfeItems.First;
  while not cds_nfeItems.Eof do
  BEgin
    Lc_Vl_Soma := Lc_Vl_Soma + cds_nfeItemsnfeTotalValue.AsFloat;
    cds_nfeItems.Next;
  end;
  Lc_Str_Vl_Produto := E_Vl_Product.Text;
  Lc_Str_Vl_Soma := FloatToStrF(Lc_Vl_Soma, ffFixed, 10, 2);
  if (Lc_Str_Vl_Produto <> Lc_Str_Vl_Soma) then
  Begin
      MensageAlert(['A T E N Ç Ã O!.',
                    '',
                    'Os valores dos itens não confere com o valor total',
                    'dos produtos da Nota Fiscal. Verifique'
                    ]);
    Result := False;
    exit;
  end;
end;

function TTasXmlImportNfe.ValidatePurchaseReferences: Boolean;
Var
  Lc_I: Integer;
  LcNotFound : Boolean;
  LcItensPurchase : TControllerOrderItem;
  LcITem : String;
Begin
  Result := True;
  LcItensPurchase := TControllerOrderItem.create(Self);
  cds_nfeItems.First;
  LcNotFound := False;
  while not cds_nfeItems.Eof do
  BEgin
    LcITem := '';
    if ( StrToIntDef(cds_nfeItemsOrderPuchase.AsString,0) > 0 )  then
    Begin
      LcItensPurchase.clear;
      LcItensPurchase.Registro.Estabelecimento  := UMM.GInstitution.registro.Codigo;
      LcItensPurchase.Registro.Produto          := cds_nfeItemsIntIdProduct.AsInteger;
      LcItensPurchase.Registro.Ordem            := cds_nfeItemsOrderPuchase.AsInteger;
      LcNotFound := not LcItensPurchase.readByField;
      if LcNotFound then
      Begin
        LcITem := concat(cds_nfeItemsnfeNrITem.AsString,' - ',cds_nfeItemsnfeProduct.AsString);
        break;
      End;
    End;
    cds_nfeItems.Next;
  end;
  if LcNotFound then
  Begin
      MensageAlert(['A T E N Ç Ã O!.',
                    '',
                    'Número do pedido de compra informado no Item abaixo não encontrado.',
                    LcITem,
                    '',
                    'Verifique!'
                    ]);
    Result := False;
  end;
end;

end.
