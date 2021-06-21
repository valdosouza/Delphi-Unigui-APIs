unit tblCompany;

interface

Uses GenericEntity,CAtribEntity, System.SysUtils;

Type
  //nome da classe de entidade
  [TableName('tb_company')]
  TCompany = Class(TGenericEntity)
  private
    Fiss_process_number: String;
    Fcrtmodal: String;
    FCNPJ: String;
    Fsend_xml_nfe_only: String;
    Fiss_inc_fiscal: String;
    FID: Integer;
    Fupdated_at: TDAteTime;
    Find_ie_destinatario: String;
    FIm: String;
    Fiss_ind_exig: String;
    Fdt_foundation: TDateTime;
    Fiss_retencao: String;
    FIE: String;
    Fcrt: String;
    Fcreated_at: TDAteTime;
    procedure setFCNPJ(const Value: String);
    procedure setFcreated_at(const Value: TDAteTime);
    procedure setFcrt(const Value: String);
    procedure setFcrtmodal(const Value: String);
    procedure setFdt_foundation(const Value: TDateTime);
    procedure setFID(const Value: Integer);
    procedure setFIE(const Value: String);
    procedure setFIm(const Value: String);
    procedure setFind_ie_destinatario(const Value: String);
    procedure setFiss_inc_fiscal(const Value: String);
    procedure setFiss_ind_exig(const Value: String);
    procedure setFiss_process_number(const Value: String);
    procedure setFiss_retencao(const Value: String);
    procedure setFsend_xml_nfe_only(const Value: String);
    procedure setFupdated_at(const Value: TDAteTime);

  public

    [KeyField('id')]
    [FieldName('id')]
    property Codigo: Integer read FID write setFID;

    [FieldName('cnpj')]
    property CNPJ: String read FCNPJ write setFCNPJ;

    [FieldName('ie')]
    property InscricaoEstadual: String read FIE write setFIE;

    [FieldName('im')]
    property InscricaoMunicipal: String read FIm write setFIm;

    [FieldName('crt')]
    property CRT: String read Fcrt write setFcrt;

    [FieldName('crt_modal')]
    property CRTmodal: String read Fcrtmodal write setFcrtmodal;

    [FieldName('ind_ie_destinatario')]
    property IndicacaoIEDestinatario: String read Find_ie_destinatario write setFind_ie_destinatario;

    [FieldName('dt_foundation')]
    property DataFundacao: TDateTime read Fdt_foundation write setFdt_foundation;

    [FieldName('iss_ind_exig')]
    property IndExigibilidadeISS: String read Fiss_ind_exig write setFiss_ind_exig;

    [FieldName('iss_retencao')]
    property RetencaoISS: String read Fiss_retencao write setFiss_retencao;

    [FieldName('iss_inc_fiscal')]
    property IncentFiscalISS: String read Fiss_inc_fiscal write setFiss_inc_fiscal;

    [FieldName('iss_process_number')]
    property NumeroProcessoISS: String read Fiss_process_number write setFiss_process_number;

    [FieldName('send_xml_nfe_only')]
    property EnviarSomenteXMLNFe: String read Fsend_xml_nfe_only write setFsend_xml_nfe_only;

    [FieldName('created_at')]
    property RegistroCriado: TDAteTime read Fcreated_at write setFcreated_at;

    [FieldName('updated_at')]
    property RegistroAlterado: TDAteTime read Fupdated_at write setFupdated_at;

  End;

implementation



{ TCompany }

procedure TCompany.setFCNPJ(const Value: String);
begin
  FCNPJ := Value;
end;

procedure TCompany.setFcreated_at(const Value: TDAteTime);
begin
  Fcreated_at := Value;
end;

procedure TCompany.setFcrt(const Value: String);
begin
  Fcrt := Value;
end;

procedure TCompany.setFcrtmodal(const Value: String);
begin
  Fcrtmodal := Value;
end;

procedure TCompany.setFdt_foundation(const Value: TDateTime);
begin
   Fdt_foundation := Value;
end;

procedure TCompany.setFID(const Value: Integer);
begin
  FID := Value;
end;

procedure TCompany.setFIE(const Value: String);
begin
  FIE := Value;
end;

procedure TCompany.setFIm(const Value: String);
begin
  FIm := Value;
end;

procedure TCompany.setFind_ie_destinatario(const Value: String);
begin
  Find_ie_destinatario := Value;
end;

procedure TCompany.setFiss_inc_fiscal(const Value: String);
begin
  Fiss_inc_fiscal := Value;
end;

procedure TCompany.setFiss_ind_exig(const Value: String);
begin
  Fiss_ind_exig := Value;
end;

procedure TCompany.setFiss_process_number(const Value: String);
begin
  Fiss_process_number := Value;
end;

procedure TCompany.setFiss_retencao(const Value: String);
begin
  Fiss_retencao := Value;
end;

procedure TCompany.setFsend_xml_nfe_only(const Value: String);
begin
  Fsend_xml_nfe_only := Value;
end;

procedure TCompany.setFupdated_at(const Value: TDAteTime);
begin
  Fupdated_at := Value;
end;

end.
