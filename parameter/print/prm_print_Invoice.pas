unit prm_print_Invoice;

interface
uses prm_base_Report;

Type
  TPrmPrintInvoice = class(TPrmBaseReport)

  private
    FModelo: String;
    FEntidade: Integer;
    FPeriodo: Boolean;
    FDataFinal: TDate;
    FDataInicial: TDate;
    procedure setFDataDinal(const Value: TDate);
    procedure setFDataInicial(const Value: TDate);
    procedure setFEntidade(const Value: Integer);
    procedure setFModelo(const Value: String);
    procedure setFPeriodo(const Value: Boolean);

  public
    property Periodo :Boolean read FPeriodo write setFPeriodo;
    property DataInicial :TDate read FDataInicial write setFDataInicial;
    property DataFinal :TDate read FDataFinal write setFDataDinal;
    property Entidade :Integer read FEntidade write setFEntidade;
    property Modelo : String read FModelo write setFModelo;

  end;

implementation

{ TPrmPrintInvoice }

procedure TPrmPrintInvoice.setFDataDinal(const Value: TDate);
begin
  FDataFinal := Value;
end;

procedure TPrmPrintInvoice.setFDataInicial(const Value: TDate);
begin
  FDataInicial := Value;
end;

procedure TPrmPrintInvoice.setFEntidade(const Value: Integer);
begin
  FEntidade := Value;
end;

procedure TPrmPrintInvoice.setFModelo(const Value: String);
begin
  FModelo := Value;
end;

procedure TPrmPrintInvoice.setFPeriodo(const Value: Boolean);
begin
  FPeriodo := Value;
end;

end.
