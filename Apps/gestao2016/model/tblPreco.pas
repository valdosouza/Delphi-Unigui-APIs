unit tblPreco;

interface

Uses GenericEntity,GenericDao,CAtribEntity, System.Classes, System.SysUtils;

Type
  //nome da classe de entidade
  [TableName('tb_preco')]
  TPreco = Class(TGenericEntity)
  private
    FPRC_AQ_COM: Real;
    FPRC_VL_VDA: Real;
    FPRC_CODPRO: Integer;
    FPRC_CODIGO: Integer;
    FPRC_MAR_LRC: Real;
    FPRC_QT_MIN: Real;
    FPRC_CODTPR: Integer;

    procedure setFPRC_CODIGO( Value : INTEGER);
    procedure setFPRC_CODTPR( Value : INTEGER);
    procedure setFPRC_CODPRO( Value : INTEGER);
    procedure setFPRC_VL_VDA( Value : Real);
    procedure setFPRC_AQ_COM( Value : Real);
    procedure setFPRC_QT_MIN( Value : Real);
    procedure setFPRC_MAR_LRC( Value : Real);

  public

    [FieldName('PRC_CODIGO')]
    property Codigo: Integer read FPRC_CODIGO write setFPRC_CODIGO;

    [KeyField('PRC_CODTPR')]
    [FieldName('PRC_CODTPR')]
    property CodigoTabela: Integer read FPRC_CODTPR write setFPRC_CODTPR;

    [KeyField('PRC_CODPRO')]
    [FieldName('PRC_CODPRO')]
    property CodigoProduto: Integer read FPRC_CODPRO write setFPRC_CODPRO;

    [FieldName('PRC_VL_VDA')]
    property Valor: Real read FPRC_VL_VDA write setFPRC_VL_VDA;

    [FieldName('PRC_AQ_COM')]
    property AliComissao: Real read FPRC_AQ_COM write setFPRC_AQ_COM;

    [FieldName('PRC_QT_MIN')]
    property QtdeMinima: Real read FPRC_QT_MIN write setFPRC_QT_MIN;

    [FieldName('PRC_MAR_LRC')]
    property MargemLucro: Real read FPRC_MAR_LRC write setFPRC_MAR_LRC;

  End;

implementation



{ TPreco }

procedure TPreco.setFPRC_AQ_COM(Value: Real);
begin
  FPRC_AQ_COM := Value;
end;

procedure TPreco.setFPRC_CODIGO(Value: INTEGER);
begin
  FPRC_CODIGO := Value;
end;

procedure TPreco.setFPRC_CODPRO(Value: INTEGER);
begin
  FPRC_CODPRO := Value;
end;

procedure TPreco.setFPRC_CODTPR(Value: INTEGER);
begin
  FPRC_CODTPR := Value;
end;

procedure TPreco.setFPRC_MAR_LRC(Value: Real);
begin
  FPRC_MAR_LRC := Value;
end;

procedure TPreco.setFPRC_QT_MIN(Value: Real);
begin
  FPRC_QT_MIN := Value;
end;

procedure TPreco.setFPRC_VL_VDA(Value: Real);
begin
  FPRC_VL_VDA := Value;
end;

end.
