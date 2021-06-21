unit prm_print_media_parts;

interface

uses prm_base_report;
type
  TPrmPrintMediaParts = class(TPrmBaseReport)
  private
    FVeiculoCom: String;
    FPeriodo: Boolean;
    FDataFinal: TDate;
    FDataInicial: TDate;
    procedure setFDataDinal(const Value: TDate);
    procedure setFDataInicial(const Value: TDate);
    procedure setFPeriodo(const Value: Boolean);
    procedure setFVeiculoCom(const Value: String);


  public
    property Periodo :Boolean read FPeriodo write setFPeriodo;
    property DataInicial :TDate read FDataInicial write setFDataInicial;
    property DataFinal :TDate read FDataFinal write setFDataDinal;
    property VeiculoCom :String  read FVeiculoCom write setFVeiculoCom;
  end;

implementation


{ TPrmPrintMediaParts }

procedure TPrmPrintMediaParts.setFDataDinal(const Value: TDate);
begin
  FDataFinal := Value;
end;

procedure TPrmPrintMediaParts.setFDataInicial(const Value: TDate);
begin
  FDataInicial := Value;
end;

procedure TPrmPrintMediaParts.setFPeriodo(const Value: Boolean);
begin
  FPeriodo := Value;
end;

procedure TPrmPrintMediaParts.setFVeiculoCom(const Value: String);
begin
  FVeiculoCom := Value;
end;

end.
