unit TblIteration;

interface
Uses GenericEntity,GenericDao,CAtribEntity, System.Classes, System.SysUtils;
Type
  //nome da classe de entidade
  [TableName('tb_Iteration')]
  TIteration = Class(TGenericEntity)

  private
    Fdescription: String;
    FId: Integer;
    Fupdated_at: TDAteTime;
    Fpath_attachament: String;
    Ftb_situation_id: Integer;
    Fdetail: String;
    Ftb_institution_id: integer;
    Fkind: String;
    Ftb_order_id: Integer;
    Fcreated_at: TDAteTime;
    Ftb_customer_id: Integer;
    Ftb_user_id: Integer;

    procedure setFcreated_at(const Value: TDAteTime);
    procedure setFdescription(const Value: String);
    procedure setFdetail(const Value: String);
    procedure setFId(const Value: Integer);
    procedure setFkind(const Value: String);
    procedure setFpath_attachament(const Value: String);
    procedure setFtb_institution_id(const Value: integer);
    procedure setFtb_order_id(const Value: Integer);
    procedure setFtb_situation_id(const Value: Integer);
    procedure setFupdated_at(const Value: TDAteTime);
    procedure setFtb_customer_id(const Value: Integer);
    procedure setFusuario(const Value: Integer);



  public

    [FieldName('id')]
    [KeyField('id')]
    property Codigo: Integer read FId write setFId;

    [FieldName('tb_institution_id')]
    [KeyField('tb_institution_id')]
    property Estabelecimento: integer read Ftb_institution_id write setFtb_institution_id;

    [FieldName('tb_order_id')]
    [KeyField('tb_order_id')]
    property Ordem: Integer read Ftb_order_id write setFtb_order_id;

    [FieldName('tb_customer_id')]
    property Cliente: Integer read Ftb_customer_id write setFtb_customer_id;

    [FieldName('tb_user_id')]
    property Usuario: Integer read Ftb_user_id write setFusuario;

    [FieldName('description')]
    property Descricao: String read Fdescription write setFdescription;

    [FieldName('detail')]
    property Detalhe: String read Fdetail write setFdetail;

    [FieldName('kind')]
    property Tipo: String read Fkind write setFkind;

    [FieldName('tb_situation_id')]
    property Situacao: Integer read Ftb_situation_id write setFtb_situation_id;

    [FieldName('path_attachament')]
    property Anexo: String read Fpath_attachament write setFpath_attachament;

    [FieldName('created_at')]
    property RegistroCriado: TDAteTime read Fcreated_at write setFcreated_at;

    [FieldName('updated_at')]
    property RegistroAlterado: TDAteTime read Fupdated_at write setFupdated_at;

  End;
implementation


{ TIteration }

procedure TIteration.setFcreated_at(const Value: TDAteTime);
begin
  Fcreated_at := Value;
end;

procedure TIteration.setFdescription(const Value: String);
begin
  Fdescription := Value;
end;

procedure TIteration.setFdetail(const Value: String);
begin
  Fdetail := Value;
end;

procedure TIteration.setFId(const Value: Integer);
begin
  FId := Value;
end;

procedure TIteration.setFkind(const Value: String);
begin
  Fkind := Value;
end;

procedure TIteration.setFpath_attachament(const Value: String);
begin
  Fpath_attachament := Value;
end;

procedure TIteration.setFtb_customer_id(const Value: Integer);
begin
  Ftb_customer_id := Value;
end;

procedure TIteration.setFtb_institution_id(const Value: integer);
begin
  Ftb_institution_id := Value;
end;

procedure TIteration.setFtb_order_id(const Value: Integer);
begin
  Ftb_order_id := Value;
end;

procedure TIteration.setFtb_situation_id(const Value: Integer);
begin
  Ftb_situation_id := Value;
end;

procedure TIteration.setFupdated_at(const Value: TDAteTime);
begin
  Fupdated_at := Value;
end;

procedure TIteration.setFusuario(const Value: Integer);
begin
  Ftb_user_id := Value;
end;

end.
