unit tblEstoque;

interface

Uses GenericEntity,GenericDao,CAtribEntity, System.Classes, System.SysUtils;

Type
  //nome da classe de entidade
  [TableName('tb_estoque')]
  TEstoque = Class(TGenericEntity)
  private
    FEST_CODPRO: Integer;
    FEST_CODIGO: Integer;
    FEST_QTDE_MIN: Real;
    FEST_RESERVA: Real;
    FEST_QTDE: Real;
    FEST_SLD_DATA: Real;
    FEST_CODETS: Integer;
    FEST_DATA: TDate;


    procedure setFEST_CODIGO( Value : INTEGER);
    procedure setFEST_CODETS( Value : INTEGER);
    procedure setFEST_CODPRO( Value : INTEGER);
    procedure setFEST_QTDE( Value : Real);
    procedure setFEST_QTDE_MIN( Value : Real);
    procedure setFEST_RESERVA( Value : Real);
    procedure setFEST_DATA( Value : TDate);
    procedure setFEST_SLD_DATA( Value : Real);
  public

    [FieldName('EST_CODIGO')]
    property Codigo: Integer read FEST_CODIGO write setFEST_CODIGO;

    [KeyField('EST_CODETS')]
    [FieldName('EST_CODETS')]
    property CodigoEstoque: Integer read FEST_CODETS write setFEST_CODETS;

    [KeyField('EST_CODPRO')]
    [FieldName('EST_CODPRO')]
    property CodigoProduto: Integer read FEST_CODPRO write setFEST_CODPRO;

    [FieldName('EST_QTDE')]
    property QtdeDisp: Real read FEST_QTDE write setFEST_QTDE;

    [FieldName('EST_QTDE_MIN')]
    property QtdeMinima: Real read FEST_QTDE_MIN write setFEST_QTDE_MIN;

    [FieldName('EST_RESERVA')]
    property QtdeReservada: Real read FEST_RESERVA write setFEST_RESERVA;

    [FieldName('EST_DATA')]
    property Data: TDate read FEST_DATA write setFEST_DATA;

    [FieldName('EST_SLD_DATA')]
    property SaldoData: Real read FEST_SLD_DATA write setFEST_SLD_DATA;


  End;

Implementation

{ TEstoque }

procedure TEstoque.setFEST_CODETS(Value: INTEGER);
begin
  FEST_CODETS := Value;
end;

procedure TEstoque.setFEST_CODIGO(Value: INTEGER);
begin
  FEST_CODIGO := Value;
end;

procedure TEstoque.setFEST_CODPRO(Value: INTEGER);
begin
  FEST_CODPRO := Value;
end;

procedure TEstoque.setFEST_DATA(Value: TDate);
begin
  FEST_DATA := Value;
end;

procedure TEstoque.setFEST_QTDE(Value: Real);
begin
  FEST_QTDE := Value;
end;

procedure TEstoque.setFEST_QTDE_MIN(Value: Real);
begin
  FEST_QTDE_MIN := Value;
end;

procedure TEstoque.setFEST_RESERVA(Value: Real);
begin
  FEST_RESERVA := Value;
end;

procedure TEstoque.setFEST_SLD_DATA(Value: Real);
begin
  FEST_SLD_DATA := Value;
end;

end.
