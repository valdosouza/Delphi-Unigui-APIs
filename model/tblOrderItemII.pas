unit tblOrderItemII;

interface

Uses GenericEntity,CAtribEntity;

Type
  //nome da classe de entidade
  [TableName('tb_order_item_ii')]
  TOrderItemII = Class(TGenericEntity)
  private
    Ftb_order_item_id : integer;
    Ftb_institution_id : integer;
    Fbase_value : Real;
    Fcustoms_expense : Real;
    Ftag_value : Real;
    Fiof_value : Real;
    Fcreated_at : TDateTime;
	  Fupdated_at : TDateTime;
    Ftb_order_id: Integer;
    Fterminal: Integer;

    procedure setFtb_order_item_id(Value : integer);
    procedure setFtb_institution_id(Value : integer);
    procedure setFbase_value(Value : Real);
    procedure setFcustoms_expense(Value : Real);
    procedure setFtag_value(Value : Real);
    procedure setFiof_value(Value : Real);
    procedure setFcreated_at(Value : tdatetime);
	  procedure setFupdated_at(Value : tdatetime);
    procedure setFtb_order_id(const Value: Integer);
    procedure setFterminal(const Value: Integer);

  public
    [KeyField('tb_order_item_id')]
    [FieldName('tb_order_item_id')]
    property ItemOrdem: Integer read Ftb_order_item_id write setFtb_order_item_id;

    [KeyField('tb_order_id')]
    [FieldName('tb_order_id')]
    property Ordem: Integer read Ftb_order_id write setFtb_order_id;

    [KeyField('tb_institution_id')]
    [FieldName('tb_institution_id')]
    property Estabelecimento: Integer read Ftb_institution_id write setFtb_institution_id;

    [FieldName('terminal')]
    [KeyField('terminal')]
    property Terminal: Integer read Fterminal write setFterminal;

    [FieldName('base_value')]
    property ValorBase: Real read Fbase_value write setFbase_value;

    [FieldName('customs_expense')]
    property Despesas: Real read Fcustoms_expense write setFcustoms_expense;

    [FieldName('tag_value')]
    property Valor: Real read Ftag_value write setFtag_value;

	  [FieldName('iof_value')]
    property ValorIOF: Real read Fiof_value write setFiof_value;

    [FieldName('created_at')]
    property RegistroCriado: TDatetime read Fcreated_at write setFcreated_at;

	  [FieldName('updated_at')]
    property RegistroAlterado: TDatetime read Fupdated_at write setFupdated_at;

	End;

implementation



{ TOrderItemII }

procedure TOrderItemII.setFbase_value(Value: Real);
begin
   Fbase_value := Value;
end;

procedure TOrderItemII.setFcreated_at(Value: tdatetime);
begin
  Fcreated_at := Value;
end;

procedure TOrderItemII.setFcustoms_expense(Value: Real);
begin
   Fcustoms_expense := Value;
end;

procedure TOrderItemII.setFiof_value(Value: Real);
begin
   Fiof_value := Value;
end;

procedure TOrderItemII.setFtag_value(Value: Real);
begin
  Ftag_value := Value;
end;

procedure TOrderItemII.setFtb_institution_id(Value: integer);
begin
   Ftb_institution_id := Value;
end;

procedure TOrderItemII.setFtb_order_id(const Value: Integer);
begin
  Ftb_order_id := Value;
end;

procedure TOrderItemII.setFtb_order_item_id(Value: integer);
begin
  Ftb_order_item_id := Value;
end;

procedure TOrderItemII.setFterminal(const Value: Integer);
begin
  Fterminal := Value;
end;

procedure TOrderItemII.setFupdated_at(Value: tdatetime);
begin
  Fupdated_at := Value;
end;

end.
