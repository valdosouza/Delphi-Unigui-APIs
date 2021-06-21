unit intInteration;

interface
type
  TIntInteration = class
  private
    FAtualizacao: TDateTime;
    FCliente: Integer;
    Fid: Integer;
    Fcommentatio: String;
    Fsituacao: String;
    FEstabelecimento: Integer;
    FTipo: Integer;
    FOrdem: Integer;
    procedure setFAtualizacao(const Value: TDateTime);
    procedure setFCliente(const Value: Integer);
    procedure setFcommentatio(const Value: String);
    procedure setFEstabelecimento(const Value: Integer);
    procedure setFid(const Value: Integer);
    procedure setFOrdem(const Value: Integer);
    procedure setFsituacao(const Value: String);
    procedure setFTipo(const Value: Integer);

  public
    property Estabelecimento : Integer read FEstabelecimento write setFEstabelecimento;
    property id : Integer read Fid write setFid;
    property Ordem : Integer read FOrdem write setFOrdem;
    property Atualizacao : TDateTime read FAtualizacao write setFAtualizacao;
    property commentatio : String read Fcommentatio write setFcommentatio;
    property situacao : String read Fsituacao write setFsituacao;
    property Tipo : Integer read FTipo write setFTipo;
    property Cliente : Integer read FCliente write setFCliente;

  end;
implementation

{ TIntInteration }

procedure TIntInteration.setFAtualizacao(const Value: TDateTime);
begin
  FAtualizacao := Value;
end;

procedure TIntInteration.setFCliente(const Value: Integer);
begin
  FCliente := Value;
end;

procedure TIntInteration.setFcommentatio(const Value: String);
begin
  Fcommentatio := Value;
end;

procedure TIntInteration.setFEstabelecimento(const Value: Integer);
begin
  FEstabelecimento := Value;
end;

procedure TIntInteration.setFid(const Value: Integer);
begin
  Fid := Value;
end;

procedure TIntInteration.setFOrdem(const Value: Integer);
begin
  FOrdem := Value;
end;

procedure TIntInteration.setFsituacao(const Value: String);
begin
  Fsituacao := Value;
end;

procedure TIntInteration.setFTipo(const Value: Integer);
begin
  FTipo := Value;
end;

end.
