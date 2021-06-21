unit tblOrderBudget;

interface

Uses GenericEntity,CAtribEntity;

Type
  //nome da classe de entidade
  [TableName('tb_order_budget')]
  TOrderBudget = Class(TGenericEntity)
  private
    Ftb_order_id: Integer;
    Fcustomer_name: Integer;
    Fupdated_at: TDatetime;
    Fnumber: Integer;
    Ftb_institution_id: Integer;
    Ftb_salesman_id: Integer;
    Fcreated_at: TDatetime;
    Fterminal: Integer;
    procedure setFcreated_at(const Value: TDatetime);
    procedure setFcustomer_name(const Value: Integer);
    procedure setFnumber(const Value: Integer);
    procedure setFtb_institution_id(const Value: Integer);
    procedure setFtb_order_id(const Value: Integer);
    procedure setFtb_salesman_id(const Value: Integer);
    procedure setFupdated_at(const Value: TDatetime);
    procedure setFterminal(const Value: Integer);
		
  public
	  [KeyField('tb_institution_id')]
    [FieldName('tb_institution_id')]
    property Estabelecimento: Integer read Ftb_institution_id write setFtb_institution_id;

    [KeyField('tb_order_id')]
    [FieldName('tb_order_id')]
    property CodigoOrdem: Integer read Ftb_order_id write setFtb_order_id;

    [FieldName('terminal')]
    [KeyField('terminal')]
    property Terminal: Integer read Fterminal write setFterminal;

    [FieldName('number')]
    property Numero: Integer read Fnumber write setFnumber;

    [FieldName('customer_name')]
    property Cliente: Integer read Fcustomer_name write setFcustomer_name;

    [FieldName('tb_salesman_id')]
    property CodigoVendedor: Integer read Ftb_salesman_id write setFtb_salesman_id;

	  [FieldName('created_at')]
    property RegistroCriado: TDatetime read Fcreated_at write setFcreated_at;

    [FieldName('updated_at')]
    property RegistroAlterado: TDatetime read Fupdated_at write setFupdated_at;

	End;

implementation



{ TOrderBudget }

procedure TOrderBudget.setFcreated_at(const Value: TDatetime);
begin
  Fcreated_at := Value;
end;

procedure TOrderBudget.setFcustomer_name(const Value: Integer);
begin
  Fcustomer_name := Value;
end;

procedure TOrderBudget.setFnumber(const Value: Integer);
begin
  Fnumber := Value;
end;

procedure TOrderBudget.setFtb_institution_id(const Value: Integer);
begin
  Ftb_institution_id := Value;
end;

procedure TOrderBudget.setFtb_order_id(const Value: Integer);
begin
  Ftb_order_id := Value;
end;

procedure TOrderBudget.setFtb_salesman_id(const Value: Integer);
begin
  Ftb_salesman_id := Value;
end;

procedure TOrderBudget.setFterminal(const Value: Integer);
begin
  Fterminal := Value;
end;

procedure TOrderBudget.setFupdated_at(const Value: TDatetime);
begin
  Fupdated_at := Value;
end;

end.
