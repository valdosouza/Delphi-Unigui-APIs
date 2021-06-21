unit objInvoiceReturn65;

interface

uses System.SysUtils,  tblCashier, tblInvoiceReturn65,System.Generics.Collections,
  ObjBase;

Type
  TListItems = TObjectList<TInvoiceReturn65>;
  TObjInvoiceReturn65 = Class(TObjBase)
  private
    FRetorno: TInvoiceReturn65;
    procedure setFRetorno(const Value: TInvoiceReturn65);

  public
      constructor Create;override;
      destructor Destroy;override;
      property Retorno : TInvoiceReturn65 read FRetorno write setFRetorno;

  End;
implementation

{ TObjInvoiceReturn65 }

constructor TObjInvoiceReturn65.Create;
begin
  inherited;
  FRetorno := TInvoiceReturn65.Create;
end;

destructor TObjInvoiceReturn65.Destroy;
begin
  FRetorno.DisposeOf;
end;

procedure TObjInvoiceReturn65.setFRetorno(const Value: TInvoiceReturn65);
begin
  FRetorno := Value;
end;

end.
