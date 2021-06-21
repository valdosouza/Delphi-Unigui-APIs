unit objInvoiceReturn55;

interface

uses System.SysUtils,  tblCashier, tblInvoiceReturn55,System.Generics.Collections,
  ObjBase;

Type
  TListItems = TObjectList<TInvoiceReturn55>;
  TObjInvoiceReturn55 = Class(TObjBase)
  private
    FRetorno: TInvoiceReturn55;
    procedure setFRetorno(const Value: TInvoiceReturn55);

  public
      constructor Create;override;
      destructor Destroy;override;
      property Retorno : TInvoiceReturn55 read FRetorno write setFRetorno;

  End;
implementation

{ TObjInvoiceReturn55 }

constructor TObjInvoiceReturn55.Create;
begin
  inherited;
  FRetorno := TInvoiceReturn55.Create;
end;

destructor TObjInvoiceReturn55.Destroy;
begin
  FRetorno.DisposeOf;

end;

procedure TObjInvoiceReturn55.setFRetorno(const Value: TInvoiceReturn55);
begin
  FRetorno := Value;
end;

end.
