unit intBroadcasterHasCirculation;

interface
type
  TIntBroadcasterHasCirculation = class
  private
    FNumero: Integer;
    FPopulacao: Integer;
    FVeiculo: Integer;
    FCidade: Integer;
    FEstado: Integer;
    FDescCidade: String;
    procedure setFCidade(const Value: Integer);
    procedure setFEstado(const Value: Integer);
    procedure setFNumero(const Value: Integer);
    procedure setFPopulacao(const Value: Integer);
    procedure setFVeiculo(const Value: Integer);
    procedure setFDescCidade(const Value: String);

  public
    property Estado : Integer read FEstado write setFEstado;
    property Cidade : Integer read FCidade write setFCidade;
    Property DescCidade : String read FDescCidade write setFDescCidade;
    property Veiculo : Integer read FVeiculo write setFVeiculo;
    property Populacao : Integer read FPopulacao write setFPopulacao;
    property Numero : Integer read FNumero write setFNumero;

  end;

implementation

{ TIntBroadcasterHasCirculation }

procedure TIntBroadcasterHasCirculation.setFCidade(const Value: Integer);
begin
  FCidade := Value;
end;

procedure TIntBroadcasterHasCirculation.setFDescCidade(const Value: String);
begin
  FDescCidade := Value;
end;

procedure TIntBroadcasterHasCirculation.setFEstado(const Value: Integer);
begin
  FEstado := Value;
end;

procedure TIntBroadcasterHasCirculation.setFNumero(const Value: Integer);
begin
  FNumero := Value;
end;

procedure TIntBroadcasterHasCirculation.setFPopulacao(const Value: Integer);
begin
  FPopulacao := Value;
end;

procedure TIntBroadcasterHasCirculation.setFVeiculo(const Value: Integer);
begin
  FVeiculo := Value;
end;

end.
