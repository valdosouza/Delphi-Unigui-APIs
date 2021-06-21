unit prm_city;

interface

uses System.SysUtils,  prm_base,tblcity;

Type
  TPrmCity = class(TPrmbase)
  private
    FVendedor: Integer;
    FCidade: TCity;
    procedure setFCidade(const Value: TCity);
    procedure setFVendedor(const Value: Integer);


  public
    constructor Create;Override;
    destructor Destroy;Override;
    property Vendedor : Integer read FVendedor write setFVendedor;
    property Cidade: TCity read FCidade write setFCidade;

  end;
implementation

{ TPrmCity }

constructor TPrmCity.Create;
begin
  inherited;
  FCidade := TCity.Create;
  FCidade.RegistroCriado := 0;
  FCidade.RegistroAlterado := 0;
end;

destructor TPrmCity.Destroy;
begin
  FCidade.DisposeOf;
  inherited;
end;

procedure TPrmCity.setFCidade(const Value: TCity);
begin
  FCidade := Value;
end;

procedure TPrmCity.setFVendedor(const Value: Integer);
begin
  FVendedor := Value;
end;

end.
