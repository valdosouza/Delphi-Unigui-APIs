unit tblRestGroupHasAttribute;

interface

Uses GenericEntity,CAtribEntity;

Type
  //nome da classe de entidade
  [TableName('tb_rest_group_has_attribute')]
  TRestGroupHasAttribute = Class(TGenericEntity)

  private
    Fprice_tag: Real;
    Fdescription: String;
    FId: Integer;
    Fupdated_at: TDAteTime;
    Ftb_institution_id: Integer;
    Fkind: String;
    Ftb_rest_group_id: Integer;
    Fcreated_at: TDAteTime;
    procedure setFcreated_at(const Value: TDAteTime);
    procedure setFdescription(const Value: String);
    procedure setFId(const Value: Integer);
    procedure setFkind(const Value: String);
    procedure setFprice_tag(const Value: Real);
    procedure setFtb_institution_id(const Value: Integer);
    procedure setFtb_rest_group_id(const Value: Integer);
    procedure setFupdated_at(const Value: TDAteTime);


  public

    [FieldName('id')]
    [KeyField('id')]
    property Codigo: Integer read FId write setFId;

    [FieldName('tb_institution_id')]
    [KeyField('tb_institution_id')]
    property Estabelecimento: Integer read Ftb_institution_id write setFtb_institution_id;

    [FieldName('tb_rest_group_id')]
    [KeyField('tb_rest_group_id')]
    property Grupo: Integer read Ftb_rest_group_id write setFtb_rest_group_id;

    [FieldName('kind')]
    property Tipo: String read Fkind write setFkind;

    [FieldName('description')]
    property Descricao: String read Fdescription write setFdescription;

    [FieldName('price_tag')]
    property Preco: Real read Fprice_tag write setFprice_tag;

    [FieldName('created_at')]
    property RegistroCriado: TDAteTime read Fcreated_at write setFcreated_at;

    [FieldName('updated_at')]
    property RegistroAlterado: TDAteTime read Fupdated_at write setFupdated_at;
  End;

implementation

{ TRestGroupHasAttribute }

procedure TRestGroupHasAttribute.setFcreated_at(const Value: TDAteTime);
begin
  Fcreated_at := Value;
end;

procedure TRestGroupHasAttribute.setFdescription(const Value: String);
begin
  Fdescription := Value;
end;

procedure TRestGroupHasAttribute.setFId(const Value: Integer);
begin
  FId := Value;
end;

procedure TRestGroupHasAttribute.setFkind(const Value: String);
begin
  Fkind := Value;
end;

procedure TRestGroupHasAttribute.setFprice_tag(const Value: Real);
begin
  Fprice_tag := Value;
end;

procedure TRestGroupHasAttribute.setFtb_institution_id(const Value: Integer);
begin
  Ftb_institution_id := Value;
end;

procedure TRestGroupHasAttribute.setFtb_rest_group_id(const Value: Integer);
begin
  Ftb_rest_group_id := Value;
end;

procedure TRestGroupHasAttribute.setFupdated_at(const Value: TDAteTime);
begin
  Fupdated_at := Value;
end;

end.
