unit tblOrderItemDetailRemove;

interface

Uses GenericEntity,GenericDao,CAtribEntity, System.Classes, System.SysUtils;
Type
  //nome da classe de entidade
  [TableName('tb_order_item_detail_remove')]
  TOrderItemDetailRemove = Class(TGenericEntity)
  private
    Ftb_order_item_detail_id: Integer;
    FId: Integer;
    Fupdated_at: TDAteTime;
    Ftb_order_item_detached_id: Integer;
    Ftb_institution_id: Integer;
    Fterminal: Integer;
    Ftb_order_id: Integer;
    Ftb_product_id: Integer;
    Fcreated_at: TDAteTime;
    procedure setFcreated_at(const Value: TDAteTime);
    procedure setFId(const Value: Integer);
    procedure setFtb_institution_id(const Value: Integer);
    procedure setFtb_order_id(const Value: Integer);
    procedure setFtb_order_item_detached_id(const Value: Integer);
    procedure setFtb_order_item_detail_id(const Value: Integer);
    procedure setFtb_product_id(const Value: Integer);
    procedure setFterminal(const Value: Integer);
    procedure setFupdated_at(const Value: TDAteTime);

  public
    [KeyField('id')]
    [FieldName('id')]
    property Codigo: Integer read FId write setFId;

    [KeyField('tb_institution_id')]
    [FieldName('tb_institution_id')]
    property Estabelecimento: Integer read Ftb_institution_id write setFtb_institution_id;

    [KeyField('tb_order_id')]
    [FieldName('tb_order_id')]
    property Ordem: Integer read Ftb_order_id write setFtb_order_id;

    [KeyField('terminal')]
    [FieldName('terminal')]
    property Terminal: Integer read Fterminal write setFterminal;

    [FieldName('tb_order_item_detail_id')]
    property ItemDetalhe: Integer read Ftb_order_item_detail_id write setFtb_order_item_detail_id;

    [FieldName('tb_order_item_detached_id')]
    property ItemAvulso: Integer read Ftb_order_item_detached_id write setFtb_order_item_detached_id;

    [FieldName('tb_product_id')]
    property ProdutoOpcional: Integer read Ftb_product_id write setFtb_product_id;

    [FieldName('created_at')]
    property RegistroCriado: TDAteTime read Fcreated_at write setFcreated_at;

    [FieldName('updated_at')]
    property RegistroAlterado: TDAteTime read Fupdated_at write setFupdated_at;

  End;

implementation


{ TOrderItemDetailRemove }

procedure TOrderItemDetailRemove.setFcreated_at(const Value: TDAteTime);
begin
  Fcreated_at := Value;
end;

procedure TOrderItemDetailRemove.setFId(const Value: Integer);
begin
  FId := Value;
end;

procedure TOrderItemDetailRemove.setFtb_institution_id(const Value: Integer);
begin
  Ftb_institution_id := Value;
end;

procedure TOrderItemDetailRemove.setFtb_order_id(const Value: Integer);
begin
  Ftb_order_id := Value;
end;

procedure TOrderItemDetailRemove.setFtb_order_item_detached_id(
  const Value: Integer);
begin
  Ftb_order_item_detached_id := Value;
end;

procedure TOrderItemDetailRemove.setFtb_order_item_detail_id(
  const Value: Integer);
begin
  Ftb_order_item_detail_id := Value;
end;

procedure TOrderItemDetailRemove.setFtb_product_id(const Value: Integer);
begin
  Ftb_product_id := Value;
end;

procedure TOrderItemDetailRemove.setFterminal(const Value: Integer);
begin
  Fterminal := Value;
end;

procedure TOrderItemDetailRemove.setFupdated_at(const Value: TDAteTime);
begin
  Fupdated_at := Value;
end;

end.
