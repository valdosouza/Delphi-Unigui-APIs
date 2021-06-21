unit tblOrderToBuy;

interface

Uses GenericEntity,GenericDao,CAtribEntity, System.Classes, System.SysUtils;
Type
  //nome da classe de entidade
  [TableName('tb_order_to_buy')]
  TOrderJobToBuy = Class(TGenericEntity)
  private
    Fdt_record: TDateTime;
    Fid: Integer;
    Fupdated_at: TDAteTime;
    Ftb_order_item_id: Integer;
    Ftb_merchandise_id: Integer;
    Fqtde: Real;
    FTb_institution_id: Integer;
    Ftb_order_id: Integer;
    Fcreated_at: TDAteTime;
    Fstatus: String;
    procedure setFcreated_at(const Value: TDAteTime);
    procedure setFdt_record(const Value: TDateTime);
    procedure setFId(const Value: Integer);
    procedure setFqtde(const Value: Real);
    procedure setFTb_institution_id(const Value: Integer);
    procedure setFtb_merchandise_id(const Value: Integer);
    procedure setFtb_order_id(const Value: Integer);
    procedure setFtb_order_item_id(const Value: Integer);
    procedure setFupdated_at(const Value: TDAteTime);
    procedure setFstatus(const Value: String);


 public
    [FieldName('id')]
    [KeyField('id')]
    property Codigo: Integer read Fid write setFId;

    [FieldName('tb_institution_id')]
    [KeyField('tb_institution_id')]
    property Estabelecimento: Integer read FTb_institution_id write setFTb_institution_id;

    [FieldName('tb_order_id')]
    property Ordem: Integer read Ftb_order_id write setFtb_order_id;

    [FieldName('tb_order_item_id')]
    property OrdemItem: Integer read Ftb_order_item_id write setFtb_order_item_id;

    [FieldName('tb_product_id')]
    property Mercadoria: Integer read Ftb_merchandise_id write setFtb_merchandise_id;

    [FieldName('dt_record')]
    property DataRegistro: TDateTime read Fdt_record write setFdt_record;

    [FieldName('quantity')]
    property Quantidade: Real read Fqtde write setFqtde;

    [FieldName('status')]
    property Status: String read Fstatus write setFstatus;

    [FieldName('created_at')]
    property RegistroCriado: TDAteTime read Fcreated_at write setFcreated_at;

    [FieldName('updated_at')]
    property RegistroAlterado: TDAteTime read Fupdated_at write setFupdated_at;
  End;

implementation






{ TOrderJobToBuy }

procedure TOrderJobToBuy.setFcreated_at(const Value: TDAteTime);
begin
  Fcreated_at := Value;
end;

procedure TOrderJobToBuy.setFdt_record(const Value: TDateTime);
begin
  Fdt_record := Value;
end;

procedure TOrderJobToBuy.setFId(const Value: Integer);
begin
  Fid := Value;
end;

procedure TOrderJobToBuy.setFqtde(const Value: Real);
begin
  Fqtde := Value;
end;

procedure TOrderJobToBuy.setFstatus(const Value: String);
begin
  Fstatus := Value;
end;

procedure TOrderJobToBuy.setFTb_institution_id(const Value: Integer);
begin
  FTb_institution_id := Value;
end;

procedure TOrderJobToBuy.setFtb_merchandise_id(const Value: Integer);
begin
  Ftb_merchandise_id := Value;
end;

procedure TOrderJobToBuy.setFtb_order_id(const Value: Integer);
begin
  Ftb_order_id := Value;
end;

procedure TOrderJobToBuy.setFtb_order_item_id(const Value: Integer);
begin
  Ftb_order_item_id := Value;
end;

procedure TOrderJobToBuy.setFupdated_at(const Value: TDAteTime);
begin
  Fupdated_at := Value;
end;

end.

