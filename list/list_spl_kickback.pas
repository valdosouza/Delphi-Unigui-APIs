unit list_spl_kickback;

interface
type
  TListSplKickback = class
  private
    FHistorico: String;
    FVenda: Real;
    FComissao: Real;
    FItem: Integer;
    FEstabelecimento: Integer;
    FOrdem: Integer;
    FTerminal: Integer;
    FParcela: Integer;
    FData: TDate;
    procedure setFComissao(const Value: Real);
    procedure setFEstabelecimento(const Value: Integer);
    procedure setFHistorico(const Value: String);
    procedure setFItem(const Value: Integer);
    procedure setFOrdem(const Value: Integer);
    procedure setFParcela(const Value: Integer);
    procedure setFTerminal(const Value: Integer);
    procedure setFVenda(const Value: Real);
    procedure setFData(const Value: TDate);

   public
      property Estabelecimento : Integer read FEstabelecimento write setFEstabelecimento;
      property Terminal : Integer read FTerminal write setFTerminal;
      property Ordem : Integer read FOrdem write setFOrdem;
      property Item : Integer read FItem write setFItem;
      property Parcela : Integer read FParcela write setFParcela;
      property Data  : TDate read FData write setFData;
      property Venda : Real Read FVenda write setFVenda;
      property Comissao : Real read FComissao write setFComissao;
      property Historico : String Read FHistorico write setFHistorico;
  end;

implementation

{ TListSplKickback }

procedure TListSplKickback.setFComissao(const Value: Real);
begin
  FComissao := Value;
end;

procedure TListSplKickback.setFData(const Value: TDate);
begin
  FData := Value;
end;

procedure TListSplKickback.setFEstabelecimento(const Value: Integer);
begin
  FEstabelecimento := Value;
end;

procedure TListSplKickback.setFHistorico(const Value: String);
begin
  FHistorico := Value;
end;

procedure TListSplKickback.setFItem(const Value: Integer);
begin
  FItem := Value;
end;

procedure TListSplKickback.setFOrdem(const Value: Integer);
begin
  FOrdem := Value;
end;

procedure TListSplKickback.setFParcela(const Value: Integer);
begin
  FParcela := Value;
end;

procedure TListSplKickback.setFTerminal(const Value: Integer);
begin
  FTerminal := Value;
end;

procedure TListSplKickback.setFVenda(const Value: Real);
begin
  FVenda := Value;
end;

end.
