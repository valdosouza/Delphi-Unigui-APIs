unit tblPromotionItemsLog;
interface

Uses GenericEntity,CAtribEntity, Classes, SysUtils;

Type
  //nome da classe de entidade
  [TableName('tb_promotion_items_log')]
  TPromotionItemsLog = Class(TGenericEntity)
  private
    FProduto: Integer;
    Flog_time: TDateTime;
    Flog_oper: String;
    FPromocao: Integer;
    FEstabelecimento: Integer;
    procedure setFEstabelecimento(const Value: Integer);
    procedure setFlog_oper(const Value: String);
    procedure setFlog_time(const Value: TDateTime);
    procedure setFProduto(const Value: Integer);
    procedure setFPromocao(const Value: Integer);


  public
    [KeyField('tb_promotion_id')]
    [FieldName('tb_promotion_id')]
    property Promocao: Integer read FPromocao write setFPromocao;

    [KeyField('tb_institution_id')]
    [FieldName('tb_institution_id')]
    property Estabelecimento: Integer read FEstabelecimento write setFEstabelecimento;

    [KeyField('tb_product_id')]
    [FieldName('tb_product_id')]
    property Produto: Integer read FProduto write setFProduto;

    [FieldName('log_oper')]
    property operacao: String read Flog_oper write setFlog_oper;

    [FieldName('log_time')]
    property update_Log: TDateTime read Flog_time write setFlog_time;

  End;


implementation
{ TPromotionItemsLog }

procedure TPromotionItemsLog.setFEstabelecimento(const Value: Integer);
begin
  FEstabelecimento := Value;
end;

procedure TPromotionItemsLog.setFlog_oper(const Value: String);
begin
  Flog_oper := Value;
end;

procedure TPromotionItemsLog.setFlog_time(const Value: TDateTime);
begin
  Flog_time := Value;
end;

procedure TPromotionItemsLog.setFProduto(const Value: Integer);
begin
  FProduto := Value;
end;

procedure TPromotionItemsLog.setFPromocao(const Value: Integer);
begin
  FPromocao := Value;
end;

end.
