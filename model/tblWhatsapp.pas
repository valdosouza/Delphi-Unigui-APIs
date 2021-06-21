unit tblWhatsapp;

interface

Uses GenericEntity,CAtribEntity, Classes, SysUtils;

Type
  //nome da classe de entidade
  [TableName('tb_whatsapp')]
  TWhatsapp = Class(TGenericEntity)
  private
    Fsession_id: String;
    Factive: String;
    Fupdated_at: TDAteTime;
    Fid: String;
    Ftb_institution_id: Integer;
    Fcreated_at: TDAteTime;
    Furl_api: String;
    procedure setFactive(const Value: String);
    procedure setFcreated_at(const Value: TDAteTime);
    procedure setFid(const Value: String);
    procedure setFsession_id(const Value: String);
    procedure setFtb_institution_id(const Value: Integer);
    procedure setFupdated_at(const Value: TDAteTime);
    procedure setFurl_api(const Value: String);


  public

    [FieldName('tb_institution_id')]
    [KeyField('tb_institution_id')]
    property Estabelecimento: Integer read Ftb_institution_id write setFtb_institution_id;

    [FieldName('id')]
    [KeyField('id')]
    property Identificacao: String read Fid write setFid;

    [FieldName('session_id')]
    property Sessao: String read Fsession_id write setFsession_id;

    [FieldName('url_api')]
    property UrlApi: String read Furl_api write setFurl_api;

    [FieldName('active')]
    property Ativo: String read Factive write setFactive;

    [FieldName('created_at')]
    property RegistroCriado: TDAteTime read Fcreated_at write setFcreated_at;

    [FieldName('updated_at')]
    property RegistroAlterado: TDAteTime read Fupdated_at write setFupdated_at;

  End;

implementation

{ TWhatsapp }

procedure TWhatsapp.setFactive(const Value: String);
begin
  Factive := Value;
end;

procedure TWhatsapp.setFcreated_at(const Value: TDAteTime);
begin
  Fcreated_at := Value;
end;

procedure TWhatsapp.setFid(const Value: String);
begin
  Fid := Value;
end;

procedure TWhatsapp.setFsession_id(const Value: String);
begin
  Fsession_id := Value;
end;

procedure TWhatsapp.setFtb_institution_id(const Value: Integer);
begin
  Ftb_institution_id := Value;
end;

procedure TWhatsapp.setFupdated_at(const Value: TDAteTime);
begin
  Fupdated_at := Value;
end;

procedure TWhatsapp.setFurl_api(const Value: String);
begin
  Furl_api := Value;
end;

end.
