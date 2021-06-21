unit objFinancialStatement;

interface

uses System.SysUtils, ObjBase,  tblFinancialStatement;

Type

  TObjFinancialStatement = Class(TObjBase)
  private
    FMovimento: TFinancialStatement;
    FFormaPagamento: String;
    procedure setFMovimento(const Value: TFinancialStatement);
    procedure setFFormaPagamento(const Value: String);

  public
      constructor Create; override;
      destructor Destroy; override;
      property Movimento : TFinancialStatement read FMovimento write setFMovimento;
      property FormaPagamento     : String read FFormaPagamento write setFFormaPagamento;
  End;

implementation


{ TObjFinancialStatement }

constructor TObjFinancialStatement.Create;
begin
  inherited;
  FMovimento := TFinancialStatement.Create;
end;

destructor TObjFinancialStatement.Destroy;
begin
  FMovimento.DisposeOf;
end;


procedure TObjFinancialStatement.setFFormaPagamento(const Value: String);
begin
  FFormaPagamento := Value;
end;

procedure TObjFinancialStatement.setFMovimento(
  const Value: TFinancialStatement);
begin
  FMovimento := Value;
end;

end.
