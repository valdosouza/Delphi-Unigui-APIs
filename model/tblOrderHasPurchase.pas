
unit tblOrderHasPurchase;

interface

Uses GenericEntity,GenericDao,CAtribEntity, System.Classes, System.SysUtils;
Type
  //nome da classe de entidade
  [TableName('tb_order_has_purchase')]
  TOrderHasPurchase = Class(TGenericEntity)
  private
    Ftb_order_to_buy_id: Integer;
    Fupdated_at: TDAteTime;
    Ftb_order_item_id: Integer;
    Ftb_institution_id: Integer;
    Ftb_order_id: Integer;
    Fcreated_at: TDAteTime;
    procedure setFcreated_at(const Value: TDAteTime);
    procedure setFtb_institution_id(const Value: Integer);
    procedure setFtb_order_id(const Value: Integer);
    procedure setFtb_order_item_id(const Value: Integer);
    procedure setFtb_order_to_buy_id(const Value: Integer);
    procedure setFupdated_at(const Value: TDAteTime);


  public
    [FieldName('tb_institution_id')]
    [KeyField('tb_institution_id')]
    property Estabelecimento: Integer read Ftb_institution_id write setFtb_institution_id;

    [FieldName('tb_order_id')]
    [KeyField('tb_order_id')]
    property Ordem: Integer read Ftb_order_id write setFtb_order_id;

    [FieldName('tb_order_item_id')]
    [KeyField('tb_order_item_id')]
    property Item: Integer read Ftb_order_item_id write setFtb_order_item_id;

    [FieldName('tb_order_to_buy_id')]
    property ItemListadeCompra: Integer read Ftb_order_to_buy_id write setFtb_order_to_buy_id;

    [FieldName('created_at')]
    property RegistroCriado: TDAteTime read Fcreated_at write setFcreated_at;

    [FieldName('updated_at')]
    property RegistroAlterado: TDAteTime read Fupdated_at write setFupdated_at;

  End;
implementation


{ TOrderHasPurchase }

procedure TOrderHasPurchase.setFcreated_at(const Value: TDAteTime);
begin
  Fcreated_at := Value;
end;

procedure TOrderHasPurchase.setFtb_institution_id(const Value: Integer);
begin
  Ftb_institution_id := Value;
end;

procedure TOrderHasPurchase.setFtb_order_id(const Value: Integer);
begin
  Ftb_order_id := Value;
end;

procedure TOrderHasPurchase.setFtb_order_item_id(const Value: Integer);
begin
  Ftb_order_item_id := Value;
end;

procedure TOrderHasPurchase.setFtb_order_to_buy_id(const Value: Integer);
begin
  Ftb_order_to_buy_id := Value;
end;

procedure TOrderHasPurchase.setFupdated_at(const Value: TDAteTime);
begin
  Fupdated_at := Value;
end;

end.
