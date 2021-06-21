unit prm_to_invoice;

interface
  Uses prm_invoice_merchandise, prm_base, prm_invoice_shipping, prm_call_invoice;

Type
  TPrmToInvoicer = Class(TPrmBase)
  private
    FModalFrete: Integer;
    FDistribuirIcms: Boolean;
    FObservacao: String;
    FDestinatario: Integer;
    FTransportadora: Integer;
    FSomaIpiBaseIcms: Boolean;
    FBaixarRetorno: Boolean;
    FControlaDevolucao: Boolean;
    FNumeroControle: String;
    FSomarFreteNota: Boolean;
    FDirecaoOperacao: String;
    FEmitente: Integer;
    FNumeroManual: String;
    FSolicitaNfe: Boolean;
    FCFOP: String;
    FControlarRetorno: Boolean;
    FDataEmissao: TDate;
    FAtualizarEstoque: Boolean;
    FSomaICMS: Boolean;
    FContasReceber: Boolean;
    FTipoControle: String;
    FNotaEntrega: TPrmInvoiceShipping;
    FDistribuirIpi: Boolean;
    FDistribuirIcmsSt: Boolean;
    FDataSaida: TDate;
    FTipo: String;
    FOrdem: Integer;
    FSomaIpiBaseIcmsSt: Boolean;
    FContasPagar: Boolean;
    FNotaMercadoria: TPrmInvoiceMerchandise;
    FUsarMvaOriginal: Boolean;
    FModeloNFe: String;

    procedure setFAtualizarEstoque(const Value: Boolean);
    procedure setFBaixarRetorno(const Value: Boolean);
    procedure setFCFOP(const Value: String);
    procedure setFContasPagar(const Value: Boolean);
    procedure setFContasReceber(const Value: Boolean);
    procedure setFControlaDevolucao(const Value: Boolean);
    procedure setFControlarRetorno(const Value: Boolean);
    procedure setFDataemissao(const Value: TDate);
    procedure setFDestinatario(const Value: Integer);
    procedure setFDirecaoOperacao(const Value: String);
    procedure setFDistribuirIcms(const Value: Boolean);
    procedure setFDistribuirIcmsSt(const Value: Boolean);
    procedure setFDistribuirIpi(const Value: Boolean);
    procedure setFEmitente(const Value: Integer);
    procedure setFModalFrete(const Value: Integer);
    procedure setFNotaEntrega(const Value: TPrmInvoiceShipping);
    procedure setFNotaMercadoria(const Value: TPrmInvoiceMerchandise);
    procedure setFNumeroControle(const Value: String);
    procedure setFNumeroManual(const Value: String);
    procedure setFObservacao(const Value: String);
    procedure setFOrdem(const Value: Integer);
    procedure setFSaida(const Value: TDate);
    procedure setFSolicitaNfe(const Value: Boolean);
    procedure setFSomaICMS(const Value: Boolean);
    procedure setFSomaIpiBaseIcms(const Value: Boolean);
    procedure setFSomaIpiBaseIcmsSt(const Value: Boolean);
    procedure setFSomarFreteNota(const Value: Boolean);
    procedure setFTipo(const Value: String);
    procedure setFTipoControle(const Value: String);
    procedure setFTransportadora(const Value: Integer);
    procedure setFUsarMvaOriginal(const Value: Boolean);
    procedure setFModeloNFe(const Value: String);


  public
    //Padrão
    property Ordem: Integer read FOrdem write setFOrdem;
    property Emitente: Integer read FEmitente write setFEmitente;
    property Destinatario: Integer read FDestinatario write setFDestinatario;
    property Tipo: String read FTipo write setFTipo;
    property DirecaoOperacao: String read FDirecaoOperacao write setFDirecaoOperacao;
    property CFOP: String read FCFOP write setFCFOP;

    property DataEmissao: TDate read FDataEmissao write setFDataemissao;
    property DataSaida: TDate read FDataSaida write setFSaida;
    property Transportadora : Integer read FTransportadora write setFTransportadora;
    property ModalFrete : Integer read FModalFrete write setFModalFrete;
    property Observacao : String read FObservacao write setFObservacao;

    //Outros Parametros Nota
    property SolicitaNfe : Boolean read FSolicitaNfe write setFSolicitaNfe;
    property NumeroManual : String read FNumeroManual write setFNumeroManual;
    property ContasReceber : Boolean read FContasReceber write setFContasReceber;
    property ContasPagar : Boolean read FContasPagar write setFContasPagar;
    property SomaICMS : Boolean read FSomaICMS write setFSomaICMS;
    property SomaIpiBaseIcms : Boolean read FSomaIpiBaseIcms write setFSomaIpiBaseIcms;
    property SomaIpiBaseIcmsSt : Boolean read FSomaIpiBaseIcmsSt write setFSomaIpiBaseIcmsSt;
    property DistribuirIcms : Boolean  read FDistribuirIcms write setFDistribuirIcms;
    property DistribuirIcmsSt : Boolean  read FDistribuirIcmsSt write setFDistribuirIcmsSt;
    property DistribuirIpi : Boolean read FDistribuirIpi write setFDistribuirIpi;
    property ControlaDevolucao : Boolean read FControlaDevolucao write setFControlaDevolucao;
    property AtualizarEstoque : Boolean read FAtualizarEstoque write setFAtualizarEstoque;
    property UsarMvaOriginal : Boolean read FUsarMvaOriginal write setFUsarMvaOriginal;
    property SomarFreteNota : Boolean read FSomarFreteNota write setFSomarFreteNota;
    property ModeloNFe : String read FModeloNFe write setFModeloNFe;

    //Controle de Retorno de documento
    property ControlarRetorno: Boolean read FControlarRetorno write setFControlarRetorno;
    property BaixarRetorno : Boolean read FBaixarRetorno write setFBaixarRetorno;
    property TipoControle : String read FTipoControle write setFTipoControle;
    property NumeroControle: String read FNumeroControle write setFNumeroControle;
    property NotaMercadoria : TPrmInvoiceMerchandise read FNotaMercadoria write setFNotaMercadoria;
    property NotaEntrega : TPrmInvoiceShipping read FNotaEntrega write setFNotaEntrega;

  End;

implementation

{ TPrmToInvoicer }

procedure TPrmToInvoicer.setFAtualizarEstoque(const Value: Boolean);
begin
  FAtualizarEstoque := Value;
end;

procedure TPrmToInvoicer.setFBaixarRetorno(const Value: Boolean);
begin
  FBaixarRetorno := Value;
end;

procedure TPrmToInvoicer.setFCFOP(const Value: String);
begin
  FCFOP := Value;
end;

procedure TPrmToInvoicer.setFContasPagar(const Value: Boolean);
begin
  FContasPagar := Value;
end;

procedure TPrmToInvoicer.setFContasReceber(const Value: Boolean);
begin
  FContasReceber := Value;
end;

procedure TPrmToInvoicer.setFControlaDevolucao(const Value: Boolean);
begin
  FControlaDevolucao := Value;
end;

procedure TPrmToInvoicer.setFControlarRetorno(const Value: Boolean);
begin
  FControlarRetorno := Value;
end;

procedure TPrmToInvoicer.setFDataemissao(const Value: TDate);
begin
  FDataEmissao := Value;
end;

procedure TPrmToInvoicer.setFDestinatario(const Value: Integer);
begin
  FDestinatario := Value;
end;

procedure TPrmToInvoicer.setFDirecaoOperacao(const Value: String);
begin
  FDirecaoOperacao := Value;
end;

procedure TPrmToInvoicer.setFDistribuirIcms(const Value: Boolean);
begin
  FDistribuirIcms := Value;
end;

procedure TPrmToInvoicer.setFDistribuirIcmsSt(const Value: Boolean);
begin
  FDistribuirIcmsSt := Value;
end;

procedure TPrmToInvoicer.setFDistribuirIpi(const Value: Boolean);
begin
  FDistribuirIpi := Value;
end;

procedure TPrmToInvoicer.setFEmitente(const Value: Integer);
begin
  FEmitente := Value;
end;

procedure TPrmToInvoicer.setFModalFrete(const Value: Integer);
begin
  FModalFrete := Value;
end;

procedure TPrmToInvoicer.setFModeloNFe(const Value: String);
begin
  FModeloNFe := Value;
end;

procedure TPrmToInvoicer.setFNotaEntrega(const Value: TPrmInvoiceShipping);
begin
  FNotaEntrega := Value;
end;

procedure TPrmToInvoicer.setFNotaMercadoria(
  const Value: TPrmInvoiceMerchandise);
begin
  FNotaMercadoria := Value;
end;

procedure TPrmToInvoicer.setFNumeroControle(const Value: String);
begin
  FNumeroControle := Value;
end;

procedure TPrmToInvoicer.setFNumeroManual(const Value: String);
begin
  FNumeroManual := Value;
end;

procedure TPrmToInvoicer.setFObservacao(const Value: String);
begin
  FObservacao := Value;
end;

procedure TPrmToInvoicer.setFOrdem(const Value: Integer);
begin
  FOrdem := Value;
end;

procedure TPrmToInvoicer.setFSaida(const Value: TDate);
begin
  FDataSaida := Value;
end;

procedure TPrmToInvoicer.setFSolicitaNfe(const Value: Boolean);
begin
  FSolicitaNfe := Value;
end;

procedure TPrmToInvoicer.setFSomaICMS(const Value: Boolean);
begin
  FSomaICMS := Value;
end;

procedure TPrmToInvoicer.setFSomaIpiBaseIcms(const Value: Boolean);
begin
  FSomaIpiBaseIcms := Value;
end;

procedure TPrmToInvoicer.setFSomaIpiBaseIcmsSt(const Value: Boolean);
begin
  FSomaIpiBaseIcmsSt := Value;
end;

procedure TPrmToInvoicer.setFSomarFreteNota(const Value: Boolean);
begin
  FSomarFreteNota := Value;
end;

procedure TPrmToInvoicer.setFTipo(const Value: String);
begin
  FTipo := Value;
end;

procedure TPrmToInvoicer.setFTipoControle(const Value: String);
begin
  FTipoControle := Value;
end;

procedure TPrmToInvoicer.setFTransportadora(const Value: Integer);
begin
  FTransportadora := Value;
end;

procedure TPrmToInvoicer.setFUsarMvaOriginal(const Value: Boolean);
begin
  FUsarMvaOriginal := Value;
end;

end.
