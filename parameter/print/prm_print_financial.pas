unit prm_print_financial;

interface

uses prm_base_report;
type
  TPrmPrintFinancial = class(TPrmBaseReport)
  private
    FEntidade: Integer;
    FPeriodo: Boolean;
    FDataFinal: TDate;
    FDataInicial: TDate;
    FTipo: String;
    FTerminal: Integer;
    procedure setFDataDinal(const Value: TDate);
    procedure setFDataInicial(const Value: TDate);
    procedure setFEntidade(const Value: Integer);
    procedure setFPeriodo(const Value: Boolean);
    procedure setFTipo(const Value: String);
    procedure setFTerminal(const Value: Integer);

  public
    property Periodo :Boolean read FPeriodo write setFPeriodo;
    property DataInicial :TDate read FDataInicial write setFDataInicial;
    property DataFinal :TDate read FDataFinal write setFDataDinal;
    property Entidade :Integer read FEntidade write setFEntidade;
    property Tipo : String read FTipo write setFTipo;
    property Terminal : Integer read FTerminal write setFTerminal;
  end;
implementation

{ TPrmPrintFinancial }

procedure TPrmPrintFinancial.setFDataDinal(const Value: TDate);
begin
  FDataFinal := Value;
end;

procedure TPrmPrintFinancial.setFDataInicial(const Value: TDate);
begin
  FDataInicial := Value;
end;

procedure TPrmPrintFinancial.setFEntidade(const Value: Integer);
begin
  FEntidade := Value;
end;

procedure TPrmPrintFinancial.setFPeriodo(const Value: Boolean);
begin
  FPeriodo := Value;
end;

procedure TPrmPrintFinancial.setFTerminal(const Value: Integer);
begin
  FTerminal := Value;
end;

procedure TPrmPrintFinancial.setFTipo(const Value: String);
begin
  FTipo := Value;
end;

end.
