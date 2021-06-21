unit tblOrderItemPacking;

interface

Uses GenericEntity,CAtribEntity;

Type
  //nome da classe de entidade
  [TableName('tb_order_item_packing')]
  TOrderItemPacking = Class(TGenericEntity)
  private
		Ftb_institution_id : Integer;
    Ftb_order_id : Integer;
    Fexternal_id : Integer;
  	Fitem : Integer;
  	Fpurchase_invoce_number : String;
		Fcreated_at : TDateTime;
		Fupdated_at : TDateTime;
    Fterminal: Integer;

		procedure setFtb_institution_id(Value : Integer);
    procedure setFtb_order_id(Value : Integer);
    procedure setFexternal_id(Value : Integer);
  	procedure setFitem(Value : Integer);
  	procedure setFpurchase_invoce_number(Value : String);
		procedure setFcreated_at(Value : tdatetime);
		procedure setFupdated_at(Value : tdatetime);
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

    [FieldName('external_id')]
    property CodigoExterno: Integer read Fexternal_id write setFexternal_id;

    [FieldName('item')]
    property Item: Integer read Fitem write setFitem;

    [FieldName('purchase_invoce_number')]
    property NumeroNota: String read Fpurchase_invoce_number write setFpurchase_invoce_number;

	  [FieldName('created_at')]
    property RegistroCriado: TDatetime read Fcreated_at write setFcreated_at;

    [FieldName('updated_at')]
    property RegistroAlterado: TDatetime read Fupdated_at write setFupdated_at;

	End;

implementation


{ TOrderItemPacking }

procedure TOrderItemPacking.setFcreated_at(Value: tdatetime);
begin
  Fcreated_at := Value;
end;

procedure TOrderItemPacking.setFexternal_id(Value: Integer);
begin
  Fexternal_id := Value;
end;

procedure TOrderItemPacking.setFitem(Value: Integer);
begin
  Fitem := Value;
end;

procedure TOrderItemPacking.setFpurchase_invoce_number(Value: String);
begin
  Fpurchase_invoce_number := Value;
end;

procedure TOrderItemPacking.setFtb_institution_id(Value: Integer);
begin
  Ftb_institution_id := Value;
end;

procedure TOrderItemPacking.setFtb_order_id(Value: Integer);
begin
  Ftb_order_id := Value;
end;

procedure TOrderItemPacking.setFterminal(const Value: Integer);
begin
  Fterminal := Value;
end;

procedure TOrderItemPacking.setFupdated_at(Value: tdatetime);
begin
  Fupdated_at := Value;
end;

end.
