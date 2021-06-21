unit prm_simple;

interface
  Uses prm_invoice_merchandise, prm_invoice_shipping;

Type
  TPrmSimple = Class
  private
    FResultado: String;
    FReferencia: String;
    procedure setFReferencia(const Value: String);
    procedure setFResultado(const Value: String);
  public
    property Referencia: String read FReferencia write setFReferencia;
    property Resultado: String read FResultado write setFResultado;

  End;

implementation


{ TPrmSimple }

procedure TPrmSimple.setFReferencia(const Value: String);
begin
  FReferencia := Value;
end;

procedure TPrmSimple.setFResultado(const Value: String);
begin
  FResultado := Value;
end;

end.
