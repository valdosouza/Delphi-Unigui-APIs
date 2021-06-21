unit tblRestGroupHasOptional;

interface

Uses GenericEntity,CAtribEntity;

Type
  //nome da classe de entidade
  [TableName('tb_rest_group_has_optional')]
  TRestGroupHasOptional = Class(TGenericEntity)

  private
    Ftb_product_id: Integer;
    Fprice_tag: Real;
    FId: Integer;
    Fupdated_at: TDAteTime;
    Ftb_institution_id: Integer;
    Ftb_rest_group_id: Integer;
    Fcreated_at: TDAteTime;
    Fquantity: Real;
    procedure setFcreated_at(const Value: TDAteTime);
    procedure setFId(const Value: Integer);
    procedure setFprice_tag(const Value: Real);
    procedure setFtb_institution_id(const Value: Integer);
    procedure setFtb_product_id(const Value: Integer);
    procedure setFtb_rest_group_id(const Value: Integer);
    procedure setFupdated_at(const Value: TDAteTime);
    procedure setFquantity(const Value: Real);


  public

    [FieldName('tb_institution_id')]
    [KeyField('tb_institution_id')]
    property Estabelecimento: Integer read Ftb_institution_id write setFtb_institution_id;

    [FieldName('tb_rest_group_id')]
    [KeyField('tb_rest_group_id')]
    property Grupo: Integer read Ftb_rest_group_id write setFtb_rest_group_id;

    [FieldName('tb_product_id')]
    [KeyField('tb_product_id')]
    property Produto: Integer read Ftb_product_id write setFtb_product_id;

    [FieldName('quantity')]
    property Quantidade: Real read Fquantity write setFquantity;

    [FieldName('price_tag')]
    property Preco: Real read Fprice_tag write setFprice_tag;

    [FieldName('created_at')]
    property RegistroCriado: TDAteTime read Fcreated_at write setFcreated_at;

    [FieldName('updated_at')]
    property RegistroAlterado: TDAteTime read Fupdated_at write setFupdated_at;
  End;
implementation


{ TRestGroupHasOptional }

procedure TRestGroupHasOptional.setFcreated_at(const Value: TDAteTime);
begin
  Fcreated_at := Value;
end;

procedure TRestGroupHasOptional.setFId(const Value: Integer);
begin
  FId := Value;
end;

procedure TRestGroupHasOptional.setFprice_tag(const Value: Real);
begin
  Fprice_tag := Value;
end;

procedure TRestGroupHasOptional.setFquantity(const Value: Real);
begin
  Fquantity := Value;
end;

procedure TRestGroupHasOptional.setFtb_institution_id(const Value: Integer);
begin
  Ftb_institution_id := Value;
end;

procedure TRestGroupHasOptional.setFtb_product_id(const Value: Integer);
begin
  Ftb_product_id := Value;
end;

procedure TRestGroupHasOptional.setFtb_rest_group_id(const Value: Integer);
begin
  Ftb_rest_group_id := Value;
end;

procedure TRestGroupHasOptional.setFupdated_at(const Value: TDAteTime);
begin
  Fupdated_at := Value;
end;

end.
