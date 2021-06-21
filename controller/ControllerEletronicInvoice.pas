unit ControllerEletronicInvoice;

interface

uses
  System.Classes, Xml.XMLDoc, System.SysUtils, ACBrNFe,ACBrDFeSSL, ACBrNFeDANFeRLClass,
  pcnConversaoNFe, pcnConversao, ActiveX, ControllerInstitution,
  ControllerEntityFiscal,
  BaseController,
  ControllerConfigNfe55,
  ControllerInvoiceMerchandise, ControllerState;

type
  TControllerEletronicInvoice = class(TBaseController)
  private
    Config : TControllerConfigNfe55;
    FChaveXML: String;
    FCodigoUF : Integer;
    FAutorizaNFe: String;
    FTipoNotaFiscal: String;
    procedure setFChaveXML(const Value: String);
    procedure setFAutorizaNFe(const Value: String);
    procedure setFTipoNotaFiscal(const Value: String);
  public
    Estabelecimento : TControllerInstitution;
    NotaMercadoria : TControllerInvoiceMerchandise;
    Fiscal : TControllerEntityFiscal;
    Nfe: TACBrNFe;
    Dfe_Fortes: TACBrNFeDANFeRL;
    PathNameFileXML : String;

    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;

    function getConfigNF55: Boolean;
    Function ConsultaNfe:String;
    Function loadComponent:Boolean;

    property ChaveXML : String read FChaveXML write setFChaveXML;
    property AutorizaNFe : String read FAutorizaNFe write setFAutorizaNFe;
    property TipoNotaFiscal : String read FTipoNotaFiscal write setFTipoNotaFiscal;
    function getNameXmlFile:String;

    procedure Inicialize;
  end;
implementation

{ TControllerEletronicInvoice }

uses
  unMessages,
  UnFunctions,
  UnitConstantes,
  ClasseUtil
  ;

function TControllerEletronicInvoice.ConsultaNfe: String;
begin
  with Nfe do
  Begin
    WebServices.Consulta.Executar;
    if (WebServices.Consulta.cStat <> 100) then
      Result := 'Retorno : ' + WebServices.Consulta.XMotivo;
  End;
end;


constructor TControllerEletronicInvoice.Create(AOwner: TComponent);
begin
  inherited;
  Estabelecimento := TControllerInstitution.Create(self);
  NotaMercadoria  := TControllerInvoiceMerchandise.Create(self);
  Fiscal    := TControllerEntityFiscal.Create(Self);
  Nfe             := TACBrNFe.Create(self);
  Dfe_Fortes       := TACBrNFeDANFeRL.Create(self);
  Nfe.DANFE := Dfe_Fortes;
  Config          := TControllerConfigNfe55.Create(self);
end;

destructor TControllerEletronicInvoice.Destroy;
begin
  FreeAndNil(Estabelecimento );
  FreeAndNil(Config);
  FreeAndNil(Dfe_Fortes);
  FreeAndNil(Nfe );
  FreeAndNil(NotaMercadoria );
  FreeAndNil(Fiscal);
  inherited;
end;


function TControllerEletronicInvoice.getConfigNF55: Boolean;
Var
  LocalCerti : String;
begin
  with Nfe do
  Begin
    // cONFIGURAÇÕES DO COMPONENTE
    //Dfe_Fortes.MostraDadosISSQN := False;
    Configuracoes.Geral.ModeloDF := moNFe;
    Dfe_Fortes.ACBrNFe := Nfe;
    DANFE := Dfe_Fortes;
    Dfe_Fortes.ACBrNFe := Nfe;
    Nfe.DANFE.TipoDANFE := tiRetrato;
    Dfe_Fortes.PosCanhoto := prCabecalho;
    Estabelecimento.getRepository(False,'');
    //Config
    Config.Registro.Estabelecimento := Estabelecimento.Registro.Codigo;
    Config.getByKey;
    // cONFIGURAÇÕES DO COMPONENTE
    //Dfe_Fortes.MostraDadosISSQN := False;
    Configuracoes.Geral.ModeloDF := moNFe;
    Dfe_Fortes.ACBrNFe := Nfe;
    DANFE := Dfe_Fortes;
    Dfe_Fortes.ACBrNFe := Nfe;
    if ( Config.Registro.Orientacao = '0' ) then
      Nfe.DANFE.TipoDANFE := tiRetrato
    else
      Nfe.DANFE.TipoDANFE := tiPaisagem;

    if ( Config.Registro.Recebimento = '0' ) then
      Dfe_Fortes.PosCanhoto := prCabecalho
    else
      Dfe_Fortes.PosCanhoto := prRodape;

    Estabelecimento.getRepository(False,'');

    Configuracoes.Arquivos.PathNFe := Concat(Estabelecimento.PathPublico,'Nfe');
    Configuracoes.Arquivos.PathInu := Concat(Estabelecimento.PathPublico,'Inu');
    Configuracoes.Arquivos.PathEvento := Concat(Estabelecimento.PathPublico,'Eve');
    LocalCerti := concat(Estabelecimento.PathPrivado, 'cert_', Estabelecimento.Fiscal.Juridica.Registro.CNPJ,'.pfx');
    if FileExists(LocalCerti) then
    Begin
      Configuracoes.Certificados.ArquivoPFX := LocalCerti;
      Configuracoes.Certificados.Senha := Config.ConfigNfe.Registro.Senha;
      Configuracoes.Certificados.NumeroSerie := NFe.SSL.CertNumeroSerie;
    End;

    Configuracoes.Geral.FormaEmissao := teNormal;
    Configuracoes.Geral.Salvar := True;

    Estabelecimento.Fiscal.Endereco.Estado.Registro.Codigo := StrtoIntDef(Copy(ChaveXML,1,2),41);
    Estabelecimento.Fiscal.Endereco.Estado.getByKey;
    Nfe.Configuracoes.WebServices.UF := Estabelecimento.Fiscal.Endereco.Estado.Registro.Abreviatura;
    FCodigoUF := Estabelecimento.Fiscal.Endereco.Estado.Registro.Codigo;

    with NotaMercadoria.Nota.Estabelecimento.Fiscal do
    Begin
      Telefone.Registro.Codigo := Estabelecimento.Registro.Codigo;
      Telefone.Registro.Tipo := 'Fax';
      Telefone.getByKey;
      DANFE.Fax := Telefone.Registro.Numero;
    End;
    with NotaMercadoria.Nota.Estabelecimento.Fiscal do
    Begin
      Email.getbyKind(Estabelecimento.Registro.Codigo,'principal');
      DANFE.Email := Email.Registro.Email;
    End;
    with NotaMercadoria.Nota.Estabelecimento.Fiscal do
    Begin
      MidiaSocial.Registro.Codigo := Estabelecimento.Registro.Codigo;
      MidiaSocial.Registro.Tipo := 'www';
      MidiaSocial.getByKey;
      DANFE.Site := MidiaSocial.Registro.Link;
    End;

    if Config.ConfigNfe.Registro.Ambiente = '0' then
      Configuracoes.WebServices.Ambiente := taProducao
    else
      Configuracoes.WebServices.Ambiente := taHomologacao;

    if Config.ConfigNfe.Registro.Versao = '310' then
      Configuracoes.Geral.VersaoDF := ve310
    else
      Configuracoes.Geral.VersaoDF := ve400;

    Configuracoes.WebServices.Visualizar := ( Config.ConfigNfe.Registro.VisualizarMensagem = 'S' );

    Configuracoes.Geral.SSLLib := TSSLLib(1);
    Configuracoes.Geral.SSLCryptLib := TSSLCryptLib(1);
    Configuracoes.Geral.SSLHttpLib := TSSLHttpLib(3);
    Configuracoes.Geral.SSLXmlSignLib := TSSLXmlSignLib(1);
    SSL.CertDataVenc;

  End;
end;

function TControllerEletronicInvoice.getNameXmlFile: String;
begin
  if Estabelecimento.PathPublico = '' then
    Estabelecimento.getRepository(False,'');
  PathNameFileXML := concat( Estabelecimento.PathPublico,'nfe\',FChaveXML,'-nfe.xml');
  Result := PathNameFileXML
end;

procedure TControllerEletronicInvoice.Inicialize;
begin
  //Pega os dados do estabelecimento
  NotaMercadoria.Nota.Estabelecimento.getByKey;
  //PEga o Estado do Estabelecimento
  FCodigoUF := NotaMercadoria.Nota.Estabelecimento.Fiscal.getStateAdrress;
end;

function TControllerEletronicInvoice.loadComponent: Boolean;
begin
  //Carrega o XMl no Componente
  Result := False;
  Try
    if FileExists(PathNameFileXML) then
    Begin
      Nfe.NotasFiscais.Clear;
      Nfe.NotasFiscais.LoadFromFile(PathNameFileXML);
      Result := True;
    End;
  Except
    Result := False;
  End;
  { 11/08/2017
    Entender melhor este codigo que há tempos executo por executar
    wnProt := TLeitor.Create;
    wnProt.CarregarArquivo(Pc_Path + '\' +  Pc_FileXML);
    wnProt.Grupo := wnProt.Arquivo;
    Nfe.DANFE.ProtocoloNFe := wnProt.rCampo(tcStr,'nProt');
  }  
end;

procedure TControllerEletronicInvoice.setFAutorizaNFe(const Value: String);
begin
  FAutorizaNFe := Value;
end;

procedure TControllerEletronicInvoice.setFChaveXML(const Value: String);
begin
  if Length(Trim(Value))= 44 then
  Begin
    FChaveXML := Value;
  End
  else
  Begin
    MensageException(['A T E N Ç Ã O!.',
                    '',
                    'Chave informada não contém 44 caracteres.']);
    FChaveXML := '';
  End;
end;


procedure TControllerEletronicInvoice.setFTipoNotaFiscal(const Value: String);
begin
  FTipoNotaFiscal := Value;
end;

end.
