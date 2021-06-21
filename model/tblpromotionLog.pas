unit tblpromotionLog;

interface

Uses GenericEntity,CAtribEntity, Classes, SysUtils,tblPromotion;

Type
  //nome da classe de entidade
  [TableName('tb_promotion_log')]
  TPromotionLog = Class(TGenericEntity)
  private
    Flog_time: TDateTime;
    Flog_oper: String;
    FAtivo: String;
    Fprice_tag: Real;
    FDescricao: String;
    FId: Integer;
    Fquantity: Real;
    FEstabelecimento: Integer;
    procedure setFAtivo(const Value: String);
    procedure setFDescricao(const Value: String);
    procedure setFEstabelecimento(const Value: Integer);
    procedure setFId(const Value: Integer);
    procedure setFlog_oper(const Value: String);
    procedure setFlog_time(const Value: TDateTime);
    procedure setFprice_tag(const Value: Real);
    procedure setFquantity(const Value: Real);

  public

    [KeyField('id')]
    [FieldName('id')]
    property Codigo: Integer read FId write setFId;

    [KeyField('tb_institution_id')]
    [FieldName('tb_institution_id')]
    property Estabelecimento: Integer read FEstabelecimento write setFEstabelecimento;

    [FieldName('description')]
    property Descricao: String read FDescricao write setFDescricao;


    [FieldName('price_tag')]
    property Preco: Real read Fprice_tag write setFprice_tag;

    [FieldName('quantity')]
    property Quantidade: Real read Fquantity write setFquantity;

    [FieldName('reg_active')]
    property Ativo: String read FAtivo write setFAtivo;

    [FieldName('log_oper')]
    property operacao: String read Flog_oper write setFlog_oper;

    [FieldName('log_time')]
    property update_Log: TDateTime read Flog_time write setFlog_time;

  End;


implementation

{ TPromotionLog }

procedure TPromotionLog.setFAtivo(const Value: String);
begin
  FAtivo := Value;
end;

procedure TPromotionLog.setFDescricao(const Value: String);
begin
  FDescricao := Value;
end;

procedure TPromotionLog.setFEstabelecimento(const Value: Integer);
begin
  FEstabelecimento := Value;
end;

procedure TPromotionLog.setFId(const Value: Integer);
begin
  FId := Value;
end;

procedure TPromotionLog.setFlog_oper(const Value: String);
begin
  Flog_oper := Value;
end;

procedure TPromotionLog.setFlog_time(const Value: TDateTime);
begin
  Flog_time := Value;
end;

procedure TPromotionLog.setFprice_tag(const Value: Real);
begin
  Fprice_tag := Value;
end;

procedure TPromotionLog.setFquantity(const Value: Real);
begin
  Fquantity := Value;
end;

end.

