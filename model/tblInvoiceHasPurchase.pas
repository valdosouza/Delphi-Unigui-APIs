unit tblInvoiceHasPurchase;

interface

Uses GenericEntity,GenericDao,CAtribEntity, System.Classes, System.SysUtils;
Type
  //nome da classe de entidade
  [TableName('tb_invoice_has_purchase')]
  TInvoiceHasPurchase = Class(TGenericEntity)
  private
    Ftb_order_purchase_id: Integer;
    Ftb_invoice_id: Integer;
    Fupdated_at: TDAteTime;
    FTb_institution_id: Integer;
    Ftb_order_item_id: Integer;
    Ftb_invoice_item_id: Integer;
    Fcreated_at: TDAteTime;
    procedure setFcreated_at(const Value: TDAteTime);
    procedure setFTb_institution_id(const Value: Integer);
    procedure setFtb_invoice_id(const Value: Integer);
    procedure setFtb_invoice_item_id(const Value: Integer);
    procedure setFtb_order_item_id(const Value: Integer);
    procedure setFtb_order_purchase_id(const Value: Integer);
    procedure setFupdated_at(const Value: TDAteTime);

  public

    [KeyField('tb_institution_id')]
    [FieldName('tb_institution_id')]
    property Estabelecimento: Integer read FTb_institution_id write setFTb_institution_id;

    [KeyField('tb_invoice_id')]
    [FieldName('tb_invoice_id')]
    property NotaFiscal: Integer read Ftb_invoice_id write setFtb_invoice_id;

    [KeyField('tb_invoice_item_id')]
    [FieldName('tb_invoice_item_id')]
    property NotaFiscalItem: Integer read Ftb_invoice_item_id write setFtb_invoice_item_id;

    [FieldName('tb_order_purchase_id')]
    property OrdemCompra: Integer read Ftb_order_purchase_id write setFtb_order_purchase_id;

    [FieldName('tb_order_item_id')]
    property OrdemCompraItem: Integer read Ftb_order_item_id write setFtb_order_item_id;

    [FieldName('created_at')]
    property RegistroCriado: TDAteTime read Fcreated_at write setFcreated_at;

    [FieldName('updated_at')]
    property RegistroAlterado: TDAteTime read Fupdated_at write setFupdated_at;

  End;

implementation

{ TInvoiceHasPurchase }

procedure TInvoiceHasPurchase.setFcreated_at(const Value: TDAteTime);
begin
  Fcreated_at := Value;
end;

procedure TInvoiceHasPurchase.setFTb_institution_id(const Value: Integer);
begin
  FTb_institution_id := Value;
end;

procedure TInvoiceHasPurchase.setFtb_invoice_id(const Value: Integer);
begin
  Ftb_invoice_id := Value;
end;

procedure TInvoiceHasPurchase.setFtb_invoice_item_id(const Value: Integer);
begin
  Ftb_invoice_item_id := Value;
end;

procedure TInvoiceHasPurchase.setFtb_order_item_id(const Value: Integer);
begin
  Ftb_order_item_id := Value;
end;

procedure TInvoiceHasPurchase.setFtb_order_purchase_id(const Value: Integer);
begin
  Ftb_order_purchase_id := Value;
end;

procedure TInvoiceHasPurchase.setFupdated_at(const Value: TDAteTime);
begin
  Fupdated_at := Value;
end;

end.
