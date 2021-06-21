unit prm_order_consignment;

interface

uses System.SysUtils, tblOrder, tblOrderItem, tblOrderSale, tblOrderTotalizer,
  tblEntity,TypesCollection,tblOrderConsignment,tblOrderConsignmentOperation,prm_base;

type
  TPrmOrderConsignmet = class (TPrmBase)
    private
    FEntidade: TEntity;
    FConsignacao: TOrderConsignment;
    FOperacoes: TOrderConsignmentOperation;
    procedure setFConsignacao(const Value: TOrderConsignment);
    procedure setFEntidade(const Value: TEntity);
    procedure setFOperacoes(const Value: TOrderConsignmentOperation);

    public
      constructor Create;override;
      destructor Destroy;override;
      property Entidade : TEntity read FEntidade write setFEntidade;
      property Consignacao  : TOrderConsignment read FConsignacao write setFConsignacao;
      property Operacoes    : TOrderConsignmentOperation read FOperacoes write setFOperacoes;

  end;

implementation

{ TPrmOrderConsignmet }

constructor TPrmOrderConsignmet.Create;
begin
  inherited;
  FEntidade     := TEntity.Create;
  FEntidade.RegistroCriado := 0;
  FEntidade.RegistroAlterado := 0;

  FConsignacao  := TOrderConsignment.Create;
  FConsignacao.RegistroCriado := 0;
  FConsignacao.RegistroAlterado := 0;

  FOperacoes    := TOrderConsignmentOperation.Create;
  FOperacoes.RegistroCriado := 0;
  FOperacoes.RegistroAlterado := 0;

end;

destructor TPrmOrderConsignmet.Destroy;
begin
  FEntidade.DisposeOf;
  FConsignacao.DisposeOf;
  FOperacoes.DisposeOf;
  inherited;
end;

procedure TPrmOrderConsignmet.setFConsignacao(const Value: TOrderConsignment);
begin
  FConsignacao := Value;
end;

procedure TPrmOrderConsignmet.setFEntidade(const Value: TEntity);
begin
  FEntidade := Value;
end;

procedure TPrmOrderConsignmet.setFOperacoes(const Value: TOrderConsignmentOperation);
begin
  FOperacoes := Value;
end;

end.
