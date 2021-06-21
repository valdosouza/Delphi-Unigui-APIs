unit prm_base_report;

interface
Type
  TPrmBaseReport = Class
  private
    FEstabelecimento: Integer;
    FResultado: Boolean;
    Furl: string;
    FUsuario: Integer;
    FOrderBy: string;
    FPublico: string;
    FArquivo: String;
    procedure setFestabelecimento(const Value: Integer);
    procedure setFResultado(const Value: Boolean);
    procedure setFUrl(const Value: string);
    procedure setFUsuario(const Value: Integer);
    procedure setFOrderBy(const Value: string);
    procedure setFPublico(const Value: string);
    procedure setFArquivo(const Value: String);

  public
    property Estabelecimento: Integer read FEstabelecimento write setFestabelecimento;
    property Usuario: Integer read FUsuario write setFUsuario;
    property Resultado: Boolean read FResultado write setFResultado;
    property Publico: string read FPublico write setFPublico;
    property Arquivo : String read FArquivo write setFArquivo;
    property URL: string read Furl write setFUrl;
    property OrderBy: string read FOrderBy write setFOrderBy;
  End;

implementation

{ TPrmBaseReport }

procedure TPrmBaseReport.setFArquivo(const Value: String);
begin
  FArquivo := Value;
end;

procedure TPrmBaseReport.setFestabelecimento(const Value: Integer);
begin
  FEstabelecimento := Value;
end;

procedure TPrmBaseReport.setFOrderBy(const Value: string);
begin
  FOrderBy := Value;
end;

procedure TPrmBaseReport.setFPublico(const Value: string);
begin
  FPublico := Value;
end;

procedure TPrmBaseReport.setFResultado(const Value: Boolean);
begin
  FResultado := Value;
end;

procedure TPrmBaseReport.setFUrl(const Value: string);
begin
  Furl := Value;
end;

procedure TPrmBaseReport.setFUsuario(const Value: Integer);
begin
  FUsuario := Value;
end;

end.
