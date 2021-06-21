  unit ObjPriceList;

interface

uses System.SysUtils, objBase, System.Generics.Collections, tblPriceList,tblPrice;

Type

  TListPrice = TObjectList<TPrice>;

  TObjPriceList = Class(TObjBase)
  private
    FTabela: TPriceList;
    FPrecos: TListPrice;
    procedure setFTabela(const Value: TPriceList);
    procedure setFPrecos(const Value: TListPrice);
  public
    constructor Create;override;
    destructor Destroy;override;
    Property Tabela : TPriceList read FTabela write setFTabela;
    Property Precos : TListPrice read FPrecos write setFPrecos;
  End;

implementation

{ TObjPriceList }

constructor TObjPriceList.Create;
begin
  FTabela := TPriceList.Create;
  FPrecos := TListPrice.Create;
end;

destructor TObjPriceList.Destroy;
begin
  {$IFDEF WIN32}
  FTabela.DisposeOf;
  FPrecos.DisposeOf;

  {$ENDIF }
end;


procedure TObjPriceList.setFPrecos(const Value: TListPrice);
begin
  FPrecos := Value;
end;

procedure TObjPriceList.setFTabela(const Value: TPriceList);
begin
  FTabela := Value;
end;

end.
