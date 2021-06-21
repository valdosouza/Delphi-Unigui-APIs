unit tblOrderHasDelivery;

interface

Uses GenericEntity,GenericDao,CAtribEntity, System.Classes, System.SysUtils;
Type
  //nome da classe de entidade
  [TableName('tb_order_has_delivery')]
  TOrderHasDelivery = Class(TGenericEntity)
  private
    Ftb_order_to_deliver_id: Integer;
    Fupdated_at: TDAteTime;
    Ftb_order_item_id: Integer;
    FTb_institution_id: Integer;
    Ftb_order_id: Integer;
    Fcreated_at: TDAteTime;
    procedure setFcreated_at(const Value: TDAteTime);
    procedure setFTb_institution_id(const Value: Integer);
    procedure setFtb_order_id(const Value: Integer);
    procedure setFtb_order_item_id(const Value: Integer);
    procedure setFtb_order_to_deliver_id(const Value: Integer);
    procedure setFupdated_at(const Value: TDAteTime);

  public

    [KeyField('tb_institution_id')]
    [FieldName('tb_institution_id')]
    property Estabelecimento: Integer read FTb_institution_id write setFTb_institution_id;

    [KeyField('tb_order_id')]
    [FieldName('tb_order_id')]
    property Ordem: Integer read Ftb_order_id write setFtb_order_id;

    [KeyField('tb_order_item_id')]
    [FieldName('tb_order_item_id')]
    property OrdemItem: Integer read Ftb_order_item_id write setFtb_order_item_id;

    [FieldName('tb_order_to_deliver_id')]
    property ItemListadeCompra: Integer read Ftb_order_to_deliver_id write setFtb_order_to_deliver_id;

    [FieldName('created_at')]
    property RegistroCriado: TDAteTime read Fcreated_at write setFcreated_at;

    [FieldName('updated_at')]
    property RegistroAlterado: TDAteTime read Fupdated_at write setFupdated_at;

  End;

implementation

{ TOrderHasDelivery }

procedure TOrderHasDelivery.setFcreated_at(const Value: TDAteTime);
begin
  Fcreated_at := Value;
end;

procedure TOrderHasDelivery.setFTb_institution_id(const Value: Integer);
begin
  FTb_institution_id := Value;
end;

procedure TOrderHasDelivery.setFtb_order_id(const Value: Integer);
begin
  Ftb_order_id := Value;
end;

procedure TOrderHasDelivery.setFtb_order_item_id(const Value: Integer);
begin
  Ftb_order_item_id := Value;
end;

procedure TOrderHasDelivery.setFtb_order_to_deliver_id(const Value: Integer);
begin
  Ftb_order_to_deliver_id := Value;
end;

procedure TOrderHasDelivery.setFupdated_at(const Value: TDAteTime);
begin
  Fupdated_at := Value;
end;

end.
