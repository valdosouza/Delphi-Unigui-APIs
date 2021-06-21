unit tblInvoiceService;

interface

Uses GenericEntity,CAtribEntity;

Type
  //nome da classe de entidade
  [TableName('tb_invoice_service')]
  TInvoiceService = Class(TGenericEntity)
  private
	  Fid : Integer;
	  Ftb_institution_id : Integer;
	  Ftb_order_id : Integer;
	  Ftb_invoice_id : Integer;
    Fiss_value : Real;
    Fiss_withheld_value : Real;
    Ftotal_value : Real;
    Fcreated_at : TDateTime;
	  Fupdated_at : TDateTime;

	  procedure setFid(Value : Integer);
	  procedure setFtb_institution_id(Value : Integer);
	  procedure setFtb_order_id(Value : Integer);
	  procedure setFtb_invoice_id(Value : Integer);
    procedure setFiss_value(Value : Real);
    procedure setFiss_withheld_value(Value : Real);
    procedure setFtotal_value(Value : Real);
    procedure setFcreated_at(Value : tdatetime);
	  procedure setFupdated_at(Value : tdatetime);

  public
    [KeyField('id')]
    [FieldName('id')]
    property Codigo: Integer read Fid write setFid;

	  [KeyField('tb_institution_id')]
    [FieldName('tb_institution_id')]
    property Estabelecimento: Integer read Ftb_institution_id write setFtb_institution_id;

    [KeyField('tb_order_id')]
    [FieldName('tb_order_id')]
    property Ordem: Integer read Ftb_order_id write setFtb_order_id;

    [KeyField('tb_invoice_id')]
    [FieldName('tb_invoice_id')]
    property Fatura: Integer read Ftb_invoice_id write setFtb_invoice_id;

    [FieldName('iss_value')]
    property ValorISS: Real read Fiss_value write setFiss_value;

    [FieldName('iss_withheld_value')]
    property ValorISS_retido: Real read Fiss_withheld_value write setFiss_withheld_value;

    [FieldName('total_value')]
    property ValorTotal: Real read Ftotal_value write setFtotal_value;

	  [FieldName('created_at')]
    property RegistroCriado: TDatetime read Fcreated_at write setFcreated_at;

    [FieldName('updated_at')]
    property RegistroAlterado: TDatetime read Fupdated_at write setFupdated_at;

	End;

implementation


{ TInvoiceService }

procedure TInvoiceService.setFcreated_at(Value: tdatetime);
begin
  Fcreated_at := Value;
end;

procedure TInvoiceService.setFid(Value: Integer);
begin
  Fid := Value;
end;

procedure TInvoiceService.setFiss_value(Value: Real);
begin
  Fiss_value := Value;
end;

procedure TInvoiceService.setFiss_withheld_value(Value: Real);
begin
  Fiss_withheld_value := Value;
end;

procedure TInvoiceService.setFtb_institution_id(Value: Integer);
begin
  Ftb_institution_id := Value;
end;

procedure TInvoiceService.setFtb_invoice_id(Value: Integer);
begin
  Ftb_invoice_id := Value;
end;

procedure TInvoiceService.setFtb_order_id(Value: Integer);
begin
  Ftb_order_id := Value;
end;

procedure TInvoiceService.setFtotal_value(Value: Real);
begin
  Ftotal_value := Value;
end;

procedure TInvoiceService.setFupdated_at(Value: tdatetime);
begin
  Fupdated_at := Value;
end;

end.
