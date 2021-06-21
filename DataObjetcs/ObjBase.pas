unit ObjBase;

interface

Type

  TObjBase = Class
  private
    FDescricao: String;
    FEstabelecimento: Integer;
    FCodigoWeb: Integer;
    FTerminal: Integer;
    FPagina: Integer;
    FDataAlteracao: TDateTime;
    FEstabelecimentoCNPJ: String;
    procedure setFCodigoWeb(const Value: Integer);
    procedure setFDescricao(const Value: String);
    procedure setFEstabelecimento(const Value: Integer);
    procedure setFPagina(const Value: Integer);
    procedure setFTerminal(const Value: Integer);
    procedure setFDataAlteracao(const Value: TDateTime);
    procedure setFEstabelecimentoCNPJ(const Value: String);

  public
    constructor Create;Virtual;
    destructor Destroy;override;

    property Pagina : Integer read FPagina write setFPagina;
    property Estabelecimento : Integer Read FEstabelecimento write setFEstabelecimento;
    property EstabelecimentoCNPJ : String read FEstabelecimentoCNPJ write setFEstabelecimentoCNPJ;
    property Terminal : Integer Read FTerminal write setFTerminal;
    property Descricao : String read FDescricao write setFDescricao;
    property CodigoWeb : Integer Read FCodigoWeb write setFCodigoWeb;
    Property DataAlteracao : TDateTime read FDataAlteracao write setFDataAlteracao;
  End;

implementation

{ TObjBase }

constructor TObjBase.Create;
begin

end;

destructor TObjBase.Destroy;
begin
end;

procedure TObjBase.setFCodigoWeb(const Value: Integer);
begin
  FCodigoWeb := Value;
end;

procedure TObjBase.setFDataAlteracao(const Value: TDateTime);
begin
  FDataAlteracao := Value;
end;

procedure TObjBase.setFDescricao(const Value: String);
begin
  FDescricao := Value;
end;

procedure TObjBase.setFEstabelecimento(const Value: Integer);
begin
  FEstabelecimento := Value;
end;

procedure TObjBase.setFEstabelecimentoCNPJ(const Value: String);
begin
  FEstabelecimentoCNPJ := Value;
end;

procedure TObjBase.setFPagina(const Value: Integer);
begin
  FPagina := Value;
end;

procedure TObjBase.setFTerminal(const Value: Integer);
begin
  FTerminal := Value;
end;

end.
