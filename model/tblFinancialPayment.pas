unit tblFinancialPayment;

interface

Uses GenericEntity,CAtribEntity;

Type
  //nome da classe de entidade
  [TableName('tb_financial_payment')]
  TFinancialPayment = Class(TGenericEntity)
  private
    Fdt_payment: TDateTime;
    Fdt_real_payment: TDateTime;
    Flate_value: Real;
    Fsettled: String;
    Fupdated_at: TDatetime;
    Fdiscount_aliquot: Real;
    Ftb_institution_id: Integer;
    Fpaid_value: Real;
    Finterest_value: Real;
    Fsettled_code: Integer;
    Fterminal: Integer;
    Ftb_order_id: Integer;
    Ftb_financial_plans_id: Integer;
    Fcreated_at: TDatetime;
    Fparcel: Integer;
    procedure setFcreated_at(const Value: TDatetime);
    procedure setFdiscount_aliquot(const Value: Real);
    procedure setFdt_payment(const Value: TDateTime);
    procedure setFdt_real_payment(const Value: TDateTime);
    procedure setFinterest_value(const Value: Real);
    procedure setFlate_value(const Value: Real);
    procedure setFpaid_value(const Value: Real);
    procedure setFparcel(const Value: Integer);
    procedure setFsettled(const Value: String);
    procedure setFsettled_code(const Value: Integer);
    procedure setFtb_financial_plans_id(const Value: Integer);
    procedure setFtb_institution_id(const Value: Integer);
    procedure setFtb_order_id(const Value: Integer);
    procedure setFterminal(const Value: Integer);
    procedure setFupdated_at(const Value: TDatetime);


  public

	  [KeyField('tb_institution_id')]
    [FieldName('tb_institution_id')]
    property Estabelecimento: Integer read Ftb_institution_id write setFtb_institution_id;

    [KeyField('tb_order_id')]
    [FieldName('tb_order_id')]
    property Ordem: Integer read Ftb_order_id write setFtb_order_id;

    [KeyField('terminal')]
    [FieldName('terminal')]
    property Terminal: Integer read Fterminal write setFterminal;

    [KeyField('parcel')]
    [FieldName('parcel')]
    property Parcela: Integer read Fparcel write setFparcel;

    [FieldName('interest_value')]
    property Juro: Real read Finterest_value write setFinterest_value;

    [FieldName('late_value')]
    property ValorDeMora: Real read Flate_value write setFlate_value;

    [FieldName('discount_aliquot')]
    property AliquotaDesconto: Real read Fdiscount_aliquot write setFdiscount_aliquot;

    [FieldName('paid_value')]
    property ValorPago: Real read Fpaid_value write setFpaid_value;

    [FieldName('dt_payment')]
    property DataDoPagamento: TDateTime read Fdt_payment write setFdt_payment;

    [FieldName('dt_real_payment')]
    property DataDaBaixa: TDateTime read Fdt_real_payment write setFdt_real_payment;

    [FieldName('settled')]
    property Baixa: String read Fsettled write setFsettled;

    [FieldName('tb_financial_plans_id')]
    property PlanoContas: Integer read Ftb_financial_plans_id write setFtb_financial_plans_id;

    [FieldName('settled_code')]
    property CodigoBaixa: Integer read Fsettled_code write setFsettled_code;

	  [FieldName('created_at')]
    property RegistroCriado: TDatetime read Fcreated_at write setFcreated_at;

    [FieldName('updated_at')]
    property RegistroAlterado: TDatetime read Fupdated_at write setFupdated_at;

	End;

implementation


{ TFinancialPayment }

procedure TFinancialPayment.setFcreated_at(const Value: TDatetime);
begin
  Fcreated_at := Value;
end;

procedure TFinancialPayment.setFdiscount_aliquot(const Value: Real);
begin
  Fdiscount_aliquot := Value;
end;

procedure TFinancialPayment.setFdt_payment(const Value: TDateTime);
begin
  Fdt_payment := Value;
end;

procedure TFinancialPayment.setFdt_real_payment(const Value: TDateTime);
begin
  Fdt_real_payment := Value;
end;

procedure TFinancialPayment.setFinterest_value(const Value: Real);
begin
  Finterest_value := Value;
end;

procedure TFinancialPayment.setFlate_value(const Value: Real);
begin
  Flate_value := Value;
end;

procedure TFinancialPayment.setFpaid_value(const Value: Real);
begin
  Fpaid_value := Value;
end;

procedure TFinancialPayment.setFparcel(const Value: Integer);
begin
  Fparcel := Value;
end;

procedure TFinancialPayment.setFsettled(const Value: String);
begin
  Fsettled := Value;
end;

procedure TFinancialPayment.setFsettled_code(const Value: Integer);
begin
  Fsettled_code := Value;
end;

procedure TFinancialPayment.setFtb_financial_plans_id(const Value: Integer);
begin
  Ftb_financial_plans_id := Value;
end;

procedure TFinancialPayment.setFtb_institution_id(const Value: Integer);
begin
  Ftb_institution_id := Value;
end;

procedure TFinancialPayment.setFtb_order_id(const Value: Integer);
begin
  Ftb_order_id := Value;
end;

procedure TFinancialPayment.setFterminal(const Value: Integer);
begin
  Fterminal := Value;
end;

procedure TFinancialPayment.setFupdated_at(const Value: TDatetime);
begin
  Fupdated_at := Value;
end;

end.

