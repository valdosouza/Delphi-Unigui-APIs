unit tblWhatsappHasTalk;

interface

Uses GenericEntity,CAtribEntity, Classes, SysUtils;

Type
  //nome da classe de entidade
  [TableName('tb_whatsapp_has_talk')]
  TWhatsappHasTalk = Class(TGenericEntity)
  private
    Factive: String;
    Fid: Integer;
    Fupdated_at: TDAteTime;
    Fcontact_id: String;
    Ftb_whatsapp_id: String;
    Ftb_institution_id: Integer;
    Ftype_way: String;
    Fbody_text: String;
    Fcreated_at: TDAteTime;
    procedure setFactive(const Value: String);
    procedure setFbody_text(const Value: String);
    procedure setFcontact_id(const Value: String);
    procedure setFcreated_at(const Value: TDAteTime);
    procedure setFid(const Value: Integer);
    procedure setFtb_institution_id(const Value: Integer);
    procedure setFtb_whatsapp_id(const Value: String);
    procedure setFtype_way(const Value: String);
    procedure setFupdated_at(const Value: TDAteTime);

  public

    [FieldName('id')]
    [KeyField('id')]
    property Codigo: Integer read Fid write setFid;

    [FieldName('tb_institution_id')]
    property Estabelecimento: Integer read Ftb_institution_id write setFtb_institution_id;

    [FieldName('tb_whatsapp_id')]
    property ContaOrigem: String read Ftb_whatsapp_id write setFtb_whatsapp_id;

    [FieldName('contact_id')]
    property ContaDestino: String read Fcontact_id write setFcontact_id;

    [FieldName('body_text')]
    property Mensagem: String read Fbody_text write setFbody_text;

    [FieldName('type_way')]
    property Sentido: String read Ftype_way write setFtype_way;

    [FieldName('active')]
    property Ativo: String read Factive write setFactive;

    [FieldName('created_at')]
    property RegistroCriado: TDAteTime read Fcreated_at write setFcreated_at;

    [FieldName('updated_at')]
    property RegistroAlterado: TDAteTime read Fupdated_at write setFupdated_at;

  End;


implementation


{ TWhatsappHasTalk }

procedure TWhatsappHasTalk.setFactive(const Value: String);
begin
  Factive := Value;
end;

procedure TWhatsappHasTalk.setFbody_text(const Value: String);
begin
  Fbody_text := Value;
end;

procedure TWhatsappHasTalk.setFcontact_id(const Value: String);
begin
  Fcontact_id := Value;
end;

procedure TWhatsappHasTalk.setFcreated_at(const Value: TDAteTime);
begin
  Fcreated_at := Value;
end;

procedure TWhatsappHasTalk.setFid(const Value: Integer);
begin
  Fid := Value;
end;

procedure TWhatsappHasTalk.setFtb_institution_id(const Value: Integer);
begin
  Ftb_institution_id := Value;
end;

procedure TWhatsappHasTalk.setFtb_whatsapp_id(const Value: String);
begin
  Ftb_whatsapp_id := Value;
end;

procedure TWhatsappHasTalk.setFtype_way(const Value: String);
begin
  Ftype_way := Value;
end;

procedure TWhatsappHasTalk.setFupdated_at(const Value: TDAteTime);
begin
  Fupdated_at := Value;
end;

end.
