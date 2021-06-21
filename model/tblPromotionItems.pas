unit tblPromotionItems;
interface

Uses GenericEntity,CAtribEntity, Classes, SysUtils;

Type
  //nome da classe de entidade
  [TableName('tb_promotion_items')]
  TPromotionItems = Class(TGenericEntity)
  private
    FProduto: Integer;
    FPromocao: Integer;
    FEstabelecimento: Integer;
    Fupdated_at: TDAteTime;
    Fcreated_at: TDAteTime;
    procedure setFEstabelecimento(const Value: Integer);
    procedure setFProduto(const Value: Integer);
    procedure setFPromocao(const Value: Integer);
    procedure setFcreated_at(const Value: TDAteTime);
    procedure setFupdated_at(const Value: TDAteTime);

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

    [FieldName('created_at')]
    property RegistroCriado: TDAteTime read Fcreated_at write setFcreated_at;

    [FieldName('updated_at')]
    property RegistroAlterado: TDAteTime read Fupdated_at write setFupdated_at;

  End;

implementation


{ TPromotionItems }

procedure TPromotionItems.setFcreated_at(const Value: TDAteTime);
begin
  Fcreated_at := Value;
end;

procedure TPromotionItems.setFEstabelecimento(const Value: Integer);
begin
  FEstabelecimento := Value;
end;

procedure TPromotionItems.setFProduto(const Value: Integer);
begin
  FProduto := Value;
end;

procedure TPromotionItems.setFPromocao(const Value: Integer);
begin
  FPromocao := Value;
end;

procedure TPromotionItems.setFupdated_at(const Value: TDAteTime);
begin
  Fupdated_at := Value;
end;

end.
