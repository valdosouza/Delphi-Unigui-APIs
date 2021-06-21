unit objCashier;

interface

uses tblCashier, tblCashierItems,System.Generics.Collections,
  ObjBase;

Type
  TListItems = TObjectList<TCashierItems>;
  TObjCashier = Class(TObjBase)
  private
    FItems: TListItems;
    FCaixa: TCashier;
    procedure setFCaixar(const Value: TCashier);
    procedure setFItems(const Value: TListItems);

  public
      constructor Create;override;
      destructor Destroy;override;
      property Caixa : TCashier read FCaixa write setFCaixar;
      property Items : TListItems read FItems write setFItems;
  End;
implementation

{ TObjCashier }

constructor TObjCashier.Create;
begin
  inherited;
  FCaixa := TCashier.Create;
  FItems := TListItems.Create;
end;

destructor TObjCashier.Destroy;
begin
  FCaixa.DisposeOf;
  FItems.DisposeOf;
end;

procedure TObjCashier.setFCaixar(const Value: TCashier);
begin
  FCaixa := Value;
end;

procedure TObjCashier.setFItems(const Value: TListItems);
begin
  FItems := Value;
end;

end.
