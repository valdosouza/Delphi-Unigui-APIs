unit tblusuario;

interface

Uses TEntity,CAtribEntity;

Type
  //nome da classe de entidade
  [TableName('tb_usuario')]
  TUsuario = Class(TGenericEntity)
  private
    FUSU_PORTA_EMAIL: String;
    FUSU_REQ_AUT_EMAIL: String;
    FUSU_USU_EMAIL: String;
    FUSU_ATIVO: String;
    FUSU_ASSINATURA: String;
    FUSU_CODIGO: Integer;
    FUSU_LBL_EMAIL: String;
    FUSU_NIVEL: String;
    FUSU_SENHA: String;
    FUSU_PWD_EMAIL: String;
    FUSU_SRV_SMTP: String;
    FUSU_REQ_AUT_SSL: String;
    FUSU_LOGIN: String;
    FUSU_NOME: String;
    FUSU_LGN_EMAIL: String;
    procedure setFUSU_ASSINATURA(const Value: String);
    procedure setFUSU_ATIVO(const Value: String);
    procedure setFUSU_CODIGO(const Value: Integer);
    procedure setFUSU_LBL_EMAIL(const Value: String);
    procedure setFUSU_LGN_EMAIL(const Value: String);
    procedure setFUSU_LOGIN(const Value: String);
    procedure setFUSU_NIVEL(const Value: String);
    procedure setFUSU_NOME(const Value: String);
    procedure setFUSU_PORTA_EMAIL(const Value: String);
    procedure setFUSU_PWD_EMAIL(const Value: String);
    procedure setFUSU_REQ_AUT_EMAIL(const Value: String);
    procedure setFUSU_REQ_AUT_SSL(const Value: String);
    procedure setFUSU_SENHA(const Value: String);
    procedure setFUSU_SRV_SMTP(const Value: String);
    procedure setFUSU_USU_EMAIL(const Value: String);

  public

    [KeyField('USU_CODIGO')]
    [FieldName('USU_CODIGO')]
    property Codigo: Integer read FUSU_CODIGO write setFUSU_CODIGO;
    [FieldName('USU_NOME')]
    property Nome: String read FUSU_NOME write setFUSU_NOME;
    [FieldName('USU_LOGIN')]
    property Login: String read FUSU_LOGIN write setFUSU_LOGIN;
    [FieldName('USU_SENHA')]
    property Senha: String read FUSU_SENHA write setFUSU_SENHA;
    [FieldName('USU_NIVEL')]
    property Nivel: String read FUSU_NIVEL write setFUSU_NIVEL;
    [FieldName('USU_SRV_SMTP')]
    property emailSMTP: String read FUSU_SRV_SMTP write setFUSU_SRV_SMTP;
    [FieldName('USU_LGN_EMAIL')]
    property emailLogin: String read FUSU_LGN_EMAIL write setFUSU_LGN_EMAIL;
    [FieldName('USU_PWD_EMAIL')]
    property emailSenha: String read FUSU_PWD_EMAIL write setFUSU_PWD_EMAIL;
    [FieldName('USU_USU_EMAIL')]
    property email: String read FUSU_USU_EMAIL write setFUSU_USU_EMAIL;
    [FieldName('USU_LBL_EMAIL')]
    property emailLabel: String read FUSU_LBL_EMAIL write setFUSU_LBL_EMAIL;
    [FieldName('USU_PORTA_EMAIL')]
    property emailPorta: String read FUSU_PORTA_EMAIL write setFUSU_PORTA_EMAIL;
    [FieldName('USU_ATIVO')]
    property Ativo: String read FUSU_ATIVO write setFUSU_ATIVO;
    [FieldName('USU_REQ_AUT_EMAIL')]
    property emailAutenticacao: String read FUSU_REQ_AUT_EMAIL write setFUSU_REQ_AUT_EMAIL;
    [FieldName('USU_REQ_AUT_SSL')]
    property emailSSL: String read FUSU_REQ_AUT_SSL write setFUSU_REQ_AUT_SSL;
    [FieldName('USU_ASSINATURA')]
    property emailAssinatura: String read FUSU_ASSINATURA write setFUSU_ASSINATURA;
  End;

implementation


{ TUsuario }

procedure TUsuario.setFUSU_ASSINATURA(const Value: String);
begin
  FUSU_ASSINATURA := Value;
end;

procedure TUsuario.setFUSU_ATIVO(const Value: String);
begin
  FUSU_ATIVO := Value;
end;

procedure TUsuario.setFUSU_CODIGO(const Value: Integer);
begin
  FUSU_CODIGO := Value;
end;

procedure TUsuario.setFUSU_LBL_EMAIL(const Value: String);
begin
  FUSU_LBL_EMAIL := Value;
end;

procedure TUsuario.setFUSU_LGN_EMAIL(const Value: String);
begin
  FUSU_LGN_EMAIL := Value;
end;

procedure TUsuario.setFUSU_LOGIN(const Value: String);
begin
  FUSU_LOGIN := Value;
end;

procedure TUsuario.setFUSU_NIVEL(const Value: String);
begin
  FUSU_NIVEL := Value;
end;

procedure TUsuario.setFUSU_NOME(const Value: String);
begin
  FUSU_NOME := Value;
end;

procedure TUsuario.setFUSU_PORTA_EMAIL(const Value: String);
begin
  FUSU_PORTA_EMAIL := Value;
end;

procedure TUsuario.setFUSU_PWD_EMAIL(const Value: String);
begin
  FUSU_PWD_EMAIL := Value;
end;

procedure TUsuario.setFUSU_REQ_AUT_EMAIL(const Value: String);
begin
  FUSU_REQ_AUT_EMAIL := Value;
end;

procedure TUsuario.setFUSU_REQ_AUT_SSL(const Value: String);
begin
  FUSU_REQ_AUT_SSL := Value;
end;

procedure TUsuario.setFUSU_SENHA(const Value: String);
begin
  FUSU_SENHA := Value;
end;

procedure TUsuario.setFUSU_SRV_SMTP(const Value: String);
begin
  FUSU_SRV_SMTP := Value;
end;

procedure TUsuario.setFUSU_USU_EMAIL(const Value: String);
begin
  FUSU_USU_EMAIL := Value;
end;

end.
