unit ObjStockList;

interface

uses System.SysUtils, System.Generics.Collections, tblStockList,tblStockBalance, ObjBase;

Type

  TListStockBalance = TObjectList<TStockBalance>;

  TObjStockList = Class(TObjBase)
  private
    FTabela: TStockList;
    FSaldo: TListStockBalance;
    procedure setFTabela(const Value: TStockList);
    procedure setFSaldo(const Value: TListStockBalance);


  public
    constructor Create;
    destructor Destroy;
    Property Tabela : TStockList read FTabela write setFTabela;
    Property Saldo : TListStockBalance read FSaldo write setFSaldo;
  End;


implementation

{ TObjStockList }

constructor TObjStockList.Create;
begin
  FTabela := TStockList.create;
  FSaldo := TListStockBalance.create;
end;

destructor TObjStockList.Destroy;
begin
  {$IFDEF WIN32}
  FTabela.DisposeOf;
  FSaldo.DisposeOf;
  {$ENDIF }
end;

procedure TObjStockList.setFSaldo(const Value: TListStockBalance);
begin
  FSaldo := Value;
end;

procedure TObjStockList.setFTabela(const Value: TStockList);
begin
  FTabela := Value;
end;

end.
