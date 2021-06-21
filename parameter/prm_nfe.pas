unit prm_nfe;

interface

Type
  TPrmNFe = Class
  private
    FOperacao: String;
    FMotivo: String;
    FEstabelecimento: Integer;
    FOrdem: Integer;
    FChave: String;
    FEvento: Integer;
    FJustificativa: String;
    procedure setFEstabelecimento(const Value: Integer);
    procedure setFMotivo(const Value: String);
    procedure setFOperacao(const Value: String);
    procedure setFOrdem(const Value: Integer);
    procedure setFChave(const Value: String);
    procedure setFEvento(const Value: Integer);
    procedure setFJustificativa(const Value: String);

  public
    property Estabelecimento: Integer read FEstabelecimento write setFEstabelecimento;
    property Ordem: Integer read FOrdem write setFOrdem;
    property Operacao:String read FOperacao write setFOperacao;
    property Motivo: String read FMotivo write setFMotivo;
    property Chave : String read FChave write setFChave;
    property Evento : Integer read FEvento write setFEvento;
    property Justificativa :String read FJustificativa write setFJustificativa;
  End;

implementation
{ TPrmNFe }

procedure TPrmNFe.setFChave(const Value: String);
begin
  FChave := Value;
end;

procedure TPrmNFe.setFEstabelecimento(const Value: Integer);
begin
  FEstabelecimento := Value;
end;

procedure TPrmNFe.setFEvento(const Value: Integer);
begin
  FEvento := Value;
end;

procedure TPrmNFe.setFJustificativa(const Value: String);
begin
  FJustificativa := Value;
end;

procedure TPrmNFe.setFMotivo(const Value: String);
begin
  FMotivo := Value;
end;

procedure TPrmNFe.setFOperacao(const Value: String);
begin
  FOperacao := Value;
end;

procedure TPrmNFe.setFOrdem(const Value: Integer);
begin
  FOrdem := Value;
end;

end.
