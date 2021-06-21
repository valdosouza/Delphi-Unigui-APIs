unit objPromotion;

interface

uses System.SysUtils,tblpromotion, tblPromotionItems, System.Generics.Collections,
  ObjBase;

Type
  TListItems = TObjectList<TPromotionItems>;
  TObjPromotion = Class(TObjBase)
  private
    FItems: TListItems;
    FPromotion: TPromotion;
    procedure setFItems(const Value: TListItems);
    procedure setFPromotion(const Value: TPromotion);

  public
      constructor Create;override;
      destructor Destroy;override;
      property Promocao : TPromotion read FPromotion write setFPromotion;
      property Items : TListItems read FItems write setFItems;
  End;

implementation


{ TObjPromotion }

constructor TObjPromotion.Create;
begin
  inherited;
  FPromotion := TPromotion.Create;
  FItems := TListItems.Create;
end;

destructor TObjPromotion.Destroy;
begin
  FPromotion.DisposeOf;
  FItems.DisposeOf;
end;

procedure TObjPromotion.setFItems(const Value: TListItems);
begin
  FItems := Value;
end;

procedure TObjPromotion.setFPromotion(const Value: TPromotion);
begin
  FPromotion := Value;
end;

end.
