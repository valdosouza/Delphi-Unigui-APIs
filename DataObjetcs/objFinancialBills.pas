unit objFinancialBills;

interface

uses System.SysUtils,  tblFinancialPlans, tblFinancial, tblFinancialBills,
  tblFinancialPayment,ObjBase, Typescollection;

Type

  TObjFinancialBills = Class(TObjBase)
  private
    FPagamentos: TFinancialPayment;
    FContas: TFinancialBills;
    FFinanceiro: TFinancial;
    FMovimento: TListFinancialStatement;

    procedure setFContas(const Value: TFinancialBills);
    procedure setFFinanceiro(const Value: TFinancial);
    procedure setFPagamentos(const Value: TFinancialPayment);
    procedure setFMovimento(const Value: TListFinancialStatement);

  public
      constructor Create;override;
      destructor Destroy; override;
      property Financeiro : TFinancial read FFinanceiro write setFFinanceiro;
      property Contas : TFinancialBills read FContas write setFContas;
      property Pagamentos : TFinancialPayment read FPagamentos write setFPagamentos;
      property Movimento : TListFinancialStatement read FMovimento write setFMovimento;
  End;

implementation

{ TObjFinancialBills }

constructor TObjFinancialBills.Create;
begin
  Inherited;
  FFinanceiro := TFinancial.Create;
  FContas := TFinancialBills.Create;
  FPagamentos := TFinancialPayment.Create;
  FMovimento := TListFinancialStatement.Create;
end;

destructor TObjFinancialBills.Destroy;
begin
  FMovimento.DisposeOf;
  FFinanceiro.DisposeOf;
  FContas.DisposeOf;
  FPagamentos.DisposeOf;
end;

procedure TObjFinancialBills.setFContas(const Value: TFinancialBills);
begin
  FContas := Value;
end;

procedure TObjFinancialBills.setFFinanceiro(const Value: TFinancial);
begin
  FFinanceiro := Value;
end;


procedure TObjFinancialBills.setFMovimento(
  const Value: TListFinancialStatement);
begin
  FMovimento := Value;
end;

procedure TObjFinancialBills.setFPagamentos(const Value: TFinancialPayment);
begin
  FPagamentos := Value;
end;

end.
