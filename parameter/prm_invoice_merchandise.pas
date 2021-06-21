unit prm_invoice_merchandise;

interface

Type
  TPrmInvoiceMerchandise = Class
  private
    FValorDesc: Real;
    FValorFrete: Real;
    FValorIpi: Real;
    FValorIcmsSt: Real;
    FValorBaseICMS: Real;
    FValorProduto: Real;
    FDataFaturamento: Tdate;
    FValorIcms: Real;
    FValorSeguro: Real;
    FValorTotal: Real;
    FValorDespesas: Real;
    FValorBaseIcmsSt: Real;
    FDataSaida: Tdate;
    procedure setFDataFaturamento(const Value: Tdate);
    procedure setFDataSaida(const Value: Tdate);
    procedure setFValorBaseICMS(const Value: Real);
    procedure setFValorBaseIcmsSt(const Value: Real);
    procedure setFValorDesc(const Value: Real);
    procedure setFValorDespesas(const Value: Real);
    procedure setFValorFrete(const Value: Real);
    procedure setFValorIcms(const Value: Real);
    procedure setFValorIcmsSt(const Value: Real);
    procedure setFValorIpi(const Value: Real);
    procedure setFValorProduto(const Value: Real);
    procedure setFValorSeguro(const Value: Real);
    procedure setFValorTotal(const Value: Real);

  public

    property DataFaturamento: Tdate read FDataFaturamento write setFDataFaturamento;
    property DataSaida: Tdate read FDataSaida write setFDataSaida;
    property ValorBaseICMS: Real read FValorBaseICMS write setFValorBaseICMS;
    property ValorIcms: Real read FValorIcms write setFValorIcms;
    property ValorBaseIcmsSt: Real read FValorBaseIcmsSt write setFValorBaseIcmsSt;
    property ValorIcmsSt  : Real read FValorIcmsSt write setFValorIcmsSt;
    property ValorProduto : Real read FValorProduto write setFValorProduto;
    property ValorFrete: Real read FValorFrete write setFValorFrete;
    property ValorSeguro: Real read FValorSeguro write setFValorSeguro;
    property ValorDespesas: Real read FValorDespesas write setFValorDespesas;
    property ValorIpi: Real read FValorIpi write setFValorIpi;
    property ValorDesc: Real read FValorDesc write setFValorDesc;
    property ValorTotal: Real read FValorTotal write setFValorTotal;
  End;

implementation


{ TPrmInvoiceMerchandise }

procedure TPrmInvoiceMerchandise.setFDataFaturamento(const Value: Tdate);
begin
  FDataFaturamento := Value;
end;

procedure TPrmInvoiceMerchandise.setFDataSaida(const Value: Tdate);
begin
  FDataSaida := Value;
end;

procedure TPrmInvoiceMerchandise.setFValorBaseICMS(const Value: Real);
begin
  FValorBaseICMS := Value;
end;

procedure TPrmInvoiceMerchandise.setFValorBaseIcmsSt(const Value: Real);
begin
  FValorBaseIcmsSt := Value;
end;

procedure TPrmInvoiceMerchandise.setFValorDesc(const Value: Real);
begin
  FValorDesc := Value;
end;

procedure TPrmInvoiceMerchandise.setFValorDespesas(const Value: Real);
begin
  FValorDespesas := Value;
end;

procedure TPrmInvoiceMerchandise.setFValorFrete(const Value: Real);
begin
  FValorFrete := Value;
end;

procedure TPrmInvoiceMerchandise.setFValorIcms(const Value: Real);
begin
  FValorIcms := Value;
end;

procedure TPrmInvoiceMerchandise.setFValorIcmsSt(const Value: Real);
begin
  FValorIcmsSt := Value;
end;

procedure TPrmInvoiceMerchandise.setFValorIpi(const Value: Real);
begin
  FValorIpi := Value;
end;

procedure TPrmInvoiceMerchandise.setFValorProduto(const Value: Real);
begin
  FValorProduto := Value;
end;

procedure TPrmInvoiceMerchandise.setFValorSeguro(const Value: Real);
begin
  FValorSeguro := Value;
end;

procedure TPrmInvoiceMerchandise.setFValorTotal(const Value: Real);
begin
  FValorTotal := Value;
end;

end.
