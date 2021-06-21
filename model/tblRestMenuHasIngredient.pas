unit tblRestMenuHasIngredient;

interface

Uses GenericEntity,CAtribEntity;

Type
  //nome da classe de entidade
  [TableName('tb_rest_menu_has_ingredient')]
  TRestMenuHasIngredient = Class(TGenericEntity)

  private
    Ftb_product_id: Integer;
    Factive: String;
    Fupdated_at: TDAteTime;
    Ftb_institution_id: Integer;
    Fcreated_at: TDAteTime;
    Ftb_rest_menu_id: Integer;
    Fquantity: Real;
    procedure setFactive(const Value: String);
    procedure setFcreated_at(const Value: TDAteTime);
    procedure setFtb_institution_id(const Value: Integer);
    procedure setFtb_product_id(const Value: Integer);
    procedure setFtb_rest_menu_id(const Value: Integer);
    procedure setFupdated_at(const Value: TDAteTime);
    procedure setFquantity(const Value: Real);

  public


    [FieldName('tb_institution_id')]
    [KeyField('tb_institution_id')]
    property Estabelecimento: Integer read Ftb_institution_id write setFtb_institution_id;

    [FieldName('tb_rest_menu_id')]
    [KeyField('tb_rest_menu_id')]
    property Cardapio: Integer read Ftb_rest_menu_id write setFtb_rest_menu_id;

    [FieldName('tb_product_id')]
    [KeyField('tb_product_id')]
    property Ingrediente: Integer read Ftb_product_id write setFtb_product_id;


    [FieldName('quantity')]
    property Quantidade: Real read Fquantity write setFquantity;

    [FieldName('active')]
    property Ativo: String read Factive write setFactive;

    [FieldName('created_at')]
    property RegistroCriado: TDAteTime read Fcreated_at write setFcreated_at;

    [FieldName('updated_at')]
    property RegistroAlterado: TDAteTime read Fupdated_at write setFupdated_at;
  End;


implementation

{ TRestMenuHasIngredient }

procedure TRestMenuHasIngredient.setFactive(const Value: String);
begin
  Factive := Value;
end;

procedure TRestMenuHasIngredient.setFcreated_at(const Value: TDAteTime);
begin
  Fcreated_at := Value;
end;

procedure TRestMenuHasIngredient.setFquantity(const Value: Real);
begin
  Fquantity := Value;
end;

procedure TRestMenuHasIngredient.setFtb_institution_id(const Value: Integer);
begin
  Ftb_institution_id := Value;
end;

procedure TRestMenuHasIngredient.setFtb_product_id(const Value: Integer);
begin
  Ftb_product_id := Value;
end;

procedure TRestMenuHasIngredient.setFtb_rest_menu_id(const Value: Integer);
begin
  Ftb_rest_menu_id := Value;
end;

procedure TRestMenuHasIngredient.setFupdated_at(const Value: TDAteTime);
begin
  Fupdated_at := Value;
end;

end.
