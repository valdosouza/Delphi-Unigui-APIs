unit tblProduto;

interface

Uses GenericEntity,GenericDao,CAtribEntity, System.Classes, System.SysUtils;

Type
  //nome da classe de entidade
  [TableName('tb_produto')]
  TProduto = Class(TGenericEntity)
  private
    FPRO_DESTAQUE: String;
    FPRO_CODIGOFOR: String;
    FPRO_CODMHA: Integer;
    FPRO_VENDA: String;
    FPRO_EXCLUSIVO: String;
    FPRO_PESO: Real;
    FPRO_CODMRC: Integer;
    FPRO_VL_CUSTO: Real;
    FPRO_FORA_LINHA: String;
    FPRO_CODMED: Integer;
    FPRO_CODSBG: Integer;
    FPRO_ATIVO: String;
    FPRO_CAMPANHA: String;
    FPRO_CODGRP: Integer;
    FPRO_SERIE: String;
    FPRO_DESCRICAO: String;
    FPRO_CEST: String;
    FPRO_TRIBUTACAO: String;
    FPRO_VL_CUSTOMED: Real;
    FPRO_ALTURA: Real;
    FPRO_CODIGO: Integer;
    FPRO_VL_FABRICA: Real;
    FPRO_IMPRIME: String;
    FPRO_DETALHES: String;
    FPRO_VL_CUSTOANT: Real;
    FPRO_QTDE_MIN: Real;
    FPRO_CODCAT: Integer;
    FPRO_LARGURA: Real;
    FPRO_LOCAL: String;
    FPRO_APLICACAO: String;
    FPRO_EST_NEG: String;
    FPRO_SUB_TRIB: String;
    FPRO_CODIGOFAB: String;
    FPRO_CODIGOBAR: String;
    FPRO_INTERNET: String;
    FPRO_VL_CUSTOMEDANT: Real;
    FPRO_MAISVENDIDO: String;
    FPRO_COMPRIMENTO: Real;
    FPRO_TIPO: String;
    FPRO_CODIGONCM: String;
    FPRO_CODRVT: Integer;
    FPRO_ORIGEM: String;
    FPRO_COMPOSICAO: String;
    FPRO_DIVISOR: Integer;
    FPRO_CODEMB: Integer;

    procedure setFPRO_CODIGO( Value : INTEGER);
    procedure setFPRO_CODMHA( Value : INTEGER);
    procedure setFPRO_CODIGOFAB( Value : String);
    procedure setFPRO_CODIGOBAR( Value : String);
    procedure setFPRO_CODIGOFOR( Value : String);
    procedure setFPRO_CODIGONCM( Value : String);
    procedure setFPRO_DESCRICAO( Value : String);
    procedure setFPRO_CODMED( Value : INTEGER);
    procedure setFPRO_CODEMB( Value : INTEGER);
    procedure setFPRO_CODGRP( Value : INTEGER);
    procedure setFPRO_CODSBG( Value : INTEGER);
    procedure setFPRO_DIVISOR( Value : INTEGER);
    procedure setFPRO_ORIGEM( Value : String);
    procedure setFPRO_TIPO( Value : String);
    procedure setFPRO_LOCAL( Value : String);
    procedure setFPRO_PESO( Value : Real);
    procedure setFPRO_LARGURA( Value : Real);
    procedure setFPRO_COMPRIMENTO( Value : Real);
    procedure setFPRO_ALTURA( Value : Real);
    procedure setFPRO_VL_FABRICA( Value : Real);
    procedure setFPRO_VL_CUSTOMED( Value : Real);
    procedure setFPRO_VL_CUSTOMEDANT( Value : Real);
    procedure setFPRO_VL_CUSTO( Value : Real);
    procedure setFPRO_VL_CUSTOANT( Value : Real);
    procedure setFPRO_QTDE_MIN( Value : Real);
    procedure setFPRO_DETALHES( Value : String);
    procedure setFPRO_SUB_TRIB( Value : String);
    procedure setFPRO_CAMPANHA( Value : String);
    procedure setFPRO_DESTAQUE( Value : String);
    procedure setFPRO_ATIVO( Value : String);
    procedure setFPRO_IMPRIME( Value : String);
    procedure setFPRO_EST_NEG( Value : String);
    procedure setFPRO_EXCLUSIVO( Value : String);
    procedure setFPRO_INTERNET( Value : String);
    procedure setFPRO_MAISVENDIDO( Value : String);
    procedure setFPRO_COMPOSICAO( Value : String);
    procedure setFPRO_APLICACAO( Value : String);
    procedure setFPRO_CODMRC( Value : INTEGER);
    procedure setFPRO_TRIBUTACAO( Value : String);
    procedure setFPRO_SERIE( Value : String);
    procedure setFPRO_VENDA( Value : String);
    procedure setFPRO_CODRVT( Value : INTEGER);
    procedure setFPRO_CODCAT( Value : INTEGER);
    procedure setFPRO_FORA_LINHA( Value : String);
    procedure setFPRO_CEST( Value : String);


  public

    [KeyField('PRO_CODIGO')]
    [FieldName('PRO_CODIGO')]
    property Codigo: Integer read FPRO_CODIGO write setFPRO_CODIGO;

    //[KeyField('PRO_CODMHA')] retirado pois a sequencia é a mesma para todas os estabelecimentos
    [FieldName('PRO_CODMHA')]
    property CodigoEstabelecimento: Integer read FPRO_CODMHA write setFPRO_CODMHA;

    [FieldName('PRO_CODIGOFAB')]
    property CodigoFabrica: String read FPRO_CODIGOFAB write setFPRO_CODIGOFAB;

    [FieldName('PRO_CODIGOBAR')]
    property CodigoBarras: String read FPRO_CODIGOBAR write setFPRO_CODIGOBAR;

    [FieldName('PRO_CODIGOFOR')]
    property CodigoFornecedor: String read FPRO_CODIGOFOR write setFPRO_CODIGOFOR;

    [FieldName('PRO_CODIGONCM')]
    property CodigoNCM: String read FPRO_CODIGONCM write setFPRO_CODIGONCM;

    [FieldName('PRO_DESCRICAO')]
    property Descricao: String read FPRO_DESCRICAO write setFPRO_DESCRICAO;

    [FieldName('PRO_CODMED')]
    property CodigoMedida: Integer read FPRO_CODMED write setFPRO_CODMED;

    [FieldName('PRO_CODEMB')]
    property CodigoEmbalagem: Integer read FPRO_CODEMB write setFPRO_CODEMB;

    [FieldName('PRO_CODGRP')]
    property CodigoGrupo: Integer read FPRO_CODGRP write setFPRO_CODGRP;

    [FieldName('PRO_CODSBG')]
    property CodigoSubgrupo: Integer read FPRO_CODSBG write setFPRO_CODSBG;

    [FieldName('PRO_DIVISOR')]
    property Divisor: Integer read FPRO_DIVISOR write setFPRO_DIVISOR;

    [FieldName('PRO_ORIGEM')]
    property Origem: String read FPRO_ORIGEM write setFPRO_ORIGEM;

    [FieldName('PRO_TIPO')]
    property Tipo: String read FPRO_TIPO write setFPRO_TIPO;

    [FieldName('PRO_LOCAL')]
    property Localizacao: String read FPRO_LOCAL write setFPRO_LOCAL;

    [FieldName('PRO_PESO')]
    property Peso: Real read FPRO_PESO write setFPRO_PESO;

    [FieldName('PRO_LARGURA')]
    property Largura: Real read FPRO_LARGURA write setFPRO_LARGURA;

    [FieldName('PRO_COMPRIMENTO')]
    property Comprimento: Real read FPRO_COMPRIMENTO write setFPRO_COMPRIMENTO;

    [FieldName('PRO_ALTURA')]
    property Altura: Real read FPRO_ALTURA write setFPRO_ALTURA;

    [FieldName('PRO_VL_FABRICA')]
    property ValorFabrica: Real read FPRO_VL_FABRICA write setFPRO_VL_FABRICA;

    [FieldName('PRO_VL_CUSTOMED')]
    property ValorCustoMedio: Real read FPRO_VL_CUSTOMED write setFPRO_VL_CUSTOMED;

    [FieldName('PRO_VL_CUSTOMEDANT')]
    property ValorCustoMedioAnt: Real read FPRO_VL_CUSTOMEDANT write setFPRO_VL_CUSTOMEDANT;

    [FieldName('PRO_VL_CUSTO')]
    property ValorCusto: Real read FPRO_VL_CUSTO write setFPRO_VL_CUSTO;

    [FieldName('PRO_VL_CUSTOANT')]
    property ValorCustoAnt: Real read FPRO_VL_CUSTOANT write setFPRO_VL_CUSTOANT;

    [FieldName('PRO_QTDE_MIN')]
    property QtdeMinima: Real read FPRO_QTDE_MIN write setFPRO_QTDE_MIN;

    [FieldName('PRO_DETALHES')]
    property Detalhes: String read FPRO_DETALHES write setFPRO_DETALHES;

    [FieldName('PRO_SUB_TRIB')]
    property SubsTrib: String read FPRO_SUB_TRIB write setFPRO_SUB_TRIB;

    [FieldName('PRO_CAMPANHA')]
    property Campanha: String read FPRO_CAMPANHA write setFPRO_CAMPANHA;

    [FieldName('PRO_DESTAQUE')]
    property Destaque: String read FPRO_DESTAQUE write setFPRO_DESTAQUE;

    [FieldName('PRO_ATIVO')]
    property Ativo: String read FPRO_ATIVO write setFPRO_ATIVO;

    [FieldName('PRO_IMPRIME')]
    property Imprime: String read FPRO_IMPRIME write setFPRO_IMPRIME;

    [FieldName('PRO_EST_NEG')]
    property EstoqueNegativo: String read FPRO_EST_NEG write setFPRO_EST_NEG;

    [FieldName('PRO_EXCLUSIVO')]
    property Exclusivo: String read FPRO_EXCLUSIVO write setFPRO_EXCLUSIVO;

    [FieldName('PRO_INTERNET')]
    property Internet: String read FPRO_INTERNET write setFPRO_INTERNET;

    [FieldName('PRO_MAISVENDIDO')]
    property MaisVendido: String read FPRO_MAISVENDIDO write setFPRO_MAISVENDIDO;

    [FieldName('PRO_COMPOSICAO')]
    property Composicao: String read FPRO_COMPOSICAO write setFPRO_COMPOSICAO;

    [FieldName('PRO_APLICACAO')]
    property Aplicacao: String read FPRO_APLICACAO write setFPRO_APLICACAO;

    [FieldName('PRO_CODMRC')]
    property CodigoMarca: Integer read FPRO_CODMRC write setFPRO_CODMRC;

    [FieldName('PRO_TRIBUTACAO')]
    property FinalidadeTributacao: String read FPRO_TRIBUTACAO write setFPRO_TRIBUTACAO;

    [FieldName('PRO_SERIE')]
    property UtilizaSerie: String read FPRO_SERIE write setFPRO_SERIE;

    [FieldName('PRO_VENDA')]
    property Venda: String read FPRO_VENDA write setFPRO_VENDA;

    [FieldName('PRO_CODRVT')]
    property Revestimento: Integer read FPRO_CODRVT write setFPRO_CODRVT;

    [FieldName('PRO_CODCAT')]
    property Categoria: Integer read FPRO_CODCAT write setFPRO_CODCAT;

    [FieldName('PRO_FORA_LINHA')]
    property ForaLinha: String read FPRO_FORA_LINHA write setFPRO_FORA_LINHA;

    [FieldName('PRO_CEST')]
    property CEST: String read FPRO_CEST write setFPRO_CEST;


  End;

implementation


{ TProduto }

procedure TProduto.setFPRO_ALTURA(Value: Real);
begin
  FPRO_ALTURA := Value;
end;

procedure TProduto.setFPRO_APLICACAO(Value: String);
begin
  FPRO_APLICACAO := Value;
end;

procedure TProduto.setFPRO_ATIVO(Value: String);
begin
  FPRO_ATIVO := Value;
end;

procedure TProduto.setFPRO_CAMPANHA(Value: String);
begin
  FPRO_CAMPANHA := Value;
end;

procedure TProduto.setFPRO_CEST(Value: String);
begin
  FPRO_CEST := Value;
end;

procedure TProduto.setFPRO_CODCAT(Value: INTEGER);
begin
  FPRO_CODCAT := Value;
end;

procedure TProduto.setFPRO_CODEMB(Value: INTEGER);
begin
  FPRO_CODEMB := Value;
end;

procedure TProduto.setFPRO_CODGRP(Value: INTEGER);
begin
  FPRO_CODGRP := Value;
end;

procedure TProduto.setFPRO_CODIGO(Value: INTEGER);
begin
  FPRO_CODIGO := Value;
end;

procedure TProduto.setFPRO_CODIGOBAR(Value: String);
begin
  FPRO_CODIGOBAR := Value;
end;

procedure TProduto.setFPRO_CODIGOFAB(Value: String);
begin
  FPRO_CODIGOFAB := Value;
end;

procedure TProduto.setFPRO_CODIGOFOR(Value: String);
begin
  FPRO_CODIGOFOR := Value;
end;

procedure TProduto.setFPRO_CODIGONCM(Value: String);
begin
  FPRO_CODIGONCM := Value;
end;

procedure TProduto.setFPRO_CODMED(Value: INTEGER);
begin
  FPRO_CODMED := Value;
end;

procedure TProduto.setFPRO_CODMHA(Value: INTEGER);
begin
  FPRO_CODMHA := Value;
end;

procedure TProduto.setFPRO_CODMRC(Value: INTEGER);
begin
  FPRO_CODMRC := Value;
end;

procedure TProduto.setFPRO_CODRVT(Value: INTEGER);
begin
  FPRO_CODRVT := Value;
end;

procedure TProduto.setFPRO_CODSBG(Value: INTEGER);
begin
  FPRO_CODSBG := Value;
end;

procedure TProduto.setFPRO_COMPOSICAO(Value: String);
begin
  FPRO_COMPOSICAO := Value;
end;

procedure TProduto.setFPRO_COMPRIMENTO(Value: Real);
begin
  FPRO_COMPRIMENTO := Value;
end;

procedure TProduto.setFPRO_DESCRICAO(Value: String);
begin
  FPRO_DESCRICAO := Value;
end;

procedure TProduto.setFPRO_DESTAQUE(Value: String);
begin
  FPRO_DESTAQUE := Value;
end;

procedure TProduto.setFPRO_DETALHES(Value: String);
begin
  FPRO_DETALHES := Value;
end;

procedure TProduto.setFPRO_DIVISOR(Value: INTEGER);
begin
  FPRO_DIVISOR := Value;
end;

procedure TProduto.setFPRO_EST_NEG(Value: String);
begin
  FPRO_EST_NEG := Value;
end;

procedure TProduto.setFPRO_EXCLUSIVO(Value: String);
begin
  FPRO_EXCLUSIVO := Value;
end;

procedure TProduto.setFPRO_FORA_LINHA(Value: String);
begin
  FPRO_FORA_LINHA := Value;
end;

procedure TProduto.setFPRO_IMPRIME(Value: String);
begin
  FPRO_IMPRIME := Value;
end;

procedure TProduto.setFPRO_INTERNET(Value: String);
begin
  FPRO_INTERNET := Value;
end;

procedure TProduto.setFPRO_LARGURA(Value: Real);
begin
  FPRO_LARGURA := Value;
end;

procedure TProduto.setFPRO_LOCAL(Value: String);
begin
  FPRO_LOCAL := Value;
end;

procedure TProduto.setFPRO_MAISVENDIDO(Value: String);
begin
  FPRO_MAISVENDIDO := Value;
end;

procedure TProduto.setFPRO_ORIGEM(Value: String);
begin
  FPRO_ORIGEM := Value;
end;

procedure TProduto.setFPRO_PESO(Value: Real);
begin
  FPRO_PESO := Value;
end;

procedure TProduto.setFPRO_QTDE_MIN(Value: Real);
begin
  FPRO_QTDE_MIN := Value;
end;

procedure TProduto.setFPRO_SERIE(Value: String);
begin
  FPRO_SERIE := Value;
end;

procedure TProduto.setFPRO_SUB_TRIB(Value: String);
begin
  FPRO_SUB_TRIB := Value;
end;

procedure TProduto.setFPRO_TIPO(Value: String);
begin
  FPRO_TIPO := Value;
end;

procedure TProduto.setFPRO_TRIBUTACAO(Value: String);
begin
  FPRO_TRIBUTACAO := Value;
end;

procedure TProduto.setFPRO_VENDA(Value: String);
begin
  FPRO_VENDA := Value;
end;

procedure TProduto.setFPRO_VL_CUSTO(Value: Real);
begin
  FPRO_VL_CUSTO := Value;
end;

procedure TProduto.setFPRO_VL_CUSTOANT(Value: Real);
begin
  FPRO_VL_CUSTOANT := Value;
end;

procedure TProduto.setFPRO_VL_CUSTOMED(Value: Real);
begin
  FPRO_VL_CUSTOMED := Value;
end;

procedure TProduto.setFPRO_VL_CUSTOMEDANT(Value: Real);
begin
  FPRO_VL_CUSTOMEDANT := Value;
end;

procedure TProduto.setFPRO_VL_FABRICA(Value: Real);
begin
  FPRO_VL_FABRICA := Value;
end;


end.
