unit prm_salesman_has_stock;

interface

uses TypesCollection, System.SysUtils, prm_base ;

Type
  TPrmSalesmanHasStock = class(TPrmBase)
    private
    FVendedor: Integer;
    procedure setFVendedor(const Value: Integer);

    public
      property Vendedor : Integer read FVendedor write setFVendedor;

  end;


implementation

{ TPrmSalesmanHasStock }

procedure TPrmSalesmanHasStock.setFVendedor(const Value: Integer);
begin
  FVendedor := Value;
end;

end.
