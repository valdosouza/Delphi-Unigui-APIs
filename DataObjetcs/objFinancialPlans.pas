unit objFinancialPlans;

interface

uses System.SysUtils,  tblFinancialPlans, ObjBase;

Type

  TObjFinancialPlans = Class(TObjBase)
  private
    FPlanoContas: TFinancialPlans;
    procedure setFPlanoContas(const Value: TFinancialPlans);

  public
      constructor Create;override;
      destructor Destroy;override;
      property PlanoContas : TFinancialPlans read FPlanoContas write setFPlanoContas;
  End;

implementation

{ TObjFinancialPlans }

constructor TObjFinancialPlans.Create;
begin
  inherited;
  FPlanoContas := TFinancialPlans.create;
end;

destructor TObjFinancialPlans.Destroy;
begin
  FPlanoContas.DisposeOf;
end;

procedure TObjFinancialPlans.setFPlanoContas(const Value: TFinancialPlans);
begin
  FPlanoContas := Value;
end;

end.
