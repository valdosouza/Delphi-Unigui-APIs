unit ControllerFinanceiro;

interface

uses System.Classes, IBQuery, System.SysUtils,BaseController,tblCartao,
      Un_sistema,Un_funcoes,Un_Regra_Negocio, tblFinanceiro ,GenericDao, Un_DM;

Type
  TControllerFinanceiro = Class(TBaseController)
  private
    procedure get;
  public

    Registro : TFinanceiro;
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure getById;
    function salva:boolean;
    function insere:boolean;
  End;

implementation

{ TControllerFinanceiro }

constructor TControllerFinanceiro.Create(AOwner: TComponent);
begin
  inherited;
  Registro := TFinanceiro.Create;
end;

destructor TControllerFinanceiro.Destroy;
begin
  FreeAndNil(Registro);
  inherited;
end;

procedure TControllerFinanceiro.get;
begin
  with DM.Qr_Crud,Registro do
  Begin
    Codigo := FieldByName('FIN_CODIGO').asInteger;
    CodigoEmpresa := FieldByName('FIN_CODEMP').asInteger;
    DataFinanceiro := FieldByName('FIN_DATA').asDateTime;
    CodigoPedido := FieldByName('FIN_CODPED').asInteger;
    CodigoNota := FieldByName('FIN_CODNFL').asInteger;
    FormaPagamento := FieldByName('FIN_CODFPG').asInteger;
    PrazoPagamento := FieldByName('FIN_PRAZO').asString;
    DataVencimento := FieldByName('FIN_DT_VENCIMENTO').asDAteTime;
    NumeroDuplicata := FieldByName('FIN_NUMERO').asString;
    ValorParcela := FieldByName('FIN_VL_PARCELA').asFloat;
    NumeroParcela := FieldByName('FIN_NR_PARCELA').asInteger;
    ValorJuros := FieldByName('FIN_VL_JUROS').asFloat;
    ValorMora := FieldByName('FIN_VL_MORA').asFloat;
    ValorDesconto := FieldByName('FIN_VL_DESCONTO').asFloat;
    ValorPago := FieldByName('FIN_VL_PAGO').asFloat;
    DataPagamento := FieldByName('FIN_DT_PAGTO').asDAteTime;
    DataBaixa := FieldByName('FIN_DT_BAIXA').asDAteTime;
    DocumentoBaixado := FieldByName('FIN_BAIXA').asString;
    ContaResultado := FieldByName('FIN_PLC_CREDITO').asInteger;
    CentroCusto := FieldByName('FIN_PLC_DEBITO').asInteger;
    TipoFinanceiro := FieldByName('FIN_TIPO').asString;
    SituacaoFinanceiro := FieldByName('FIN_SITUACAO').asString;
    CodigoQuitacao := FieldByName('FIN_CODQTC').asInteger;
    OperacaoFinanceiro := FieldByName('FIN_OPERACAO').asString;
    EtapaFinaceiro := FieldByName('FIN_ETAPA').asString;
    Estabelecimento := FieldByName('FIN_CODMHA').asInteger;
    CodigoCheque := FieldByName('FIN_CODCHQ').asInteger;
    AliquotaDesconto := FieldByName('FIN_ALIQ_DESC').AsFloat;
    DataLimite := FieldByName('FIN_DT_LIMIT_DESC').AsDateTime;
    CondicoesEspeciais := FieldByName('FIN_COND_ESPECIAIS').asString;
    Reprogramacao := FieldByName('FIN_DT_REPROGRAMADA').AsDateTime;
    Close;
  End;
end;

procedure TControllerFinanceiro.getById;
begin
  exist := existId(Registro);
  if (exist) then get;
end;

function TControllerFinanceiro.insere: boolean;
begin
  TGenericDAO.Insert(Registro);
end;

function TControllerFinanceiro.salva: boolean;
begin
  TGenericDAO.SaveRecord(Registro);
end;

end.
