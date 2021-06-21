unit tblOrderProductionPa;

interface


Uses GenericEntity,GenericDao,CAtribEntity, System.Classes, System.SysUtils;
Type
  //nome da classe de entidade
  [TableName('tb_order_production_pa')]
  TOrderProductionPa = Class(TGenericEntity)
  private
    Ftb_product_id: Integer;
    FId: Integer;
    Ftb_stock_list_id: Integer;
    Fupdated_at: TDAteTime;
    Fquantity: Real;
    Ftb_institution_id: Integer;
    Ftb_order_id: Integer;
    Fcreated_at: TDAteTime;
    Fterminal: Integer;
    procedure setFcreated_at(const Value: TDAteTime);
    procedure setFId(const Value: Integer);
    procedure setFquantity(const Value: Real);
    procedure setFtb_institution_id(const Value: Integer);
    procedure setFtb_order_id(const Value: Integer);
    procedure setFtb_product_id(const Value: Integer);
    procedure setFtb_stock_list_id(const Value: Integer);
    procedure setFupdated_at(const Value: TDAteTime);
    procedure setFterminal(const Value: Integer);



  public
    [FieldName('id')]
    [KeyField('id')]
    property Codigo: Integer read FId write setFId;

    [KeyField('tb_institution_id')]
    [FieldName('tb_institution_id')]
    property Estabelecimento: Integer read Ftb_institution_id write setFtb_institution_id;

    [KeyField('tb_order_id')]
    [FieldName('tb_order_id')]
    property Ordem: Integer read Ftb_order_id write setFtb_order_id;

    [FieldName('terminal')]
    [KeyField('terminal')]
    property Terminal: Integer read Fterminal write setFterminal;

    [FieldName('tb_product_id')]
    property Produto: Integer read Ftb_product_id write setFtb_product_id;

    [FieldName('tb_stock_list_id')]
    property Estoque: Integer read Ftb_stock_list_id write setFtb_stock_list_id;

    [FieldName('quantity')]
    property Quantidade: Real read Fquantity write setFquantity;

    [FieldName('created_at')]
    property RegistroCriado: TDAteTime read Fcreated_at write setFcreated_at;

    [FieldName('updated_at')]
    property RegistroAlterado: TDAteTime read Fupdated_at write setFupdated_at;

  End;
implementation



{ TOrderProductionPa }

procedure TOrderProductionPa.setFcreated_at(const Value: TDAteTime);
begin
  Fcreated_at := Value;
end;

procedure TOrderProductionPa.setFId(const Value: Integer);
begin
  FId := Value;
end;

procedure TOrderProductionPa.setFquantity(const Value: Real);
begin
  Fquantity := Value;
end;

procedure TOrderProductionPa.setFtb_institution_id(const Value: Integer);
begin
  Ftb_institution_id := Value;
end;

procedure TOrderProductionPa.setFtb_order_id(const Value: Integer);
begin
  Ftb_order_id := Value;
end;

procedure TOrderProductionPa.setFtb_product_id(const Value: Integer);
begin
  Ftb_product_id := Value;
end;

procedure TOrderProductionPa.setFtb_stock_list_id(const Value: Integer);
begin
  Ftb_stock_list_id := Value;
end;

procedure TOrderProductionPa.setFterminal(const Value: Integer);
begin
  Fterminal := Value;
end;

procedure TOrderProductionPa.setFupdated_at(const Value: TDAteTime);
begin
  Fupdated_at := Value;
end;

end.
