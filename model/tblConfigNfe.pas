unit tblConfigNfe;

interface

Uses GenericEntity,GenericDao,CAtribEntity, System.Classes, System.SysUtils;
Type
  //nome da classe de entidade
  [TableName('tb_config_nfe')]
  TConfigNfe = Class(TGenericEntity)
  private
    Fset_view_msg: String;
    Fcertificate_serie: String;
    Fupdated_at: TDAteTime;
    Ftype_emission: String;
    Fcertificate_pass: String;
    Flayer: String;
    Ftb_institution_id: Integer;
    Fcertificate_path: String;
    Fcertificate: String;
    Fcreated_at: TDAteTime;
    Fversion: String;
    procedure setFcertificate(const Value: String);
    procedure setFcertificate_pass(const Value: String);
    procedure setFcertificate_path(const Value: String);
    procedure setFcertificate_serie(const Value: String);
    procedure setFcreated_at(const Value: TDAteTime);
    procedure setFlayer(const Value: String);
    procedure setFset_view_msg(const Value: String);
    procedure setFtb_institution_id(const Value: Integer);
    procedure setFtype_emission(const Value: String);
    procedure setFupdated_at(const Value: TDAteTime);
    procedure setFversion(const Value: String);

  public

    [KeyField('tb_institution_id')]
    [FieldName('tb_institution_id')]
    property Estabelecimento: Integer read Ftb_institution_id write setFtb_institution_id;

    [FieldName('layer')]
    property Ambiente: String read Flayer write setFlayer;

    [FieldName('version')]
    property Versao: String read Fversion write setFversion;

    [FieldName('type_emission')]
    property TipoEmissao: String read Ftype_emission write setFtype_emission;

    [FieldName('certificate')]
    property Certificado: String read Fcertificate write setFcertificate;

    [FieldName('certificate_serie')]
    property Serie: String read Fcertificate_serie write setFcertificate_serie;

    [FieldName('certificate_pass')]
    property Senha: String read Fcertificate_pass write setFcertificate_pass;

    [FieldName('certificate_path')]
    property Arquivo: String read Fcertificate_path write setFcertificate_path;

    [FieldName('set_view_msg')]
    property VisualizarMensagem: String read Fset_view_msg write setFset_view_msg;

    [FieldName('created_at')]
    property RegistroCriado: TDAteTime read Fcreated_at write setFcreated_at;

    [FieldName('updated_at')]
    property RegistroAlterado: TDAteTime read Fupdated_at write setFupdated_at;

  End;
implementation


{ TConfigNfe }

procedure TConfigNfe.setFcertificate(const Value: String);
begin
  Fcertificate := Value;
end;

procedure TConfigNfe.setFcertificate_pass(const Value: String);
begin
  Fcertificate_pass := Value;
end;

procedure TConfigNfe.setFcertificate_path(const Value: String);
begin
  Fcertificate_path := Value;
end;

procedure TConfigNfe.setFcertificate_serie(const Value: String);
begin
  Fcertificate_serie := Value;
end;

procedure TConfigNfe.setFcreated_at(const Value: TDAteTime);
begin
  Fcreated_at := Value;
end;

procedure TConfigNfe.setFlayer(const Value: String);
begin
  Flayer := Value;
end;

procedure TConfigNfe.setFset_view_msg(const Value: String);
begin
  Fset_view_msg := Value;
end;

procedure TConfigNfe.setFtb_institution_id(const Value: Integer);
begin
  Ftb_institution_id := Value;
end;

procedure TConfigNfe.setFtype_emission(const Value: String);
begin
  Ftype_emission := Value;
end;

procedure TConfigNfe.setFupdated_at(const Value: TDAteTime);
begin
  Fupdated_at := Value;
end;

procedure TConfigNfe.setFversion(const Value: String);
begin
  Fversion := Value;
end;

end.
