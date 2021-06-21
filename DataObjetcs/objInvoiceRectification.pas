unit objInvoiceRectification;

interface

uses System.SysUtils,  tblInvoiceRectification,System.Generics.Collections,
  ObjBase;

Type

  TObjInvoiceRectification = Class(TObjBase)
  private
    FCartaCorrecao: TInvoiceRectification;
    procedure setFCartaCorrecao(const Value: TInvoiceRectification);

  public
    constructor Create;override;
    destructor Destroy;override;
    property CartaCorrecao : TInvoiceRectification read FCartaCorrecao write setFCartaCorrecao;
  End;
implementation

{ TObjInvoiceRectification }

constructor TObjInvoiceRectification.Create;
begin
  inherited;
  FCartaCorrecao := TInvoiceRectification.Create
end;

destructor TObjInvoiceRectification.Destroy;
begin
  FCartaCorrecao.DisposeOf;

end;

procedure TObjInvoiceRectification.setFCartaCorrecao(
  const Value: TInvoiceRectification);
begin
  FCartaCorrecao := Value;
end;

end.
