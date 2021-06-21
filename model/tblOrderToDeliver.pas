unit tblOrderToDeliver;

interface

Uses GenericEntity,GenericDao,CAtribEntity, System.Classes, System.SysUtils;
Type
  //nome da classe de entidade
  [TableName('tb_order_to_deliver')]
  TOrderToDeliver = Class(TGenericEntity)
  private
    Fdt_record: TDateTime;
    FId: Integer;
    Fupdated_at: TDAteTime;
    Ftb_order_item_id: Integer;
    Ftb_merchandise_id: Integer;
    Fqtde: Real;
    FTb_institution_id: Integer;
    Ftb_order_id: Integer;
    Fcreated_at: TDAteTime;
    Fstatus: String;
    Frefer_doc: String;
    Ftb_stock_list_id: Integer;
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
    procedure setFrefer_doc(const Value: String);
    procedure setFtb_stock_list_id(const Value: Integer);


 public
    [FieldName('id')]
    [KeyField('id')]
    property Codigo: Integer read FId write setFId;

    [FieldName('tb_institution_id')]
    [KeyField('tb_institution_id')]
    property Estabelecimento: Integer read FTb_institution_id write setFTb_institution_id;

    [FieldName('tb_order_id')]
    property Ordem: Integer read Ftb_order_id write setFtb_order_id;

    [FieldName('tb_order_item_id')]
    property OrdemItem: Integer read Ftb_order_item_id write setFtb_order_item_id;

    [FieldName('tb_product_id')]
    property Mercadoria: Integer read Ftb_merchandise_id write setFtb_merchandise_id;

    [FieldName('tb_stock_list_id')]
    property Estoque: Integer read Ftb_stock_list_id write setFtb_stock_list_id;

    [FieldName('dt_record')]
    property DataRegistro: TDateTime read Fdt_record write setFdt_record;

    [FieldName('quantity')]
    property Quantidade: Real read Fqtde write setFqtde;

    [FieldName('refer_doc')]
    property DocumentoReferencia: String read Frefer_doc write setFrefer_doc;

    [FieldName('status')]
    property Status: String read Fstatus write setFstatus;

    [FieldName('created_at')]
    property RegistroCriado: TDAteTime read Fcreated_at write setFcreated_at;

    [FieldName('updated_at')]
    property RegistroAlterado: TDAteTime read Fupdated_at write setFupdated_at;
  End;

implementation


{ TOrderToDeliver }

procedure TOrderToDeliver.setFcreated_at(const Value: TDAteTime);
begin
  Fcreated_at := Value;
end;

procedure TOrderToDeliver.setFdt_record(const Value: TDateTime);
begin
  Fdt_record := Value;
end;

procedure TOrderToDeliver.setFId(const Value: Integer);
begin
  FId := Value;
end;

procedure TOrderToDeliver.setFqtde(const Value: Real);
begin
  Fqtde := Value;
end;

procedure TOrderToDeliver.setFrefer_doc(const Value: String);
begin
  Frefer_doc := Value;
end;

procedure TOrderToDeliver.setFstatus(const Value: String);
begin
  Fstatus := Value;
end;

procedure TOrderToDeliver.setFTb_institution_id(const Value: Integer);
begin
  FTb_institution_id := Value;
end;

procedure TOrderToDeliver.setFtb_merchandise_id(const Value: Integer);
begin
  Ftb_merchandise_id := Value;
end;

procedure TOrderToDeliver.setFtb_order_id(const Value: Integer);
begin
  Ftb_order_id := Value;
end;

procedure TOrderToDeliver.setFtb_order_item_id(const Value: Integer);
begin
  Ftb_order_item_id := Value;
end;

procedure TOrderToDeliver.setFtb_stock_list_id(const Value: Integer);
begin
  Ftb_stock_list_id := Value;
end;

procedure TOrderToDeliver.setFupdated_at(const Value: TDAteTime);
begin
  Fupdated_at := Value;
end;

end.
