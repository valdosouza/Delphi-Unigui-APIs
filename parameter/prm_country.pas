unit prm_country;

interface

uses System.SysUtils, prm_base,tblcountry;

Type
  TPrmCountry = class(TPrmbase)
  private
    FVendedor: Integer;
    procedure setFVendedor(const Value: Integer);

  public
    constructor Create;Override;
    destructor Destroy;Override;
    property Vendedor : Integer read FVendedor write setFVendedor;
  end;
implementation

{ TPrmCountry }

constructor TPrmCountry.Create;
begin
  inherited;
end;

destructor TPrmCountry.Destroy;
begin
  inherited;
end;
procedure TPrmCountry.setFVendedor(const Value: Integer);
begin
  FVendedor := Value;
end;

end.
