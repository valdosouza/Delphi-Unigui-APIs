unit tblOrderJobHasBought;

interface

Uses GenericEntity,GenericDao,CAtribEntity, System.Classes, System.SysUtils;
Type
  //nome da classe de entidade
  [TableName('tb_order_job_has_bought')]
  TOrderJobHasBought = Class(TGenericEntity)
  private
    Ftb_order_bought: Integer;
    Ftb_order_id: Integer;
    Ftb_order_item_id: Integer;
    Fupdated_at: TDAteTime;
    FTb_institution_id: Integer;
    Fcreated_at: TDAteTime;
    Ftb_order_item_bought: Integer;
    procedure setFcreated_at(const Value: TDAteTime);
    procedure setFTb_institution_id(const Value: Integer);
    procedure setFtb_order_bought(const Value: Integer);
    procedure setFtb_order_id(const Value: Integer);
    procedure setFtb_order_item_bought(const Value: Integer);
    procedure setFtb_order_item_id(const Value: Integer);
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

    [FieldName('tb_order_bought')]
    [KeyField('tb_order_bought')]
    property OrdemCompra: Integer read Ftb_order_bought write setFtb_order_bought;

    [FieldName('tb_order_item_bought')]
    [KeyField('tb_order_item_bought')]
    property OrdemItemCompra: Integer read Ftb_order_item_bought write setFtb_order_item_bought;

    [FieldName('created_at')]
    property RegistroCriado: TDAteTime read Fcreated_at write setFcreated_at;

    [FieldName('updated_at')]
    property RegistroAlterado: TDAteTime read Fupdated_at write setFupdated_at;
  End;

implementation





{ TOrderJobHasBought }

procedure TOrderJobHasBought.setFcreated_at(const Value: TDAteTime);
begin
  Fcreated_at := Value;
end;

procedure TOrderJobHasBought.setFTb_institution_id(const Value: Integer);
begin
  FTb_institution_id := Value;
end;

procedure TOrderJobHasBought.setFtb_order_bought(const Value: Integer);
begin
  Ftb_order_bought := Value;
end;

procedure TOrderJobHasBought.setFtb_order_id(const Value: Integer);
begin
  Ftb_order_id := Value;
end;

procedure TOrderJobHasBought.setFtb_order_item_bought(const Value: Integer);
begin
  Ftb_order_item_bought := Value;
end;

procedure TOrderJobHasBought.setFtb_order_item_id(const Value: Integer);
begin
  Ftb_order_item_id := Value;
end;

procedure TOrderJobHasBought.setFupdated_at(const Value: TDAteTime);
begin
  Fupdated_at := Value;
end;

end.
