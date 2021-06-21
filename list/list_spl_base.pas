unit list_spl_base;

interface
type
  TListSplBase = class
  private
    FDescricao: String;
    FEstabelecimento: Integer;
    FTerminal: Integer;
    procedure setFDescricao(const Value: String);
    procedure setFEstabelecimento(const Value: Integer);
    procedure setFTerminal(const Value: Integer);

  public
    property Estabelecimento : Integer read FEstabelecimento write setFEstabelecimento;
    property Terminal : Integer read FTerminal write setFTerminal;
    property Descricao : String read FDescricao write setFDescricao;
  end;
implementation

{ TListSplBase }

procedure TListSplBase.setFDescricao(const Value: String);
begin
  FDescricao := Value;
end;

procedure TListSplBase.setFEstabelecimento(const Value: Integer);
begin
  FEstabelecimento := Value;
end;

procedure TListSplBase.setFTerminal(const Value: Integer);
begin
  FTerminal := Value;
end;

end.
