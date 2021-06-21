unit prm_promotion;

interface

uses tblpromotion, System.SysUtils, prm_base ;

Type
  TPrmPromotion = class(TPrmBase)
  private
    FPromocao: TPromotion;
    procedure setFPromocao(const Value: TPromotion);
  public
    constructor Create;override;
    destructor Destroy;override;
    property Promocao : TPromotion read FPromocao write setFPromocao;
  end;


implementation

{ TPrmPromotion }

constructor TPrmPromotion.Create;
begin
  inherited;
  FPromocao := TPromotion.Create;
end;

destructor TPrmPromotion.Destroy;
begin
  FPromocao.DisposeOf;
  inherited;
end;

procedure TPrmPromotion.setFPromocao(const Value: TPromotion);
begin
  FPromocao := Value;
end;

end.
