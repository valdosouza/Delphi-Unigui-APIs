unit uSM;

interface

uses Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,IdText,Winapi.ActiveX,Xml.XMLDoc,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uniPanel, Vcl.StdCtrls, DBXJSON,
  uniMemo, uniMultiItem, uniComboBox, uniCheckBox, uniGroupBox, uniRadioButton,
  uniDateTimePicker, uniRadioGroup, uniButton, uniBitBtn, uniSpeedButton,
  tblInvoiceShipping,pcnRetDistDFeInt,
  uniGUIClasses, uniEdit, uniLabel, uniGUIBaseClasses, tblInvoiceMerchandise,
  uniPageControl, prm_to_invoice, REST.Json, System.Json,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Phys.MySQLDef, FireDAC.UI.Intf,
  FireDAC.VCLUI.Wait, FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Phys,
  FireDAC.Phys.MySQL, Data.DB, FireDAC.Comp.Client, FireDAC.Comp.UI,
  FireDAC.Comp.DataSet, Datasnap.DSProviderDataModuleAdapter,
  ControllerOrderItemIcms, ControllerOrderItemIPI, ControllerOrderItemCofins,
  ControllerOrderItemPis, ControllerOrderItemII, System.IniFiles,
  DBXJSONReflect, System.Math, System.AnsiStrings,
  ACBrNFe, pcnConversao, pcnNFe, pcnConversaoNFe,
  ControllerInvoice, ControllerInvoiceMerchandise,
  prm_simple, prm_nfe, Md5, ACBrNFeDANFEClass, ACBrNFeDANFeRLClass, ACBrBase,
  ACBrDFe, ACBrDFeSSL,pcnLeitor, ACBrMail, ControllerMailing, tblMailing,
  ControllerInstitution, ControllerConfigNfe55, ControllerNfeEventsSent,
  blcksock, ControllerState, ClasseUtil, UnitConstantes, ACBrDFeReport,
  ACBrDFeDANFeReport;

type
  TSM = class(TDSServerModule)
    Qr_Emitente: TFDQuery;
    Qr_Destinatario: TFDQuery;
    Qr_Company: TFDQuery;
    Qr_Person: TFDQuery;
    Qr_Customer: TFDQuery;
    Qr_Items: TFDQuery;
    Qr_Tributacao: TFDQuery;
    Qr_ST: TFDQuery;
    Qr_DeliveryLocal: TFDQuery;
    Nfe: TACBrNFe;
    Dfe_Fortes: TACBrNFeDANFeRL;
    Qr_Icms: TFDQuery;
    Qr_Lote: TFDQuery;
    Qr_Lote_Produzido: TFDQuery;
    Qr_Serie_Produto: TFDQuery;
    Qr_Icms_ST: TFDQuery;
    Qr_DI: TFDQuery;
    Qr_DI_Adicao: TFDQuery;
    Qr_Ipi: TFDQuery;
    Qr_II: TFDQuery;
    Qr_Pis: TFDQuery;
    Qr_Cofins: TFDQuery;
    Qr_Transportadora: TFDQuery;
    Qr_InvoiceShipping: TFDQuery;
    Qr_InvoiceObs: TFDQuery;
    Qr_Email: TFDQuery;
    Qr_Midia_Social: TFDQuery;
    Qr_Msg_Retorno_Nfe: TFDQuery;
    Id_Mail: TACBrMail;
    procedure DSServerModuleCreate(Sender: TObject);
    procedure DSServerModuleDestroy(Sender: TObject);
  private
    { Private declarations }
    ParameToInvoice: TPrmToInvoicer;
    ParamNfe: TPrmNfe;
    TipoPessoa: String;

    TaxaImpAprox: TStringList;
    ValorBaseProduto: Real;
    MargemValorAgregado: Real;
    AliqIcmsST: Real;

    AliqCombPobreza: Real;

    AliqCreditoIcms: Real;

    NotaServicoConjugada: Boolean;
    ItemNota: Integer;
    idxItemNota: Integer;
    InformaTribAprox: Boolean;
    PathLocal: String;
    UrlSaida: String;

    NF: TControllerInvoiceMerchandise;
    // Funções certificado e funções webservice Receita
    Function getStatusNfeService(msg: Boolean): Boolean;

    // Funções para a geração da Nota
    function setNfeNumber(): Boolean;
    // Funções para autroização da Nota
    procedure CleanWebService;
    Function DealWithReturn(Retorno: Integer): Integer;
    Function ConsultWebNFe(FileXML:String): Integer;
    Function AuthorizaWebNFe(Path, FileXML: String): Integer;
    procedure loadComponentNfe(path,filexml:String);

    // Funções para o cancelamento da Nota
    procedure CancelNF;
    procedure CancelNFe;
    function getCancelNFe:Boolean;
    procedure finishedCancellationNF;
    // Funções para a impressão da Nota
    function PrintNfe(Nr:Integer;FileDefault:String):String;

    //Funções para o envio de emails
    procedure SetSendEmail(FileXML:String;FilePDf:String);
    function setPathUrlSaida: Boolean;
    function setPathLocal: Boolean;
    function SetConnection: Boolean;

    function getConfigNF55: Boolean;
    function getPermissao: Boolean;
    function getConfig(chave, valor: String): String;

    procedure MsgCallBack(Seq, Value: String);

    function openEmitente(Emitente: Integer): Boolean;
    function openMailing(Grupo: String; Entity: Integer): Boolean;
    function openSocialMedia(Tipo: String; Entity: Integer): Boolean;
    function openDestinatario(destinatario: Integer): Boolean;
    function openCompany(destinatario: Integer): Boolean;
    function openPerson(destinatario: Integer): Boolean;
    function openCustomer(destinatario: Integer): Boolean;
    function openDeliveryLocal(destinatario, InvoiceID: Integer): Boolean;
    function openItemList(Estabelecimento, Ordem: Integer): Boolean;
    function openItemIcms: Boolean;
    function openItemIpi: Boolean;
    function openItemIi: Boolean;
    function openItemPis: Boolean;
    function openItemCofins: Boolean;
    function openItemSerie: Boolean;
    function openInvoiceShipping(estabelecimento, InvoiceID: Integer): Boolean;
    function openCarrier(Carrier: Integer): Boolean;
    function openInvoiceObservation(estabelecimento, InvoiceID: Integer): Boolean;
    function OpenTributacao: Boolean;

    function validateEmitente: Boolean;
    function validateDestinatario: Boolean;
    function ValidateItemsCadastro: Boolean;
    function ValidateItemsFiscal: Boolean;
    function ValidateTributacao: Boolean;
    function validateAddress(qry: TFDQuery; Tipo: String): Boolean;

    // Calculate Invoice Items
    function verificaInfoManual: Boolean;
    Function VerificaBeneficioICMS(): Boolean;

    function getAliqIcmsST: Boolean;
    function getInscrSubstTributario: String;
    Function getImpostoAproximado(NCM: String; Origem: String): TStringList;
    function getCalculateValues: TInvoiceMerchandise;

    Function CalculateTotalPedido(): Real;
    procedure CalculateTaxes;
    procedure CalculateIcms(Imposto: TImposto);
    procedure CalculateIcmsRBNormal(Imposto: TImposto);
    procedure CalculateIcmsRBSimplesNacional(Imposto: TImposto);
    procedure CalculateIPI(Imposto: TImposto);
    procedure CalculateII(Imposto: TImposto);
    procedure CalculatePIS(Imposto: TImposto);
    procedure CalculateCOFINS(Imposto: TImposto);
    procedure CalculateISSQN(Imposto: TImposto);

    Procedure SumValorBaseICMS(Pc_Nfe: TNFe);
    Procedure SumValorICMS(Pc_Nfe: TNFe);
    Procedure SumValorBaseICMSST(Pc_Nfe: TNFe);
    Procedure SumValorICMSST(Pc_Nfe: TNFe);
    Procedure SumValorProduto(Pc_Nfe: TNFe);
    Procedure SumValorFrete(Pc_Nfe: TNFe);
    Procedure SumValorSeguro(Pc_Nfe: TNFe);
    Procedure SumValorDesconto(Pc_Nfe: TNFe);
    Procedure SumValorII(Pc_Nfe: TNFe);
    Procedure SumValorIPI(Pc_Nfe: TNFe);
    Procedure SumValorPIS(Pc_Nfe: TNFe);
    Procedure SumValorCFS(Pc_Nfe: TNFe);
    Procedure SumValorOutros(Pc_Nfe: TNFe);
    Procedure SumValorISSQN(Pc_Nfe: TNFe);
    Procedure SumValorAproximImposto(Pc_Nfe: TNFe);
    Procedure SumValorTotalNota(Pc_Nfe: TNFe);

    // Save Invoice Items
    procedure saveInvoice;
    procedure saveInvoiceMerchandise;
    procedure saveInvoiceShipping;
    procedure SaveInvoiceItems;
    procedure SaveInvoiceItemsIcms(idx: Integer);
    procedure SaveInvoiceItemsIpi(idx: Integer);
    procedure SaveInvoiceItemsPis(idx: Integer);
    procedure SaveInvoiceItemsCofins(idx: Integer);
    procedure SaveInvoiceItemsII(idx: Integer);
    procedure SaveObservation;
    procedure updateStock(idx: Integer);
    procedure SaveReturn55(Retorno:Integer;FileNfe:String);

    procedure DefineDecimalPointValue;
    procedure DefineDecimalPointQtty;
    procedure DefineSizeProductField;

    Function ConferenceDanfe(Tipo: String): String;
    function fillDanfe(Tipo: String): String;
    procedure fillDanfeInfNfe(Tipo: String; nfide: TinfNFe);
    procedure fillDanfeIde(Tipo: String; nfide: TIde);
    procedure fillDanfeEmit(Tipo: String; nfemit: TEmit);
    procedure fillDanfeDest(Tipo: String; nfdest: TDest);
    procedure FillDanfeDocRefer(nfide: TIde);
    procedure FillDanfeDeliveryLocal(ent: TEntrega);
    procedure fillDanfeItems;
    procedure fillDanfeItemsProd(Det: TDetCollection);
    procedure fillDanfeItemsProdInfoAdic(Det: TDetCollection);
    procedure fillDanfeItemsProdSerie(Det: TDetCollection);
    procedure fillDanfeItemsProdDetalharST(Det: TDetCollection);
    procedure fillDanfeItemsProdImportacao(Det: TDetCollection);
    procedure fillDanfeItemsIcms(Imposto: TImposto);
    procedure fillDanfeItemsIcmsRN(Imposto: TImposto);
    procedure fillDanfeItemsIcmsSN(Imposto: TImposto);
    procedure fillDanfeItemsIcmsUFDestino(Det: TDetCollection);
    procedure fillDanfeItemsIpi(Imposto: TImposto);
    procedure fillDanfeItemsIi(Imposto: TImposto);
    procedure fillDanfeItemsPis(Imposto: TImposto);
    procedure fillDanfeItemsCofins(Imposto: TImposto);
    procedure fillDanfeItemsIssqn(Imposto: TImposto);
    procedure fillDanfeTotalizador();
    procedure fillDanfeCarrier;
    procedure fillDanfeShipping;
    procedure fillDanfePayment;
    procedure fillDanfeObservation;
    procedure fillDanfeForeignTrade;



  public
    { Public declarations }
    FCallback: TDBXCallback;
    user_dev : Boolean;
    procedure Echo(s: String; Callback: TDBXCallback);
    procedure getValidityCertificate(s: String; Callback: TDBXCallback);

    procedure ValidtoInvoice(Value: string; Callback: TDBXCallback);
    procedure CalculateInvoice(Value: string; Callback: TDBXCallback);
    procedure ToInvoice(Value: string; Callback: TDBXCallback);

    procedure ValidateConference(s: String; Callback: TDBXCallback);
    procedure PrintConference(s: String; Callback: TDBXCallback);

    procedure ValidateAuthorization(s: String; Callback: TDBXCallback);
    procedure Authorization(s: String; Callback: TDBXCallback);

    procedure ValidateConsult(s: String; Callback: TDBXCallback);
    procedure Consult(s: String; Callback: TDBXCallback);

    procedure ValidateCancel(s: String; Callback: TDBXCallback);
    procedure Cancel(s: String; Callback: TDBXCallback);

    procedure ValidatePrint(s: String; Callback: TDBXCallback);
    procedure Print(s: String; Callback: TDBXCallback);

    procedure ValidateSendEmail(s: String; Callback: TDBXCallback);
    procedure SendEmail(s: String; Callback: TDBXCallback);

    procedure setManifestation(s: String; Callback: TDBXCallback);
    procedure getDownloadXML(s: String; Callback: TDBXCallback);
  end;

var
  GbCasaDecimal: Integer;

implementation

{$R *.dfm}

uses System.StrUtils, Main, UnFunctions, MainModule;

function TSM.getCalculateValues: TInvoiceMerchandise;
begin
  Result := TInvoiceMerchandise.Create;
  with Result do
  Begin
    Codigo := 0;
    Estabelecimento := 0;
    DataSaida := Date;
    HoraSaida := time;
    ValorBaseICMS := 1;
    ValorICMS := 2;
    ValorBaseIcmsSt := 3;
    ValorIcmsSt := 4;
    ValorTotal := 5;
    ValorFrete := 6;
    ValorSeguro := 7;
    ValorDespesas := 8;
    ValorIpi := 9;
    RegistroCriado := Now;
    RegistroAlterado := Now;
  End;
end;

function TSM.getCancelNFe: Boolean;
Var
  Lc_NumeroLote: Integer;
  AuxReturn : String;
begin
  with Nfe do
  Begin
    MsgCallBack('Cancelamento Nfe', 'INICIANDO A OPERAÇÃO DE CANCELAMENTO...');
    Lc_NumeroLote := StrToInt(FormatDateTime('yymmddhhmm', NOW));
    EventoNFe.Evento.Clear;
    EventoNFe.idLote := Lc_NumeroLote;
    with EventoNFe.Evento.Add do
    begin
      infEvento.dhEvento := NOW;
      infEvento.tpEvento := teCancelamento;
      infEvento.detEvento.xJust := ParamNfe.Motivo;
    end;
    MsgCallBack('Cancelamento Nfe', 'ENVIANDO INFORMAÇÕES PARA O CANCELAMENTO...');
    try
      EnviarEvento(Lc_NumeroLote);
      if (WebServices.EnvEvento.EventoRetorno.retEvento.Items[0].RetInfEvento.cStat = 135) then
      Begin
        MsgCallBack('Cancelamento Nfe', 'NOTA FISCAL CANCELADA COM SUCESSO.');
      end
      else
      Begin
        MsgCallBack('Rejeição', 'ESTA NOTA FISCAL NÃO PODE SER CANCELADA.');
        AuxReturn := Concat('Código: ',IntToStr(WebServices.EnvEvento.EventoRetorno.retEvento.Items[0].RetInfEvento.cStat));
        MsgCallBack('Rejeição', AuxReturn);
        AuxReturn := Concat('Motivo: ',WebServices.EnvEvento.EventoRetorno.retEvento.Items[0].RetInfEvento.xMotivo);
        MsgCallBack('Rejeição', AuxReturn);
        MsgCallBack('Cancelamento Nfe','PROCESSAMENTO FINALIZADO...');
      end;
      Result := True;
    except
      Result := False;
      MsgCallBack('Rejeição', 'ESTA NOTA FISCAL NÃO PODE SER CANCELADA.');
      AuxReturn := Concat('Código: ',IntToStr(WebServices.EnvEvento.EventoRetorno.retEvento.Items[0].RetInfEvento.cStat));
      MsgCallBack('Rejeição', AuxReturn);
      AuxReturn := Concat('Motivo: ',WebServices.EnvEvento.EventoRetorno.retEvento.Items[0].RetInfEvento.xMotivo);
      MsgCallBack('Rejeição', AuxReturn);
      MsgCallBack('Cancelamento Nfe','PROCESSAMENTO FINALIZADO...');
    end;
  end;
end;

function TSM.getImpostoAproximado(NCM, Origem: String): TStringList;
Var
  Lc_Qry: TFDQuery;
  Lc_Campo: String;
Begin
  Result := TStringList.Create;
  Lc_Qry := TFDQuery.Create(Self);
  with Lc_Qry do
  Begin
    Connection := umm.DB;
    Active := False;
    SQL.Clear;
    if (Origem = '0') then
      Lc_Campo := 'aliq_nac'
    else
      Lc_Campo := 'aliq_imp';

    SQL.Add('select ' + Lc_Campo +
      ' , aliq_est,aliq_mun FROM tb_ncm n WHERE n.number =:number');
    ParamByName('number').AsString := NCM;
    Active := True;
    Result.Clear;
    Result.Append(FieldByName(Lc_Campo).AsString);
    Result.Append(FieldByName('aliq_est').AsString);
    Result.Append(FieldByName('aliq_mun').AsString);
    Result.Append(FloatToStr(FieldByName(Lc_Campo).AsFloat +
      FieldByName('aliq_est').AsFloat + FieldByName('aliq_mun').AsFloat));
  end;
  Lc_Qry.Close;
  FreeAndNil(Lc_Qry);
end;

procedure TSM.CleanWebService;
Begin
  with Nfe.WebServices do
  Begin
    Enviar.Clear;
    Retorno.Clear;
    Consulta.Clear;
    EnvioWebService.Clear;
  End;
End;

Function TSM.DealWithReturn(Retorno: Integer): Integer;
Var
  Lc_SqlTxt: String;
  Lc_Codigo: String;
  Lc_Mensagem: String;
Begin
  if (Nfe.WebServices.Retorno.cStat > 0) then
  Begin
    Lc_Codigo := IntToStr(Nfe.WebServices.Retorno.cStat);
    Lc_Mensagem := UpperCase(Nfe.WebServices.Retorno.XMotivo);
  End
  else
  Begin
    if (Nfe.WebServices.Enviar.cStat > 0) then
    Begin
      Lc_Codigo := IntToStr(Nfe.WebServices.Enviar.cStat);
      Lc_Mensagem := UpperCase(Nfe.WebServices.Enviar.XMotivo);
    End
    else
    Begin
      Lc_Codigo := IntToStr(Nfe.WebServices.Consulta.cStat);
      Lc_Mensagem := UpperCase(Nfe.WebServices.Consulta.XMotivo);
    End;
  End;
  // faz a cnsulta na tabela de retono
  with Qr_Msg_Retorno_Nfe do
  Begin
    Active := False;
    ParamByName('id').AsInteger := Retorno;
    Active := True;
    FetchAll;
    First;
    Result := 0;
    if recordcount > 0 then
    Begin
      Result := FieldByName('interno').AsInteger;
    End;
  end;
  MsgCallBack('Consulta Nfe', Lc_Mensagem);
end;

procedure TSM.Consult(s: String; Callback: TDBXCallback);
Var
  M: TJSONMarshal;
  jo: TJSONObject;
  jv: TJSONValue;
  unM: TJSONUnMarshal;
  AuxReturn: String;
  Lc_FileDefault: String;
  Lc_FileGestao: String;
  Lc_NF: String;
  Retorno : Integer;
Begin
  try
    FCallback := Callback;
    jo := TJSONObject.Create;
    jv := TJSONObject.ParseJSONValue(s);
    if assigned(jv) then
    Begin
      try
        MsgCallBack('Consulta', 'INICIANDO A OPERAÇÃO...');
        unM := TJSONUnMarshal.Create;
        ParamNfe := TPrmNfe.Create;
        ParamNfe := (unM.Unmarshal(jv) as TPrmNfe);
        NF := TControllerInvoiceMerchandise.Create(Self);
        Nfe.NotasFiscais.Clear;
        Nfe.NotasFiscais.Add;
        MsgCallBack('Consulta', 'NOTA SELECIONADA...');
          NF.Registro.Codigo          := ParamNfe.Ordem;
          NF.Registro.Estabelecimento := ParamNfe.Estabelecimento;
          NF.getAllByKey;
        openEmitente(NF.Registro.Estabelecimento);
        getConfigNF55;

        NF.Retorno.Registro.Estabelecimento := NF.Registro.Estabelecimento;
        NF.Retorno.Registro.Codigo := NF.Registro.Codigo;
        NF.Retorno.getByKey;
        Lc_FileDefault := NF.Retorno.Registro.NomeArquivo;
        if (Lc_FileDefault = '')  or (not FileExists(concat(PathLocal,Lc_FileDefault))) then
        Begin
          // Prepara a danfe para o envio
          Lc_FileDefault := ConferenceDanfe('Consulta');
        end;
        //Carrega o componenente para Consulta
        loadComponentNfe(PathLocal, Lc_FileDefault);
        Retorno := ConsultWebNFe(Lc_FileDefault);
        Retorno := DealWithReturn(Retorno);
        SaveReturn55(Retorno,Lc_FileDefault);
      finally
        FreeAndNil(ParamNfe);
        FreeAndNil(NF);
        FreeAndNil(unM);
      end;
    End
    else
    Begin
      MsgCallBack('Rejeição', 'Problemas na conversão');
    End;
  finally
    FreeAndNil(jv);
    FreeAndNil(jo);
  end;
end;

Function TSM.ConsultWebNFe(FileXML:String): Integer;
begin
  Result := 0;
  CleanWebService;
  MsgCallBack('Consulta Nfe', 'INICIANDO A OPERAÇÃO DE CONSULTA...');
  Nfe.Consultar;
  Nfe.NotasFiscais.Items[0].GravarXML(FileXML, PathLocal);
  Result := Nfe.WebServices.Consulta.cStat;
end;

Function TSM.AuthorizaWebNFe(Path, FileXML: String): Integer;
var
  Retorno: Integer;
  Lc_Cd_Vinculo: Integer;
begin
  With Nfe do
  Begin
    CleanWebService;
    MsgCallBack('Autorização', 'ENVIANDO OS DADOS DA NOTA...');
    try
      DANFE.MostrarPreview := False;
      TRY
        Enviar(0,false);
      except
        on E: Exception do
          MsgCallBack('Rejeição', E.Message);
      end;
    finally
      Retorno := WebServices.Retorno.cStat;
      //Foi retirado em 30/09/2017 e colocado dentro da consulta para garantir existencia do XML oficial
      //NotasFiscais.Items[0].GravarXML(FileXML, Path);
      Result := Retorno;
      MsgCallBack('Autorização', 'FINALIZAÇÃO DO PROCESSO DE AUTORIZAÇÃO...');
    end;
  End;
end;

procedure TSM.Authorization(s: String; Callback: TDBXCallback);
Var
  M: TJSONMarshal;
  jo: TJSONObject;
  jv: TJSONValue;
  unM: TJSONUnMarshal;
  AuxReturn: String;
  Lc_FileDefault: String;
  Lc_FileGestao: String;
  Lc_NF: String;
  Retorno: Integer;
Begin
  try
    FCallback := Callback;
    jo := TJSONObject.Create;
    jv := TJSONObject.ParseJSONValue(s);
    if assigned(jv) then
    Begin
      try
        MsgCallBack('Autorização', 'INICIANDO A OPERAÇÃO...');
        unM := TJSONUnMarshal.Create;
        ParamNfe := TPrmNfe.Create;
        ParamNfe := (unM.Unmarshal(jv) as TPrmNfe);
        NF := TControllerInvoiceMerchandise.Create(Self);
        Nfe.NotasFiscais.Clear;
        Nfe.NotasFiscais.Add;
        //Repassa os dados dos parametros para começar a tratar somente no Objeto
        MsgCallBack('Autorização', 'NOTA SELECIONADA...');
          NF.Registro.Codigo          := ParamNfe.Ordem;
          NF.Registro.Estabelecimento := ParamNfe.Estabelecimento;
          NF.getAllByKey;

        openEmitente(NF.Registro.Estabelecimento);
        getConfigNF55;
        Lc_FileDefault := ConferenceDanfe('Autorização');
        if Trim(Lc_FileDefault) <> '' then
        Begin
          // Faz a consulta no site antes de Autorizar
          MsgCallBack('Autorização', 'NOTA CONSULTADA...');
          Retorno := ConsultWebNFe(Lc_FileDefault);
          Retorno := DealWithReturn(Retorno);
          SaveReturn55(Retorno,Lc_FileDefault);
          if (Retorno = 0) and (Retorno <> -1) then
          Begin
            //Registra como enviado para salvaguarda erro de retorno
            SaveReturn55(1,Lc_FileDefault);
            // Autorização propriamente dita
            Retorno := AuthorizaWebNFe(PathLocal, Lc_FileDefault);
            Retorno := DealWithReturn(Retorno);
            SaveReturn55(Retorno,Lc_FileDefault);
          end;
          if ( Retorno = 2 ) then PrintNfe(Nfe.NotasFiscais.Items[0].Nfe.Ide.cNF,Lc_FileDefault);
        end;
      finally
        FreeAndNil(ParamNfe);
        FreeAndNil(NF);
        FreeAndNil(unM);
      end;
    End
    else
    Begin
      MsgCallBack('Rejeição', 'Problemas na conversão');
    End;
  finally
    FreeAndNil(jv);
    FreeAndNil(jo);
  end;
end;

procedure TSM.CalculateCOFINS(Imposto: TImposto);
Var
  Lc_Ok: Boolean;
BEgin
  with Imposto, Qr_Items do
  Begin
    // Define a Situação tributária do COFINS COM ISENTA PARA NA SEQUENCIA FOR SETADA AS VARIAVEIS SE HOUVER
    COFINS.CST := cof07;
    COFINS.vBC := 0;
    COFINS.pcofins := 0;
    COFINS.vCOFINS := 0;
    if Qr_Tributacao.FieldByName('cofins_aliq').AsFloat > 0 then
    Begin
      // Define a Situação tributária do COFINS
      COFINS.CST := StrToCSTCOFINS(Lc_Ok,
        Qr_Tributacao.FieldByName('tb_tax_cofins_id').AsString);
      if (COFINS.CST = cof01) OR (COFINS.CST = cof02) then
      Begin
        COFINS.vBC := ValorBaseProduto;
        COFINS.pcofins := Qr_Tributacao.FieldByName('cofins_aliq').AsFloat;
        COFINS.vCOFINS := COFINS.vBC * (COFINS.pcofins / 100);
        COFINS.vCOFINS := RoundTo(COFINS.vCOFINS, -2);
      end;

      if (COFINS.CST = cof03) then
      Begin
        COFINS.qBCProd := FieldByName('quantity').AsFloat;
        COFINS.vAliqProd := FieldByName('unit_value').AsFloat;
      end;

      if (COFINS.CST = cof99) then
      Begin
        COFINS.vBC := ValorBaseProduto;
        if (COFINS.vBC > 0) then
        Begin
          COFINS.pcofins := Qr_Tributacao.FieldByName('cofins_aliq').AsFloat;
          COFINS.vCOFINS := COFINS.vBC * (COFINS.pcofins / 100);
          COFINS.vCOFINS := RoundTo(COFINS.vCOFINS, -2);
        end
        else
        Begin
          COFINS.qBCProd := FieldByName('quantity').AsFloat;
          COFINS.vAliqProd := FieldByName('unit_value').AsFloat;
        end;
      end;
    end;
  end;

end;

procedure TSM.CalculateIcms(Imposto: TImposto);
Var

  LcTxTribAprox: Real;
begin
  with Qr_Items, Imposto do
  Begin
    TaxaImpAprox.Clear;
    TaxaImpAprox := getImpostoAproximado(FieldByName('ncm').AsString,
      FieldByName('source').AsString);
    LcTxTribAprox := StrToFloatDef(TaxaImpAprox.Strings[3], 0);
    vTotTrib := ((ValorBaseProduto * LcTxTribAprox) / 100);
    // Codigo de Regime Tributario 1/2 - Simples nacional e 3 Regime normal
    ICMS.CST := cstVazio;

    if (Qr_Emitente.FieldByName('crt').AsString = '3') then
      CalculateIcmsRBNormal(Imposto)
    else
      CalculateIcmsRBSimplesNacional(Imposto);

  end;
end;

procedure TSM.CalculateIcmsRBNormal(Imposto: TImposto);
Var
  Lc_Ok: Boolean;

BEgin
  with Imposto, Qr_Items do
  Begin
    // Zera os valores
    // Limpa as Váriaveis
    ICMS.vBC := 0;
    ICMS.pICMS := 0;
    ICMS.pRedBC := 0;
    ICMS.vICMS := 0;
    // ICMS Normal S.T
    ICMS.pMVAST := 0;
    ICMS.pRedBCST := 0;
    ICMS.vBCST := 0;
    ICMS.pICMSST := 0;
    ICMS.vICMSST := 0;
    ICMS.orig := StrToOrig(Lc_Ok, Qr_Tributacao.FieldByName('origem').AsString);
    ICMS.CST := StrToCSTICMS(Lc_Ok,
      Qr_Tributacao.FieldByName('tb_tax_icms_nr_id').AsString);
    ICMS.modBC := StrTomodBC(Lc_Ok,
      Qr_Tributacao.FieldByName('tb_deter_base_tax_icms_id').AsString);
    // Tributação do ICMS – 00 – Tributada integralmente
    if ICMS.CST = cst00 then
    Begin
      // Define o Codigo de situação tributaria
      ICMS.vBC := ValorBaseProduto;
      ICMS.pICMS := Qr_Tributacao.FieldByName('icms_aliq').AsFloat;
      ICMS.vICMS := (ICMS.vBC * (ICMS.pICMS / 100));
      ICMS.vICMS := RoundTo(ICMS.vICMS, -2);
      Exit;
    end;
    // Tributação do ICMS - 10 - Tributada e com cobrança do ICMS por substituição tributária
    if ICMS.CST = cst10 then
    Begin
      if (Qr_Customer.FieldByName('consumer').AsString = 'N') then
      Begin
        // ICMS Normal
        ICMS.vBC := ValorBaseProduto;
        ICMS.pICMS := Qr_Tributacao.FieldByName('icms_aliq').AsFloat;
        ICMS.pRedBC := Qr_Tributacao.FieldByName('icms_aliq_reduced').AsFloat;
        ICMS.vICMS := (ICMS.vBC * ((ICMS.pICMS - ICMS.pRedBC) / 100));
        ICMS.vICMS := RoundTo(ICMS.vICMS, -2);
        // ICMS Normal S.T
        ICMS.modBCST := StrTomodBCST(Lc_Ok,
          Qr_Tributacao.FieldByName('tb_deter_base_tax_icms_st_id').AsString);
        ICMS.pMVAST := MargemValorAgregado;
        ICMS.pRedBCST := 0;
        ICMS.vBCST := RoundTo(ICMS.vBC * ICMS.pMVAST, -2);
        ICMS.pICMSST := AliqIcmsST;
        ICMS.vICMSST := (ICMS.vBCST * (ICMS.pICMSST / 100)) - ICMS.vICMS;
        ICMS.vICMSST := RoundTo(ICMS.vICMSST, -2);
      end;
      Exit;
    end;
    // Tributação do ICMS – 20 - Com redução de base de cálculo
    if ICMS.CST = cst20 then
    Begin
      ICMS.vBC := ValorBaseProduto;
      ICMS.pICMS := Qr_Tributacao.FieldByName('icms_aliq').AsFloat;
      ICMS.pRedBC := Qr_Tributacao.FieldByName('icms_aliq_reduced').AsFloat;
      ICMS.vICMS := (ICMS.vBC * ((ICMS.pICMS - ICMS.pRedBC) / 100));
      ICMS.vICMS := RoundTo(ICMS.vICMS, -2);
      Exit;
    end;
    // Tributação do ICMS – 30 - Isenta ou não tributada e com cobrança do ICMS por substituição tributária
    if ICMS.CST = cst30 then
    Begin
      if (Qr_Customer.FieldByName('consumer').AsString = 'N') then
      Begin
        ICMS.vBC := ValorBaseProduto;
        ICMS.pICMS := Qr_Tributacao.FieldByName('icms_aliq').AsFloat;
        ICMS.pRedBC := Qr_Tributacao.FieldByName('icms_aliq_reduced').AsFloat;
        ICMS.vICMS := (ICMS.vBC * ((ICMS.pICMS - ICMS.pRedBC) / 100));
        ICMS.vICMS := RoundTo(ICMS.vICMS, -2);
        // ICMS S.T
        ICMS.modBCST := StrTomodBCST(Lc_Ok,
          Qr_Tributacao.FieldByName('tb_deter_base_tax_icms_st_id').AsString);
        ICMS.pMVAST := MargemValorAgregado;
        ICMS.pRedBCST := 0;
        ICMS.vBCST := ValorBaseProduto;
        ICMS.pICMSST := AliqIcmsST;
        ICMS.vICMSST := (ICMS.vBCST * (ICMS.pICMSST / 100)) - ICMS.vICMS;
        ICMS.vICMSST := RoundTo(ICMS.vICMSST, -2);
        // Zera o ICMS Normal conforme isençao
        ICMS.vBC := 0;
        ICMS.pICMS := 0;
        ICMS.pRedBC := 0;
        ICMS.vICMS := 0;
      end;
      Exit;
    end;
    // Tributação do ICMS – 40 - Isenta 41 - Não tributada 50 - Suspensão
    if (ICMS.CST = cst40) or (ICMS.CST = cst41) or (ICMS.CST = cst50) then
    Begin
      Exit;
    end;
    // Tributação do ICMS – 51 - Diferimento  A exigência do preenchimento das informações do ICMS diferido fica a critério de cada UF.
    if ICMS.CST = cst51 then
    Begin
      if (Qr_Customer.FieldByName('consumer').AsString = 'N') then
      Begin
        // ICMS Normal
        ICMS.vBC := ValorBaseProduto;
        ICMS.pICMS := Qr_Tributacao.FieldByName('icms_aliq').AsFloat;
        ICMS.pRedBC := Qr_Tributacao.FieldByName('icms_aliq_reduced').AsFloat;
        ICMS.vICMS := (ICMS.vBC * ((ICMS.pICMS - ICMS.pRedBC) / 100));
        ICMS.vICMS := RoundTo(ICMS.vICMS, -2);
      end;
      Exit;
    end;
    // Tributação do ICMS – 60 - ICMS cobrado anteriormente por substituição tributária
    if ICMS.CST = cst60 then
    Begin
      ICMS.vBCSTRet := 0;
      ICMS.vICMSSTRet := 0;
      Exit;
    end;
    // Tributação do ICMS - 70 - Com redução de base de cálculo e  cobrança do ICMS por substituição tributária
    if ICMS.CST = cst70 then
    Begin
      ICMS.pRedBC := Qr_Tributacao.FieldByName('icms_aliq_reduced').AsFloat;
      ICMS.vBC := ValorBaseProduto;
      // faz a redução da base
      ICMS.vBC := ICMS.vBC -
        (ICMS.vBC * (Qr_Tributacao.FieldByName('icms_base_reduced')
        .AsFloat / 100));
      ICMS.vBC := RoundTo(ICMS.vBC, -2);
      ICMS.pICMS := Qr_Tributacao.FieldByName('icms_aliq').AsFloat;
      ICMS.vICMS := (ICMS.vBC * (ICMS.pICMS / 100));
      ICMS.vICMS := RoundTo(ICMS.vICMS, -2);
      if (Qr_Customer.FieldByName('consumer').AsString = 'N') then
      Begin
        // ICMS Normal S.T
        ICMS.modBCST := StrTomodBCST(Lc_Ok,
          Qr_Tributacao.FieldByName('tb_deter_base_tax_icms_st_id').AsString);
        ICMS.pMVAST := MargemValorAgregado;
        ICMS.pRedBCST := 0;
        if Qr_Tributacao.FieldByName('propag_base_reduc').AsString = 'S' then
        Begin
          ICMS.vBCST := RoundTo(ICMS.vBC * ICMS.pMVAST, -2);
        end
        else
        Begin
          ICMS.vBCST := ValorBaseProduto;
        end;
        ICMS.pICMSST := AliqIcmsST;
        ICMS.vICMSST := (ICMS.vBCST * (ICMS.pICMSST / 100)) - ICMS.vICMS;
        ICMS.vICMSST := RoundTo(ICMS.vICMSST, -2);
      end;
      Exit;
    end;
    // Tributação do ICMS - 90 – Outros
    if ICMS.CST = cst90 then
    Begin
      // ICMS Normal -
      ICMS.vBC := ValorBaseProduto;
      ICMS.vBC := ICMS.vBC -
        (ICMS.vBC * (Qr_Tributacao.FieldByName('icms_base_reduced')
        .AsFloat / 100));
      ICMS.vBC := RoundTo(ICMS.vBC, -2);
      ICMS.pICMS := Qr_Tributacao.FieldByName('icms_aliq').AsCurrency;
      ICMS.pRedBC := Qr_Tributacao.FieldByName('icms_aliq_reduced').AsCurrency;
      ICMS.vICMS := (ICMS.vBC * ((ICMS.pICMS - ICMS.pRedBC) / 100));
      ICMS.vICMS := RoundTo(ICMS.vICMS, -2);
      Exit;
    end;
  end;
end;

procedure TSM.CalculateIcmsRBSimplesNacional(Imposto: TImposto);
Var
  Lc_Ok: Boolean;
BEgin
  with Imposto, Qr_Items do
  Begin
    // Verifica se há tributação pelo Simples Nacional
    ICMS.CSOSN := StrToCSOSNIcms(Lc_Ok,
      Qr_Tributacao.FieldByName('tb_tax_icms_sn_id').AsString);
    ICMS.modBC := StrTomodBC(Lc_Ok,
      Qr_Tributacao.FieldByName('tb_deter_base_tax_icms_id').AsString);
    ICMS.vBC := ValorBaseProduto;
    ICMS.vBC := ICMS.vBC -
      (ICMS.vBC * (Qr_Tributacao.FieldByName('icms_base_reduced')
      .AsFloat / 100));
    ICMS.vBC := RoundTo(ICMS.vBC, -2);
    ICMS.pICMS := Qr_Tributacao.FieldByName('icms_aliq').AsFloat;
    ICMS.pRedBC := Qr_Tributacao.FieldByName('icms_aliq_reduced').AsFloat;
    ICMS.vICMS := (ICMS.vBC * ((ICMS.pICMS - ICMS.pRedBC) / 100));
    ICMS.vICMS := RoundTo(ICMS.vICMS, -2);
    // credito ICMS
    ICMS.pCredSN := RoundTo(AliqCreditoIcms, -2);
    // Alíquota aplicável de cálculo do crédito (Simples Nacional).
    ICMS.vCredICMSSN := ValorBaseProduto;
    ICMS.vCredICMSSN := RoundTo(ICMS.vCredICMSSN * (AliqCreditoIcms / 100), -2);
    // Valor crédito do ICMS que pode ser aproveitado nos termos do art. 23 da LC 123 (Simples Nacional)
    // TRIBUTADA PELO SIMPLES NACIONAL COM PERMISSÃO DE CRÉDITO
    if (ICMS.CSOSN = csosn101) then
    Begin
      Exit;
    end;
    // Tributação do ICMS pelo SIMPLES NACIONAL e CSOSN=102, 103, 300 ou 400 (v.2.0)
    if (ICMS.CSOSN = csosn102) or (ICMS.CSOSN = csosn103) or
      (ICMS.CSOSN = csosn300) or (ICMS.CSOSN = csosn400) then
    Begin
      // credito ICMS
      ICMS.pCredSN := 0;
      ICMS.vCredICMSSN := 0;
      Exit;
    end;
    // 201- Tributada pelo Simples Nacional com permissão de crédito e com cobrança do ICMS por Substituição Tributária v.2.0)
    if (ICMS.CSOSN = csosn201) then
    Begin
      // ICMS Normal S.T
      ICMS.modBCST := StrTomodBCST(Lc_Ok,
        Qr_Tributacao.FieldByName('tb_deter_base_tax_icms_st_id').AsString);
      ICMS.pMVAST := MargemValorAgregado;
      ICMS.pRedBCST := 0;
      ICMS.vBCST := RoundTo(ICMS.vBC * ICMS.pMVAST, -2);
      ICMS.pICMSST := AliqIcmsST;
      ICMS.vICMSST := (ICMS.vBCST * (ICMS.pICMSST / 100)) - ICMS.vICMS;
      ICMS.vICMSST := RoundTo(ICMS.vICMSST, -2);
      // ICMS Normal - Zera os valores depois de feito o calculo
      ICMS.vBC := 0;
      ICMS.pICMS := 0;
      ICMS.pRedBC := 0;
      ICMS.vICMS := 0;
      Exit;
    end;
    // 202- Tributada pelo Simples Nacional sem permissão de  crédito e com cobrança do ICMS por Substituição Tributária
    // 203- Isenção do ICMS nos Simples Nacional para faixa de receita bruta e com cobrança do ICMS por Substituição Tributária  (v.2.0)
    if (ICMS.CSOSN = csosn202) OR (ICMS.CSOSN = csosn203) then
    Begin
      // ICMS Normal S.T
      ICMS.modBCST := StrTomodBCST(Lc_Ok,
        Qr_Tributacao.FieldByName('tb_deter_base_tax_icms_st_id').AsString);
      ICMS.pMVAST := MargemValorAgregado;
      ICMS.pRedBCST := 0;
      ICMS.vBCST := RoundTo(ICMS.vBC * ICMS.pMVAST, -2);
      ICMS.pICMSST := AliqIcmsST;
      ICMS.vICMSST := (ICMS.vBCST * (ICMS.pICMSST / 100)) - ICMS.vICMS;
      ICMS.vICMSST := RoundTo(ICMS.vICMSST, -2);
      // ICMS Normal - Zera os valores depois de feito o calculo
      ICMS.vBC := 0;
      ICMS.pICMS := 0;
      ICMS.pRedBC := 0;
      ICMS.vICMS := 0;
      // credito ICMS
      ICMS.pCredSN := 0;
      ICMS.vCredICMSSN := 0;
      Exit;
    end;
    // 500 – ICMS cobrado anteriormente por substituição tributária (substituído) ou por antecipação (v.2.0)
    if (ICMS.CSOSN = csosn500) then
    Begin
      ICMS.pMVAST := 0;
      ICMS.pRedBCST := 0;
      ICMS.vBCST := 0;
      ICMS.pICMSST := 0;
      ICMS.vICMSST := 0;
      ICMS.vBCSTRet := 0;
      ICMS.vICMSSTRet := 0;
      Exit;
    end;
    // Tributação do ICMS pelo SIMPLES NACIONAL e CSOSN=900 (v2.0)
    if (ICMS.CSOSN = csosn900) then
    Begin
      Exit;
    end;
  end;
end;

procedure TSM.CalculateII(Imposto: TImposto);
begin
  with Imposto do
  Begin
    if Qr_Tributacao.FieldByName('ii_aliq').AsFloat > 0 then
    Begin
      II.vBC := ValorBaseProduto;
      II.vDespAdu := 0;
      II.vII := (II.vBC * (Qr_Tributacao.FieldByName('ii_aliq').AsFloat) / 100);
      II.vII := RoundTo(II.vII, -2);
      II.vIOF := 0;
    end;
  end;
end;

procedure TSM.CalculateIPI(Imposto: TImposto);
Var
  Lc_Ok: Boolean;
Begin
  with Imposto do
  Begin
    if Trim(Qr_Tributacao.FieldByName('tb_tax_ipi_id').AsString) <> '' then
    Begin
      IPI.CST := StrToCSTIPI(Lc_Ok, Qr_Tributacao.FieldByName('tb_tax_ipi_id')
        .AsString);
      IPI.cEnq := '999';
      // Tabela a ser criada pela RFB, informar 999 enquanto a tabela não for criada
      if (IPI.CST = ipi00) or (IPI.CST = ipi49) or (IPI.CST = ipi50) or
        (IPI.CST = ipi99) then
      Begin
        IPI.vBC := ValorBaseProduto;
        IPI.pIPI := Qr_Tributacao.FieldByName('ipi_aliq').AsFloat;
        IPI.vIPI := IPI.vBC * (IPI.pIPI / 100);
        IPI.vIPI := RoundTo(IPI.vIPI, -2);
      end
    END;
  end;
end;

procedure TSM.CalculateISSQN(Imposto: TImposto);
Var
  Lc_Ok: Boolean;
BEgin
  {
    with Imposto do
    BEgin
    ICMS.orig     := StrToOrig(Lc_Ok,Qr_Tributacao.FieldByName('CST_ICMS').AsString);
    ICMS.CST      := StrToCSTICMS(Lc_Ok,Qr_Tributacao.FieldByName('CST_ICMS').AsString);
    ICMS.modBC    := StrTomodBC(Lc_Ok,Qr_Tributacao.FieldByName('MODAL_ICMS_NR').AsString);
    ISSQN.vBC := RoundTo((Qr_ItensPedido.FieldByName('ITF_VL_UNIT').AsFloat * Qr_ItensPedido.FieldByName('ITF_QTDE').AsFloat) - Qr_ItensPedido.FieldByName('ITF_VL_DESC').AsFloat,-2);
    ICMS.vBC      := ICMS.vBC - (ICMS.vBC * (Qr_Tributacao.FieldByName('TRB_RD_BS_ICMS').AsFloat / 100));
    ISSQN.vBC := RoundTo(ISSQN.vBC,-2);
    ISSQN.vDeducao := Qr_ItensPedido.FieldByName('ITF_VL_DESC').AsFloat;
    ISSQN.vAliq := Qr_pedido.FieldByName('CDD_ISS_ALIQ').AsFloat;

    ISSQN.vISSQN := ISSQN.vBC * (ISSQN.vAliq / 100);

    ISSQN.vISSQN := RoundTo(ISSQN.vISSQN,-3);

    ISSQN.cMunFG := Qr_Estabelecimento.FieldByName('CDD_IBGE').asinteger;

    ISSQN.cListServ := It_CODSRV116;

    if (Qr_Pedido.FieldByName('CLI_ISS_RET').asString = 'S') then

    Begin

    ISSQN.indISSRet := StrToindISSRet(Lc_Ok,'1');

    ISSQN.vISSRet := ISSQN.vISSQN;

    end

    else

    Begin

    ISSQN.indISSRet := StrToindISSRet(Lc_Ok,'2');

    ISSQN.vISSRet := 0;

    end;

    ISSQN.vOutro := 0; //Outras REtenções

    ISSQN.vDescIncond := 0;

    ISSQN.vDescCond := 0;

    //1=Exigível, 2=Não incidência; 3=Isenção; 4=Exportação; 5=Imunidade; 6=Exigibilidade Suspensa por Decisão Judicial; 7=Exigibilidade Suspensa por Processo Administrativo;

    ISSQN.indISS := StrToindISS(Lc_Ok,IntToStr(StrToIntDef(Qr_Pedido.FieldByName('CLI_ISS_EXIGIB').AsString,0) + 1));

    ISSQN.cServico := Qr_ItensPedido.FieldByName('ITF_CODPRO').Asstring;

    ISSQN.cMunFG := Qr_Pedido.FieldByName('CDD_IBGE').asinteger;

    ISSQN.cPais := Qr_Pedido.FieldByName('END_PAIS').asinteger;

    ISSQN.nProcesso := Qr_Pedido.FieldByName('CLI_ISS_NR_PROCESSO').AsString;

    if (Qr_Pedido.FieldByName('CLI_ISS_IND_INC_FISCAL').asString = 'S') then

    ISSQN.indIncentivo := StrToindIncentivo(Lc_Ok,'Sim')

    else

    ISSQN.indIncentivo := StrToindIncentivo(Lc_Ok,'Não');

    end;

  }
end;

procedure TSM.CalculatePIS(Imposto: TImposto);
Var
  Lc_Ok: Boolean;
BEgin
  with Imposto, Qr_Items do
  Begin
    PIS.CST := pis07;
    PIS.vBC := 0;
    PIS.pPIS := 0;
    PIS.vPIS := 0;
    if Qr_Tributacao.FieldByName('pis_aliq').AsFloat > 0 then
    Begin
      // Define a Situação tributária do PISPIS
      PIS.CST := StrToCSTPIS(Lc_Ok, Qr_Tributacao.FieldByName('tb_tax_pis_id')
        .AsString);
      if (PIS.CST = pis01) OR (PIS.CST = pis02) then
      Begin
        PIS.vBC := ValorBaseProduto;
        PIS.pPIS := Qr_Tributacao.FieldByName('pis_aliq').AsFloat;
        PIS.vPIS := PIS.vBC * (PIS.pPIS / 100);
        PIS.vPIS := RoundTo(PIS.vPIS, -2);
      end;

      if (PIS.CST = pis03) then
      Begin
        PIS.qBCProd := FieldByName('quantity').AsFloat;
        PIS.vAliqProd := FieldByName('unit_value').AsFloat;
      end;

      if (PIS.CST = pis99) then
      Begin
        PIS.vBC := ValorBaseProduto;
        PIS.vBC := RoundTo(PIS.vBC, -2);
        if (PIS.vBC > 0) then
        Begin
          PIS.pPIS := Qr_Tributacao.FieldByName('pis_aliq').AsFloat
        end
        else
        Begin
          PIS.qBCProd := FieldByName('quantity').AsFloat;
          PIS.vAliqProd := FieldByName('unit_value').AsFloat;
        end;
      end;
    end;
  end;
end;

procedure TSM.CalculateInvoice(Value: string; Callback: TDBXCallback);
vAR
  M: TJSONMarshal;
  jo: TJSONObject;
  jv: TJSONValue;
  unM: TJSONUnMarshal;
begin
  jo := TJSONObject.Create;
  jv := TJSONObject.ParseJSONValue(Value);
  if assigned(jv) then
  Begin
    try
      Nfe.NotasFiscais.Add;
      TaxaImpAprox := TStringList.Create;
      unM := TJSONUnMarshal.Create;
      ParameToInvoice := (unM.Unmarshal(jv) as TPrmToInvoicer);
      openItemList(ParameToInvoice.Estabelecimento, ParameToInvoice.Ordem);
      CalculateTaxes;
      M := TJSONMarshal.Create(TJSONConverter.Create);
      jv := M.Marshal(ParameToInvoice.NotaMercadoria);
      MsgCallBack('TOTALIZADOR', jv.ToString);
    finally
      FreeAndNil(M);
      FreeAndNil(jv);
      FreeAndNil(unM);
      FreeAndNil(jo);
      FreeAndNil(ParameToInvoice);
      FreeAndNil(NF);
      FreeAndNil(TaxaImpAprox);
    end;
  End
  else
    MsgCallBack('TOTALIZADOR', 'Problemas Conversão Json');
end;

procedure TSM.DefineDecimalPointQtty;
Var
  Lc_Nr_CasaDecimal: Integer;
begin
  with Qr_Items do
  Begin
    First;
    Lc_Nr_CasaDecimal := 0;
    Nfe.DANFE.CasasDecimais._qCom := 2;
    while not Eof do
    begin
      Lc_Nr_CasaDecimal := getDecimalPoint
        (FloatToStrF(FieldByName('quantity').AsFloat, ffFixed, 10, 4));
      if Lc_Nr_CasaDecimal > Nfe.DANFE.CasasDecimais._qCom then
        Nfe.DANFE.CasasDecimais._qCom := Lc_Nr_CasaDecimal;
      Next;
    end;
  End;
end;

procedure TSM.DefineDecimalPointValue;
Var
  Lc_Nr_CasaDecimal: Integer;
begin
  with Qr_Items, Nfe.DANFE do
  Begin
    First;
    CasasDecimais._vUnCom := 2;
    while not Eof do
    begin
      Lc_Nr_CasaDecimal := getDecimalPoint
        (FloatToStrF(FieldByName('unit_value').AsFloat, ffFixed, 10, 6));
      if Lc_Nr_CasaDecimal > CasasDecimais._vUnCom then
        CasasDecimais._vUnCom := Lc_Nr_CasaDecimal;
      Next;
    end;
  End;
end;


procedure TSM.DefineSizeProductField;
Var
  Lc_Tam_CodPro: Integer;
  Lc_AuxInt: Integer;
begin
  with Qr_Items, Nfe.DANFE do
  Begin
    First;
    Lc_Tam_CodPro := 43;
    while not Eof do
    begin
      // Determina tamanho do campo codigo do produto
      Lc_AuxInt := Length(FieldByName('identifier').AsString) * 6;
      if (Lc_AuxInt > Lc_Tam_CodPro) then
        Lc_Tam_CodPro := Lc_AuxInt;
      Next;
    end;
    Dfe_Fortes.LarguraCodProd := Lc_Tam_CodPro;
  End;
end;

procedure TSM.DSServerModuleCreate(Sender: TObject);
begin
  SetConnection;
end;

procedure TSM.DSServerModuleDestroy(Sender: TObject);
begin
  try
    umm.DB.Connected := False;
  except
    exit;
  end;
end;

procedure TSM.Echo(s: String; Callback: TDBXCallback);
var
  I: Integer;
  LCallbackValue: TJSONObject;
begin

  for I := 0 to 20 do
  begin
    LCallbackValue := TJSONObject.Create;
    LCallbackValue.AddPair(TJSONPair.Create('Server return',
      UpperCase(s) + ' - ' + IntToStr(I)));

    Callback.Execute(LCallbackValue);
  end;

end;

function TSM.getConfig(chave, valor: String): String;
Begin
  Result := '';
End;

function TSM.getConfigNF55: Boolean;
Var
 LcEstab : TControllerInstitution;
 LcConfi : TControllerConfigNfe55;
 LocalCerti : String;
 LcOk : Boolean;
begin
  try
    LcOk := True;
    with Nfe do
    Begin
      //Estabelecimento
      LcEstab := TControllerInstitution.create(nil);
      LcEstab.Registro.Codigo := GbInstitution;
      LcEstab.getByKey;
      //Config
      LcConfi := TControllerConfigNfe55.create(nil);
      LcConfi.Registro.Estabelecimento := GbInstitution;
      LcConfi.getByKey;
      // cONFIGURAÇÕES DO COMPONENTE
      Dfe_Fortes.MostraDadosISSQN := False;
      Configuracoes.Geral.ModeloDF := moNFe;
      Dfe_Fortes.ACBrNFe := Nfe;
      DANFE := Dfe_Fortes;

      if ( LcConfi.Registro.Orientacao = '0' ) then
        Nfe.DANFE.TipoDANFE := tiRetrato
      else
        Nfe.DANFE.TipoDANFE := tiPaisagem;

      if ( LcConfi.Registro.Recebimento = '0' ) then
        Dfe_Fortes.PosCanhoto := prCabecalho
      else
        Dfe_Fortes.PosCanhoto := prRodape;

      LcEstab.getRepository;


      Configuracoes.Arquivos.PathNFe    := concat(LcEstab.Publico,'nfe\');
      Configuracoes.Arquivos.PathInu    := concat(LcEstab.Publico,'inu\');
      Configuracoes.Arquivos.PathEvento := concat(LcEstab.Publico,'eve\');

      LocalCerti := concat(LcEstab.PathDominio, 'cert_', LcEstab.EntityFiscal.Juridica.Registro.CNPJ,'.pfx');
      if FileExists(LocalCerti) then
      Begin
        Configuracoes.Certificados.ArquivoPFX := LocalCerti;
        Configuracoes.Certificados.Senha := LcConfi.ConfigNfe.Registro.Senha;
        Configuracoes.Certificados.NumeroSerie := NFe.SSL.CertNumeroSerie;
      End;
      Configuracoes.Geral.FormaEmissao := StrToTpEmis(LcOk,LcConfi.ConfigNfe.Registro.TipoEmissao);
      Configuracoes.Geral.Salvar := True;
      Nfe.Configuracoes.WebServices.UF := Qr_Emitente.FieldByName('state').AsString;
      DANFE.Fax := MaskFone(Qr_Emitente.FieldByName('phone').AsString);
      openMailing('principal', Qr_Emitente.FieldByName('id').AsInteger);
      DANFE.Email := Qr_Email.FieldByName('email').AsString;

      openSocialMedia('www', Qr_Emitente.FieldByName('id').AsInteger);
      DANFE.Site := Qr_Midia_Social.FieldByName('link').AsString;

      if LcConfi.ConfigNfe.Registro.Ambiente = '0' then
        Configuracoes.WebServices.Ambiente := taProducao
      else
        Configuracoes.WebServices.Ambiente := taHomologacao;

      if LcConfi.ConfigNfe.Registro.Versao = '310' then
        Configuracoes.Geral.VersaoDF := ve310
      else
        Configuracoes.Geral.VersaoDF := ve400;

      Configuracoes.WebServices.Visualizar := ( LcConfi.ConfigNfe.Registro.VisualizarMensagem = 'S' );

      //Testando via openSSL e não deu certo o evento de manifestação
      //SSL.SSLType := TSSLType(0);
      //Configuracoes.Geral.SSLLib := TSSLLib(1);
      //Configuracoes.Geral.SSLCryptLib := cryWinCrypt;     //TSSLCryptLib(1);
      //Configuracoes.Geral.SSLHttpLib := httpWinHttp;      //TSSLHttpLib(3);
      //Configuracoes.Geral.SSLXmlSignLib := TSSLXmlSignLib(1);
      SSL.CertDataVenc;

    End;
  finally
    FreeAndNil( LcEstab );
    FreeAndNil( LcConfi );
  end;
end;

procedure TSM.getDownloadXML(s: String; Callback: TDBXCallback);
Var
  Lc_Lote: Integer;
  LcEvento : TControllerNfeEventsSent;
  M: TJSONMarshal;
  jo: TJSONObject;
  jv: TJSONValue;
  unM: TJSONUnMarshal;

  LC_ULTNSU : String;
  ArqXML : TStringStream;
  XMLDoc: TXMLDocument;
  I : Integer;
  Lc_Path : String;
  LcState : TControllerState;
Begin
  try
    FCallback := Callback;
    jo := TJSONObject.Create;
    jv := TJSONObject.ParseJSONValue(s);
    if assigned(jv) then
    Begin
      MsgCallBack('Download XML','Iniciando processo...');
      unM := TJSONUnMarshal.Create;
      ParamNfe := TPrmNfe.Create;
      ParamNfe := (unM.Unmarshal(jv) as TPrmNfe);
      GbInstitution := ParamNfe.Estabelecimento;
      openEmitente(GbInstitution);
      getConfigNF55;
      LcState  := TControllerState.create(self);
      LcState.Registro.Codigo := StrToIntDef(Copy(ParamNfe.Chave,1,2),Qr_Emitente.FieldByName('tb_state_id').asInteger);
      with Nfe do
      Begin
        try
          DistribuicaoDFePorChaveNFe( LcState.Registro.Codigo,
                                      Qr_Emitente.FieldByName('cnpj').AsString,
                                      ParamNfe.Chave);
          with WebServices.DistribuicaoDFe.retDistDFeInt do
          begin
            LC_ULTNSU := ultNSU;
            if cStat = 138 then
            begin
              XMLDoc := TXMLDocument.Create(nil);
              for i := 0 to docZip.Count - 1 do
              begin
                if docZip.Items[i].schema = schprocNFe then //verifica se o arquivo é o XML da NFe (-nfe.xml)
                begin
                  XML := docZip.Items[i].XML;
                  ArqXML := TStringStream.Create(XML);
                  XMLDoc.XML.Clear;
                  XMLDoc.LoadFromStream(ArqXML);
                  XMLDoc.Active;

                  XMLDoc.SaveToFile(concat(
                                        Configuracoes.Arquivos.PathNFe,ParamNfe.chave,'-nfe.xml'));

                end;
              end;
            end
          end;
        except
          on E : Exception do
          Begin
            MsgCallBack('Download XML','Erro econtrado : '+ E.Message);
            MsgCallBack('Download XML','Não foi possivel baixar o arquivo');
          End;
        end;
      end;
    End;
  finally
    FreeAndNil(jv);
    FreeAndNil(jo);
  end;
end;

function TSM.getPermissao: Boolean;
begin
  Result := True;
end;


function TSM.getStatusNfeService(msg: Boolean): Boolean;
begin
  Result := True;
  with Nfe.WebServices do
  Begin
    try
      try
        StatusServico.Executar;
      finally
        if ((StatusServico.cStat <> 107) AND (Trim(StatusServico.XMotivo) <> '')
          ) or msg then
          MsgCallBack('Receita Estadual', StatusServico.XMotivo);
      end;
    except
      on E: Exception do
        MsgCallBack('Rejeição', E.Message);
    end;
  end;
end;

procedure TSM.getValidityCertificate(s: String; Callback: TDBXCallback);
Var
  LcParamSimple: TPrmSimple;
  M: TJSONMarshal;
  jo: TJSONObject;
  jv: TJSONValue;
  unM: TJSONUnMarshal;
Begin
  try
    FCallback := Callback;
    LcParamSimple := TPrmSimple.Create;
    jo := TJSONObject.Create;
    jv := TJSONObject.ParseJSONValue(s);
    if assigned(jv) then
    Begin
      unM := TJSONUnMarshal.Create;
      LcParamSimple := (unM.Unmarshal(jv) as TPrmSimple);
      Nfe.NotasFiscais.Add;
      GbInstitution := StrToIntDef(LcParamSimple.Resultado, 0);
      openEmitente(GbInstitution);
      getConfigNF55;
      LcParamSimple.Referencia := 'Validade do Certificado';
      LcParamSimple.Resultado := DateToStr(Nfe.SSL.CertDataVenc);

      M := TJSONMarshal.Create(TJSONConverter.Create);
      jv := M.Marshal(LcParamSimple);

      MsgCallBack('CERTIFICADO', jv.ToString);
    End
    else
    Begin
      MsgCallBack('Json', 'Problemas na conversão');
    End;
  finally
    FreeAndNil(jv);
    FreeAndNil(unM);
    FreeAndNil(jo);
    FreeAndNil(LcParamSimple);
    FreeAndNil(NF);
  end;
end;

procedure TSM.loadComponentNfe(path, filexml: String);
Var
  wnProt: TLeitor;
Begin
  //Carrega o XMl no Componente
  Nfe.NotasFiscais.Clear;
  Nfe.NotasFiscais.LoadFromFile(Path + '\' + FileXML);
  wnProt := TLeitor.Create;
  wnProt.CarregarArquivo(Path + '\' +  FileXML);
  wnProt.Grupo := wnProt.Arquivo;
  Nfe.DANFE.ProtocoloNFe := wnProt.rCampo(tcStr,'nProt');
end;

function TSM.getAliqIcmsST: Boolean;
Var
  Lc_AliqIcmsST: Real;
  Lc_AliqIcmsNR: Real;
begin
  Result := True;
  AliqIcmsST := 0;
  AliqCombPobreza := 0;
  MargemValorAgregado := 0;
  with Qr_ST do
  Begin
    Active := False;
    ParamByName('tb_state_id').AsInteger := Qr_Destinatario.FieldByName
      ('tb_state_id').AsInteger;
    ParamByName('ncm').AsString := Qr_Items.FieldByName('ncm').AsString;
    Active := True;
    FetchAll;
    if (recordcount > 0) then
    Begin
      First;
      AliqIcmsST := FieldByName('aliq_icms').AsFloat;
      AliqCombPobreza := 0;
      MargemValorAgregado := FieldByName('mva').AsFloat;

      if not ParameToInvoice.UsarMvaOriginal then
      Begin
        Lc_AliqIcmsST := AliqIcmsST;
        Lc_AliqIcmsNR := Qr_Tributacao.FieldByName('icms_aliq').AsFloat;
        if (Qr_Tributacao.Active) then
        Begin
          // Margem de Valor Agregado
          // Observar não so as aliquotas mas a carga tributaria real do ICMS Próprio e o ICMS do Destino
          Lc_AliqIcmsNR :=
            (Lc_AliqIcmsNR -
            ((Lc_AliqIcmsNR * Qr_Tributacao.FieldByName('icms_base_reduced')
            .AsFloat) / 100));
          Lc_AliqIcmsNR := RoundTo(Lc_AliqIcmsNR, -2);
          // Verifica se a redução da base será propagada para o calculo da base da ST
          if (Qr_Tributacao.FieldByName('propag_base_reduc').AsString = 'S')
          then
          Begin
            Lc_AliqIcmsST :=
              (AliqIcmsST -
              ((AliqIcmsST * Qr_Tributacao.FieldByName('icms_base_reduced')
              .AsFloat) / 100));
            Lc_AliqIcmsST := RoundTo(Lc_AliqIcmsST, -2);
          End;
          // MVA ajustada = [(1+ MVA ST original) x (1 - ALQ inter) / (1- ALQ intra)] -1
          // TRansformada no Excel =((B8 * (1-C8)) / (1-D8))
          MargemValorAgregado := ((MargemValorAgregado * (100 - Lc_AliqIcmsNR))
            / (100 - Lc_AliqIcmsST));
          MargemValorAgregado := RoundTo(MargemValorAgregado, -4);
        End;
      End;
      // Caso seja empesa optante pelo Simples deixar 50% da aliquota

      if (Qr_Company.FieldByName('crt').AsString <> '3') then
      Begin
        if (MargemValorAgregado > 0) then
        Begin
          if (getConfig('GRL_G_DECRETO108352014', 'N') = 'S') then
          Begin
            // Verifica se o Estado é de Santa Catarina
            if (FieldByName('UFE_SIGLA').AsString = 'SC') then
            Begin
              MargemValorAgregado := ((MargemValorAgregado - 1) * 0.3) + 1;
            end
            else
            Begin
              if (Lc_AliqIcmsST < 18) or (VerificaBeneficioICMS) then
              Begin
                MargemValorAgregado := ((MargemValorAgregado - 1) * 0.5) + 1;
              end
              else
              Begin
                MargemValorAgregado := ((MargemValorAgregado - 1) * 0.3) + 1;
              end;
            end;
          end;
        end;
      end;
    End;
  End;
end;

function TSM.getInscrSubstTributario: String;
Begin
  Result := RemoveCaracterInformado(Result, ['.', ',', '/', '-', ' ']);
end;

procedure TSM.MsgCallBack(Seq, Value: String);
Var
  CallbackValue: TJSONObject;
begin
  CallbackValue := TJSONObject.Create;
  CallbackValue.AddPair(TJSONPair.Create(Seq, Value));
  FCallback.Execute(CallbackValue);
  // CallbackValue.Free;
end;

function TSM.openCompany(destinatario: Integer): Boolean;
begin
  with Qr_Company do
  Begin
    Active := False;
    ParamByName('company_id').AsInteger := destinatario;
    Active := True;
    FetchAll;
    Result := (recordcount > 0);
    TipoPessoa := 'J';
  End;
end;

function TSM.openCustomer(destinatario: Integer): Boolean;
begin
  with Qr_Customer do
  Begin
    Active := False;
    ParamByName('customer_id').AsInteger := destinatario;
    Active := True;
    FetchAll;
    Result := (recordcount > 0);
  End;
end;

function TSM.openDeliveryLocal(destinatario, InvoiceID: Integer): Boolean;
var
  Lc_SqlTxt: String;
  Lc_Cd_Endereco, Lc_Cd_Entrega: Integer;
  Lc_qt_Endereco: Integer;
begin
  with Qr_DeliveryLocal do
  Begin
    Active := False;
    SQL.Clear;
    SQL.Add(concat('SELECT a.id, a.main ', 'FROM tb_address a ',
      'WHERE a.id =:id ', ' and (main = ''S'')'));
    ParamByName('id').AsInteger := destinatario;
    Active := True;
    FetchAll;
    First;
    Lc_qt_Endereco := recordcount;
    if Lc_qt_Endereco > 1 then
      Locate('main', 'S', []);
    Lc_Cd_Endereco := FieldByName('id').AsInteger;

    Active := False;
    SQL.Clear;
    SQL.Add(concat('SELECT ad.id, ad.street, ad.complement, ad.neighborhood,',
      'ad.zip_code, ct.name city_desc, ct.ibge, ',
      'st.abbreviation state,ad.nmbr ', 'FROM tb_address ad ',
      '  INNER JOIN tb_city ct ', '  ON (ct.id = ad.tb_city_id) ',
      '  INNER JOIN tb_state st ', '  ON (st.id = ad.tb_state_id) ',
      '  INNER JOIN tb_order_shipping ords ',
      '  ON (ords.tb_address_id = ad.id) ', 'WHERE ords.id =:invoice_id ',
      '  and (ords.tb_institution_id=:tb_institution_id) '));
    ParamByName('tb_institution_id').AsInteger := InvoiceID;
    ParamByName('invoice_id').AsInteger := InvoiceID;
    Active := True;
    FetchAll;

    // Neste caso tem apenas um endereço e não precisa comparar
    if (Lc_qt_Endereco = 1) then
    Begin
      Result := False;
      Exit;
    end;

    Lc_Cd_Entrega := FieldByName('id').AsInteger;

    Result := (Lc_Cd_Endereco <> Lc_Cd_Entrega)
  End;
end;

function TSM.openDestinatario(destinatario: Integer): Boolean;
begin
  with Qr_Destinatario do
  Begin
    Active := False;
    ParamByName('entity_id').AsInteger := destinatario;
    Active := True;
  End;
end;

function TSM.openEmitente(Emitente: Integer): Boolean;
begin
  with Qr_Emitente do
  Begin
    Active := False;
    ParamByName('entity_id').AsInteger := Emitente;
    Active := True;
  End;
end;

function TSM.openItemList(estabelecimento, Ordem: Integer): Boolean;
begin
  with Qr_Items do
  Begin
    Active := False;
    ParamByName('institution_id').AsInteger := estabelecimento;
    ParamByName('order_id').AsInteger := Ordem;
    Active := True;
    FetchAll;
  End;
end;

function TSM.openInvoiceObservation(estabelecimento, InvoiceID: Integer): Boolean;
begin
  with Qr_InvoiceObs do
  Begin
    Active := False;
    ParamByName('institution_id').AsInteger := estabelecimento;
    ParamByName('invoice_id').AsInteger := InvoiceID;
    Active := True;
    FetchAll;
    First;
  End;
end;

function TSM.openInvoiceShipping(estabelecimento, InvoiceID: Integer): Boolean;
begin
  with Qr_InvoiceShipping do
  Begin
    Active := False;
    ParamByName('institution_id').AsInteger := estabelecimento;
    ParamByName('invoice_id').AsInteger := InvoiceID;
    Active := True;
    FetchAll;
  End;
end;

function TSM.openItemCofins: Boolean;
begin
  with Qr_Cofins do
  Begin
    Active := False;
    ParamByName('order_item_id').AsInteger := Qr_Items.FieldByName('item_id')
      .AsInteger;
    ParamByName('order_id').AsInteger := Qr_Items.FieldByName('tb_order_id')
      .AsInteger;
    ParamByName('institution_id').AsInteger :=
      Qr_Items.FieldByName('tb_institution_id').AsInteger;
    Active := True;
    FetchAll;
    First;
  End;
end;

function TSM.openItemPis: Boolean;
begin
  with Qr_Pis do
  Begin
    Active := False;
    ParamByName('order_item_id').AsInteger := Qr_Items.FieldByName('item_id')
      .AsInteger;
    ParamByName('order_id').AsInteger := Qr_Items.FieldByName('tb_order_id')
      .AsInteger;
    ParamByName('institution_id').AsInteger :=
      Qr_Items.FieldByName('tb_institution_id').AsInteger;
    Active := True;
    FetchAll;
    First;
  End;
end;

function TSM.openItemIcms: Boolean;
BEgin
  with Qr_Icms do
  Begin
    Active := False;
    ParamByName('order_item_id').AsInteger := Qr_Items.FieldByName('item_id')
      .AsInteger;
    ParamByName('order_id').AsInteger := Qr_Items.FieldByName('tb_order_id')
      .AsInteger;
    ParamByName('institution_id').AsInteger :=
      Qr_Items.FieldByName('tb_institution_id').AsInteger;
    Active := True;
    FetchAll;
    First;
  End;
End;

function TSM.openItemIi: Boolean;
begin
  with Qr_II do
  Begin
    Active := False;
    ParamByName('order_item_id').AsInteger := Qr_Items.FieldByName('item_id')
      .AsInteger;
    ParamByName('order_id').AsInteger := Qr_Items.FieldByName('tb_order_id')
      .AsInteger;
    ParamByName('institution_id').AsInteger :=
      Qr_Items.FieldByName('tb_institution_id').AsInteger;
    Active := True;
    FetchAll;
    First;
  End;
end;

function TSM.openItemIpi: Boolean;
begin
  with Qr_Ipi do
  Begin
    Close;
    ParamByName('order_item_id').AsInteger := Qr_Items.FieldByName('item_id')
      .AsInteger;
    ParamByName('order_id').AsInteger := Qr_Items.FieldByName('tb_order_id')
      .AsInteger;
    ParamByName('institution_id').AsInteger :=
      Qr_Items.FieldByName('tb_institution_id').AsInteger;
    Active := True;
    FetchAll;
    First;
  End;
end;

function TSM.openItemSerie: Boolean;
Var
  SqlTxt: String;
Begin
  {
    with Qr_Serie_Produto do
    Begin
    Close;
    sql.Clear;
    SqlTxt := 'SELECT * FROM TB_SERIE_PRODUTO ';

    if Qr_invoice.FieldByName('NFL_TIPO').AsAnsiString = 'SI' then
    SqlTxt := concat(SqlTxt, 'WHERE SRP_CODSAI=:SRP_CODSAI  ')
    else
    if (Qr_Invoice.FieldByName('NFL_TIPO').AsAnsiString = 'EI') then
    SqlTxt := concat(SqlTxt, ' WHERE SRP_CODENT=:SRP_CODENT  ')
    else
    SqlTxt := concat(SqlTxt, 'WHERE 1<>1  ');
    sql.Add(SqlTxt);
    End;
  }
end;

function TSM.openMailing(Grupo: String; Entity: Integer): Boolean;
begin
  with Qr_Email do
  Begin
    Active := False;
    ParamByName('description').Value := Grupo;
    ParamByName('entity_id').Value := Entity;
    Active := True;
    FetchAll;
  End;
end;

function TSM.openPerson(destinatario: Integer): Boolean;
begin
  with Qr_Person do
  Begin
    Active := False;
    ParamByName('person_id').AsInteger := destinatario;
    Active := True;
    FetchAll;
    Result := (recordcount > 0);
    TipoPessoa := 'F';
  End;
end;

function TSM.openSocialMedia(Tipo: String; Entity: Integer): Boolean;
begin
  with Qr_Midia_Social do
  Begin
    Active := False;
    ParamByName('kind').Value := Tipo;
    ParamByName('entity_id').Value := Entity;
    Active := True;
    FetchAll;
  End;
end;

function TSM.openCarrier(Carrier: Integer): Boolean;
begin
  with Qr_Transportadora do
  Begin
    Close;
    ParamByName('entity_id').AsInteger := Carrier;
    Active := True;
    FetchAll;
    First;
  End;
end;

function TSM.OpenTributacao: Boolean;
Var
  Lc_Sub_Trib: String;
begin
  Result := True;
  // Busca a Tributação
  // Verifica se é contribuinte do ICMS
  // It_Contribuinte_ICMS := (Length(Trim(Qr_Pedido.FieldByName('EMP_INSC_EST').AsString))>0);
  // Neste Momento o sistema verifica se o cliente ignorar a S.T do Produto
  with Qr_Tributacao do
  Begin
    Active := False;
    SQL.Clear;
    SQL.Add(concat('Select r.*,c.description desc_cfop ',
      'from tb_tax_ruler r ', '  inner join tb_cfop c ',
      '  on (c.id = r.tb_cfop_id) ',
      'where (tb_institution_id =:tb_institution_id) ',
      '   AND ( ( tb_product_id =:tb_product_id ) OR ( tb_product_id = 0 ) ) ',
      '   AND ( (ncm =:ncm) OR (ncm IS NULL) OR (ncm = '''') ) ',
      '   AND ( origem=:origem ) ', '   AND ( for_icms_st =:for_icms_st ) ',
      '   AND ( for_consumer =:for_consumer ) ', '   AND ( crt =:crt ) ',
      '   AND ( direction =:direction ) ',
      '   AND ( transaction_kind =:transaction_kind) '));

    if ParameToInvoice.Cfop <> '' then
      SQL.Add(' and ( tb_cfop_id =:tb_cfop_id )');

    if (Qr_Emitente.FieldByName('tb_state_id').AsInteger = Qr_Destinatario.FieldByName('tb_state_id').AsInteger) then
      SQL.Add('AND ( tb_state_id =:tb_state_id ) ')
    else
      SQL.Add('AND ( (tb_state_id =:tb_state_id) or (tb_state_id = 0) OR (tb_state_id IS NULL) )');

    SQL.Add(' Order By ncm DESC ');

    ParamByName('tb_institution_id').AsInteger := ParameToInvoice.Emitente;
    ParamByName('tb_product_id').AsInteger := Qr_Items.FieldByName('prod_id')
      .AsInteger;
    ParamByName('ncm').AsString := Qr_Items.FieldByName('ncm').AsString;
    ParamByName('origem').AsString := Qr_Items.FieldByName('source').AsString;
    ParamByName('for_icms_st').AsString := Qr_Items.FieldByName('st').AsString;
    if (Qr_Customer.FieldByName('consumer').AsString <> '') then
      ParamByName('for_consumer').AsString :=
        Qr_Customer.FieldByName('consumer').AsString
    else
      ParamByName('for_consumer').AsString := 'N';
    if (Qr_Company.FieldByName('crt').AsString <> '') then
      ParamByName('crt').AsString := Qr_Company.FieldByName('crt').AsString
    else
      ParamByName('crt').AsString := '3';
    ParamByName('direction').AsString := ParameToInvoice.DirecaoOperacao;
    if ParameToInvoice.Cfop <> '' then
      ParamByName('transaction_kind').AsString := '0'
    else
      ParamByName('transaction_kind').AsString :=
        Qr_Items.FieldByName('kind_tributary').AsString;

    if ParameToInvoice.Cfop <> '' then
      ParamByName('tb_cfop_id').AsString := ParameToInvoice.Cfop;

    ParamByName('tb_state_id').AsInteger := Qr_Destinatario.FieldByName
      ('tb_state_id').AsInteger;

    Active := True;
    FetchAll;
  End;
end;

procedure TSM.fillDanfeInfNfe(Tipo: String; nfide: TinfNFe);
Begin
  with nfide do
  Begin
    if Tipo = 'Conferência' then
    Begin
      ID := '1';
    End
    else
    Begin
      ID := NF.Nota.Registro.Numero;
    End;
  End;
End;

procedure TSM.fillDanfeItemsProdInfoAdic(Det: TDetCollection);
Begin
  with Det[idxItemNota], Qr_Lote do
  Begin
    infAdProd := Qr_Items.FieldByName('note').AsAnsiString;
    /// / Informação de Lote
    // Active := False;
    // ParamByName('MLT_CODVCL').AsInteger :=  Qr_items.FieldByName('ITF_CODIGO').AsInteger;
    // ParamByName('MLT_TIPO').AsAnsiString := 'VENDA';
    // Active := True;
    // FetchAll;
    // First;
    // if recordcount > 0 then
    // begin
    // Qr_lote_Produzido.Active := False;
    // Qr_lote_Produzido.ParamByName('CLT_CODIGO').AsInteger :=  FieldByName('CLT_CODIGO').AsInteger;
    // Qr_lote_Produzido.Active := True;
    // infAdProd := concat('Lote  : ', Qr_lote.FieldByName('CLT_NUMERO').AsString , ' | ',
    // 'Data Fabricação: ', Qr_lote_Produzido.FieldByName('MLT_DATA').AsAnsiString,' | ',
    // 'Data Validade  : ',FieldByName('CLT_DT_VENCIMENTO').AsAnsiString
    // );
    // end;
  End;
End;

procedure TSM.fillDanfeItemsProdSerie(Det: TDetCollection);
Begin
  {
    with Det[idxItemNota],Qr_Serie_Produto do
    Begin
    Active := False;
    IF Qr_Invoice.FieldByName('NFL_TIPO').AsAnsiString = 'SI' then
    ParamByName('SRP_CODSAI').AsInteger := Qr_Items.FieldByName('ITF_CODIGO').AsInteger;

    IF Qr_Invoice.FieldByName('NFL_TIPO').AsAnsiString = 'EI' then
    ParamByName('SRP_CODENT').AsInteger := Qr_Items.FieldByName('ITF_CODIGO').AsInteger;
    Active := True;
    FetchAll;
    First;
    if recordcount > 0 then
    begin
    if (Trim(infAdProd) = '') then
    infAdProd := concat( infAdProd,FieldByName('SRP_DESCRICAO').AsString )
    else
    infAdProd := concat( ' | ' , infAdProd,FieldByName('SRP_DESCRICAO').AsString )
    end;
    End;
  }
End;

procedure TSM.fillDanfeObservation;
Var
  I: Integer;
  LcObs: String;
begin
  with Qr_InvoiceObs, Nfe.NotasFiscais[0].Nfe do
  Begin
    InfAdic.infCpl := '';
    while not Eof do
    Begin
      if bof then
        LcObs := FieldByName('obs').AsString
      else
        LcObs := concat(';', FieldByName('obs').AsString);
      Next;
    end;
    InfAdic.infCpl := LcObs;
  end;
end;

procedure TSM.fillDanfePayment;
begin
  {
    // Verifica se é uma NF de Saida
    if (Qr_Nota.FieldByName('NFL_TIPO').AsAnsiString = 'SI') or
    (Qr_Nota.FieldByName('NFL_TIPO').AsAnsiString = 'SC') then
    Begin

    // Caso seja um ajuste marcaremos como outros, se for venda sera modificada mais à frente
    Ide.indPag := ipOutras;
    if Qr_Nota.FieldByName('PED_TIPO').AsAnsiString = '1' then
    Begin
    if (It_Tipo_Operacao = 'NFC-e') then
    Begin
    if Fc_VerificaServico(It_Cd_Nota) then
    Begin
    //quando não tiver financeiro
    with pag.Add do // PAGAMENTOS apenas para NFC-e
    begin
    tPag := fpDinheiro;
    vPag := Qr_Nota.FieldByName('NFL_VL_TL_NOTA').asfloat - Qr_Nota.FieldByName('NFL_VL_TL_SRV').AsCurrency;
    end;
    End
    else
    Begin
    Qr_Financeiro.Active := False;
    Qr_Financeiro.ParamByName('FIN_CODNFL').AsInteger := Qr_Nota.FieldByName('NFL_CODIGO').AsInteger;
    Qr_Financeiro.Active := True;
    Qr_Financeiro.FetchAll;
    Qr_Financeiro.First;
    Fr_Principal.Nfe.DANFE.vTroco := 0;
    if not Qr_Financeiro.IsEmpty then
    Begin
    while not Qr_Financeiro.Eof do
    Begin
    with pag.Add do // PAGAMENTOS apenas para NFC-e
    begin
    tPag := StrToFormaPagamento(Lc_Ok,Qr_Financeiro.FieldByName('FPT_TIPO_NFCE').AsAnsiString);
    vPag := Qr_Financeiro.FieldByName('FIN_VL_PARCELA').asfloat;
    //Zera o valor de troco, para setar novamente se for dinheiro
    if (Qr_Financeiro.FieldByName('FPT_DESCRICAO').AsAnsiString = 'DINHEIRO') then
    Begin
    Fr_Principal.Nfe.DANFE.vTroco := ValorTroco;
    Ide.indPag := ipVista;
    //vTroco := ValorTroco;
    End;
    tpIntegra := tiPagNaoIntegrado;

    //Verificando campos para integração dos pagamentos
    //tpIntegra := tiPagIntegrado;
    //CNPJ := '07742094000113';
    //tBand.bcVisa;
    //cAut := '';
    end;
    Qr_Financeiro.Next;
    end;
    End;
    end
    End
    else
    Begin
    if (Copy(Qr_Nota.FieldByName('PED_PRAZO').AsAnsiString, 1, 3) = '000')then
    Ide.indPag := ipVista
    else // verifica prazo
    Ide.indPag := ipPrazo;

    // Exemplos de como carregar as faturas
    If (DM.Qr_Nf_Eletronica.FieldByName('NFE_DFE_FAT').AsAnsiString = 'S') then
    Begin
    Cobr.Fat.nFat := IntToStr(It_Nr_Nota);
    // Qr_Nota.FieldByName('NFL_NUMERO').AsAnsiString;
    Cobr.Fat.vOrig := Qr_Nota.FieldByName('NFL_VL_TL_PROD').asfloat;
    Cobr.Fat.vDesc := Qr_Nota.FieldByName('PED_VL_DESCONTO').asfloat;
    Cobr.Fat.vLiq := Qr_Nota.FieldByName('NFL_VL_TL_NOTA').asfloat - Qr_Nota.FieldByName('NFL_VL_TL_SRV').AsCurrency;
    end;

    // Exemplos de como carregar as duplicatas
    If (DM.Qr_Nf_Eletronica.FieldByName('NFE_DFE_DUP').AsAnsiString = 'S') then
    Begin
    if (  ( Copy(Qr_Nota.FieldByName('PED_PRAZO').AsAnsiString, 1, 3) = '000') and
    ( Fc_Tb_Geral('L','NFE_OCUL_PAG_AVISTA','S') = 'N') ) or
    ( Copy(Qr_Nota.FieldByName('PED_PRAZO').AsAnsiString, 1, 3) <> '000')then
    Begin
    Qr_Financeiro.Active := False;
    Qr_Financeiro.ParamByName('FIN_CODNFL').AsInteger := Qr_Nota.FieldByName('NFL_CODIGO').AsInteger;
    Qr_Financeiro.Active := True;
    Qr_Financeiro.FetchAll;
    Qr_Financeiro.First;
    if not Qr_Financeiro.IsEmpty then
    Begin
    while not Qr_Financeiro.Eof do
    Begin
    with Cobr.Dup.Add do
    Begin
    nDup := Qr_Financeiro.FieldByName('FIN_NUMERO').AsAnsiString;
    dVenc := Qr_Financeiro.FieldByName('FIN_DT_VENCIMENTO').AsDateTime;
    vDup := Qr_Financeiro.FieldByName('FIN_VL_PARCELA').asfloat;
    end;
    Qr_Financeiro.Next;
    end;
    end;
    end;
    end;
    end;
    End;
    end
    else // Verificaçã de saida
    Begin
    end; // Verificaçã de saida
  }
end;

procedure TSM.fillDanfeTotalizador;
Var
  I: Integer;
  LcOk: Boolean;
begin
  with Nfe.NotasFiscais[0].Nfe do
  Begin
    with Total.ICMSTot do
    Begin
      For I := 0 to (Det.Count - 1) do
      Begin
        if (Det.Items[I].Prod.IndTot = StrToindTot(LcOk, '1')) then
          vProd := vProd + Det.Items[I].Prod.vProd;
        vBC := vBC + Det.Items[I].Imposto.ICMS.vBC;
        vICMS := vICMS + Det.Items[I].Imposto.ICMS.vICMS;
        vBCST := vBCST + Det.Items[I].Imposto.ICMS.vBCST;
        vST := vST + Det.Items[I].Imposto.ICMS.vICMSST;
        vDesc := vDesc + Det.Items[I].Prod.vDesc;
        vFrete := vFrete + Det.Items[I].Prod.vFrete;
        vSeg := vSeg + Det.Items[I].Prod.vSeg;
        vOutro := vOutro + Det.Items[I].Prod.vOutro;
        vII := vII + Det.Items[I].Imposto.II.vII;
        vIPI := vIPI + Det.Items[I].Imposto.IPI.vIPI;
        vPIS := vPIS + Det.Items[I].Imposto.PIS.vPIS;
        vCOFINS := vCOFINS + Det.Items[I].Imposto.COFINS.vCOFINS;
        vFCPUFDest := vFCPUFDest + Det.Items[I].Imposto.ICMSUFDest.vFCPUFDest;
        vICMSUFDest := vICMSUFDest + Det.Items[I]
          .Imposto.ICMSUFDest.vICMSUFDest;
        vICMSUFRemet := vICMSUFRemet + Det.Items[I]
          .Imposto.ICMSUFDest.vICMSUFRemet;
        vTotTrib := vTotTrib + Det.Items[I].Imposto.vTotTrib;
      end;
    End;

    if NotaServicoConjugada then
    Begin
      with Total.ISSQNtot do
      Begin
        vServ := 0;
        vBC := 0;
        vISS := 0;
        vISSRet := 0;
        vDeducao := 0;
        For I := 0 to (Det.Count - 1) do
        Begin
          IF (Det.Items[I].Prod.IndTot = StrToindTot(LcOk, '2')) then
          Begin
            vServ := vServ + Det.Items[I].Imposto.ISSQN.vBC + Det.Items[I]
              .Imposto.ISSQN.vDeducao;
            vBC := vBC + Det.Items[I].Imposto.ISSQN.vBC;
            vISS := vISS + Det.Items[I].Imposto.ISSQN.vISSQN;
            vISSRet := vISSRet + Det.Items[I].Imposto.ISSQN.vISSRet;
            vDeducao := vDeducao + Det.Items[I].Imposto.ISSQN.vDeducao;
            dCompet := NF.Nota.Registro.Data_emissao;
          end;
        end;
      end;
    end;
    Total.ICMSTot.vNF :=  NF.Nota.Registro.Valor;
  end;
end;

procedure TSM.finishedCancellationNF;
Var
  Lc_Verificacao: Integer;
  Lc_nfl_tipo: String;
Begin
  //Este Cancelamento efetua o canelamento de outras operações vinculadas
  //ApagaMovimFinanceiro
  //ApagaFinanceiro
  //ApagaComissao
  //ExtornaCustoCompra
  //Retornodevolucao - Devolução modelo Genio
  //AtualizaSeries
  //AtualizarItensDevolucao
  //ApagaDespachoMercadoria
  //Pc_DeletaParcelamento(It_Cd_Pedido);

  MsgCallBack('Cancelamento Nfe', 'ESTOQUE ATUALIZADO');
  NF.MovimentoEstoque.Registro.Estabelecimento := NF.Registro.Estabelecimento;
  NF.MovimentoEstoque.Registro.Ordem := NF.Registro.Codigo;
  NF.MovimentoEstoque.deletebyOrder;
  MsgCallBack('Cancelamento Nfe', 'CANCELAMENTO FINALIZADO');
end;

procedure TSM.fillDanfeCarrier;
Var
  LcOk: Boolean;
begin
  with Qr_Transportadora, Nfe.NotasFiscais[0].Nfe do
  Begin
    if not IsEmpty then
    begin
      Transp.Transporta.CNPJCPF := FieldByName('cnpjcpf').AsAnsiString;
      IF Length(Trim(FieldByName('cnpjcpf').AsAnsiString)) = 14 then
        Transp.Transporta.IE := FieldByName('ierg').AsAnsiString;
      Transp.Transporta.xNome :=
        Copy(FieldByName('name_company').AsAnsiString, 1, 60);
      Transp.Transporta.xEnder := FieldByName('street').AsAnsiString + ', ' +
        FieldByName('nmbr').AsAnsiString;
      Transp.Transporta.xMun := FieldByName('city_desc').AsAnsiString;
      Transp.Transporta.UF := UpperCase(FieldByName('state').AsAnsiString);
    end;
  end;
end;

procedure TSM.fillDanfeItemsProdDetalharST(Det: TDetCollection);
Var
  Lc_Aux: String;
  valor: Real;
Begin
  // with Det[idxItemNota],Qr_Icms_ST do
  // Begin
  // //if (Fc_Tb_Geral('L', 'PRO_G_DET_ST_NFE', 'N') = 'S') then
  // Active := False;
  // ParamByName('tb_order_item_id').AsInteger   := Qr_Items.FieldByName('id').AsInteger;
  // ParamByName('tb_order_id').AsInteger        := Qr_Items.FieldByName('tb_order_id').AsInteger;
  // ParamByName('tb_institution_id').AsInteger  := Qr_Items.FieldByName('tb_institution_id').AsInteger;
  // Active := True;
  // FetchAll;
  // if (recordcount > 0) then
  // Begin
  // Valor := ((FieldByName('mva').asfloat - 1) * 100);
  // Lc_Aux := concat('MVA: ',       FloatToStrF(valor, ffFixed,10, 2) , '%',' | ',
  // 'BCST: R$ ',   FloatToStrF(FieldByName('base_value_st').asfloat, ffFixed, 10, 2),' | ',
  // 'ICMS ST: R$ ',FloatToStrF(FieldByName('value_st').asfloat, ffFixed, 10, 2)
  // );
  // if (Trim(infAdProd) = '') then
  // infAdProd := Lc_Aux
  // else
  // infAdProd := infAdProd + ' | ' + Lc_Aux;
  // end;
  // End;
End;

procedure TSM.fillDanfeItemsProdImportacao(Det: TDetCollection);
Var
  Lc_Aux: String;
  valor: Real;
Begin
  // with Det[idxItemNota],Qr_DI do
  // Begin
  // Active := False;
  // ParamByName('DIM_CODITF').AsInteger := Qr_Items.FieldByName('ITF_CODIGO').AsInteger;
  // Active := True;
  // FetchAll;
  // First;
  // if recordcount > 0 then
  // Begin
  // while not Eof do
  // Begin
  // with Prod.DI.Add do
  // Begin
  // nDi         := concat(FieldByName('DIM_NUMERO').AsAnsiString,
  // FieldByName('DIM_DIV').AsAnsiString);
  // dDi         := FieldByName('DIM_DATA').AsDateTime;
  // xLocDesemb  := FieldByName('DIM_LOCAL_DESEMB').AsString;
  // dDesemb     := FieldByName('DIM_DT_DESEMB').AsDateTime;
  // UFDesemb    := FieldByName('UFE_SIGLA').AsAnsiString;
  // cExportador := FieldByName('DIM_CODEXP').AsAnsiString;
  // // Incluir as adições para cada DI
  // Qr_DI_Adicao.Active := False;
  // Qr_DI_Adicao.ParamByName('ADC_CODDIM').AsInteger := FieldByName('DIM_CODIGO').AsInteger;
  // Qr_DI_Adicao.Active := True;
  // Qr_DI_Adicao.FetchAll;
  // Qr_DI_Adicao.First;
  // while not Qr_DI_Adicao.Eof do
  // Begin
  // with adi.Add do
  // Begin
  // nAdicao := Qr_DI_Adicao.FieldByName('ADC_NUMERO').AsInteger;
  // nSeqAdi := Qr_DI_Adicao.FieldByName('ADC_SEQUENCIA').AsInteger;
  // cFabricante := Qr_DI_Adicao.FieldByName('ADC_CODFAB').AsAnsiString;
  // vDescDI := Qr_DI_Adicao.FieldByName('ADC_VL_DESC').asfloat;
  // end;
  // Qr_DI_Adicao.Next;
  // end;
  // end;
  // Qr_DI.Next;
  // end;
  // end;
  // End;
End;

procedure TSM.fillDanfeItemsIcms(Imposto: TImposto);
Var
  LcOk: Boolean;
Begin
  with Imposto.ICMS, Qr_Icms do
  Begin
    // Origem da Mercadoria
    orig := StrToOrig(LcOk, Qr_Icms.FieldByName('origem').AsString);
    // Codigo de Regime Tributario 1/2 - Simples nacional e 3 Regime normal
    modBC := StrTomodBC(LcOk, FieldByName('determ_base').AsString);
    // Inicializa as variaveis
    CST := cstVazio;
    vBC := 0;
    pICMS := 0;
    pRedBC := 0;
    vICMS := 0;
    vBCSTRet := 0;
    vICMSSTRet := 0;
    pMVAST := 0;
    pRedBCST := 0;
    vBCST := 0;
    pICMSST := 0;
    vICMSST := 0;
    if (Qr_Emitente.FieldByName('crt').AsInteger = 3) then
    Begin
      // Regime Tributario normal
      fillDanfeItemsIcmsRN(Imposto);
    end
    else
    Begin
      // Regime do Simples Nacional
      fillDanfeItemsIcmsSN(Imposto);
    end;
  End;
End;

procedure TSM.fillDanfeItemsIcmsRN(Imposto: TImposto);
Var
  LcOk: Boolean;
Begin
  with Imposto.ICMS, Qr_Icms do
  Begin
    // Define o Codigo de situação tributaria
    CST := StrToCSTICMS(LcOk, FieldByName('cst').AsString);

    // Tributação do ICMS - 00 - Tributada Integralmente
    // Tributação do ICMS - 10 - Tributada e com cobrança do ICMS por substituição tributária
    // Tributação do ICMS – 20 - Com redução de base de cálculo
    // Tributação do ICMS – 30 - Isenta ou não tributada e com cobrança do ICMS por substituição tributária
    // Tributação do ICMS – 40 - Isenta
    // Tributação do ICMS – 41 - Não tributada
    // Tributação do ICMS – 50 - Suspensão
    // Tributação do ICMS – 51 - Diferimento  A exigência do preenchimento das informações do ICMS diferido fica a critério de cada UF.
    // Tributação do ICMS – 60 - ICMS cobrado anteriormente por substituição tributária
    // Tributação do ICMS - 70 - Com redução de base de cálculo e  cobrança do ICMS por substituição tributária
    // Tributação do ICMS - 90 – Outros

    // ICMS Normal
    vBC := FieldByName('base_value').AsFloat;
    pICMS := FieldByName('aliq').AsCurrency;
    pRedBC := FieldByName('aliq_rd').AsCurrency;
    vICMS := FieldByName('value').AsFloat;
    if (CST = cst10) or (CST = cst30) or (CST = cst70) then
    Begin
      // ICMS Normal S.T
      modBCST := StrTomodBCST(LcOk, FieldByName('determ_base_st').AsString);
      pMVAST := FieldByName('mva').AsFloat;
      pRedBCST := FieldByName('aliq_rd_base_st').AsFloat;
      vBCST := FieldByName('base_value_st').AsFloat;
      pICMSST := FieldByName('aliq_st').AsFloat;
      vICMSST := FieldByName('value_st').AsFloat;
    end;

    if FieldByName('discharge').AsInteger > 0 then
    Begin
      vICMS := FieldByName('value').AsFloat;;
      motDesICMS := StrTomotDesICMS(LcOk, FieldByName('discharge')
        .AsAnsiString);
    end;
  End;
End;

procedure TSM.fillDanfeItemsIcmsSN(Imposto: TImposto);
Var
  LcOk: Boolean;
Begin
  with Imposto.ICMS, Qr_Icms do
  Begin
    CSOSN := StrToCSOSNIcms(LcOk, FieldByName('cst').AsString);
    pCredSN := RoundTo(Qr_Icms.FieldByName('cred_calc_aliq').AsFloat, -2);
    // Alíquota aplicável de cálculo do crédito (Simples Nacional).
    vCredICMSSN := RoundTo(Qr_Icms.FieldByName('cred_expl_value').AsFloat, -2);
    // Valor crédito do ICMS que pode ser aproveitado nos termos do art. 23 da LC 123 (Simples Nacional)
    // 101 - Tributação do ICMS pelo SIMPLES NACIONAL com permissão de credito
    // 102 - Tributação do ICMS pelo SIMPLES NACIONAL sem permissão de creduti
    // 103
    // 300
    // 400
    // 201 - Tributada pelo Simples Nacional com permissão de crédito e com cobrança do ICMS por Substituição Tributária v.2.0)
    // 202 - Tributada pelo Simples Nacional sem permissão de  crédito e com cobrança do ICMS por Substituição Tributária
    // 203 - Isenção do ICMS nos Simples Nacional para faixa de receita bruta e com cobrança do ICMS por Substituição Tributária  (v.2.0)
    // 500 – ICMS cobrado anteriormente por substituição tributária (substituído) ou por antecipação (v.2.0)
    // 900 - Tributação do ICMS pelo SIMPLES NACIONAL
    if (CSOSN = csosn201) or (CSOSN = csosn202) OR (CSOSN = csosn203) or
      (CSOSN = csosn900) then
    Begin
      // ICMS Normal S.T
      modBCST := StrTomodBCST(LcOk, FieldByName('determ_base_st').AsString);
      pMVAST := FieldByName('mva').AsFloat;
      pRedBCST := FieldByName('aliq_rd_base_st').AsFloat;
      vBCST := FieldByName('base_value_st').AsFloat;
      pICMSST := FieldByName('aliq_st').AsFloat;
      vICMSST := FieldByName('value_st').AsFloat;
    end;
  End;
End;

procedure TSM.fillDanfeItemsIcmsUFDestino(Det: TDetCollection);
Var
  LcOk: Boolean;
  Lc_Aq_Icms_Partilha: Real;
Begin
  with Nfe.NotasFiscais[0].Nfe, Det[idxItemNota], Qr_Icms do
  Begin
    // NA. Item / ICMS para a UF de Destino
    if (Ide.modelo = 55) and (Ide.tpNF = tnSaida) and
      (Ide.idDest = doInterestadual) and (Ide.indFinal = cfConsumidorFinal) and
      (Dest.indIEDest = inNaoContribuinte) and (Ide.finNFe <> fnDevolucao) then
    Begin
      with Imposto do
      Begin
        // Valor da BC do ICMS na UF de destino
        ICMSUFDest.vBCUFDest := (Prod.qTrib * Prod.vUnTrib) - Prod.vDesc +
          (Prod.vFrete + Prod.vSeg + Prod.vOutro);
        // Alíquota interna da UF de destino
        ICMSUFDest.pICMSUFDest := AliqIcmsST;
        // Alíquota interestadual das UF envolvidas - Desativei para manter o padrao programado
        // ICMSUFDest.pICMSInter := DM.Qr_Uf_Mva_NCM.FieldByname('UFE_ALIQ_INT_EST').AsFloat;
        // Verifica se a origem do produto é importada
        if ((ICMS.orig = oeEstrangeiraImportacaoDireta) or
          (ICMS.orig = oeEstrangeiraAdquiridaBrasil) or
          (ICMS.orig = oeEstrangeiraImportacaoDiretaSemSimilar) or
          (ICMS.orig = oeEstrangeiraAdquiridaBrasilSemSimilar)) then
        Begin
          ICMSUFDest.pICMSInter := 4;
        End
        else
        Begin
          // 7% para os Estados de origem do Sul e Sudeste (exceto ES), destinado para os Estados do Norte, Nordeste, Centro-Oeste e Espírito Santo;
          if ((Emit.EnderEmit.UF = 'RS') or (Emit.EnderEmit.UF = 'SC') or
            (Emit.EnderEmit.UF = 'PR') or (Emit.EnderEmit.UF = 'SP') or
            (Emit.EnderEmit.UF = 'RJ') or (Emit.EnderEmit.UF = 'MG')) and
            ((Dest.EnderDest.UF = 'AC') or (Dest.EnderDest.UF = 'AP') or
            (Dest.EnderDest.UF = 'AM') or (Dest.EnderDest.UF = 'PA') or
            (Dest.EnderDest.UF = 'RO') or (Dest.EnderDest.UF = 'RR') or
            (Dest.EnderDest.UF = 'TO') or (Dest.EnderDest.UF = 'AL') or
            (Dest.EnderDest.UF = 'BA') or (Dest.EnderDest.UF = 'CE') or
            (Dest.EnderDest.UF = 'MA') or (Dest.EnderDest.UF = 'PB') or
            (Dest.EnderDest.UF = 'PE') or (Dest.EnderDest.UF = 'PI') or
            (Dest.EnderDest.UF = 'RN') or (Dest.EnderDest.UF = 'SE') or
            (Dest.EnderDest.UF = 'ES') or (Dest.EnderDest.UF = 'DF') or
            (Dest.EnderDest.UF = 'GO') or (Dest.EnderDest.UF = 'MT') or
            (Dest.EnderDest.UF = 'MS')) Then
          Begin
            ICMSUFDest.pICMSInter := 7;
          End
          else
          Begin
            ICMSUFDest.pICMSInter := 12;
          End;
        End;
        // Calcula a Diferença  entre a alíquota interna do Estado destinatário e a alíquota interestadual;
        Lc_Aq_Icms_Partilha := ICMSUFDest.pICMSUFDest - ICMSUFDest.pICMSInter;
        // Percentual do ICMS relativo ao Fundo de Combate à Pobreza (FCP) na UF de destino
        ICMSUFDest.pFCPUFDest := AliqCombPobreza;
        // Percentual de ICMS Interestadual para a UF de destino: - 40% em 2016; - 60% em 2017; - 80% em 2018; - 100% a partir de 2019.
        ICMSUFDest.pICMSInterPart := 60.00;
        // Valor do ICMS relativo ao Fundo de Combate à Pobreza (FCP) da UF de destino
        ICMSUFDest.vFCPUFDest :=
          RoundTo((ICMSUFDest.vBCUFDest * ICMSUFDest.pFCPUFDest) / 100, -2);
        // Valor do ICMS Interestadual para a UF de destino
        ICMSUFDest.vICMSUFDest :=
          RoundTo(((ICMSUFDest.vBCUFDest * Lc_Aq_Icms_Partilha) / 100), -2);
        ICMSUFDest.vICMSUFDest := RoundTo(ICMSUFDest.vICMSUFDest * 0.60, -2);
        // Valor do ICMS Interestadual para a UF do remetente
        if (Emit.CRT <> crtRegimeNormal) then
        Begin
          ICMSUFDest.vICMSUFRemet :=
            RoundTo(((ICMSUFDest.vBCUFDest * Lc_Aq_Icms_Partilha) / 100), -2);
          ICMSUFDest.vICMSUFRemet :=
            RoundTo((ICMSUFDest.vICMSUFRemet + ICMSUFDest.vFCPUFDest) *
            0.60, -2);
        end
        else
        Begin
          ICMSUFDest.vICMSUFRemet := 0;
          ICMSUFDest.vICMSUFRemet := 0;
        end;
      end;
    End;
  End;
End;

procedure TSM.fillDanfeItemsIi(Imposto: TImposto);
begin
  with Qr_II, Imposto do
  Begin
    if not IsEmpty then
    begin
      II.vBC := FieldByName('base_value').AsFloat;
      II.vDespAdu := FieldByName('customs_expense').AsFloat;
      II.vII := FieldByName('tag_value').AsFloat;
      II.vIOF := FieldByName('iof_value').AsFloat;
    end;
  End;

end;

procedure TSM.fillDanfeItemsIpi(Imposto: TImposto);
Var
  LcOk: Boolean;
begin
  // Define a Situação tributária do IPI COM ISENTA PARA NA SEQUENCIA FOR SETADA AS VARIAVEIS SE HOUVER
  with Qr_Ipi, Imposto do
  Begin
    if not IsEmpty then
    begin
      // Define a Situação Tributaria do IPI
      IPI.CST := StrToCSTIPI(LcOk, FieldByName('cst').AsAnsiString);
      IPI.cEnq := '109';
      // Tabela a ser criada pela RFB, informar 999 enquanto a tabela não for criada
      if (IPI.CST = ipi00) or (IPI.CST = ipi49) or (IPI.CST = ipi50) or
        (IPI.CST = ipi99) then
      Begin
        if (Qr_Ipi.FieldByName('aliq_value').AsCurrency > 0) then
        Begin
          IPI.vBC := FieldByName('base_value').AsCurrency;
          IPI.pIPI := FieldByName('aliq_value').AsCurrency;
          IPI.vIPI := FieldByName('unit_value').AsCurrency;
        end
        else
        Begin
          IPI.qUnid := FieldByName('unit_qtty').AsCurrency;
          IPI.vUnid := FieldByName('unit_value').AsCurrency;
        end;
      END;
    end;
  End;
end;

procedure TSM.fillDanfeItemsIssqn(Imposto: TImposto);
begin
  {
    if It_Nf_Conjugada then
    Begin
    // valores do ISSQN
    Qr_Issqn.Close;
    Qr_Issqn.ParamByName('ITF_CODIGO').AsInteger := Qr_Itens.FieldByName('ITF_CODIGO').AsInteger;
    Qr_Issqn.Active := True;
    Qr_Issqn.FetchAll;
    Qr_Issqn.First;
    Imposto.ISSQN.cSitTrib := ISSQNcSitTribVazio;
    if not Qr_Issqn.IsEmpty then
    begin
    Imposto.ISSQN.vBC := Qr_Issqn.FieldByName('ISS_VL_BC').asfloat;
    Imposto.ISSQN.vDeducao := Qr_Itens.FieldByName('ITF_VL_DESC').asfloat;
    Imposto.ISSQN.vAliq := Qr_Issqn.FieldByName('ISS_AQ_NR').asfloat;
    Imposto.ISSQN.vISSQN := Qr_Issqn.FieldByName('ISS_VL_NR').asfloat;
    Imposto.ISSQN.cMunFG := Qr_Issqn.FieldByName('ISS_MUN_IBGE').AsInteger;
    Imposto.ISSQN.cListServ := Qr_Issqn.FieldByName('ISS_LST_SRV').AsAnsiString;
    Imposto.ISSQN.vISSRet := Qr_Issqn.FieldByName('ISS_VL_RET').asfloat;
    if Imposto.ISSQN.vISSRet > 0 then
    ISSQN.indISSRet := StrToindISSRet(Lc_Ok, '1')
    else
    ISSQN.indISSRet := StrToindISSRet(Lc_Ok, '2');
    ISSQN.indISS := StrToindISS(Lc_Ok,IntToStr(StrToIntdef(Qr_Nota.FieldByName('CLI_ISS_EXIGIB').AsAnsiString, 0) + 1));
    ISSQN.cServico := Qr_Itens.FieldByName('ITF_CODPRO').AsAnsiString;
    ISSQN.cMunFG := Qr_Nota.FieldByName('CDD_IBGE').AsInteger;

    ISSQN.cPais := Qr_Nota.FieldByName('END_PAIS').AsInteger;

    ISSQN.nProcesso := Qr_Nota.FieldByName('CLI_ISS_NR_PROCESSO').AsAnsiString;

    if (Qr_Nota.FieldByName('CLI_ISS_IND_INC_FISCAL').AsAnsiString = 'S') then
    ISSQN.indIncentivo := StrToindIncentivo(Lc_Ok, '1')
    else
    ISSQN.indIncentivo := StrToindIncentivo(Lc_Ok, '2');
    end;
    end;
  }
end;

procedure TSM.fillDanfeItemsPis(Imposto: TImposto);
Var
  LcOk: Boolean;
begin
  // Define a Situação tributária do IPI COM ISENTA PARA NA SEQUENCIA FOR SETADA AS VARIAVEIS SE HOUVER
  with Qr_Pis, Imposto do
  Begin
    // Define a Situação tributária do PISPIS COM ISENTA PARA NA SEQUENCIA FOR SETADA AS VARIAVEIS SE HOUVER
    PIS.CST := pis07;
    PIS.vBC := 0;
    PIS.pPIS := 0;
    PIS.vPIS := 0;
    if not IsEmpty then
    begin
      // Define a Situação tributária do PISPIS
      PIS.CST := StrToCSTPIS(LcOk, FieldByName('cst').AsAnsiString);
      if (PIS.CST = pis01) OR (PIS.CST = pis02) then
      Begin
        PIS.vBC := FieldByName('base_value').AsFloat;
        PIS.pPIS := FieldByName('aliq_value').AsFloat;
        PIS.vPIS := FieldByName('tag_value').AsFloat;
      end;
      if (PIS.CST = pis03) then
      Begin
        PIS.qBCProd := FieldByName('qt_sale_qtty').AsFloat;
        PIS.vAliqProd := FieldByName('qt_aliq_value').AsFloat;
        PIS.vPIS := FieldByName('tag_value').AsFloat;
      end;
      if (PIS.CST = pis99) then
      Begin
        if (FieldByName('base_value').AsFloat > 0) then
        Begin
          PIS.vBC := FieldByName('base_value').AsFloat;
          PIS.pPIS := FieldByName('aliq_value').AsFloat;
        end
        else
        Begin
          PIS.qBCProd := FieldByName('qt_sale_qtty').AsFloat;
          PIS.vAliqProd := FieldByName('qt_aliq_value').AsFloat;
        end;
        PIS.vPIS := FieldByName('tag_value').AsFloat;
      end;
    end;
  End;
end;

procedure TSM.fillDanfeItemsProd(Det: TDetCollection);
Var
  Lc_Aux: String;
Begin
  with Det[idxItemNota], Qr_Items do
  Begin
    Prod.nItem := ItemNota; // Número do item (1-990)
    Prod.cProd := FieldByName('identifier').AsAnsiString;
    Prod.xProd := FieldByName('description').AsAnsiString;
    Prod.NCM := FieldByName('ncm').AsAnsiString;
    if not(Nfe.NotasFiscais[0].Nfe.Ide.modelo = 65) then
    Begin
      // Processo B2B - Para informar o numero do pedido de Compra
      // if Trim(FieldByName('ITF_COMPRA').AsAnsiString) <> '' then
      // Begin
      // Prod.xPed := FieldByName('ITF_COMPRA').AsAnsiString;
      // Prod.nItemPed := FieldByName('ITF_ITEM_COMPRA') .AsAnsiString;
      // end;
    end;
    Prod.CEST := FieldByName('cest').AsAnsiString;
    Prod.uCom := FieldByName('uCom').AsAnsiString;
    // Unidade Comercial
    Prod.qCom := FieldByName('quantity').AsFloat;
    // Quantidade Comercial
    Prod.vUnCom := FieldByName('unit_value').AsFloat;
    // Valor Unitário de comercialização
    Prod.vProd := RoundTo((Prod.qCom * Prod.vUnCom), -2);
    // Valor Total Bruto dos Produtos ou
    Prod.qTrib := FieldByName('quantity').AsFloat;
    // Quantidade Tributável
    Prod.vUnTrib := FieldByName('unit_value').AsFloat;
    // Valor Unitário de tributação
    Prod.uTrib := FieldByName('uCom').AsAnsiString;
    // Unidade Tributável
    Prod.vDesc := FieldByName('discount_value').AsFloat;
    // Valor do Desconto
    Prod.vFrete := Qr_Icms.FieldByName('freight_value').AsFloat;
    Prod.vSeg := Qr_Icms.FieldByName('insurance_Value').AsFloat;
    Prod.vOutro := Qr_Icms.FieldByName('expenses_value').AsFloat;
    Prod.Cfop := Qr_Icms.FieldByName('tb_cfop_id').AsString;
    Prod.IndTot := itSomaTotalNFe;
  End;
End;

procedure TSM.fillDanfeItems;
Var
  Lc_Nr_Item: Integer;
  Lc_Aux: String;
begin
  // Tabelas que devem ser abertas para dar suporte ao preenchimento dos itens
  openItemSerie;
  // Pega Aliquota interna, caso precise para utilizar nos items
  getAliqIcmsST;

  with Qr_Items, Nfe.NotasFiscais[0].Nfe do
  Begin
    First;
    ItemNota := 0;
    idxItemNota := 0;
    while not Eof do
    begin
      // Sequencia de itens da Nota - Não é o indice
      inc(ItemNota);
      with Det.Add do
      Begin
        // Abre a Tabelas de apoio
        openItemIcms;
        openItemIpi;
        openItemIi;
        openItemPis;
        openItemCofins;
        // Preeche dados dos produtos
        fillDanfeItemsProd(Det);
        // Observação do produto no campo adiconal
        fillDanfeItemsProdInfoAdic(Det);
        // Informação de Série do Produto no campo adiconal
        fillDanfeItemsProdSerie(Det);
        // Detalhar a ST  no campo adiconal
        fillDanfeItemsProdDetalharST(Det);
        { ==========================  Tag da Declaração de Importação =========================== }
        fillDanfeItemsProdImportacao(Det);
        { ==========================  J - Detalhamento Específico de Veículos novos =========================== }
        { ==========================  K - Detalhamento Específico de Medicamento e de matérias-primas farmacêuticas ========================== }
        { ==========================  L - Detalhamento Específico de Armamentos =============================== }
        { ==========================  L1 - Detalhamento Específico de Combustíveis ============================ }
        { ==========================  M - Tributos incidentes no Produto ou Serviço =========================== }
        { ========================== N - ICMS Normal e ST =================================================== }
        fillDanfeItemsIcms(Imposto);
        // Informações de ICMS para UF de DEstino
        fillDanfeItemsIcmsUFDestino(Det);
        { ========================== O - Imposto sobre Produtos Industrializados ============================ }
        fillDanfeItemsIpi(Imposto);
        { ========================== P - Imposto de Importação ============================================== }
        fillDanfeItemsIi(Imposto);
        { ========================== Q – PIS ================================================================ }
        fillDanfeItemsPis(Imposto);
        { ========================== R – PIS ST ============================================================= }
        { ========================== S – COFINS ============================================================= }
        fillDanfeItemsCofins(Imposto);
        { ========================== T - COFINS ST ========================================================== }
        { ========================== U - ISSQN ============================================================== }
        fillDanfeItemsIssqn(Imposto);
      end;
      Next;
      inc(idxItemNota);
    end;
  end;
end;

procedure TSM.fillDanfeItemsCofins(Imposto: TImposto);
Var
  LcOk: Boolean;
begin
  // Define a Situação tributária do IPI COM ISENTA PARA NA SEQUENCIA FOR SETADA AS VARIAVEIS SE HOUVER
  with Qr_Cofins, Imposto do
  Begin
    // Define a Situação tributária do COFINS COM ISENTA PARA NA SEQUENCIA FOR SETADA AS VARIAVEIS SE HOUVER
    COFINS.CST := cof07;
    COFINS.vBC := 0;
    COFINS.pcofins := 0;
    COFINS.vCOFINS := 0;
    if not IsEmpty then
    begin
      // Define a Situação tributária do COFINS
      COFINS.CST := StrToCSTCOFINS(LcOk, FieldByName('cst').AsAnsiString);
      if (COFINS.CST = cof01) OR (COFINS.CST = cof02) then
      Begin
        COFINS.vBC := FieldByName('base_value').AsFloat;
        COFINS.pcofins := FieldByName('aliq_value').AsFloat;
        COFINS.vCOFINS := FieldByName('tag_value').AsFloat;
      end;
      if (COFINS.CST = cof03) then
      Begin
        COFINS.qBCProd := FieldByName('qt_sale_qtty').AsFloat;
        COFINS.vAliqProd := FieldByName('qt_aliq_value').AsFloat;
        COFINS.vCOFINS := FieldByName('tag_value').AsFloat;
      end;
      if (COFINS.CST = cof99) then
      Begin
        if (FieldByName('base_value').AsFloat > 0) then
        Begin
          COFINS.vBC := FieldByName('base_value').AsFloat;
          COFINS.pcofins := FieldByName('aliq_value').AsFloat;
        end
        else
        Begin
          COFINS.qBCProd := FieldByName('qt_sale_qtty').AsFloat;
          COFINS.vAliqProd := FieldByName('qt_aliq_value').AsFloat;
        end;
        COFINS.vCOFINS := FieldByName('tag_value').AsFloat;
      end;
    end;
  End;
end;

procedure TSM.fillDanfeEmit(Tipo: String; nfemit: TEmit);
Var
  Lc_Aux: String;
  LcOk: Boolean;
begin
  with Qr_Emitente, nfemit do
  Begin
    CNPJCPF := FieldByName('cnpj').AsAnsiString;
    xNome := Copy(FieldByName('name_company').AsAnsiString, 1, 60);
    xFant := Copy(FieldByName('nick_trade').AsAnsiString, 1, 60);
    EnderEmit.xLgr := Copy(FieldByName('street').AsAnsiString, 1, 60);
    EnderEmit.nro := FieldByName('nmbr').AsAnsiString;
    EnderEmit.xCpl := FieldByName('complement').AsAnsiString;
    EnderEmit.xBairro := FieldByName('neighborhood').AsAnsiString;
    EnderEmit.cMun := FieldByName('ibge').AsInteger;
    EnderEmit.xMun := FieldByName('city_desc').AsAnsiString;
    EnderEmit.UF := FieldByName('state').AsAnsiString;
    EnderEmit.CEP := FieldByName('zip_code').AsInteger;
    EnderEmit.cPais := FieldByName('tb_country_id').AsInteger;
    EnderEmit.xPais := FieldByName('country_desc').AsAnsiString;;
    EnderEmit.fone := MaskFone(FieldByName('phone').AsAnsiString);
    // Inscrição estadual
    Lc_Aux := FieldByName('ie').AsAnsiString;
    Lc_Aux := RemoveCaracterInformado(Lc_Aux, ['.', ',', '/', '-', ' ']);
    IE := Lc_Aux;
    CRT := StrToCRT(LcOk, FieldByName('crt').AsString);
    // Verifica se há valor de icms de substituição e se há registro de Inscrição de susbtituição
    if (NF.Registro.ValorIcmsSt > 0) then
      IEST := getInscrSubstTributario;
  End;
end;

procedure TSM.fillDanfeForeignTrade;
begin
  with Qr_Emitente, Nfe.NotasFiscais[0].Nfe.exporta do
  Begin
    // CFOP de Exportação (inicia por 7)
    if (Copy(NF.Nota.Registro.Cfop, 1, 1) = '7') then
    Begin
      UFembarq := FieldByName('UFE_SIGLA').AsAnsiString;
      xLocEmbarq := FieldByName('CDD_DESCRICAO').AsAnsiString;
    end;
  End;
end;

procedure TSM.fillDanfeShipping;
Var
  LcOk: Boolean;
  Lc_Aux: String;
begin
  with Qr_InvoiceShipping, Nfe.NotasFiscais[0].Nfe.Transp do
  Begin
    modFrete := StrTomodFrete(LcOk, FieldByName('tb_freight_mode_id').AsString);
    if Trim(FieldByName('vehicle_plaque').AsAnsiString) <> '' then
    begin
      Lc_Aux := FieldByName('vehicle_plaque').AsAnsiString;
      Lc_Aux := RemoveCaracterInformado(Lc_Aux, ['.', ',', '/', '-', ' ']);
      veicTransp.placa := Lc_Aux;
      veicTransp.UF := UpperCase(FieldByName('state_plaque').AsAnsiString);
      veicTransp.RNTC := FieldByName('rntc_plaque').AsAnsiString;
    end;

    if (FieldByName('total_qtty').AsInteger > 0) then
    Begin
      with Vol.Add do
      begin
        qVol := FieldByName('total_qtty').AsInteger;
        esp := FieldByName('sort_tag').AsAnsiString;
        marca := FieldByName('brand_tag').AsAnsiString;
        pesoL := StrToFloatDef(FieldByName('net_weight').AsString, 0);
        pesoB := StrToFloatDef(FieldByName('gross_weight').AsString, 0);
        nVol := FieldByName('volume_number').AsAnsiString;
        // Lacres.Add.nLacre := '';
      end;
    end;
  End;
end;

procedure TSM.fillDanfeIde(Tipo: String; nfide: TIde);
Var
  Lc_Time_Str: String;
  LcOk: Boolean;
Begin
  with  nfide do
  Begin
    if NF.Nota.Cfop.Registro.Direcao = 'E' then
      tpNF := tnEntrada
    else
      tpNF := tnSaida;

    if Tipo = 'Conference' then
    Begin
      nNF := 1;
      cNF := 1;
    End
    else
    Begin
      nNF := StrToIntDef(NF.Nota.Registro.Numero,0);
      cNF := nNF;
    End;
    natOp := Copy(NF.Nota.Cfop.Registro.Descricao , 1, 60);
    modelo := StrToIntDef(NF.Nota.Registro.Modelo,55);
    serie := StrToIntDef(NF.Nota.Registro.Serie,1);

    dEmi := NF.Nota.Registro.Data_emissao + NF.Registro.HoraSaida;
    if Trim(DateToStr(NF.Registro.DataSaida)) <> '' then
    Begin
      dSaiEnt := NF.Registro.DataSaida + NF.Registro.HoraSaida;
      hSaiEnt := NF.Registro.HoraSaida;
    end;
    verProc := '2.0.1.8';
    cMunFG := Qr_Emitente.FieldByName('ibge').AsInteger;
    cUF := Qr_Emitente.FieldByName('tb_state_id').AsInteger;
    tpEmis := teNormal;
    if (tpEmis <> teNormal) then
    BEgin
      dhCont := Now;
      xJust := 'Serviço paralisado - Longo Prazo';
    end;
    // Indica operação com Consumidor final E B01 N 1-1 1 0=Não; 1=Consumidor final;
    if (Qr_Customer.FieldByName('consumer').AsString = 'S') then
      indFinal := cfConsumidorFinal
    else
      indFinal := cfNao;

    case NF.Registro.IndicacaoPresenca of
      1:indPres := pcPresencial;
      2:indPres := pcInternet;
      3:indPres := pcTeleatendimento;
      4:indPres := pcEntregaDomicilio;
      5:indPres := pcOutros;
    else
      indPres := pcPresencial;
    end;
    case StrToIntDef(NF.Nota.Registro.Finalidade,1) of
      1:finNFe := fnNormal;
      2:finNFe := fnComplementar;
      3:finNFe := fnAjuste;
      4:finNFe := fnDevolucao;
    end;
    if (Qr_Emitente.FieldByName('tb_country_id').AsInteger = 1058) then
    Begin
      if (Qr_Emitente.FieldByName('state')
        .AsString = Qr_Destinatario.FieldByName('state').AsString) then
        idDest := doInterna
      else
        idDest := doInterestadual;
    end
    else
    Begin
      idDest := doExterior;
    end;

  end;
End;

function TSM.fillDanfe(Tipo: String): String;
Begin
  with Nfe.NotasFiscais[0].Nfe do
  begin
    openDestinatario(NF.Nota.Registro.Destinatario);
    if not openCompany(NF.Nota.Registro.Destinatario) then
      openPerson(NF.Nota.Registro.Destinatario);
    openCustomer(NF.Nota.Registro.Destinatario);

    openInvoiceObservation(Qr_Emitente.FieldByName('id').AsInteger,
                            NF.Nota.Registro.Codigo);
    { ========================== A - Dados da Nota Fiscal eletrônica ========================================== }
    // Componente está tratando
    { ========================== B - Identificação da Nota Fiscal eletrônica ================================== }
    fillDanfeInfNfe(Tipo, infNFe);
    fillDanfeIde(Tipo, Ide);
    FillDanfeDocRefer(Ide);
    { ========================== C - Identificação do Emitente da Nota Fiscal eletrônica ========================== }
    fillDanfeEmit(Tipo, Emit);
    { ========================== D - Identificação do Fisco Emitente da NF-e ================================ }
    { ========================== E - Identificação do Destinatário da Nota Fiscal eletrônica ========================== }
    fillDanfeDest(Tipo, Dest);
    { ========================== F - Identificação do Local de Retirada ===================================== }
    { ========================== G - Identificação do Local de Entrega ====================================== }
    FillDanfeDeliveryLocal(Entrega);
    { ========================== Preparação para preecnher os items ====================================== }
    // Carrega os itens da Nota
    openItemList(NF.Registro.Estabelecimento, NF.Registro.Codigo);
    // Define Quantas Casas Decimais para o Valor
    DefineDecimalPointValue;
    // Define Quantas Casas Decimais para a Quantidade
    DefineDecimalPointQtty;
    // Define o Tamanho do campo do codigo de Produtos
    DefineSizeProductField;
    { ========================== H - Detalhamento de Produtos e Serviços da NF-e ============================ }
    { ========================== I - Produtos e Serviços da NF-e ============================================ }
    fillDanfeItems;
    { ========================== V - Informações adicionais ============================================= }
    // tratado na tag I - Produtos e Serviços da NF-e
    { ========================== W - Valores Totais da NF-e ================================================= }
    // TAG de grupo de Valores Totais referentes ao ICMS
    fillDanfeTotalizador;
    { ========================== X - Informações do Transporte da NF-e ====================================== }
    openInvoiceShipping(NF.Registro.Estabelecimento, NF.Registro.Codigo);

    fillDanfeShipping;
    openCarrier(Qr_InvoiceShipping.FieldByName('tb_carrier_id').AsInteger);
    fillDanfeCarrier;
    { ========================== Y – Dados da Cobrança ====================================================== }
    fillDanfePayment;
    { ========================== Z - Informações Adicionais da NF-e ========================================= }
    fillDanfeObservation;
    { ========================== ZA - Informações de Comércio Exterior ====================================== }
    fillDanfeForeignTrade;
    { ========================== ZB - Informações de Compras ================================================ }
    { ========================== ZC - Informações do Registro de Aquisição de Cana ========================== }
    { ========================== ZZ - Informações da Assinatura Digital ===================================== }
  end;
end;

procedure TSM.FillDanfeDeliveryLocal(ent: TEntrega);
begin
  // O sql da nota precisa estar vinculado ao endereço principal para poder diferenciar do endereço de entrega...15/05/2015
  if openDeliveryLocal(NF.Registro.Estabelecimento, NF.Registro.Codigo) then
  begin
    with ent, Qr_DeliveryLocal do
    begin
      CNPJCPF := FieldByName('cnpj').AsAnsiString;
      xLgr := FieldByName('street').AsAnsiString;
      nro := FieldByName('nmbr').AsAnsiString;
      xCpl := FieldByName('complement').AsAnsiString;
      xBairro := FieldByName('neighborhood').AsAnsiString;
      cMun := FieldByName('ibge').AsInteger;
      xMun := FieldByName('city_desc').AsAnsiString;
      UF := FieldByName('state').AsAnsiString;
    end;
  end;

end;

procedure TSM.fillDanfeDest(Tipo: String; nfdest: TDest);
begin
  with nfdest, Qr_Destinatario do
  Begin
    if Qr_Company.recordcount > 0 then
    Begin
      if (Qr_Destinatario.FieldByName('tb_country_id').AsInteger <> 1058) then
      Begin
        idEstrangeiro := Qr_Company.FieldByName('ie').AsAnsiString
      End
      else
      Begin
        CNPJCPF := Qr_Company.FieldByName('cnpj').AsAnsiString;
        IE := Qr_Company.FieldByName('ie').AsAnsiString
      End;
      case StrToIntDef(Qr_Company.FieldByName('ind_ie_destinatario')
        .AsString, 0) of
        0:
          Begin
            indIEDest := inContribuinte;
            IE := Qr_Company.FieldByName('ie').AsAnsiString
          end;
        1:
          indIEDest := inIsento;
        2:
          indIEDest := inNaoContribuinte;
      else
        indIEDest := inIsento;
      end;
    end
    else
    Begin
      CNPJCPF := Qr_Person.FieldByName('cpf').AsAnsiString;
      indIEDest := inNaoContribuinte;
    end;
    xNome := Copy(concat(FieldByName('id').AsAnsiString, ' - ',
      FieldByName('name_company').AsAnsiString), 1, 60);
    EnderDest.CEP := FieldByName('zip_code').AsInteger;
    EnderDest.cPais := FieldByName('tb_country_id').AsInteger;
    EnderDest.xPais := FieldByName('country_desc').AsAnsiString;
    EnderDest.UF := FieldByName('state').AsAnsiString;
    EnderDest.cMun := FieldByName('ibge').AsInteger;
    EnderDest.xMun := FieldByName('city_desc').AsAnsiString;
    EnderDest.xLgr := FieldByName('street').AsAnsiString;
    EnderDest.nro := FieldByName('nmbr').AsAnsiString;
    EnderDest.xCpl := FieldByName('complement').AsAnsiString;
    EnderDest.xBairro := FieldByName('neighborhood').AsAnsiString;
    EnderDest.fone := MaskFone(FieldByName('phone').AsAnsiString);
  end;
end;

procedure TSM.FillDanfeDocRefer(nfide: TIde);
begin
  {
    with nfide do
    Begin
    NFref.Add;
    NFref.Items[0].refNFe := '';
    End;
  }
end;

procedure TSM.saveInvoice;
Var
  LcNF:Integer;
begin
  WITH NF.Nota.Registro, Nfe.NotasFiscais.Items[0].Nfe DO
  Begin
    Codigo          := ParameToInvoice.Ordem;
    Estabelecimento := ParameToInvoice.Estabelecimento;
    Emitente        := ParameToInvoice.Emitente;
    if ParameToInvoice.Tipo = 'E' then
    Begin
      TipoEmissao   := 'EE'
    End
    else
    Begin
      TipoEmissao   := 'SI';
    End;
    // (fnNormal, fnComplementar, fnAjuste, fnDevolucao);
    if (pos('DEVOLUCAO', UpperCase(Qr_Tributacao.FieldByName('desc_cfop').AsString)) > 0) or
      (pos('DEVOLUÇÃO', UpperCase(Qr_Tributacao.FieldByName('desc_cfop').AsString)) > 0) then
    begin
      Finalidade    := '4';
    end
    else
    Begin
      Finalidade    := '1';
    end;
    LcNF := StrToIntDef(ParameToInvoice.NumeroManual,0);
    if (LcNF > 0 ) then
    Begin
      Numero := StrZero(LcNF,6,0);
    End
    else
    Begin
      Numero := '';
    End;
    serie := '1';
    Cfop := ParameToInvoice.Cfop;
    Destinatario := ParameToInvoice.destinatario;
    Data_emissao := ParameToInvoice.DataEmissao;
    valor := Total.ICMSTot.vNF;
    modelo := ParameToInvoice.ModeloNFe;
    Observacao := ParameToInvoice.Observacao;
    // Determina como pendente, para o caso de travar e precisar de tratamento
    Status := 'P';
  end;
  NF.Nota.save;
end;

procedure TSM.SaveInvoiceItems;
Var
  I: Integer;
Begin

  for I := 0 to (Nfe.NotasFiscais[0].Nfe.Det.Count - 1) do
  Begin
    WITH NF.PedidoItens.Registro, Nfe.NotasFiscais[0].Nfe DO
    Begin
      NF.PedidoItens.Registro.Codigo := Det[I].Prod.nItem;
      NF.PedidoItens.Registro.ordem := ParameToInvoice.Ordem;
      NF.PedidoItens.Registro.Estabelecimento := ParameToInvoice.Estabelecimento;
      NF.PedidoItens.getByKey;
      // Grava os impostos
      SaveInvoiceItemsIcms(I);
      SaveInvoiceItemsIpi(I);
      SaveInvoiceItemsPis(I);
      SaveInvoiceItemsCofins(I);
      SaveInvoiceItemsII(I);
      // Atualizar Estoque
      updateStock(I);
    end;
  End;
end;

procedure TSM.SaveInvoiceItemsCofins(idx: Integer);
Begin
  WITH Nfe.NotasFiscais.Items[0].Nfe DO
  Begin
    with Det.Items[idx].Imposto.COFINS do
    Begin
      IF (vBC > 0) then
      Begin
        WITH NF.PedidoItensCofins do
        Begin
          with Registro DO
          Begin
            ItemOrdem := NF.PedidoItens.Registro.Codigo;
            Ordem     := NF.PedidoItens.Registro.Ordem;
            Estabelecimento := NF.PedidoItens.Registro.Estabelecimento;
            Registro.CST := CSTCOFINSToStr(Det.Items[idx].Imposto.COFINS.CST);
            ValorBase := vBC;
            ValorAliquota := pcofins;
            Valor := vCOFINS;
            QuantVendas := qBCProd;
            QuantValorAliquota := vAliqProd;
          End;
          NF.PedidoItensCofins.save;
        End;
      end;
    end;
  end;
end;

procedure TSM.SaveInvoiceItemsIcms(idx: Integer);
vAR
  Lc_CST: String;
  Lc_CSOSN: String;
Begin
  // Ajusta o Indice para percorrer a Nota
  WITH Nfe.NotasFiscais.Items[0].Nfe do
  Begin
    with Det.Items[idx] DO
    Begin
      // Trata as Variaveis do CFOP
      Lc_CST := CSTICMSToStr(Imposto.ICMS.CST);
      Lc_CSOSN := CSOSNIcmsToStr(Imposto.ICMS.CSOSN);

      WITH NF.PedidoItensIcms.Registro DO
      Begin
        ItemOrdem := NF.PedidoItens.Registro.Codigo;
        Ordem := NF.PedidoItens.Registro.Ordem;
        Estabelecimento := NF.PedidoItens.Registro.Estabelecimento;
        Origem := OrigToStr(Imposto.ICMS.orig);
        if (Trim(Lc_CST) <> '') then
          CST := Lc_CST
        else
          CST := Lc_CSOSN;
        DetermincaoBase := modBCToStr(Imposto.ICMS.modBC);
        DetermincaoBaseST := modBCSTToStr(Imposto.ICMS.modBCST);
        Desoneracao := StrtoInt(motDesICMSToStr(Imposto.ICMS.motDesICMS));
        AliqReducaoBase := Imposto.ICMS.pRedBC;
        ValorBase := Imposto.ICMS.vBC;
        Aliquota := Imposto.ICMS.pICMS;
        ReducaoAliquota := 0;
        valor := Imposto.ICMS.vICMS;
        AliqReducaoBaseST := Imposto.ICMS.pRedBCST;
        ValorBaseST := Imposto.ICMS.vBCST;
        AliquotaST := Imposto.ICMS.pICMSST;
        ReducaoAliquotaST := 0;
        ValorST := Imposto.ICMS.vICMSST;
        MVA := Imposto.ICMS.pMVAST;
        ValorBaseRetido := 0;
        ValorRetido := 0;
        ValorBaseRetidoST := Imposto.ICMS.vBCSTRet;
        ValorRetidoST := Imposto.ICMS.vICMSSTRet;
        Aliquota_CalcCred := 0;
        Valor_CredExpl := 0;
        ValorFrete := Prod.vFrete;
        ValorSeguro := Prod.vSeg;
        ValorDespesas := Prod.vOutro;
        Cfop := Prod.Cfop;
      end;
      NF.PedidoItensIcms.save;
    end;
  End;
end;

procedure TSM.SaveInvoiceItemsII(idx: Integer);
begin
  WITH Nfe.NotasFiscais.Items[0].Nfe DO
  Begin
    with Det.Items[idx].Imposto.II do
    Begin
      IF (vBC > 0) then
      Begin
        WITH NF.PedidoItensII do
        Begin
          with Registro DO
          Begin
            ItemOrdem := NF.PedidoItens.Registro.Codigo;
            Ordem     := NF.PedidoItens.Registro.Ordem;
            Estabelecimento := NF.PedidoItens.Registro.Estabelecimento;
            ValorBase := vBC;
            Despesas := vDespAdu;
            Valor := vII;
            ValorIOF := vIOF;
          End;
          NF.PedidoItensII.save;
        End;
      end;
    end;
  end;
end;

procedure TSM.SaveInvoiceItemsIpi(idx: Integer);
BEgin
  // Ajusta o Indice para percorrer a Nota
  WITH Nfe.NotasFiscais.Items[0].Nfe DO
  Begin
    with Det.Items[idx].Imposto.IPI do
    Begin
      IF (vBC > 0) then
      Begin
        WITH NF.PedidoItensIpi do
        Begin
          with Registro DO
          Begin
            ItemOrdem := NF.PedidoItens.Registro.Codigo;
            Ordem     := NF.PedidoItens.Registro.Ordem;
            Estabelecimento := NF.PedidoItens.Registro.Estabelecimento;
            Registro.CST := CSTIPIToStr(Det.Items[idx].Imposto.IPI.CST);
            Classe_Frame := clEnq;
            CnpjFabricante := CnpjFabricante;
            Selo_ctrl := cSelo;
            Selo_Quant := qSelo;
            Classe_FrameCode := cEnq;
            ValorBase := vBC;
            ValorAliquota := pIPI;
            QuantUnidade := qUnid;
            ValorUnitario := vIPI;
          End;
          NF.PedidoItensIpi.save;
        End;
      end;
    end;
  end;
end;

procedure TSM.SaveInvoiceItemsPis(idx: Integer);
Begin
  WITH Nfe.NotasFiscais.Items[0].Nfe DO
  Begin
    with Det.Items[idx].Imposto.PIS do
    Begin
      IF (vBC > 0) then
      Begin
        WITH NF.PedidoItensPis do
        Begin
          with Registro DO
          Begin
            ItemOrdem := NF.PedidoItens.Registro.Codigo;
            Ordem     := NF.PedidoItens.Registro.Ordem;
            Estabelecimento := NF.PedidoItens.Registro.Estabelecimento;
            Registro.CST := CSTPISToStr(Det.Items[idx].Imposto.PIS.CST);
            ValorBase := vBC;
            ValorAliquota := pPIS;
            Valor := vPIS;
            QuantVendas := qBCProd;
            QuantValorAliquota := vAliqProd;
          End;
          NF.PedidoItensPis.save;
        End;
      end;
    end;
  end;
end;

procedure TSM.saveInvoiceMerchandise;
begin
  WITH NF.Registro, Nfe.NotasFiscais.Items[0].Nfe DO
  Begin
    Codigo := ParameToInvoice.Ordem;
    Estabelecimento := ParameToInvoice.Estabelecimento;
    DataSaida := ParameToInvoice.DataSaida;
    HoraSaida := time;
    ValorBaseICMS := Total.ICMSTot.vBC;
    ValorICMS := Total.ICMSTot.vICMS;
    ValorBaseIcmsSt := Total.ICMSTot.vBCST;
    ValorIcmsSt := Total.ICMSTot.vST;
    ValorTotal := Total.ICMSTot.vProd;
    ValorFrete := Total.ICMSTot.vFrete;
    ValorSeguro := Total.ICMSTot.vSeg;
    ValorDespesas := Total.ICMSTot.vOutro;
    ValorIpi := Total.ICMSTot.vIPI;
    IndicacaoPresenca := 1;
    QuantidadeTotal := ParameToInvoice.NotaEntrega.Quantidade;
  End;
  NF.save;
end;

procedure TSM.saveInvoiceShipping;
begin
  // Atualiza Transportador e modal Frete
  with NF.Entrega.Registro do
  Begin
    Codigo := ParameToInvoice.Ordem;
    Estabelecimento := ParameToInvoice.Estabelecimento;
    Transportadora := ParameToInvoice.Transportadora;
    ModalidadeFrete := IntToStr(ParameToInvoice.ModalFrete);
  End;
  NF.Entrega.UpdateModalCarrier;

  WITH NF.NotaEntrega.Registro, Nfe.NotasFiscais.Items[0].Nfe DO
  Begin
    if (ParameToInvoice.NotaEntrega.Quantidade > 0) then
    Begin
      Codigo := ParameToInvoice.Ordem;
      Estabelecimento := ParameToInvoice.Estabelecimento;
      Quantidade := ParameToInvoice.NotaEntrega.Quantidade;
      Classificacao := ParameToInvoice.NotaEntrega.Classificacao;
      marca := ParameToInvoice.NotaEntrega.marca;
      PesoBruto := ParameToInvoice.NotaEntrega.PesoBruto;
      PesoLiquido := ParameToInvoice.NotaEntrega.PesoLiquido;
      NumeroVolume := ParameToInvoice.NotaEntrega.NumeroVolume;
      PlacaVeiculo := ParameToInvoice.NotaEntrega.PlacaVeiculo;
      PlacaEstado := ParameToInvoice.NotaEntrega.PlacaEstado;
      PlacaRntc := ParameToInvoice.NotaEntrega.PlacaRntc;
      NF.NotaEntrega.save;
    end;
  End;
end;


procedure TSM.SaveObservation;
begin
  if Trim(ParameToInvoice.Observacao) <> '' then
  Begin
    with NF.Observacao.Registro do
    Begin
      Codigo := ParameToInvoice.Ordem;
      Estabelecimento := ParameToInvoice.Estabelecimento;
      NotaFiscal := ParameToInvoice.Ordem;
      Observacao := ParameToInvoice.Observacao;
    End;
    NF.Observacao.insert;
  End;
end;

procedure TSM.SaveReturn55(Retorno:Integer;FileNfe:String);
begin
  with NF.Retorno.Registro do
  Begin
    Codigo := NF.Registro.Codigo;
    Estabelecimento := NF.Registro.Estabelecimento;
    if ( Retorno < 5) and (Retorno > Status) then
      Status := Retorno;
    if (Trim(FileNfe) <> '') then
      NomeArquivo := FileNfe;
  End;
  NF.Retorno.save;
end;

procedure TSM.SendEmail(s: String; Callback: TDBXCallback);
Var
  M: TJSONMarshal;
  jo: TJSONObject;
  jv: TJSONValue;
  unM: TJSONUnMarshal;
  AuxReturn: String;
  Lc_FileDefault: String;
  Lc_FileGestao: String;
  Lc_NF: String;
  Retorno : Integer;
Begin
  try
    FCallback := Callback;
    jo := TJSONObject.Create;
    jv := TJSONObject.ParseJSONValue(s);
    if assigned(jv) then
    Begin
      try
        MsgCallBack('Envio de e-mail', 'INICIANDO A OPERAÇÃO...');
        unM := TJSONUnMarshal.Create;
        ParamNfe := TPrmNfe.Create;
        ParamNfe := (unM.Unmarshal(jv) as TPrmNfe);
        NF := TControllerInvoiceMerchandise.Create(Self);
        Nfe.NotasFiscais.Clear;
        Nfe.NotasFiscais.Add;
        MsgCallBack('Envio de e-mail', 'NOTA SELECIONADA...');
          NF.Registro.Codigo          := ParamNfe.Ordem;
          NF.Registro.Estabelecimento := ParamNfe.Estabelecimento;
          NF.getAllByKey;
        openEmitente(NF.Registro.Estabelecimento);
        getConfigNF55;

        NF.Retorno.Registro.Estabelecimento := NF.Registro.Estabelecimento;
        NF.Retorno.Registro.Codigo := NF.Registro.Codigo;
        NF.Retorno.getByKey;

        // Define o caminho e o arquivo da Nota Fiscal
        Lc_FileDefault := NF.Retorno.Registro.NomeArquivo;
        if (Lc_FileDefault = '')  or (not FileExists(concat(PathLocal,Lc_FileDefault))) then
        Begin
          // Prepara a danfe para a consulta
          Lc_FileDefault := ConferenceDanfe('Envio de e-mail');
          loadComponentNfe(PathLocal, Lc_FileDefault);
          ConsultWebNFe(Lc_FileDefault);
        end
        else
        Begin
          loadComponentNfe(PathLocal, Lc_FileDefault);
        End;
        Lc_FileGestao := PrintNfe(Nfe.NotasFiscais.Items[0].Nfe.Ide.cNF,Lc_FileDefault);
        SetSendEmail(Lc_FileDefault,Lc_FileGestao);
      finally
        FreeAndNil(ParamNfe);
        FreeAndNil(NF);
        FreeAndNil(unM);
      end;
    End
    else
    Begin
      MsgCallBack('Rejeição', 'Problemas na conversão');
    End;
  finally
    FreeAndNil(jv);
    FreeAndNil(jo);
  end;
end;

function TSM.SetConnection: Boolean;
var
   ArquivoIni: TIniFile;
   sArqConfig,
   sDriver,
   sDriverBanco,
   sNomeBanco,
   sServer,
   sUsername,
   sPassword,
   sPublic,
   sDominio,
   sSite  : String;
begin
  try
    sDriver := TUtil.LeIni(STRNG_ARQUIVO_CONFIGURACAO,'Configuracao','DriverBanco');
    if sDriver = '' then begin
      sDriver := 'MySql';
      TUtil.GravaIni(STRNG_ARQUIVO_CONFIGURACAO, 'Configuracao', 'DriverBanco', sDriver);
    end;

    sServer := TUtil.LeIni(STRNG_ARQUIVO_CONFIGURACAO, sDriver,'Server');
    if sServer = '' then begin
      sServer := 'mysql.uzaa.com.br';
      TUtil.GravaIni(STRNG_ARQUIVO_CONFIGURACAO, sDriver, 'Server', sServer);
    end;

    sNomeBanco := TUtil.LeIni(STRNG_ARQUIVO_CONFIGURACAO, sDriver,'Database');
    if sNomeBanco = '' then begin
      sNomeBanco := 'uzaa15';
      TUtil.GravaIni(STRNG_ARQUIVO_CONFIGURACAO, sDriver, 'Database', sNomeBanco);
    end;

    sUsername := TUtil.LeIni(STRNG_ARQUIVO_CONFIGURACAO, sDriver,'User_Name');
    if sUsername = '' then begin
      sUsername := 'uzaa15';
      TUtil.GravaIni(STRNG_ARQUIVO_CONFIGURACAO, sDriver, 'User_Name', sUsername);
    end;

    sPassword := TUtil.LeIni(STRNG_ARQUIVO_CONFIGURACAO, sDriver,'Password');
    if sPassword = '' then begin
      sPassword := 'uz19661803';
      TUtil.GravaIni(STRNG_ARQUIVO_CONFIGURACAO, sDriver, 'Password', sPassword);
    end;

    sDriverBanco := TUtil.LeIni(STRNG_ARQUIVO_CONFIGURACAO, sDriver,'DriverID');
    if sDriverBanco = '' then begin
      sDriverBanco := 'MySql';
      TUtil.GravaIni(STRNG_ARQUIVO_CONFIGURACAO, sDriver, 'DriverID', sDriverBanco);
    end;

    sDominio := TUtil.LeIni(STRNG_ARQUIVO_CONFIGURACAO, 'Diretorios','Dominio');
    if sDominio = '' then begin
      sDominio := STRNG_CAMINHO_DOMAINS;
      TUtil.GravaIni(STRNG_ARQUIVO_CONFIGURACAO, 'Diretorios', 'Dominio', sDominio);
    end;

    sPublic := TUtil.LeIni(STRNG_ARQUIVO_CONFIGURACAO, 'Diretorios','Publico');
    if sPublic = '' then begin
      sPublic := 'S';
      TUtil.GravaIni(STRNG_ARQUIVO_CONFIGURACAO, 'Diretorios', 'Publico', sPublic);
    end;

    sSite := TUtil.LeIni(STRNG_ARQUIVO_CONFIGURACAO, 'HomePage','Site');
    if sSite = '' then begin
      sSite := STRNG_URL_SISTEMA;
      TUtil.GravaIni(STRNG_ARQUIVO_CONFIGURACAO, 'HomePage', 'Site', sSite);
    end;

    //Usuario Desenvolvedor
    if (TUtil.LeIni(STRNG_ARQUIVO_CONFIGURACAO, sDriver,'GENERAL') = '') then begin
      user_dev := False;
      TUtil.GravaIni(STRNG_ARQUIVO_CONFIGURACAO, sDriver, 'GENERAL', 'N');
    end else
      user_dev := TUtil.LeIniBoolean(STRNG_ARQUIVO_CONFIGURACAO, sDriver,'GENERAL');
    //Instsituição padrão
    GbInstitution := TUtil.LeIniInteger(STRNG_ARQUIVO_CONFIGURACAO, sDriver,'institution');
    if GbInstitution = 0 then begin
      GbInstitution := 1;
      TUtil.GravaIni(STRNG_ARQUIVO_CONFIGURACAO, sDriver, 'institution', IntToStr(GbInstitution));
    end;

    UMM.DB.Params.Clear;
    UMM.DB.Params.Add('Server='+sServer);
    UMM.DB.Params.Add('Database='+sNomeBanco);
    UMM.DB.Params.Add('User_Name='+sUsername);
    UMM.DB.Params.Add('Password='+sPassword);
    UMM.DB.Params.Add('DriverID=MySQL');
    UMM.DB.Connected := True;
    Result := True;
  finally
    ArquivoIni.Free;
  end;
end;

procedure TSM.setManifestation(s: String; Callback: TDBXCallback);
Var
  Lc_Lote: Integer;
  LcEvento : TControllerNfeEventsSent;
  M: TJSONMarshal;
  jo: TJSONObject;
  jv: TJSONValue;
  unM: TJSONUnMarshal;

  LC_ULTNSU : String;
  ArqXML : TStringStream;
  XMLDoc: TXMLDocument;
  I : Integer;
  Lc_Path : String;

Begin
  try
    FCallback := Callback;
    LcEvento := TControllerNfeEventsSent.Create(nil);
    jo := TJSONObject.Create;
    jv := TJSONObject.ParseJSONValue(s);
    if assigned(jv) then
    Begin
      MsgCallBack('Manifestação','Iniciando processo de manifestação do destinatário');
      unM := TJSONUnMarshal.Create;
      ParamNfe := TPrmNfe.Create;
      ParamNfe := (unM.Unmarshal(jv) as TPrmNfe);
      GbInstitution := ParamNfe.Estabelecimento;
      openEmitente(GbInstitution);
      getConfigNF55;
      with Nfe do
      Begin
        EventoNFe.Evento.Clear;
        with EventoNFe.Evento.Add do
        begin
          Lc_Lote := StrtoInt(FormatDateTime('yymmddhhmm', NOW));
          infEvento.chNFe := ParamNfe.Chave;
          infEvento.cOrgao := 91;

          infEvento.CNPJ := Qr_Emitente.FieldByName('cnpj').AsString;
          infEvento.dhEvento := NOW; // - StrtoTime('01:00');
          case ParamNfe.Evento of
            210200: infEvento.tpEvento := teManifDestConfirmacao;
            210210: infEvento.tpEvento := teManifDestCiencia;
            210220: infEvento.tpEvento := teManifDestDesconhecimento;
            210240: infEvento.tpEvento := teManifDestOperNaoRealizada;
          end;
          if infEvento.tpEvento = teManifDestOperNaoRealizada then
            infEvento.detEvento.xJust := ParamNfe.Justificativa
          else
            infEvento.detEvento.xJust := '';
        end;
        EnviarEvento(Lc_Lote);
        if WebServices.EnvEvento.EventoRetorno.retEvento.Count > 0 then
        Begin
          with WebServices.EnvEvento.EventoRetorno.retEvento.Items[0].RetInfEvento do
          begin
            {128 Lote de Evento Processado
              135 Evento registrado e vinculado a NF-e
              136 Evento registrado, mas não vinculado a NF-e
              137 Nenhum documento localizado para o Destinatário
              138 Documento localizado para o Destinatário
              139 Pedido de Download processado
              140 Download disponibilizado
              573 Duplicidade de evento }
            IF (cStat = 128) or (cStat = 135) then
            Begin
              MsgCallBack('Manifestação','Gravando o registro do Evento');
              try
                LcEvento.Registro.Codigo            := 0;
                LcEvento.Registro.Estabelecimento   := GbInstitution;
                LcEvento.Registro.Numero            := IntToStr( Lc_Lote );
                LcEvento.Registro.ChaveNFE          := ParamNfe.Chave;
                LcEvento.Registro.Evento            := ParamNfe.Evento;
                LcEvento.Registro.DataEvento        := Now;
                LcEvento.Registro.Sequencia         := '1';
                LcEvento.Registro.Justificativa     := xMotivo;
                LcEvento.Registro.Status            := IntToStr(cStat);
                LcEvento.insert;
              finally
                FreeAndNil(LcEvento);
              end;
            end
            else
            Begin
              MsgCallBack('Manifestação',concat('Código: ',IntToStr(cStat),' - ', 'Retorno: ', XMotivo));
            end;
          end;
        end
        else
        Begin
          MsgCallBack('Manifestação','Não houve retorno do envio do lote');
        End;
      end;
    End;
  finally
    FreeAndNil(jv);
    FreeAndNil(jo);
    FreeAndNil(LcEvento);
  end;
end;

function TSM.setNfeNumber: Boolean;
Var
  Lc_Crt: Integer;
  Lc_Nr_Nota: String;
Begin
  Result := True;
  if StrToIntDef(NF.Nota.Registro.Numero,0) = 0 then
  Begin
    NF.Nota.Registro.Numero := NF.Nota.getNextNfeNumber;
    NF.Nota.setNfeNumber;
  end;
end;

function TSM.setPathLocal: Boolean;
Var
  LcCnpj: String;
begin
  // somente para teste local
  PathLocal :=
    'C:\Domains\gestaosetes.com.br\gestaowebsetes.com.br\public_html\institution\';
  // PEgar o CNPJ
  LcCnpj := Qr_Emitente.FieldByName('cnpj').AsString;
  // Cria Diretorio do CNPJ
  PathLocal := concat(PathLocal, LcCnpj, '\nfe\');
  IF not(DirectoryExists(PathLocal)) then
    ForceDirectories(PathLocal);
  IF not(DirectoryExists(PathLocal)) then
    ForceDirectories(PathLocal);
  UrlSaida := PathLocal;
end;

function TSM.setPathUrlSaida: Boolean;
Var
  LcCnpj: String;
begin
  PathLocal :=
    'C:\Domains\gestaosetes.com.br\gestaowebsetes.com.br\public_html\institution\';
  UrlSaida := 'http://www.gestaowebsetes.com.br/institution/';
  // PEgar o CNPJ
  LcCnpj := Qr_Emitente.FieldByName('cnpj').AsString;
  PathLocal := concat(PathLocal, LcCnpj, '\nfe\');
  UrlSaida := concat(UrlSaida, LcCnpj, '/nfe/');

  IF not(DirectoryExists(PathLocal)) then
    ForceDirectories(PathLocal);
end;

procedure TSM.SetSendEmail(FileXML:String;FilePDf:String);
var
  Lc_I : Integer;
  Lc_TextPart: TIdText;
  LcMailing : TControllerMailing;
  I : Integer;
  Registro : TMailing;
  countEmail : Integer;
begin
  // Configura o Remetente da Mensagem
  with Id_Mail do
  begin
    countEmail := 0;
    Id_Mail.Clear;
    Host := 'setes.com.br';
    SetSSL := False;
    SetTLS := False;
    Username := 'sistemanfe@setes.com.br';
    Password := 'Eqpm20mrdsncdJ16!';
    Port := '587';

    From := 'sistemanfe@setes.com.br';
    FromName := 'Sistema Automático - NF-e';
    //Envia email para a propria empresa
    LcMailing := TControllerMailing.Create(Self);
    LcMailing.Registro.Codigo := NF.Nota.Registro.Emitente;
    LcMailing.getList('nfe');
    for I := 0 to LcMailing.Lista.Count - 1 do
    Begin
      inc(countEmail);
      Registro := LcMailing.Lista[I];
      AddAddress(Registro.Email,'');
    end;
    //Verifica se o cliente Possue email
    LcMailing := TControllerMailing.Create(Self);
    LcMailing.Registro.Codigo := NF.Nota.Registro.Destinatario;
    LcMailing.getList('nfe');
    for I := 0 to LcMailing.Lista.Count - 1 do
    Begin
      inc(countEmail);
      Registro := LcMailing.Lista[I];
      AddAddress(Registro.Email,'');
    end;
    //Verifica se o contador Possue email
    //Verifica se tem transportadora e se tem email
    LcMailing := TControllerMailing.Create(Self);
    LcMailing.Registro.Codigo := NF.Entrega.Registro.Transportadora;
    LcMailing.getList('nfe');
    for I := 0 to LcMailing.Lista.Count - 1 do
    Begin
      inc(countEmail);
      Registro := LcMailing.Lista[I];
      AddAddress(Registro.Email,'');
    end;
    //Verifica se há emails para onde enviar
    if ( countEmail > 0) then
    Begin
      //Assunto
      Subject := 'Envio de NF-e Nº '+ NF.Nota.Registro.Numero;
      IsHTML := True; // define que a mensagem é html
      Body.Append(concat(
                '<html>',
                '<head>',
                '  <meta content="text/html; charset=ISO-8859-1"',
                ' http-equiv="content-type">',
                '</head>',
                '<body>',
                'Ol&aacute;,<br>',
                '<br>',
                'Segue em Anexo, documento referente a NFE do n&uacute;mero: ', NF.Nota.Registro.Numero,
                '<br>',
                '</body>',
                '</html>'
      ));

      //Adiciona Anexo
      AddAttachment(concat(PathLocal,FileXML));
      AddAttachment(concat(PathLocal,FilePDF));
       try
        Id_Mail.Send();
        MsgCallBack('Envio de e-mail', 'e-mail enviado com sucesso!');
      except
        on E : Exception do
          MsgCallBack('Rejeição', E.Message);
      end;
    End;
  end;
End;


procedure TSM.SumValorAproximImposto(Pc_Nfe: TNFe);
Var
  Lc_I: Integer;
Begin
  with Pc_Nfe do
  BEgin
    Total.ICMSTot.vTotTrib := 0;
    For Lc_I := 0 to (Det.Count - 1) do

    Begin

      Total.ICMSTot.vTotTrib := Total.ICMSTot.vTotTrib + Det.Items[Lc_I]
        .Imposto.vTotTrib;

    end;

  end;
end;

procedure TSM.SumValorBaseICMS(Pc_Nfe: TNFe);
Var
  Lc_I: Integer;
Begin
  with Pc_Nfe do
  BEgin
    Total.ICMSTot.vBC := 0;
    For Lc_I := 0 to (Det.Count - 1) do

    Begin

      Total.ICMSTot.vBC := Total.ICMSTot.vBC +
        RoundTo(Det.Items[Lc_I].Imposto.ICMS.vBC, -2);

    end;

    ParameToInvoice.NotaMercadoria.ValorBaseICMS := Total.ICMSTot.vBC;

  end;
end;

procedure TSM.SumValorBaseICMSST(Pc_Nfe: TNFe);
Var
  Lc_I: Integer;
Begin
  with Pc_Nfe do
  BEgin
    Total.ICMSTot.vBCST := 0;
    For Lc_I := 0 to (Det.Count - 1) do

    Begin

      Total.ICMSTot.vBCST := Total.ICMSTot.vBCST + Det.Items[Lc_I]
        .Imposto.ICMS.vBCST;

    end;

    ParameToInvoice.NotaMercadoria.ValorBaseIcmsSt := Total.ICMSTot.vBCST;

  end;
end;

procedure TSM.SumValorCFS(Pc_Nfe: TNFe);
Var
  Lc_I: Integer;
Begin
  with Pc_Nfe do
  BEgin
    Total.ICMSTot.vCOFINS := 0;
    For Lc_I := 0 to (Det.Count - 1) do

    Begin

      Total.ICMSTot.vCOFINS := Total.ICMSTot.vCOFINS + Det.Items[Lc_I]
        .Imposto.COFINS.vCOFINS;

    end;

  end;
end;

procedure TSM.SumValorDesconto(Pc_Nfe: TNFe);
Var
  Lc_I: Integer;
Begin
  // Vou verificar se há a necessidade de salvar este campo em
  with Pc_Nfe do
  BEgin
    Total.ICMSTot.vDesc := 0;
    For Lc_I := 0 to (Det.Count - 1) do

    Begin

      Total.ICMSTot.vDesc := Total.ICMSTot.vDesc + Det.Items[Lc_I].Prod.vDesc;

    end;

    ParameToInvoice.NotaMercadoria.ValorDesc := Total.ICMSTot.vDesc;

  end;
end;

procedure TSM.SumValorFrete(Pc_Nfe: TNFe);
Var
  Lc_I: Integer;
Begin
  with Pc_Nfe do
  BEgin
    Total.ICMSTot.vFrete := 0;
    For Lc_I := 0 to (Det.Count - 1) do

    Begin

      Total.ICMSTot.vFrete := Total.ICMSTot.vFrete + Det.Items[Lc_I]
        .Prod.vFrete;

    end;

    ParameToInvoice.NotaMercadoria.ValorFrete := Total.ICMSTot.vFrete;

  end;
end;

procedure TSM.SumValorICMS(Pc_Nfe: TNFe);
Var
  Lc_I: Integer;
Begin
  with Pc_Nfe do
  BEgin
    Total.ICMSTot.vICMS := 0;
    For Lc_I := 0 to (Det.Count - 1) do

    Begin

      Total.ICMSTot.vICMS := Total.ICMSTot.vICMS + Det.Items[Lc_I]
        .Imposto.ICMS.vICMS;

    end;

    ParameToInvoice.NotaMercadoria.ValorICMS := Total.ICMSTot.vICMS;

  end;
end;

procedure TSM.SumValorICMSST(Pc_Nfe: TNFe);
Var
  Lc_I: Integer;
Begin
  with Pc_Nfe do
  BEgin
    Total.ICMSTot.vST := 0;
    For Lc_I := 0 to (Det.Count - 1) do

    Begin

      Total.ICMSTot.vST := Total.ICMSTot.vST + Det.Items[Lc_I]
        .Imposto.ICMS.vICMSST;

    end;

    ParameToInvoice.NotaMercadoria.ValorIcmsSt := Total.ICMSTot.vST;

  end;
end;

procedure TSM.SumValorII(Pc_Nfe: TNFe);
Var
  Lc_I: Integer;
Begin
  with Pc_Nfe do
  BEgin
    Total.ICMSTot.vII := 0;
    For Lc_I := 0 to (Det.Count - 1) do

    Begin

      Total.ICMSTot.vII := Total.ICMSTot.vII + Det.Items[Lc_I].Imposto.II.vII;

    end;

  end;

end;

procedure TSM.SumValorIPI(Pc_Nfe: TNFe);
Var
  Lc_I: Integer;
Begin
  with Pc_Nfe do
  BEgin
    Total.ICMSTot.vIPI := 0;
    For Lc_I := 0 to (Det.Count - 1) do

    Begin

      Total.ICMSTot.vIPI := Total.ICMSTot.vIPI + Det.Items[Lc_I]
        .Imposto.IPI.vIPI;

    end;

    ParameToInvoice.NotaMercadoria.ValorIpi := Total.ICMSTot.vIPI;

  end;

end;

procedure TSM.SumValorISSQN(Pc_Nfe: TNFe);
Var
  Lc_I: Integer;
  Lc_Ok: Boolean;
Begin
  with Pc_Nfe do
  BEgin
    Total.ISSQNtot.vServ := 0;
    Total.ISSQNtot.vBC := 0;
    Total.ISSQNtot.vISS := 0;
    Total.ISSQNtot.vISSRet := 0;
    For Lc_I := 0 to (Det.Count - 1) do

    Begin

      IF (Det.Items[Lc_I].Prod.IndTot = StrToindTot(Lc_Ok, '2')) then

      Begin

        Total.ISSQNtot.vServ := Total.ISSQNtot.vServ + Det.Items[Lc_I]
          .Imposto.ISSQN.vBC + Det.Items[Lc_I].Imposto.ISSQN.vDeducao;

        Total.ISSQNtot.vDeducao := Total.ISSQNtot.vDeducao + Det.Items[Lc_I]
          .Imposto.ISSQN.vDeducao;

        Total.ISSQNtot.vBC := Total.ISSQNtot.vBC + Det.Items[Lc_I]
          .Imposto.ISSQN.vBC;

        Total.ISSQNtot.vISS := Total.ISSQNtot.vISS + Det.Items[Lc_I]
          .Imposto.ISSQN.vISSQN;
        Total.ISSQNtot.vISSRet := Total.ISSQNtot.vISSRet + Det.Items[Lc_I]
          .Imposto.ISSQN.vISSRet;
      end;
    end;

  end;
end;

procedure TSM.SumValorOutros(Pc_Nfe: TNFe);
Var
  Lc_I: Integer;
Begin
  with Pc_Nfe do
  BEgin
    Total.ICMSTot.vOutro := 0;
    For Lc_I := 0 to (Det.Count - 1) do

    Begin

      Total.ICMSTot.vOutro := Total.ICMSTot.vOutro + Det.Items[Lc_I]
        .Prod.vOutro;

    end;

  end;
end;

procedure TSM.SumValorPIS(Pc_Nfe: TNFe);
Var
  Lc_I: Integer;
Begin
  with Pc_Nfe do
  BEgin
    Total.ICMSTot.vPIS := 0;
    For Lc_I := 0 to (Det.Count - 1) do

    Begin

      Total.ICMSTot.vPIS := Total.ICMSTot.vPIS + Det.Items[Lc_I]
        .Imposto.PIS.vPIS;

    end;

  end;
end;

procedure TSM.SumValorProduto(Pc_Nfe: TNFe);
Var
  Lc_I: Integer;
  Lc_Ok: Boolean;
Begin
  with Pc_Nfe do
  BEgin
    Total.ICMSTot.vProd := 0;
    For Lc_I := 0 to (Det.Count - 1) do

    Begin

      IF (Det.Items[Lc_I].Prod.IndTot = StrToindTot(Lc_Ok, '1')) then

        Total.ICMSTot.vProd := Total.ICMSTot.vProd + Det.Items[Lc_I].Prod.vProd;

    end;

    ParameToInvoice.NotaMercadoria.ValorProduto := Total.ICMSTot.vProd;

  end;
end;

procedure TSM.SumValorSeguro(Pc_Nfe: TNFe);
Var
  Lc_I: Integer;
Begin
  with Pc_Nfe do
  BEgin
    Total.ICMSTot.vSeg := 0;
    For Lc_I := 0 to (Det.Count - 1) do

    Begin

      Total.ICMSTot.vSeg := Total.ICMSTot.vSeg + Det.Items[Lc_I].Prod.vSeg;

    end;

    ParameToInvoice.NotaMercadoria.ValorSeguro := Total.ICMSTot.vSeg;

  end;
end;

procedure TSM.SumValorTotalNota(Pc_Nfe: TNFe);
Begin
  with Pc_Nfe do
  BEgin
    Total.ICMSTot.vNF := (Total.ICMSTot.vST +
      Total.ICMSTot.vProd + Total.ICMSTot.vFrete + Total.ICMSTot.vSeg +
      Total.ICMSTot.vOutro + Total.ICMSTot.vIPI + Total.ISSQNtot.vServ +
      Total.ICMSTot.vII) -
      Total.ICMSTot.vDesc;
    ParameToInvoice.NotaMercadoria.ValorTotal := Total.ICMSTot.vNF;
  end;
end;

procedure TSM.ToInvoice(Value: string; Callback: TDBXCallback);
vAR
  M: TJSONMarshal;
  jo: TJSONObject;
  jv: TJSONValue;
  unM: TJSONUnMarshal;
begin
  jo := TJSONObject.Create;
  jv := TJSONObject.ParseJSONValue(Value);
  if assigned(jv) then
  Begin
    try
      NF := TControllerInvoiceMerchandise.Create(Self);
      Nfe.NotasFiscais.Add;
      TaxaImpAprox := TStringList.Create;

      unM := TJSONUnMarshal.Create;
      ParameToInvoice := (unM.Unmarshal(jv) as TPrmToInvoicer);

      openItemList(ParameToInvoice.Estabelecimento, ParameToInvoice.Ordem);
      // Calcular Impostos
      CalculateTaxes;
      // Invoice
      saveInvoice;
      // Invoice Merchandise
      saveInvoiceMerchandise;
      // Invoice Itens
      SaveInvoiceItems;
      // Invoice Shipping
      saveInvoiceShipping;
      // Observation
      SaveObservation;
      //Finaliza alterando o Status da nota para Faturado
      NF.Nota.Registro.Status := 'F';
      NF.Nota.setStatus;
      //Finaliza alterando o Status da nota para Faturado
      NF.Pedido.Registro.Estabelecimento  := NF.Nota.Registro.Estabelecimento;
      NF.Pedido.Registro.Codigo           := NF.Nota.Registro.Codigo;
      NF.Pedido.Registro.Status := 'F';
      NF.Pedido.setStatus;

      MsgCallBack('FATURAMENTO', 'Finalizado');
    finally
      FreeAndNil(ParameToInvoice);
      FreeAndNil(NF);
      FreeAndNil(TaxaImpAprox);
    end;
  End
  else
    MsgCallBack('FATURAMENTO', 'Problemas ao ler Json');
end;

procedure TSM.updateStock(idx: Integer);
begin
  with NF.MovimentoEstoque.Registro do
  Begin
    Estabelecimento := NF.PedidoItens.Registro.Estabelecimento;
    Ordem := NF.PedidoItens.Registro.Ordem;
    OrdemItem := NF.PedidoItens.Registro.Codigo;
    Estoque := NF.PedidoItens.Registro.Estoque;
    Local := 'Matriz';
    Tipo := ParameToInvoice.Tipo;
    DataRegistro := Date;
    Direcao := ParameToInvoice.DirecaoOperacao;
    Mercadoria := NF.PedidoItens.Registro.Produto;
    Quantidade := NF.PedidoItens.Registro.Quantidade;
  End;
  NF.MovimentoEstoque.save;
end;

function TSM.validateDestinatario: Boolean;
Var
  AuxReturn: String;
begin
  with Qr_Destinatario do
  Begin
    if (UpperCase(FieldByName('country').AsString) = 'BRASIL') then
    Begin
      // valida O cnpj do Destinario
      if TipoPessoa = 'F' then
      Begin
        AuxReturn := ValidDocFiscal(Qr_Person.FieldByName('cpf').AsString);
        if not(AuxReturn = 'OK') then
        Begin
          MsgCallBack('DESTINATARIO', AuxReturn);
        End;
      End
      else
      Begin
        AuxReturn := ValidDocFiscal(Qr_Company.FieldByName('cnpj').AsString);
        if not(AuxReturn = 'OK') then
        Begin
          MsgCallBack('DESTINATARIO', AuxReturn);
        End;

        AuxReturn := ValidInscEstadual(Qr_Company.FieldByName('ie').AsString,
          FieldByName('state').AsString);
        if not(AuxReturn = 'OK') then
        Begin
          MsgCallBack('DESTINATARIO', AuxReturn);
        End;

      End;

      validateAddress(Qr_Destinatario, 'DESTINATARIO');

      AuxReturn := ValidPhone(FieldByName('phone').AsString);

      if not(AuxReturn = 'OK') then

      Begin
        MsgCallBack('DESTINATARIO', AuxReturn);
      End;
    End;

  end;

end;

function TSM.validateEmitente: Boolean;
Var
  AuxReturn: String;
begin
  with Qr_Emitente do
  Begin
    AuxReturn := ValidDocFiscal(FieldByName('cnpj').AsString);
    if not(AuxReturn = 'OK') then
    Begin
      MsgCallBack('EMITENTE', AuxReturn);
    End;

    // Valida Inscrição do Emitente
    AuxReturn := ValidInscEstadual(FieldByName('ie').AsString,
      FieldByName('state').AsString);
    if not(AuxReturn = 'OK') then
    Begin
      MsgCallBack('EMITENTE', AuxReturn);
    End;

    validateAddress(Qr_Emitente, 'EMITENTE');

    AuxReturn := ValidPhone(FieldByName('phone').AsString);
    if not(AuxReturn = 'OK') then

    Begin
      MsgCallBack('EMITENTE', AuxReturn);
    End;
  End;
end;

procedure TSM.ValidateAuthorization(s: String; Callback: TDBXCallback);
Var
  M: TJSONMarshal;
  jo: TJSONObject;
  jv: TJSONValue;
  unM: TJSONUnMarshal;
  AuxReturn: String;
Begin
  try
    FCallback := Callback;
    ParamNfe := TPrmNfe.Create;
    jo := TJSONObject.Create;
    jv := TJSONObject.ParseJSONValue(s);
    if assigned(jv) then
    Begin
      unM := TJSONUnMarshal.Create;
      ParamNfe := (unM.Unmarshal(jv) as TPrmNfe);
      NF := TControllerInvoiceMerchandise.Create(Self);
      Nfe.NotasFiscais.Add;
      MsgCallBack('Valida Autorização', 'NOTA SELECIONADA...');
        NF.Registro.Codigo          := ParamNfe.Ordem;
        NF.Registro.Estabelecimento := ParamNfe.Estabelecimento;
        NF.getAllByKey;

      openEmitente(NF.Registro.Estabelecimento);
      getConfigNF55;

      if not getPermissao then
      Begin
        MsgCallBack('Rejeição', 'Usuário sem permissão.');
        Exit;
      end;

      if not getStatusNfeService(True) then
      Begin
        Exit;
      end;

      if not(NF.exist) then
      Begin
        AuxReturn :=
          'Nota Fiscal não encontrada. ou não foi possivel carregá-la';
        MsgCallBack('Rejeição', AuxReturn);
        Exit;
      end;

      if (NF.Retorno.Registro.Status = 3) then
      Begin
        AuxReturn := 'Nota já cancelada. Não é possível continuar.';
        MsgCallBack('Rejeição', AuxReturn);
        Exit;
      end;

      if (NF.Retorno.Registro.Status = 5) then
      Begin
        AuxReturn := 'Nota denegada pela Receita. Não é possível continuar.';
        MsgCallBack('Rejeição', AuxReturn);
        Exit;
      end;

      if not setNfeNumber then
      Begin
        AuxReturn := 'Problemas referente ao número da nota.';
        MsgCallBack('Rejeição', AuxReturn);
        Exit;
      end;

    End
    else
    Begin
      MsgCallBack('Json', 'Problemas na conversão');
    End;
  finally
    FreeAndNil(jv);
    FreeAndNil(unM);
    FreeAndNil(jo);
    FreeAndNil(NF);
    FreeAndNil(ParamNfe)
  end;

end;

procedure TSM.ValidateCancel(s: String; Callback: TDBXCallback);
Var
  M: TJSONMarshal;
  jo: TJSONObject;
  jv: TJSONValue;
  unM: TJSONUnMarshal;
  AuxReturn: String;
Begin
  try
    FCallback := Callback;
    ParamNfe := TPrmNfe.Create;
    jo := TJSONObject.Create;
    jv := TJSONObject.ParseJSONValue(s);
    if assigned(jv) then
    Begin
      unM := TJSONUnMarshal.Create;
      ParamNfe := (unM.Unmarshal(jv) as TPrmNfe);
      NF := TControllerInvoiceMerchandise.Create(Self);
      Nfe.NotasFiscais.Add;
      MsgCallBack('Valida Cancelamento', 'NOTA SELECIONADA...');
        NF.Registro.Codigo          := ParamNfe.Ordem;
        NF.Registro.Estabelecimento := ParamNfe.Estabelecimento;
        NF.getAllByKey;

      openEmitente(NF.Registro.Estabelecimento);
      getConfigNF55;

      if not getPermissao then
      Begin
        MsgCallBack('Rejeição', 'Usuário sem permissão.');
        Exit;
      end;

      if not getStatusNfeService(True) then
      Begin
        Exit;
      end;

      if not(NF.exist) then
      Begin
        AuxReturn :=
          'Nota Fiscal não encontrada. ou não foi possivel carregá-la';
        MsgCallBack('Rejeição', AuxReturn);
        Exit;
      end;

      if ( NF.Retorno.Registro.Status > 0 ) then
      Begin
        if (NF.Retorno.Registro.Status = 1) then
        Begin
          AuxReturn := 'Faça consulta antes de tentar cancelar.';
          MsgCallBack('Rejeição', AuxReturn);
          Exit;
        end;

        if (NF.Retorno.Registro.Status = 3) then
        Begin
          AuxReturn := 'Nota já cancelada. Não é possível continuar.';
          MsgCallBack('Rejeição', AuxReturn);
          Exit;
        end;

        if (NF.Retorno.Registro.Status = 5) then
        Begin
          AuxReturn := 'Nota denegada pela Receita. Não é possível continuar.';
          MsgCallBack('Rejeição', AuxReturn);
          Exit;
        End;
        end;

      //Criar função para controlar cancelamento de nota apos inventario

      //Criar Função para Controlar cancelamento com Financeiro Baixado
    End
    else
    Begin
      MsgCallBack('Json', 'Problemas na conversão');
    End;
  finally
    FreeAndNil(jv);
    FreeAndNil(unM);
    FreeAndNil(jo);
    FreeAndNil(NF);
    FreeAndNil(ParamNfe)
  end;
end;




procedure TSM.ValidateConference(s: String; Callback: TDBXCallback);
Var
  M: TJSONMarshal;
  jo: TJSONObject;
  jv: TJSONValue;
  unM: TJSONUnMarshal;
  AuxReturn: String;
Begin
  try
    FCallback := Callback;
    ParamNfe := TPrmNfe.Create;
    jo := TJSONObject.Create;
    jv := TJSONObject.ParseJSONValue(s);
    if assigned(jv) then
    Begin
      unM := TJSONUnMarshal.Create;
      ParamNfe := (unM.Unmarshal(jv) as TPrmNfe);
      NF := TControllerInvoiceMerchandise.Create(Self);
      Nfe.NotasFiscais.Add;
      MsgCallBack('Valida Conferência', 'NOTA SELECIONADA...');
        NF.Registro.Codigo          := ParamNfe.Ordem;
        NF.Registro.Estabelecimento := ParamNfe.Estabelecimento;
        NF.getByKey;

      openEmitente( NF.Registro.Estabelecimento);
      getConfigNF55;

      if not getPermissao then
      Begin
        MsgCallBack('Rejeição', 'Usuário sem permissão.');
        Exit;
      end;

      if not(NF.exist) then
      Begin
        AuxReturn :=
          'Nota Fiscal não encontrada. ou não foi possivel carregá-la';
        MsgCallBack('Rejeição', AuxReturn);
        Exit;
      end;

      NF.Retorno.Registro.Estabelecimento := NF.Registro.Estabelecimento;
      NF.Retorno.Registro.Codigo := NF.Registro.Codigo;
      NF.Retorno.getByKey;
      if not(NF.Retorno.exist) then
      Begin
        if (NF.Retorno.Registro.Status = 1) then
        Begin
          AuxReturn :=
            'Nota já enviada, porém ainda não possue autorização. Solicite o retorno de autorização.';
          MsgCallBack('Rejeição', AuxReturn);
          Exit;
        end;

        if (NF.Retorno.Registro.Status = 2) then
        Begin
          AuxReturn := 'Nota já autorizada. Não é possível continuar.';
          MsgCallBack('Rejeição', AuxReturn);
          Exit;
        end;

        if (NF.Retorno.Registro.Status = 3) then
        Begin
          AuxReturn := 'Nota já cancelada. Não é possível continuar.';
          MsgCallBack('Rejeição', AuxReturn);
          Exit;
        end;

        if (NF.Retorno.Registro.Status = 5) then
        Begin
          AuxReturn := 'Nota denegada pela Receita. Não é possível continuar.';
          MsgCallBack('Rejeição', AuxReturn);
          Exit;
        end;
      End;
    End
    else
    Begin
      MsgCallBack('Json', 'Problemas na conversão');
    End;
  finally
    FreeAndNil(jv);
    FreeAndNil(unM);
    FreeAndNil(jo);
    FreeAndNil(NF);
    FreeAndNil(ParamNfe)
  end;

end;

procedure TSM.ValidateConsult(s: String; Callback: TDBXCallback);
Var
  M: TJSONMarshal;
  jo: TJSONObject;
  jv: TJSONValue;
  unM: TJSONUnMarshal;
  AuxReturn: String;
Begin
  try
    FCallback := Callback;
    ParamNfe := TPrmNfe.Create;
    jo := TJSONObject.Create;
    jv := TJSONObject.ParseJSONValue(s);
    if assigned(jv) then
    Begin
      unM := TJSONUnMarshal.Create;
      ParamNfe := (unM.Unmarshal(jv) as TPrmNfe);
      NF := TControllerInvoiceMerchandise.Create(Self);
      Nfe.NotasFiscais.Add;
      MsgCallBack('Valida Consulta', 'NOTA SELECIONADA...');
        NF.Registro.Codigo          := ParamNfe.Ordem;
        NF.Registro.Estabelecimento := ParamNfe.Estabelecimento;
        NF.getByKey;

      openEmitente( NF.Registro.Estabelecimento);
      getConfigNF55;

      if not getPermissao then
      Begin
        MsgCallBack('Rejeição', 'Usuário sem permissão.');
        Exit;
      end;

      if not getStatusNfeService(True) then
      Begin
        Exit;
      end;

      if not(NF.exist) then
      Begin
        AuxReturn :=
          'Nota Fiscal não encontrada. ou não foi possivel carregá-la';
        MsgCallBack('Rejeição', AuxReturn);
        Exit;
      end;

      NF.Retorno.Registro.Estabelecimento := NF.Registro.Estabelecimento;
      NF.Retorno.Registro.Codigo := NF.Registro.Codigo;
      NF.Retorno.getByKey;
      if (StrToIntDef( NF.Retorno.Registro.Status.ToString,0) = 0) then
      Begin
        AuxReturn :=
          'Nota não enviada para autorização. Envie antes de tentar Consultar.';
        MsgCallBack('Rejeição', AuxReturn);
        Exit;
      end;

    End
    else
    Begin
      MsgCallBack('Json', 'Problemas na conversão');
    End;
  finally
    FreeAndNil(jv);
    FreeAndNil(unM);
    FreeAndNil(jo);
    FreeAndNil(NF);
    FreeAndNil(ParamNfe)
  end;


end;

function TSM.ValidateItemsCadastro: Boolean;
Var
  AuxReturn: String;
  Item: Integer;
  Lista: TStringList;
  I: Integer;
begin
  Lista := TStringList.Create;
  with Qr_Items do
  Begin
    First;
    Item := 0;
    while not Eof do
    Begin
      Lista.Clear;
      inc(Item);
      // Ncm
      AuxReturn := ValidNCM(FieldByName('ncm').AsString);
      if not(AuxReturn = 'OK') then
        Lista.Add(AuxReturn);
      // CES
      if (FieldByName('st').AsString = 'S') then
      Begin
        AuxReturn := ValidCEST(FieldByName('cest').AsString);
        if not(AuxReturn = 'OK') then
          Lista.Add(AuxReturn);
      end;
      // Unidade de Medida
      if (Length(FieldByName('medida').AsString) = 0) then
        Lista.Add(AuxReturn);
      // Codigo de Barras
      AuxReturn := ValidBarCode(FieldByName('codebar').AsString);
      if not(AuxReturn = 'OK') then
        Lista.Add(AuxReturn);

      if (Lista.Count > 0) then
      Begin
        AuxReturn := UpperCase(concat(StrZero(Item, 3, 0), ' - ',
          FieldByName('identifier').AsString, ' - ', FieldByName('description')
          .AsString));
        MsgCallBack('PRODUTOS', AuxReturn);
        for I := 0 to Lista.Count - 1 do
        Begin
          MsgCallBack('PRODUTOS', Lista.Strings[I]);
        End;
      End;
      Next;
    end;
  End;

end;

function TSM.ValidateItemsFiscal: Boolean;
Var
  AuxReturn: String;
  Item: Integer;
  Lc_Tp_tributa: String;
  Lc_Tp_Cliente: String;
  SemRegra: Boolean;
begin
  with Qr_Items do
  Begin
    First;
    Item := 0;
    SemRegra := False;
    while not Eof do
    Begin
      inc(Item);
      IF not ValidateTributacao then
      Begin
        SemRegra := True;
        MsgCallBack('TRIBUTAÇÃO PRODUTO', concat(StrZero(Item, 3, 0), ' - ',
          FieldByName('identifier').AsString, ' - ', FieldByName('description')
          .AsString));
        // Monta a mensagem para produtos com Substituição tributária

        if (FieldByName('st').AsString <> 'S') then
          MsgCallBack('TRIBUTAÇÃO PRODUTO',
            'Este produto não está sob o regime de Substituição tributária.')
        else
          MsgCallBack('TRIBUTAÇÃO PRODUTO',
            'Este produto está sob o regime de Substituição tributária.');
        // Monta a Mensagem para a Finalidade de Tributação

        if (Trim(ParameToInvoice.Cfop) = '') then
        Begin
          case FieldByName('kind_tributary').AsInteger of
            1:
              Lc_Tp_tributa := 'Revenda.';
            2:
              Lc_Tp_tributa := 'Produção.';
            3:
              Lc_Tp_tributa := 'Consignado.';
            4:
              Lc_Tp_tributa := 'Industrialização.';
            5:
              Lc_Tp_tributa := 'Consumo Interno.';
            6:
              Lc_Tp_tributa := 'Prestação de Serviço.';
          else
            Lc_Tp_tributa := 'Não definida.';
          end;
          MsgCallBack('TRIBUTAÇÃO PRODUTO',
            concat('A finalidade para a tributação está como ',
            Lc_Tp_tributa, '.'));
        end
        else
        Begin
          MsgCallBack('TRIBUTAÇÃO PRODUTO',
            'A finalidade para a tributação deve estar como outras.');
        End;
        // Monta a Mensagem para a origem da Mercadoria
        case StrToIntDef(FieldByName('source').AsString, 0) of
          1:
            AuxReturn :=
              ' 1 - Estrangeira - Importação direta, exceto a indicada no código 6.';
          2:
            AuxReturn :=
              ' 2 - Estrangeira - Adquirida no mercado interno, exceto a indicada no código 7.';
          3:
            AuxReturn :=
              ' 3 - Nacional, mercadoria ou bem com Conteúdo de Importação superior a 40% e inferior ou igual a 70%.';
          4:
            AuxReturn :=
              ' 4 - Nacional, cuja prod. tenha sido feita em conf. os proc. produtivos básicos conf as legislações citadas nos Ajustes.';
          5:
            AuxReturn :=
              ' 5 - Nacional, mercadoria ou bem com Conteúdo de Importação inferior ou igual a 40%.';
          6:
            AuxReturn :=
              ' 6 - Estrangeira - Importação direta, sem similar nacional,constante em lista da CAMEX e gás natural.';
          7:
            AuxReturn :=
              ' 7 - Estrangeira - Adquirida no mercado interno, sem similar nacional, constante lista CAMEX e gás natural.';
          8:
            AuxReturn :=
              ' 8 - Nacional, mercadoria ou bem com Conteúdo de Importação superior a 70%.';
        else
          AuxReturn :=
            ' 0 - Nacional, exceto as indicadas nos códigos 3, 4, 5 e 8.';
        end;
        MsgCallBack('TRIBUTAÇÃO PRODUTO', AuxReturn);
      End;
      Next;
    End;
    if SemRegra then
    Begin
      // Pede verificação do CFOP em Relação a operação
      MsgCallBack('TRIBUTAÇÃO CFOP',
        concat('Verifique se o CFOP utilizado é o correto para operação de ',
        Lc_Tp_tributa));
      MsgCallBack('TRIBUTAÇÃO CFOP',
        concat('Verifique se o CFOP utilizado é o correto para estado do ',
        Qr_Destinatario.FieldByName('state').AsString));

      MsgCallBack('TRIBUTAÇÃO DESTINATÁRIO',
        'Existe regra para estes critérios relacionado ao destinatário?');
      // Mostra o Estado do cliente
      MsgCallBack('TRIBUTAÇÃO DESTINATÁRIO', concat('1º Para o estado do ',
        UpperCase(Qr_Destinatario.FieldByName('state').AsString)));
      // Monta a mensagem para tipo do Cliente consumidor / Revenda
      if (Qr_Customer.FieldByName('consumer').AsString = 'S') then
        Lc_Tp_Cliente := 'consumidor.'
      else
        Lc_Tp_Cliente := '[ não ] consumidor.';
      MsgCallBack('TRIBUTAÇÃO DESTINATÁRIO',
        concat('       2º Para destinatário do tipo ', Lc_Tp_Cliente));
      // Monta a mensagem Cliente micro empresa ou não
      if TipoPessoa = 'J' then
      Begin
        if (Qr_Company.FieldByName('crt').AsString <> '3') then
          MsgCallBack('TRIBUTAÇÃO DESTINATÁRIO',
            '3º Este destinatário está marcado como Optante pelo simples.')
        else
          MsgCallBack('TRIBUTAÇÃO DESTINATÁRIO',
            '3º Este destinatário [ não ] está marcado como Optante pelo simples.');
      End
      else
      Begin
        MsgCallBack('TRIBUTAÇÃO DESTINATÁRIO',
          '3º Este destinatário é pessoa física.');
      End;
    End;
  end;
end;

procedure TSM.ValidatePrint(s: String; Callback: TDBXCallback);
Var
  M: TJSONMarshal;
  jo: TJSONObject;
  jv: TJSONValue;
  unM: TJSONUnMarshal;
  AuxReturn: String;
Begin
  try
    FCallback := Callback;
    ParamNfe := TPrmNfe.Create;
    jo := TJSONObject.Create;
    jv := TJSONObject.ParseJSONValue(s);
    if assigned(jv) then
    Begin
      unM := TJSONUnMarshal.Create;
      ParamNfe := (unM.Unmarshal(jv) as TPrmNfe);
      NF := TControllerInvoiceMerchandise.Create(Self);
      Nfe.NotasFiscais.Add;
      MsgCallBack('Impressão NF-e', 'NOTA SELECIONADA...');
        NF.Registro.Codigo          := ParamNfe.Ordem;
        NF.Registro.Estabelecimento := ParamNfe.Estabelecimento;
        NF.getAllByKey;

      openEmitente(NF.Registro.Estabelecimento);
      getConfigNF55;

      if not getPermissao then
      Begin
        MsgCallBack('Rejeição', 'Usuário sem permissão.');
        Exit;
      end;

      if not(NF.exist) then
      Begin
        AuxReturn :=
          'Nota Fiscal não encontrada. ou não foi possivel carregá-la';
        MsgCallBack('Rejeição', AuxReturn);
        Exit;
      end;

      if ( NF.Retorno.Registro.Status > 0 ) then
      Begin
        if (NF.Retorno.Registro.Status = 1) then
        Begin
          AuxReturn := 'Faça consulta antes de tentar Imprimir.';
          MsgCallBack('Rejeição', AuxReturn);
          Exit;
        end;
      end
      else
      Begin
        if (NF.Retorno.Registro.Status = 1) then
        Begin
          AuxReturn := 'Nota não enviada para autorização.';
          MsgCallBack('Rejeição', AuxReturn);
          Exit;
        end;
      End;
    End
    else
    Begin
      MsgCallBack('Json', 'Problemas na conversão');
    End;
  finally
    FreeAndNil(jv);
    FreeAndNil(unM);
    FreeAndNil(jo);
    FreeAndNil(NF);
    FreeAndNil(ParamNfe)
  end;
end;

procedure TSM.ValidateSendEmail(s: String; Callback: TDBXCallback);
Var
  M: TJSONMarshal;
  jo: TJSONObject;
  jv: TJSONValue;
  unM: TJSONUnMarshal;
  AuxReturn: String;
Begin
  try
    FCallback := Callback;
    ParamNfe := TPrmNfe.Create;
    jo := TJSONObject.Create;
    jv := TJSONObject.ParseJSONValue(s);
    if assigned(jv) then
    Begin
      unM := TJSONUnMarshal.Create;
      ParamNfe := (unM.Unmarshal(jv) as TPrmNfe);
      NF := TControllerInvoiceMerchandise.Create(Self);
      Nfe.NotasFiscais.Add;
      MsgCallBack('Impressão NF-e', 'NOTA SELECIONADA...');
        NF.Registro.Codigo          := ParamNfe.Ordem;
        NF.Registro.Estabelecimento := ParamNfe.Estabelecimento;
        NF.getAllByKey;

      openEmitente(NF.Registro.Estabelecimento);
      getConfigNF55;

      if not getPermissao then
      Begin
        MsgCallBack('Rejeição', 'Usuário sem permissão.');
        Exit;
      end;

      if not(NF.exist) then
      Begin
        AuxReturn :=
          'Nota Fiscal não encontrada. ou não foi possivel carregá-la';
        MsgCallBack('Rejeição', AuxReturn);
        Exit;
      end;

      if ( NF.Retorno.Registro.Status > 0 ) then
      Begin
        if (NF.Retorno.Registro.Status = 1) then
        Begin
          AuxReturn := 'Faça consulta antes de tentar enviar o e-mail.';
          MsgCallBack('Rejeição', AuxReturn);
          Exit;
        end;

      end
      else
      Begin
        if (NF.Retorno.Registro.Status = 1) then
        Begin
          AuxReturn := 'Nota não enviada para autorização.';
          MsgCallBack('Rejeição', AuxReturn);
          Exit;
        end;
      End;
    End
    else
    Begin
      MsgCallBack('Json', 'Problemas na conversão');
    End;
  finally
    FreeAndNil(jv);
    FreeAndNil(unM);
    FreeAndNil(jo);
    FreeAndNil(NF);
    FreeAndNil(ParamNfe)
  end;
end;

function TSM.validateAddress(qry: TFDQuery; Tipo: String): Boolean;
Var
  AuxReturn: String;
begin
  Result := True;
  with qry do
  Begin
    // Valida Cidade do IBGE e se o endereço está completo
    if (Length(FieldByName('ibge').AsString) = 0) then
    begin
      AuxReturn := 'Código IBGE da Cidade não informado !';
      MsgCallBack(Tipo, AuxReturn);
    end;

    if (Length(FieldByName('neighborhood').AsString) = 0) then
    begin
      AuxReturn := 'Nome do Bairro não informado !';
      MsgCallBack(Tipo, AuxReturn);
    end;

    if (Length(FieldByName('street').AsString) = 0) then

    begin
      AuxReturn := 'Endereço não informado !';
      MsgCallBack(Tipo, AuxReturn);
    end;


    // Valida o numero predial do endereco do emitente

    if (Length(FieldByName('nmbr').AsString) = 0) then
    begin
      AuxReturn := 'Número predial do Emitente não informado !';
      MsgCallBack(Tipo, AuxReturn);
    end;

    AuxReturn := ValidCep(FieldByName('zip_code').AsString);

    if not(AuxReturn = 'OK') then
    Begin
      MsgCallBack(Tipo, AuxReturn);
    End;
  End;
end;

procedure TSM.ValidtoInvoice(Value: string; Callback: TDBXCallback);
Var
  jo: TJSONObject;
  jv: TJSONValue;
  unM: TJSONUnMarshal;
Begin
  try
    FCallback := Callback;
    ParameToInvoice := TPrmToInvoicer.Create;
    jo := TJSONObject.Create;
    jv := TJSONObject.ParseJSONValue(Value);
    if assigned(jv) then
    Begin
      unM := TJSONUnMarshal.Create;
      ParameToInvoice := (unM.Unmarshal(jv) as TPrmToInvoicer);
      // Emitente
      openEmitente(ParameToInvoice.Emitente);
      if (ParameToInvoice.Estabelecimento = ParameToInvoice.Emitente) and ParameToInvoice.SolicitaNfe then
        validateEmitente;
      // Destinatario
      openDestinatario(ParameToInvoice.destinatario);
      if not openCompany(ParameToInvoice.destinatario) then
        openPerson(ParameToInvoice.destinatario);
      openCustomer(ParameToInvoice.destinatario);
      validateDestinatario;
      // items
      openItemList(ParameToInvoice.Estabelecimento, ParameToInvoice.Ordem);
      if (ParameToInvoice.Estabelecimento = ParameToInvoice.Emitente) and ParameToInvoice.SolicitaNfe then
      Begin
        ValidateItemsCadastro;
        ValidateItemsFiscal;
      End;
    End
    else
    Begin
      MsgCallBack('Json', 'Problemas na conversão');
    End;
  finally
    FreeAndNil(jv);
    FreeAndNil(unM);
    FreeAndNil(jo);
    FreeAndNil(ParameToInvoice);
  end;

end;

function TSM.ValidateTributacao: Boolean;
begin
  OpenTributacao;
  Result := (Qr_Tributacao.recordcount > 0);
end;

function TSM.VerificaBeneficioICMS: Boolean;
begin
  Result := False;
  if Qr_Tributacao.recordcount > 0 then
  Begin
    if (Qr_Tributacao.FieldByName('icms_base_reduced').AsFloat > 0) or
      (Qr_Tributacao.FieldByName('icms_aliq_reduced').AsFloat > 0) then
    Begin
      Result := True;
    End;
  End;

end;

function TSM.verificaInfoManual: Boolean;
begin
  // Faremos a consulta se o impoto foi informado manualmente
  // Por enquanto só farei o imposto pela regra de tributaçao
  Result := False;

end;

procedure TSM.CalculateTaxes;
Var
  Contador: Integer;
  TxProp: Real;
  ValorPedido: Real;
  ValorFrete: Real;
  ValorSeguro: Real;
  ValorDespesas: Real;

  ValorBaseICMS: Real;
  aliqIcms: Real;
  ValorICMS: Real;

  ValorBaseIcmsSt: Real;
  AliqIcmsST: Real;
  ValorIcmsSt: Real;

  valorBaseIPI: Real;
  ValorIpi: Real;
Begin
  Contador := 0;
  TxProp := 0;
  ValorPedido := 0;
  ValorFrete := 0;
  ValorSeguro := 0;
  ValorDespesas := 0;
  ValorBaseICMS := 0;
  aliqIcms := 0;
  ValorICMS := 0;
  ValorBaseIcmsSt := 0;
  AliqIcmsST := 0;
  ValorIcmsSt := 0;

  ValorPedido := CalculateTotalPedido;
  with Qr_Items, ParameToInvoice, Nfe.NotasFiscais[0].Nfe do
  Begin
    First;
    Det.Clear;
    While not Eof do
    Begin
      with Det.Add do
      Begin
        OpenTributacao;
        Contador := Contador + 1;
        Prod.nItem := Contador;
        // Valor da Base de Calculo
        Prod.vDesc := FieldByName('discount_value').AsFloat;
        // Valor do Desconto
        Prod.qCom := FieldByName('quantity').AsFloat; // Quantidade Comercial
        Prod.vUnCom := FieldByName('unit_value').AsFloat;
        // Valor Unitário de comercialização
        Prod.vProd := Prod.qCom * Prod.vUnCom;
        ValorBaseProduto := Prod.vProd - Prod.vDesc;
        ValorBaseProduto := ValorBaseProduto;
        Prod.Cfop := Qr_Tributacao.FieldByName('tb_cfop_id').AsString;
        // fAZ A DIVISÃO DE VALORES DE FRETES/SEGURO/OUTRAS
        TxProp := ArredondarParaBaixo((ValorBaseProduto / ValorPedido),
          4, True);

        if (Contador < recordcount) then
        Begin
          // Valor do Frete
          Prod.vFrete := ArredondarParaBaixo(NotaMercadoria.ValorFrete *
            TxProp, 2, False);
          ValorFrete := ValorFrete + Prod.vFrete;
          // Valor do Seguro
          Prod.vSeg := ArredondarParaBaixo(NotaMercadoria.ValorSeguro *
            TxProp, 2, False);
          ValorSeguro := ValorSeguro + Prod.vSeg;
          // Valor do Outros
          Prod.vOutro := ArredondarParaBaixo(NotaMercadoria.ValorDespesas *
            TxProp, 2, False);
          ValorDespesas := ValorDespesas + Prod.vOutro;
        end
        else
        Begin
          // Valor do Frete
          Prod.vFrete := Total.ICMSTot.vFrete - ValorFrete;
          // Valor do Seguro
          Prod.vSeg := Total.ICMSTot.vSeg - ValorSeguro;
          // Valor do Outros
          Prod.vOutro := Total.ICMSTot.vOutro - ValorDespesas;
        end;

        if DistribuirIcms or DistribuirIcmsSt then
        Begin
          // Dstribui o ICMS Normal
          if (Contador < recordcount) then
          Begin
            // Valor da Base ICMS -
            Imposto.ICMS.vBC :=
              RoundTo(NotaMercadoria.ValorBaseICMS * TxProp, -2);
            ValorBaseICMS := ValorBaseICMS + Imposto.ICMS.vBC;
            // Aliquota do ICMS = VL ICMS / BC
            aliqIcms := RoundTo((RoundTo(NotaMercadoria.ValorICMS * TxProp,
              -2) / Imposto.ICMS.vBC) * 100, -2);
            Imposto.ICMS.pICMS := aliqIcms;
            // Valor do ICMS - Redefine o valor do ICMS com a Aliquota calculada
            Imposto.ICMS.vICMS :=
              RoundTo((Imposto.ICMS.vBC * Imposto.ICMS.pICMS) / 100, -2);
            ValorICMS := ValorICMS + Imposto.ICMS.vICMS;
            aliqIcms := Imposto.ICMS.vICMS;
          end
          else
          Begin
            // Valor da Base ICMS
            Imposto.ICMS.vBC :=
              RoundTo(NotaMercadoria.ValorBaseICMS - ValorBaseICMS, -2);
            // Valor do ICMS
            Imposto.ICMS.vICMS :=
              RoundTo(NotaMercadoria.ValorICMS - ValorICMS, -2);
            // Aliquota do ICMS
            aliqIcms := RoundTo((Imposto.ICMS.vICMS / Imposto.ICMS.vBC)
              * 100, -2);
            Imposto.ICMS.pICMS := aliqIcms;
            // Redefine o valor do ICMS com a Aliquota calculada
            Imposto.ICMS.vICMS :=
              RoundTo((Imposto.ICMS.vBC * Imposto.ICMS.pICMS) / 100, -2);
          end;
          if DistribuirIcmsSt then
          Begin
            // Dstribui o ICMS ST
            if (Contador < recordcount) then
            Begin
              // Valor da Base ICMS ST
              Imposto.ICMS.vBCST :=
                RoundTo(NotaMercadoria.ValorBaseIcmsSt * TxProp, -2);
              ValorBaseIcmsSt := ValorBaseIcmsSt + Imposto.ICMS.vBCST;
              // Valor do ICMS
              Imposto.ICMS.vICMSST :=
                RoundTo(NotaMercadoria.ValorIcmsSt * TxProp, -2);
              ValorIcmsSt := ValorIcmsSt + Imposto.ICMS.vICMSST;
            end
            else
            Begin
              // Valor da Base ICMS ST
              Imposto.ICMS.vBCST := NotaMercadoria.ValorBaseIcmsSt -
                ValorBaseIcmsSt;
              // Valor do ICMS ST
              Imposto.ICMS.vICMSST := NotaMercadoria.ValorIcmsSt - ValorIcmsSt;
            end;
          end;
        end
        else
        Begin
          if not verificaInfoManual then
            CalculateIcms(Imposto)
        end;
        { ========================== O - Imposto sobre Produtos Industrializados ======================== }

        if ParameToInvoice.DistribuirIpi then
        Begin
          CalculateIPI(Imposto);
          // Dstribui o IPI
          if (Contador < recordcount) then
          Begin
            // Valor da Base IPI
            Imposto.IPI.vBC := ValorBaseProduto;
            valorBaseIPI := valorBaseIPI + Imposto.IPI.vBC;
            // Valor do IPI
            Imposto.IPI.vIPI := RoundTo(Total.ICMSTot.vIPI * TxProp, -2);
            ValorIpi := ValorIpi + Imposto.IPI.vIPI;
          end
          else
          Begin
            // Valor da Base IPI
            Imposto.IPI.vBC := ValorPedido - ValorIpi;
            // Valor do IPI
            Imposto.IPI.vIPI := NotaMercadoria.ValorIpi - ValorIpi;
          end;
          Imposto.IPI.pIPI := (Imposto.IPI.vIPI / Imposto.IPI.vBC) * 100;
        end
        else
        Begin
          CalculateIPI(Imposto);
        end;
        CalculatePIS(Imposto);
        CalculateCOFINS(Imposto);
        CalculateII(Imposto);
      End;
      Qr_Items.Next;
    end;
  End;
  // TAG de grupo de Valores Totais referentes ao ICMS
  if ParameToInvoice.SolicitaNfe OR ParameToInvoice.DistribuirIcms OR
    ParameToInvoice.DistribuirIcmsSt OR ParameToInvoice.DistribuirIpi then
  BEgin
    SumValorBaseICMS(Nfe.NotasFiscais[0].Nfe);
    SumValorICMS(Nfe.NotasFiscais[0].Nfe);
    SumValorBaseICMSST(Nfe.NotasFiscais[0].Nfe);
    SumValorICMSST(Nfe.NotasFiscais[0].Nfe);
    SumValorII(Nfe.NotasFiscais[0].Nfe);
    SumValorIPI(Nfe.NotasFiscais[0].Nfe);
    SumValorPIS(Nfe.NotasFiscais[0].Nfe);
    SumValorCFS(Nfe.NotasFiscais[0].Nfe);
  end;
  SumValorISSQN(Nfe.NotasFiscais[0].Nfe);
  SumValorProduto(Nfe.NotasFiscais[0].Nfe);
  SumValorFrete(Nfe.NotasFiscais[0].Nfe);
  SumValorSeguro(Nfe.NotasFiscais[0].Nfe);
  SumValorDesconto(Nfe.NotasFiscais[0].Nfe);
  SumValorOutros(Nfe.NotasFiscais[0].Nfe);
  SumValorAproximImposto(Nfe.NotasFiscais[0].Nfe);
  SumValorTotalNota(Nfe.NotasFiscais[0].Nfe);
end;

Function TSM.CalculateTotalPedido(): Real;
begin
  with Qr_Items do
  Begin
    First;
    Result := 0;
    while not Eof do
    begin
      Result := Result +
        (RoundTo(FieldByName('unit_value').AsFloat * FieldByName('quantity')
        .AsFloat, -2));
      Result := Result - FieldByName('discount_value').AsFloat;
      Next;
    end;
  end;
end;

procedure TSM.Cancel(s: String; Callback: TDBXCallback);
Var
  M: TJSONMarshal;
  jo: TJSONObject;
  jv: TJSONValue;
  unM: TJSONUnMarshal;
  AuxReturn: String;
  Lc_FileDefault: String;
  Lc_FileGestao: String;
  Lc_NF: String;
  Retorno : Integer;
Begin
  try
    FCallback := Callback;
    jo := TJSONObject.Create;
    jv := TJSONObject.ParseJSONValue(s);
    if assigned(jv) then
    Begin
      try
        MsgCallBack('Cancelar', 'INICIANDO A OPERAÇÃO...');
        unM := TJSONUnMarshal.Create;
        ParamNfe := TPrmNfe.Create;
        ParamNfe := (unM.Unmarshal(jv) as TPrmNfe);
        NF := TControllerInvoiceMerchandise.Create(Self);
        Nfe.NotasFiscais.Clear;
        Nfe.NotasFiscais.Add;
        MsgCallBack('Cancelar', 'NOTA SELECIONADA...');
          NF.Registro.Codigo          := ParamNfe.Ordem;
          NF.Registro.Estabelecimento := ParamNfe.Estabelecimento;
          NF.getAllByKey;
        openEmitente(NF.Registro.Estabelecimento);
        getConfigNF55;

        NF.Retorno.Registro.Estabelecimento := NF.Registro.Estabelecimento;
        NF.Retorno.Registro.Codigo := NF.Registro.Codigo;
        NF.Retorno.getByKey;
        if NF.Retorno.Registro.Status > 1 then
          CancelNFe
        else
          CancelNF;
        finishedCancellationNF;
      finally
        FreeAndNil(ParamNfe);
        FreeAndNil(NF);
        FreeAndNil(unM);
      end;
    End
    else
    Begin
      MsgCallBack('Rejeição', 'Problemas na conversão');
    End;
  finally
    FreeAndNil(jv);
    FreeAndNil(jo);
  end;
end;


procedure TSM.CancelNF;
Begin
  //Este Cancelamento apaga os registros do faturamento liberando a ordem para faturar novamente
  NF.cancelInvoice;
  NF.Pedido.Registro.Estabelecimento := NF.Registro.Estabelecimento;
  NF.Pedido.Registro.Codigo := NF.Registro.Codigo;
  NF.Pedido.Registro.Status := 'P';
  NF.Pedido.setStatus;
end;

procedure TSM.CancelNFe;
Var
  Lc_FileDefault: String;
  Retorno: Integer;
begin
  //Este Cancelamento mantem os dados da nota com o Status de cancelamento
  Lc_FileDefault := NF.Retorno.Registro.NomeArquivo;
  if (Lc_FileDefault = '')  or (not FileExists(concat(PathLocal,Lc_FileDefault))) then
  Begin
    // Prepara a danfe para o envio
    Lc_FileDefault := ConferenceDanfe('Cancelamento');
  end;
  //Carrega o componenente para Consulta
  loadComponentNfe(PathLocal, Lc_FileDefault);
  Retorno := ConsultWebNFe(Lc_FileDefault);
  Retorno := DealWithReturn(Retorno);
  SaveReturn55(Retorno,Lc_FileDefault);
  if (Retorno = 2) then
  Begin
    if getCancelNFe then
    Begin
      Retorno := ConsultWebNFe(Lc_FileDefault);
      Retorno := DealWithReturn(Retorno);
      SaveReturn55(Retorno,Lc_FileDefault);
    End;
  end;
  if (Retorno = 3) or (Retorno = 5)  then
  Begin
    NF.Nota.Registro.Status := 'C';
    NF.Nota.setStatus;
  End;
end;

procedure TSM.Print(s: String; Callback: TDBXCallback);
Var
  M: TJSONMarshal;
  jo: TJSONObject;
  jv: TJSONValue;
  unM: TJSONUnMarshal;
  AuxReturn: String;
  Lc_FileDefault: String;
  Lc_FileGestao: String;
  Lc_NF: String;
  Retorno : Integer;
Begin
  try
    FCallback := Callback;
    jo := TJSONObject.Create;
    jv := TJSONObject.ParseJSONValue(s);
    if assigned(jv) then
    Begin
      try
        MsgCallBack('Cancelar', 'INICIANDO A OPERAÇÃO...');
        unM := TJSONUnMarshal.Create;
        ParamNfe := TPrmNfe.Create;
        ParamNfe := (unM.Unmarshal(jv) as TPrmNfe);
        NF := TControllerInvoiceMerchandise.Create(Self);
        Nfe.NotasFiscais.Clear;
        Nfe.NotasFiscais.Add;
        MsgCallBack('Cancelar', 'NOTA SELECIONADA...');
          NF.Registro.Codigo          := ParamNfe.Ordem;
          NF.Registro.Estabelecimento := ParamNfe.Estabelecimento;
          NF.getAllByKey;
        openEmitente(NF.Registro.Estabelecimento);
        getConfigNF55;

        NF.Retorno.Registro.Estabelecimento := NF.Registro.Estabelecimento;
        NF.Retorno.Registro.Codigo := NF.Registro.Codigo;
        NF.Retorno.getByKey;

        // Define o caminho e o arquivo da Nota Fiscal
        Lc_FileDefault := NF.Retorno.Registro.NomeArquivo;
        if (Lc_FileDefault = '')  or (not FileExists(concat(PathLocal,Lc_FileDefault))) then
        Begin
          // Prepara a danfe para a consulta
          Lc_FileDefault := ConferenceDanfe('Consulta');
          loadComponentNfe(PathLocal, Lc_FileDefault);
          ConsultWebNFe(Lc_FileDefault);
        end
        else
        Begin
          loadComponentNfe(PathLocal, Lc_FileDefault);
        End;
        PrintNfe(Nfe.NotasFiscais.Items[0].Nfe.Ide.cNF,Lc_FileDefault);
      finally
        FreeAndNil(ParamNfe);
        FreeAndNil(NF);
        FreeAndNil(unM);
      end;
    End
    else
    Begin
      MsgCallBack('Rejeição', 'Problemas na conversão');
    End;
  finally
    FreeAndNil(jv);
    FreeAndNil(jo);
  end;
end;

procedure TSM.PrintConference(s: String; Callback: TDBXCallback);
Var
  M: TJSONMarshal;
  jo: TJSONObject;
  jv: TJSONValue;
  unM: TJSONUnMarshal;
  AuxReturn: String;
  Lc_FileDefault: String;
  Lc_FileGestao: String;
  Lc_NF: String;
Begin
  try
    FCallback := Callback;
    jo := TJSONObject.Create;
    jv := TJSONObject.ParseJSONValue(s);
    if assigned(jv) then
    Begin
      try
        MsgCallBack('Conferência', 'INICIANDO A OPERAÇÃO...');
        unM := TJSONUnMarshal.Create;
        ParamNfe := TPrmNfe.Create;
        ParamNfe := (unM.Unmarshal(jv) as TPrmNfe);
        NF := TControllerInvoiceMerchandise.Create(Self);
        Nfe.NotasFiscais.Clear;
        Nfe.NotasFiscais.Add;
        MsgCallBack('Conferência', 'NOTA SELECIONADA...');
          NF.Registro.Codigo          := ParamNfe.Ordem;
          NF.Registro.Estabelecimento := ParamNfe.Estabelecimento;
          NF.getAllByKey;

        openEmitente(NF.Registro.Estabelecimento);
        getConfigNF55;
        Lc_FileDefault := ConferenceDanfe('Conferência');
        if Trim(Lc_FileDefault) <> '' then  PrintNfe(Nfe.NotasFiscais.Items[0].Nfe.Ide.cNF,Lc_FileDefault);
      finally
        FreeAndNil(ParamNfe);
        FreeAndNil(NF);
        FreeAndNil(unM);
      end;
    End
    else
    Begin
      MsgCallBack('Rejeição', 'Problemas na conversão');
    End;
  finally
    FreeAndNil(jv);
    FreeAndNil(jo);
  end;
end;

function TSM.PrintNfe(Nr:Integer;FileDefault:String):String;
Var
  Lc_FileGestao : String;
  NrNota : String;
  AuxReturn : String;
begin
  NrNota := StrZero(Nfe.NotasFiscais.Items[0].Nfe.Ide.cNF, 6, 0);
  FileDefault := concat(
                      Copy(FileDefault, 1, (Length(FileDefault) - 4)),
                      '.pdf'
                    );
  Lc_FileGestao := concat(
                      'NFe-', NrNota, '-',
                       MD5String(DateTimeToStr(Now)),
                       '.pdf'
                    );
  AuxReturn := concat(UrlSaida, Lc_FileGestao);
  MsgCallBack('Url Impressão', AuxReturn);
  Nfe.DANFE.PathPDF := PathLocal;
  Nfe.DANFE.MostrarPreview := False;
  Dfe_Fortes.NFeCancelada := ( NF.Nota.Registro.Status = 'C' );

  Nfe.NotasFiscais.ImprimirPDF;
  RenameFile(concat(PathLocal, FileDefault), concat(PathLocal, Lc_FileGestao));
  Result := Lc_FileGestao;
end;

function TSM.ConferenceDanfe(Tipo: String): String;
begin
  Nfe.DANFE.ProtocoloNFe := '';
  fillDanfe(Tipo);
  MsgCallBack(Tipo, 'DANFE GERADA COM SUCESSO...');
  Nfe.NotasFiscais.Items[0].GerarXML;
  Nfe.NotasFiscais.GerarNFe;
  Nfe.NotasFiscais.Assinar;
  Nfe.NotasFiscais.Validar;
  Result := Copy(Nfe.NotasFiscais.Items[0].Nfe.infNFe.ID,
    (Length(Nfe.NotasFiscais.Items[0].Nfe.infNFe.ID) - 44) + 1, 44) +
    '-NFe.xml';
end;

end.
