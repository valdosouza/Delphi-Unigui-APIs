unit prm_print_order_list;

interface

uses prm_base_report;

type
  TPrmPrintOrderList = class(TPrmBaseReport)
  private
    FEntidade: Integer;
    FPeriodo: Boolean;
    FTipo: String;
    FDataFinal: TDate;
    FDataInicial: TDate;
    procedure setFDataDinal(const Value: TDate);
    procedure setFDataInicial(const Value: TDate);
    procedure setFEntidade(const Value: Integer);
    procedure setFPeriodo(const Value: Boolean);
    procedure setFTipo(const Value: String);

  public
    property Periodo :Boolean read FPeriodo write setFPeriodo;
    property DataInicial :TDate read FDataInicial write setFDataInicial;
    property DataFinal :TDate read FDataFinal write setFDataDinal;
    property Entidade :Integer read FEntidade write setFEntidade;
    property Tipo : String read FTipo write setFTipo;
  end;

implementation

{ TPrmPrintOrderList }

procedure TPrmPrintOrderList.setFDataDinal(const Value: TDate);
begin
  FDataFinal := Value;
end;

procedure TPrmPrintOrderList.setFDataInicial(const Value: TDate);
begin
  FDataInicial := Value;
end;

procedure TPrmPrintOrderList.setFEntidade(const Value: Integer);
begin
  FEntidade := Value;
end;

procedure TPrmPrintOrderList.setFPeriodo(const Value: Boolean);
begin
  FPeriodo := Value;
end;

procedure TPrmPrintOrderList.setFTipo(const Value: String);
begin
  FTipo := Value;
end;

end.
