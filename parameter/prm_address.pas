unit prm_address;

interface
Type
  TPrmAddress = Class

    private
    FZipCode: String;
    FStreet: String;
    FComplement: String;
    FNeighborhood: String;
    FState: Integer;
    FCountry: Integer;
    FCity: Integer;
    procedure setFZipCode(const Value: String);
    procedure setFStreet(const Value: String);
    procedure setFComplement(const Value: String);
    procedure setFNeighborhood(const Value: String);
    procedure setFCity(const Value: Integer);
    procedure setFCountry(const Value: Integer);
    procedure setFState(const Value: Integer);



    public
      property ZipCode: String read FZipCode write setFZipCode;
      property Street: String read FStreet write setFStreet;
      property Complement: String read FComplement write setFComplement;
      property Neighborhood: String read FNeighborhood write setFNeighborhood;
      property Country: Integer read FCountry write setFCountry;
      property State: Integer read FState write setFState;
      property City: Integer read FCity write setFCity;
  End;
implementation


{ TPrmAddress }

procedure TPrmAddress.setFCity(const Value: Integer);
begin
  FCity := Value;
end;

procedure TPrmAddress.setFComplement(const Value: String);
begin
  FComplement := Value;
end;

procedure TPrmAddress.setFCountry(const Value: Integer);
begin
  FCountry := Value;
end;

procedure TPrmAddress.setFNeighborhood(const Value: String);
begin
  FNeighborhood := Value;
end;

procedure TPrmAddress.setFState(const Value: Integer);
begin
  FState := Value;
end;

procedure TPrmAddress.setFStreet(const Value: String);
begin
  FStreet := Value;
end;

procedure TPrmAddress.setFZipCode(const Value: String);
begin
  FZipCode := Value;
end;

end.

