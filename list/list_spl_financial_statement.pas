unit list_spl_financial_statement;

interface
type
  TListSplFinancialStatement = class
  private
    FHistorico: String;
    FValorCredito: Real;
    FValorDebito: Real;
    FCodigo: Integer;
    FData: TDAte;
    procedure setFCodigo(const Value: Integer);
    procedure setFData(const Value: TDAte);
    procedure setFHistorico(const Value: String);
    procedure setFValorCredito(const Value: Real);
    procedure setFValorDebito(const Value: Real);

   public
      property Codigo : Integer read FCodigo write setFCodigo;
      property Data : TDAte read FData write setFData;
      property ValorDebito : Real Read FValorDebito write setFValorDebito;
      property ValorCredito : Real Read FValorCredito write setFValorCredito;
      property Historico : String Read FHistorico write setFHistorico;
  end;


implementation

{ TListSplFinancialStatement }

procedure TListSplFinancialStatement.setFCodigo(const Value: Integer);
begin
  FCodigo := Value;
end;

procedure TListSplFinancialStatement.setFData(const Value: TDAte);
begin
  FData := Value;
end;

procedure TListSplFinancialStatement.setFHistorico(const Value: String);
begin
  FHistorico := Value;
end;

procedure TListSplFinancialStatement.setFValorCredito(const Value: Real);
begin
  FValorCredito := Value;
end;

procedure TListSplFinancialStatement.setFValorDebito(const Value: Real);
begin
  FValorDebito := Value;
end;

end.
