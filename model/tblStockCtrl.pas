unit tblStockCtrl;

interface

Uses GenericEntity,CAtribEntity;

Type
  //nome da classe de entidade
  [TableName('tb_stock_ctrl')]
  TStockCtrl = Class(TGenericEntity)
  private
    Frealized: String;
    Fdt_record: TDateTime;
    Foperation_way: String;
    Ftb_order_id: Integer;
    Ftb_product_id: Integer;
    Ftb_stock_id: Integer;
    Fupdated_at: TDatetime;
    Ftb_order_item: Integer;
    Ftb_institution_id: Integer;
    Fcreated_at: TDatetime;
    procedure setFcreated_at(const Value: TDatetime);
    procedure setFdt_record(const Value: TDateTime);
    procedure setFoperation_way(const Value: String);
    procedure setFrealized(const Value: String);
    procedure setFtb_institution_id(const Value: Integer);
    procedure setFtb_order_id(const Value: Integer);
    procedure setFtb_order_item(const Value: Integer);
    procedure setFtb_product_id(const Value: Integer);
    procedure setFtb_stock_id(const Value: Integer);
    procedure setFupdated_at(const Value: TDatetime);


  public
	  [KeyField('tb_institution_id')]
    [FieldName('tb_institution_id')]
    property Estabelecimento: Integer read Ftb_institution_id write setFtb_institution_id;

	  [KeyField('tb_stock_id')]
    [FieldName('tb_stock_id')]
    property Estoque: Integer read Ftb_stock_id write setFtb_stock_id;

    [KeyField('tb_order_id')]
    [FieldName('tb_order_id')]
    property CodigoOrdem: Integer read Ftb_order_id write setFtb_order_id;

    [FieldName('tb_order_item')]
    property ItemOrdem: Integer read Ftb_order_item write setFtb_order_item;

    [FieldName('tb_product_id')]
    property CodigoProduto: Integer read Ftb_product_id write setFtb_product_id;

    [FieldName('dt_record')]
    property DataRegistro: TDateTime read Fdt_record write setFdt_record;

    [FieldName('realized')]
    property Realizado: String read Frealized write setFrealized;

    [FieldName('operation_way')]
    property CaminhoOperacao: String read Foperation_way write setFoperation_way;

	  [FieldName('created_at')]
    property RegistroCriado: TDatetime read Fcreated_at write setFcreated_at;

    [FieldName('updated_at')]
    property RegistroAlterado: TDatetime read Fupdated_at write setFupdated_at;

	End;

implementation

{ TStockCtrl }

procedure TStockCtrl.setFcreated_at(const Value: TDatetime);
begin
  Fcreated_at := Value;
end;

procedure TStockCtrl.setFdt_record(const Value: TDateTime);
begin
  Fdt_record := Value;
end;

procedure TStockCtrl.setFoperation_way(const Value: String);
begin
  Foperation_way := Value;
end;

procedure TStockCtrl.setFrealized(const Value: String);
begin
  Frealized := Value;
end;

procedure TStockCtrl.setFtb_institution_id(const Value: Integer);
begin
  Ftb_institution_id := Value;
end;

procedure TStockCtrl.setFtb_order_id(const Value: Integer);
begin
  Ftb_order_id := Value;
end;

procedure TStockCtrl.setFtb_order_item(const Value: Integer);
begin
  Ftb_order_item := Value;
end;

procedure TStockCtrl.setFtb_product_id(const Value: Integer);
begin
  Ftb_product_id := Value;
end;

procedure TStockCtrl.setFtb_stock_id(const Value: Integer);
begin
  Ftb_stock_id := Value;
end;

procedure TStockCtrl.setFupdated_at(const Value: TDatetime);
begin
  Fupdated_at := Value;
end;

end;

end.
