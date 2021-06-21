unit tblOrderBudgedMedia;

interface

Uses GenericEntity,GenericDao,CAtribEntity, System.Classes, System.SysUtils;
Type
  //nome da classe de entidade
  [TableName('tb_order_budged_media')]
  TOrderBudgedMedia = Class(TGenericEntity)
  private
    Fsignature_resp: String;
    Femail: String;
    FId: Integer;
    Fpayment_types: Integer;
    Fdt_expiration: TDateTime;
    Fupdated_at: TDAteTime;
    Ftb_advertiser_id: Integer;
    Fnumber: Integer;
    Ffiled: String;
    Femail_resp: String;
    Fcontact: String;
    Ftb_institution_id: Integer;
    Ftb_agency_id: Integer;
    Fkind_media: Integer;
    Fphone: String;
    Fvalidate: String;
    Fcreated_at: TDAteTime;
    procedure setFcontact(const Value: String);
    procedure setFcreated_at(const Value: TDAteTime);
    procedure setFdt_expiration(const Value: TDateTime);
    procedure setFemail(const Value: String);
    procedure setFemail_resp(const Value: String);
    procedure setFfiled(const Value: String);
    procedure setFId(const Value: Integer);
    procedure setFkind_media(const Value: Integer);
    procedure setFnumber(const Value: Integer);
    procedure setFpayment_types(const Value: Integer);
    procedure setFphone(const Value: String);
    procedure setFsignature_resp(const Value: String);
    procedure setFtb_advertiser_id(const Value: Integer);
    procedure setFtb_agency_id(const Value: Integer);
    procedure setFtb_institution_id(const Value: Integer);
    procedure setFupdated_at(const Value: TDAteTime);
    procedure setFvalidate(const Value: String);


  public
    [FieldName('id')]
    [KeyField('id')]
    property Codigo: Integer read FId write setFId;

    [KeyField('tb_institution_id')]
    [FieldName('tb_institution_id')]
    property Estabelecimento: Integer read Ftb_institution_id write setFtb_institution_id;

    [FieldName('number')]
    property Numero: Integer read Fnumber write setFnumber;

    [FieldName('validate')]
    property Validade: String read Fvalidate write setFvalidate;

    [FieldName('tb_agency_id')]
    property Agencia: Integer read Ftb_agency_id write setFtb_agency_id;

    [FieldName('tb_advertiser_id')]
    property Anunciante: Integer read Ftb_advertiser_id write setFtb_advertiser_id;

    [FieldName('contact')]
    property Contato: String read Fcontact write setFcontact;

    [FieldName('email')]
    property email : String read Femail write setFemail;

    [FieldName('phone')]
    property Telefone: String read Fphone write setFphone;

    [FieldName('payment_types')]
    property TipoPagamento: Integer read Fpayment_types write setFpayment_types;

    [FieldName('signature_resp')]
    property Assinatura: String read Fsignature_resp write setFsignature_resp;

    [FieldName('email_resp')]
    property EmailResponsavel: String read Femail_resp write setFemail_resp;

    [FieldName('dt_expiration')]
    property Vencimento: TDateTime read Fdt_expiration write setFdt_expiration;

    [FieldName('filed')]
    property Arquivado: String read Ffiled write setFfiled;

    [FieldName('kind_media')]
    property TipoMidia: Integer read Fkind_media write setFkind_media;

    [FieldName('created_at')]
    property RegistroCriado: TDAteTime read Fcreated_at write setFcreated_at;

    [FieldName('updated_at')]
    property RegistroAlterado: TDAteTime read Fupdated_at write setFupdated_at;

  End;
implementation


{ TOrderBudgedMedia }

procedure TOrderBudgedMedia.setFcontact(const Value: String);
begin
  Fcontact := Value;
end;

procedure TOrderBudgedMedia.setFcreated_at(const Value: TDAteTime);
begin
  Fcreated_at := Value;
end;

procedure TOrderBudgedMedia.setFdt_expiration(const Value: TDateTime);
begin
  Fdt_expiration := Value;
end;

procedure TOrderBudgedMedia.setFemail(const Value: String);
begin
  Femail := Value;
end;

procedure TOrderBudgedMedia.setFemail_resp(const Value: String);
begin
  Femail_resp := Value;
end;

procedure TOrderBudgedMedia.setFfiled(const Value: String);
begin
  Ffiled := Value;
end;

procedure TOrderBudgedMedia.setFId(const Value: Integer);
begin
  FId := Value;
end;

procedure TOrderBudgedMedia.setFkind_media(const Value: Integer);
begin
  Fkind_media := Value;
end;

procedure TOrderBudgedMedia.setFnumber(const Value: Integer);
begin
  Fnumber := Value;
end;

procedure TOrderBudgedMedia.setFpayment_types(const Value: Integer);
begin
  Fpayment_types := Value;
end;

procedure TOrderBudgedMedia.setFphone(const Value: String);
begin
  Fphone := Value;
end;

procedure TOrderBudgedMedia.setFsignature_resp(const Value: String);
begin
  Fsignature_resp := Value;
end;

procedure TOrderBudgedMedia.setFtb_advertiser_id(const Value: Integer);
begin
  Ftb_advertiser_id := Value;
end;

procedure TOrderBudgedMedia.setFtb_agency_id(const Value: Integer);
begin
  Ftb_agency_id := Value;
end;

procedure TOrderBudgedMedia.setFtb_institution_id(const Value: Integer);
begin
  Ftb_institution_id := Value;
end;

procedure TOrderBudgedMedia.setFupdated_at(const Value: TDAteTime);
begin
  Fupdated_at := Value;
end;

procedure TOrderBudgedMedia.setFvalidate(const Value: String);
begin
  Fvalidate := Value;
end;

end.
