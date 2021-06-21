unit tblPromotion;

interface

Uses GenericEntity,CAtribEntity, Classes, SysUtils;

Type
  //nome da classe de entidade
  [TableName('tb_promotion')]
  TPromotion = Class(TGenericEntity)
  private
    Fprice_tag: Real;
    FDescricao: String;
    FId: Integer;
    Fquantity: Real;
    FEstabelecimento: Integer;
    FAtivo: String;
    Fupdated_at: TDAteTime;
    Fcreated_at: TDAteTime;
    procedure setFDescricao(const Value: String);
    procedure setFEstabelecimento(const Value: Integer);
    procedure setFId(const Value: Integer);
    procedure setFprice_tag(const Value: Real);
    procedure setFquantity(const Value: Real);
    procedure setFAtivo(const Value: String);
    procedure setFcreated_at(const Value: TDAteTime);
    procedure setFupdated_at(const Value: TDAteTime);



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

    [FieldName('created_at')]
    property RegistroCriado: TDAteTime read Fcreated_at write setFcreated_at;

    [FieldName('updated_at')]
    property RegistroAlterado: TDAteTime read Fupdated_at write setFupdated_at;
  End;


implementation


{ TPromotion }

procedure TPromotion.setFAtivo(const Value: String);
begin
  FAtivo := Value;
end;

procedure TPromotion.setFcreated_at(const Value: TDAteTime);
begin
  Fcreated_at := Value;
end;

procedure TPromotion.setFDescricao(const Value: String);
begin
  FDescricao := Value;
end;

procedure TPromotion.setFEstabelecimento(const Value: Integer);
begin
  FEstabelecimento := Value;
end;

procedure TPromotion.setFId(const Value: Integer);
begin
  FId := Value;
end;

procedure TPromotion.setFprice_tag(const Value: Real);
begin
  Fprice_tag := Value;
end;

procedure TPromotion.setFquantity(const Value: Real);
begin
  Fquantity := Value;
end;

procedure TPromotion.setFupdated_at(const Value: TDAteTime);
begin
  Fupdated_at := Value;
end;

end.
