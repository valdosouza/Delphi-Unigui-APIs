unit tblWhatsappHasContact;

interface

Uses GenericEntity,CAtribEntity, Classes, SysUtils;

Type
  //nome da classe de entidade
  [TableName('tb_whatsapp_has_contact')]
  TWhatsappHasContact = Class(TGenericEntity)
  private
    Factive: String;
    Fimg_full_url: String;
    Fupdated_at: TDAteTime;
    Fid: String;
    Ftb_whatsapp_id: String;
    Ftb_institution_id: Integer;
    Fname: String;
    Fcreated_at: TDAteTime;
    procedure setFactive(const Value: String);
    procedure setFcreated_at(const Value: TDAteTime);
    procedure setFid(const Value: String);
    procedure setFimg_full_url(const Value: String);
    procedure setFname(const Value: String);
    procedure setFtb_institution_id(const Value: Integer);
    procedure setFtb_whatsapp_id(const Value: String);
    procedure setFupdated_at(const Value: TDAteTime);



  public

    [FieldName('tb_institution_id')]
    [KeyField('tb_institution_id')]
    property Estabelecimento: Integer read Ftb_institution_id write setFtb_institution_id;

    [FieldName('tb_whatsapp_id')]
    [KeyField('tb_whatsapp_id')]
    property ContaOrigem: String read Ftb_whatsapp_id write setFtb_whatsapp_id;

    [FieldName('id')]
    [KeyField('id')]
    property ContaDestino: String read Fid write setFid;

    [FieldName('name')]
    property Nome: String read Fname write setFname;


    [FieldName('img_full_url')]
    property ImagemUrl: String read Fimg_full_url write setFimg_full_url;

    [FieldName('active')]
    property Ativo: String read Factive write setFactive;

    [FieldName('created_at')]
    property RegistroCriado: TDAteTime read Fcreated_at write setFcreated_at;

    [FieldName('updated_at')]
    property RegistroAlterado: TDAteTime read Fupdated_at write setFupdated_at;

  End;


implementation

{ TWhatsappHasContact }

procedure TWhatsappHasContact.setFactive(const Value: String);
begin
  Factive := Value;
end;

procedure TWhatsappHasContact.setFcreated_at(const Value: TDAteTime);
begin
  Fcreated_at := Value;
end;

procedure TWhatsappHasContact.setFid(const Value: String);
begin
  Fid := Value;
end;

procedure TWhatsappHasContact.setFimg_full_url(const Value: String);
begin
  Fimg_full_url := Value;
end;

procedure TWhatsappHasContact.setFname(const Value: String);
begin
  Fname := Value;
end;

procedure TWhatsappHasContact.setFtb_institution_id(const Value: Integer);
begin
  Ftb_institution_id := Value;
end;

procedure TWhatsappHasContact.setFtb_whatsapp_id(const Value: String);
begin
  Ftb_whatsapp_id := Value;
end;

procedure TWhatsappHasContact.setFupdated_at(const Value: TDAteTime);
begin
  Fupdated_at := Value;
end;

end.
