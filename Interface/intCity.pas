unit intCity;

interface
type
  TIntCity = class
  private
    FCodigo: Integer;
    FSelecao: String;
    FNome: String;
    procedure setFCodigo(const Value: Integer);
    procedure setFNome(const Value: String);
    procedure setFSelecao(const Value: String);

  public
    property Codigo : Integer read FCodigo write setFCodigo;
    property Nome  : String read FNome write setFNome;
    property Selecao  : String read FSelecao write setFSelecao;
  end;


implementation

{ TIntCity }

procedure TIntCity.setFCodigo(const Value: Integer);
begin
  FCodigo := Value;
end;

procedure TIntCity.setFNome(const Value: String);
begin
  FNome := Value;
end;

procedure TIntCity.setFSelecao(const Value: String);
begin
  FSelecao := Value;
end;

end.
