unit tblOrderTotalizer;

interface

Uses GenericEntity,CAtribEntity, Classes, SysUtils;
Type
  //nome da classe de entidade
  [TableName('tb_order_totalizer')]
  TOrderTotalizer = Class(TGenericEntity)
  private
    FIPI_value: Real;
    Fproduct_value: Real;
    FId: Integer;
    Fupdated_at: TDAteTime;
    Ftotal_value: Real;
    Fdiscount_aliquot: Real;
    Fproduct_qtde: Real;
    Ftb_institution_id: Integer;
    Fexpenses_value: Real;
    Fdiscount_value: Real;
    Fcreated_at: TDAteTime;
    Fitems_qtde: Real;
    Fterminal: Integer;
    procedure setFcreated_at(const Value: TDAteTime);
    procedure setFdiscount_aliquot(const Value: Real);
    procedure setFdiscount_value(const Value: Real);
    procedure setFexpenses_value(const Value: Real);
    procedure setFId(const Value: Integer);
    procedure setFIPI_value(const Value: Real);
    procedure setFproduct_qtde(const Value: Real);
    procedure setFproduct_value(const Value: Real);
    procedure setFtb_institution_id(const Value: Integer);
    procedure setFtotal_value(const Value: Real);
    procedure setFupdated_at(const Value: TDAteTime);
    procedure setFitems_qtde(const Value: Real);
    procedure setFterminal(const Value: Integer);

  public

    [FieldName('id')]
    [KeyField('id')]
    property Codigo: Integer read FId write setFId;

    [FieldName('tb_institution_id')]
    [keyField('tb_institution_id')]
    property Estabelecimento: Integer read Ftb_institution_id write setFtb_institution_id;

    [FieldName('terminal')]
    [KeyField('terminal')]
    property Terminal: Integer read Fterminal write setFterminal;

    [FieldName('items_qtde')]
    property ItemsQuantidade: Real read Fitems_qtde write setFitems_qtde;

    [FieldName('product_qtde')]
    property ProdutoQuantidade: Real read Fproduct_qtde write setFproduct_qtde;

    [FieldName('product_value')]
    property ValorProduto: Real read Fproduct_value write setFproduct_value;

    [FieldName('IPI_value')]
    property IPIValor: Real read FIPI_value write setFIPI_value;

    [FieldName('discount_aliquot')]
    property AlíquotaDesconto : Real read Fdiscount_aliquot write setFdiscount_aliquot;

    [FieldName('discount_value')]
    property ValorDesconto: Real read Fdiscount_value write setFdiscount_value;

    [FieldName('expenses_value')]
    property ValorDespesas: Real read Fexpenses_value write setFexpenses_value;

    [FieldName('total_value')]
    property ValorTotal: Real read Ftotal_value write setFtotal_value;

    [FieldName('created_at')]
    property RegistroCriado: TDAteTime read Fcreated_at write setFcreated_at;

    [FieldName('updated_at')]
    property RegistroAlterado: TDAteTime read Fupdated_at write setFupdated_at;

  End;
implementation

{ TOrderTotalizer }

procedure TOrderTotalizer.setFcreated_at(const Value: TDAteTime);
begin
  Fcreated_at := Value;
end;

procedure TOrderTotalizer.setFdiscount_aliquot(const Value: Real);
begin
  Fdiscount_aliquot := Value;
end;

procedure TOrderTotalizer.setFdiscount_value(const Value: Real);
begin
  Fdiscount_value := Value;
end;

procedure TOrderTotalizer.setFexpenses_value(const Value: Real);
begin
  Fexpenses_value := Value;
end;

procedure TOrderTotalizer.setFId(const Value: Integer);
begin
  FId := Value;
end;

procedure TOrderTotalizer.setFIPI_value(const Value: Real);
begin
  FIPI_value := Value;
end;

procedure TOrderTotalizer.setFitems_qtde(const Value: Real);
begin
  Fitems_qtde := Value;
end;

procedure TOrderTotalizer.setFproduct_qtde(const Value: Real);
begin
  Fproduct_qtde := Value;
end;

procedure TOrderTotalizer.setFproduct_value(const Value: Real);
begin
  Fproduct_value := Value;
end;

procedure TOrderTotalizer.setFtb_institution_id(const Value: Integer);
begin
  Ftb_institution_id := Value;
end;

procedure TOrderTotalizer.setFterminal(const Value: Integer);
begin
  Fterminal := Value;
end;

procedure TOrderTotalizer.setFtotal_value(const Value: Real);
begin
  Ftotal_value := Value;
end;

procedure TOrderTotalizer.setFupdated_at(const Value: TDAteTime);
begin
  Fupdated_at := Value;
end;

end.
