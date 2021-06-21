unit prm_invoice_shipping;

interface

Type
  TPrmInvoiceShipping = Class
  private
    FPesoBruto: String;
    FNumeroVolume: String;
    FPlacaVeiculo: String;
    FPesoLiquido: String;
    FQuantidade: Real;
    FPlacaEstado: String;
    FPlacaRntc: String;
    FMarca: String;
    FClassificacao: String;
    procedure setFClassificacao(const Value: String);
    procedure setFMarca(const Value: String);
    procedure setFNumeroVolume(const Value: String);
    procedure setFPesoBruto(const Value: String);
    procedure setFPesoLiquido(const Value: String);
    procedure setFPlacaEstado(const Value: String);
    procedure setFPlacaRntc(const Value: String);
    procedure setFPlacaVeiculo(const Value: String);
    procedure setFQuantidade(const Value: Real);

  public

    property Quantidade: Real read FQuantidade write setFQuantidade;
    property Classificacao: String read FClassificacao write setFClassificacao;
    property Marca: String read FMarca write setFMarca;
    property PesoBruto: String read FPesoBruto write setFPesoBruto;
    property PesoLiquido: String read FPesoLiquido write setFPesoLiquido;
    property NumeroVolume: String read FNumeroVolume write setFNumeroVolume;
    property PlacaVeiculo: String read FPlacaVeiculo write setFPlacaVeiculo;
    property PlacaEstado: String read FPlacaEstado write setFPlacaEstado;
    property PlacaRntc: String read FPlacaRntc write setFPlacaRntc;
	End;

implementation

{ TPrmInvoiceShipping }

procedure TPrmInvoiceShipping.setFClassificacao(const Value: String);
begin
  FClassificacao := Value;
end;

procedure TPrmInvoiceShipping.setFMarca(const Value: String);
begin
  FMarca := Value;
end;

procedure TPrmInvoiceShipping.setFNumeroVolume(const Value: String);
begin
  FNumeroVolume := Value;
end;

procedure TPrmInvoiceShipping.setFPesoBruto(const Value: String);
begin
  FPesoBruto := Value;
end;

procedure TPrmInvoiceShipping.setFPesoLiquido(const Value: String);
begin
  FPesoLiquido := Value;
end;

procedure TPrmInvoiceShipping.setFPlacaEstado(const Value: String);
begin
  FPlacaEstado := Value;
end;

procedure TPrmInvoiceShipping.setFPlacaRntc(const Value: String);
begin
  FPlacaRntc := Value;
end;

procedure TPrmInvoiceShipping.setFPlacaVeiculo(const Value: String);
begin
  FPlacaVeiculo := Value;
end;

procedure TPrmInvoiceShipping.setFQuantidade(const Value: Real);
begin
  FQuantidade := Value;
end;

end.
