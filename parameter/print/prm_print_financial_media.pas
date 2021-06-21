unit prm_print_financial_media;

interface

uses prm_base_report;
type
  TPrmPrintFinancialMedia = class(TPrmBaseReport)
  private
    FNota: integer;
    FAnunciante: integer;
    FSituacao: String;
    FPeriodo: Boolean;
    FTipoData: String;
    FVeiculo: integer;
    FAgencia: integer;
    FDataFinal: TDate;
    FDataInicial: TDate;
    procedure setFAgencia(const Value: integer);
    procedure setFAnunciante(const Value: integer);
    procedure setFDataDinal(const Value: TDate);
    procedure setFDataInicial(const Value: TDate);
    procedure setFNota(const Value: integer);
    procedure setFPeriodo(const Value: Boolean);
    procedure setFSituacao(const Value: String);
    procedure setFTipoData(const Value: String);
    procedure setFVeiculo(const Value: integer);


  public
    property Periodo :Boolean read FPeriodo write setFPeriodo;
    property DataInicial :TDate read FDataInicial write setFDataInicial;
    property DataFinal :TDate read FDataFinal write setFDataDinal;
    property Situacao : String read FSituacao write setFSituacao;
    property Veiculo: integer read FVeiculo write setFVeiculo;
    property Agencia: integer read FAgencia write setFAgencia;
    property Anunciante: integer read FAnunciante write setFAnunciante;
    property Nota: integer read FNota write setFNota;
    property TipoData: String read FTipoData write setFTipoData;
  end;

implementation

{ TPrmPrintFinancialMedia }

procedure TPrmPrintFinancialMedia.setFAgencia(const Value: integer);
begin
  FAgencia := Value;
end;

procedure TPrmPrintFinancialMedia.setFAnunciante(const Value: integer);
begin
  FAnunciante := Value;
end;

procedure TPrmPrintFinancialMedia.setFDataDinal(const Value: TDate);
begin
  FDataFinal := Value;
end;

procedure TPrmPrintFinancialMedia.setFDataInicial(const Value: TDate);
begin
  FDataInicial := Value;
end;

procedure TPrmPrintFinancialMedia.setFNota(const Value: integer);
begin
  FNota := Value;
end;

procedure TPrmPrintFinancialMedia.setFPeriodo(const Value: Boolean);
begin
  FPeriodo := Value;
end;

procedure TPrmPrintFinancialMedia.setFSituacao(const Value: String);
begin
  FSituacao := Value;
end;

procedure TPrmPrintFinancialMedia.setFTipoData(const Value: String);
begin
  FTipoData := Value;
end;

procedure TPrmPrintFinancialMedia.setFVeiculo(const Value: integer);
begin
  FVeiculo := Value;
end;

end.
