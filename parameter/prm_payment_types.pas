unit prm_payment_types;

interface

uses System.SysUtils,prm_base,  tblPaymentTypes;
Type
  TPrmPaymentTypes = class(TPrmBase)
    private
    FFormaPagamento: TPaymentTypes;
    procedure setFFormaPagamento(const Value: TPaymentTypes);
    public
      constructor Create; override;
      destructor Destroy; override;
      property FormaPagamento : TPaymentTypes Read FFormaPagamento write setFFormaPagamento;
  end;
implementation

{ TPrmPaymentTypes }

constructor TPrmPaymentTypes.Create;
begin
  inherited;
  FFormaPagamento := TPaymentTypes.Create;
  FFormaPagamento.RegistroCriado := 0;
  FFormaPagamento.RegistroAlterado := 0;

end;

destructor TPrmPaymentTypes.Destroy;
begin
  FFormaPagamento.DisposeOf;
  inherited;
end;

procedure TPrmPaymentTypes.setFFormaPagamento(const Value: TPaymentTypes);
begin
  FFormaPagamento := Value;
end;

end.

