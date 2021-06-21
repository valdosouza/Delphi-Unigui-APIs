unit prm_rep_order;

interface

uses prm_base_report;

Type
  TPrmRepOrder = Class(TPrmBaseReport)
  private
    FCodigo: Integer;
    procedure setFCodigo(const Value: Integer);

  public
    property Codigo: Integer read FCodigo write setFCodigo;
  End;
implementation

{ TPrmRepOrder }

procedure TPrmRepOrder.setFCodigo(const Value: Integer);
begin
  FCodigo := Value;
end;

end.
