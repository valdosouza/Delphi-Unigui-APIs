unit prm_financial;

interface

uses System.SysUtils, tblOrder, tblOrderItem, tblOrderSale, tblOrderTotalizer,
  tblEntity,TypesCollection,tblFinancial, tblFinancialBills,tblFinancialPayment,
  prm_base,tblfinancialPlans;

type
  TPrmFinancial = class (TPrmBase)
    private
    FPlanos: TFinancialPlans;
    FPagamentos: TFinancialPayment;
    FFinaceiro: TFinancial;
    FContas: TFinancialBills;
    FEntidade: TEntity;
    procedure setFFContas(const Value: TFinancialBills);
    procedure setFFinaceiro(const Value: TFinancial);
    procedure setFFPagamentos(const Value: TFinancialPayment);
    procedure setFFPlanos(const Value: TFinancialPlans);
    procedure setFEntidade(const Value: TEntity);


    public
      constructor Create;override;
      destructor Destroy;override;
      property Finaceiro : TFinancial read FFinaceiro write setFFinaceiro;
      property Contas : TFinancialBills read FContas write setFFContas;
      property Pagamentos : TFinancialPayment read FPagamentos write setFFPagamentos;
      property Planos : TFinancialPlans read FPlanos write setFFPlanos;
      property Entidade : TEntity read FEntidade write setFEntidade;
  end;


implementation

{ TPrmFinancial }

constructor TPrmFinancial.Create;
begin
  inherited;
  FFinaceiro  := TFinancial.Create;
  FFinaceiro.RegistroCriado := 0;
  FFinaceiro.RegistroAlterado := 0;

  FContas     := TFinancialBills.Create;
  FContas.RegistroCriado := 0;
  FContas.RegistroAlterado := 0;

  FPagamentos := TFinancialPayment.Create;
  FPagamentos.RegistroCriado := 0;
  FPagamentos.RegistroAlterado := 0;

  FPlanos     := TFinancialPlans.Create;
  FPlanos.RegistroCriado := 0;
  FPlanos.RegistroAlterado := 0;

  FEntidade   := TEntity.Create;
  FEntidade.RegistroCriado := 0;
  FEntidade.RegistroAlterado := 0;

end;

destructor TPrmFinancial.Destroy;
begin
  FFinaceiro.DisposeOf;
  FContas.DisposeOf;
  FPagamentos.DisposeOf;
  FPlanos.DisposeOf;
  inherited;
end;


procedure TPrmFinancial.setFEntidade(const Value: TEntity);
begin
  FEntidade := Value;
end;

procedure TPrmFinancial.setFFContas(const Value: TFinancialBills);
begin
  FContas := Value;
end;

procedure TPrmFinancial.setFFinaceiro(const Value: TFinancial);
begin
  FFinaceiro := Value;
end;

procedure TPrmFinancial.setFFPagamentos(const Value: TFinancialPayment);
begin
  FPagamentos := Value;
end;

procedure TPrmFinancial.setFFPlanos(const Value: TFinancialPlans);
begin
  FPlanos := Value;
end;

end.
