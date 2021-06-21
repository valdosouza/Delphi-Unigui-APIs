unit intMedFormats;

interface
type
  TIntMedFormats = class
  private
    FNome: String;
    FCodigo: Integer;
    FSelecao: String;
    FLinkImagem: String;
    procedure setFCodigo(const Value: Integer);
    procedure setFNome(const Value: String);
    procedure setFSelecao(const Value: String);
    procedure setFLinkImagem(const Value: String);

  public
    property Codigo : Integer read FCodigo write setFCodigo;
    property Descricao  : String read FNome write setFNome;
    property Selecao  : String read FSelecao write setFSelecao;
    property LinkImagem : String read FLinkImagem write setFLinkImagem;
  end;

implementation

{ TIntMedFormats }

procedure TIntMedFormats.setFCodigo(const Value: Integer);
begin
  FCodigo := Value;
end;

procedure TIntMedFormats.setFLinkImagem(const Value: String);
begin
  FLinkImagem := Value;
end;

procedure TIntMedFormats.setFNome(const Value: String);
begin
  FNome := Value;
end;

procedure TIntMedFormats.setFSelecao(const Value: String);
begin
  FSelecao := Value;
end;

end.
