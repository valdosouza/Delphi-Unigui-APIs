unit tblOrderHasProduction;

interface

Uses GenericEntity,GenericDao,CAtribEntity, System.Classes, System.SysUtils;
Type
  //nome da classe de entidade
  [TableName('tb_order_has_production')]
  TOrderHasProduction = Class(TGenericEntity)

  private
    Fupdated_at: TDAteTime;
    Ftb_order_item_id: Integer;
    Ftb_order_production_id: Integer;
    FTb_institution_id: Integer;
    Ftb_order_id: Integer;
    Fcreated_at: TDAteTime;
    procedure setFcreated_at(const Value: TDAteTime);
    procedure setFTb_institution_id(const Value: Integer);
    procedure setFtb_order_id(const Value: Integer);
    procedure setFtb_order_item_id(const Value: Integer);
    procedure setFtb_order_production_id(const Value: Integer);
    procedure setFupdated_at(const Value: TDAteTime);


 public
    [FieldName('tb_institution_id')]
    [KeyField('tb_institution_id')]
    property Estabelecimento: Integer read FTb_institution_id write setFTb_institution_id;

    [FieldName('tb_order_id')]
    [KeyField('tb_order_id')]
    property Ordem: Integer read Ftb_order_id write setFtb_order_id;

    [FieldName('tb_order_item_id')]
    [KeyField('tb_order_item_id')]
    property OrdemItem: Integer read Ftb_order_item_id write setFtb_order_item_id;

    [KeyField('tb_order_production_id')]
    property OrdemProducao: Integer read Ftb_order_production_id write setFtb_order_production_id;

    [FieldName('created_at')]
    property RegistroCriado: TDAteTime read Fcreated_at write setFcreated_at;

    [FieldName('updated_at')]
    property RegistroAlterado: TDAteTime read Fupdated_at write setFupdated_at;
  End;

implementation


{ TOrderHasProducttion }


{ TOrderHasProduction }

procedure TOrderHasProduction.setFcreated_at(const Value: TDAteTime);
begin
  Fcreated_at := Value;
end;

procedure TOrderHasProduction.setFTb_institution_id(const Value: Integer);
begin
  FTb_institution_id := Value;
end;

procedure TOrderHasProduction.setFtb_order_id(const Value: Integer);
begin
  Ftb_order_id := Value;
end;

procedure TOrderHasProduction.setFtb_order_item_id(const Value: Integer);
begin
  Ftb_order_item_id := Value;
end;

procedure TOrderHasProduction.setFtb_order_production_id(const Value: Integer);
begin
  Ftb_order_production_id := Value;
end;

procedure TOrderHasProduction.setFupdated_at(const Value: TDAteTime);
begin
  Fupdated_at := Value;
end;

end.
