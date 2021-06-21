unit tblUserSendEmail;

interface

Uses GenericEntity,CAtribEntity, Classes, SysUtils;

Type
  //nome da classe de entidade
  [TableName('tb_user_send_email')]
  TUserSendEmail = Class(TGenericEntity)
  private
    Fsignature: String;
    Fupdated_at: TDAteTime;
    Fnotify_access: String;
    Fpass_word: String;
    Fsmtp: String;
    Freq_ssl: String;
    Fport: String;
    Ftb_user_id: Integer;
    Fcreated_at: TDAteTime;
    Freq_auth: String;
    procedure setFcreated_at(const Value: TDAteTime);
    procedure setFnotify_access(const Value: String);
    procedure setFpass_word(const Value: String);
    procedure setFport(const Value: String);
    procedure setFreq_auth(const Value: String);
    procedure setFreq_ssl(const Value: String);
    procedure setFsignature(const Value: String);
    procedure setFsmtp(const Value: String);
    procedure setFtb_user_id(const Value: Integer);
    procedure setFupdated_at(const Value: TDAteTime);


  public

    [FieldName('tb_user_id')]
    [KeyField('tb_user_id')]
    property Usuario: Integer read Ftb_user_id write setFtb_user_id;

    [FieldName('smtp')]
    property SMtp: String read Fsmtp write setFsmtp;

    [FieldName('port')]
    property Porta: String read Fport write setFport;

    [FieldName('pass_word')]
    property Senha: String read Fpass_word write setFpass_word;

    [FieldName('req_auth')]
    property RequerAutenticacao: String read Freq_auth write setFreq_auth;

    [FieldName('req_ssl')]
    property RequerSSL: String read Freq_ssl write setFreq_ssl;

    [FieldName('notify_access')]
    property NotificarAcesso: String read Fnotify_access write setFnotify_access;

    [FieldName('signature')]
    property Assinatura: String read Fsignature write setFsignature;

    [FieldName('created_at')]
    property RegistroCriado: TDAteTime read Fcreated_at write setFcreated_at;

    [FieldName('updated_at')]
    property RegistroAlterado: TDAteTime read Fupdated_at write setFupdated_at;
  End;



implementation

{ TUserSendEmail }

procedure TUserSendEmail.setFcreated_at(const Value: TDAteTime);
begin
  Fcreated_at := Value;
end;

procedure TUserSendEmail.setFnotify_access(const Value: String);
begin
  Fnotify_access := Value;
end;

procedure TUserSendEmail.setFpass_word(const Value: String);
begin
  Fpass_word := Value;
end;

procedure TUserSendEmail.setFport(const Value: String);
begin
  Fport := Value;
end;

procedure TUserSendEmail.setFreq_auth(const Value: String);
begin
  Freq_auth := Value;
end;

procedure TUserSendEmail.setFreq_ssl(const Value: String);
begin
  Freq_ssl := Value;
end;

procedure TUserSendEmail.setFsignature(const Value: String);
begin
  Fsignature := Value;
end;

procedure TUserSendEmail.setFsmtp(const Value: String);
begin
  Fsmtp := Value;
end;

procedure TUserSendEmail.setFtb_user_id(const Value: Integer);
begin
  Ftb_user_id := Value;
end;

procedure TUserSendEmail.setFupdated_at(const Value: TDAteTime);
begin
  Fupdated_at := Value;
end;

end.
