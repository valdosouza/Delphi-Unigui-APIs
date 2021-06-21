unit objInvoiceReturnService;

interface

uses System.SysUtils,  tblCashier, tblInvoiceReturnService,System.Generics.Collections,
  ObjBase, tblProvisionalReceiptService;

Type
  TListItems = TObjectList<TInvoiceReturnService>;
  TObjInvoiceReturnService = Class(TObjBase)
  private
    FRetorno: TInvoiceReturnService;
    FReciboProvisorio: TProvisionalReceiptService;

    procedure setFRetorno(const Value: TInvoiceReturnService);
    procedure setFReciboProvisorio(const Value: TProvisionalReceiptService);

  public
      constructor Create;override;
      destructor Destroy;override;
      property ReciboProvisorio : TProvisionalReceiptService read FReciboProvisorio write setFReciboProvisorio;
      property Retorno : TInvoiceReturnService read FRetorno write setFRetorno;

  End;
implementation

{ TObjInvoiceReturnService }

constructor TObjInvoiceReturnService.Create;
begin
  inherited;
  FReciboProvisorio := TProvisionalReceiptService.Create;
  FRetorno := TInvoiceReturnService.Create;
end;

destructor TObjInvoiceReturnService.Destroy;
begin
  FRetorno.DisposeOf;
  FReciboProvisorio.DisposeOf;

end;

procedure TObjInvoiceReturnService.setFReciboProvisorio(
  const Value: TProvisionalReceiptService);
begin
  FReciboProvisorio := Value;
end;

procedure TObjInvoiceReturnService.setFRetorno(const Value: TInvoiceReturnService);
begin
  FRetorno := Value;
end;

end.
