unit prm_stock_list;

interface

uses System.SysUtils,tblStockList, TypesCollection,prm_base, System.Generics.Collections;

Type
  TPrmStockList = class(TPrmbase)
    private
    FTabela: TStockList;
    FVendedor: Integer;
    procedure setFTabela(const Value: TStockList);
    procedure setFVendedor(const Value: Integer);

    public
      constructor Create;Override;
      destructor Destroy;Override;
      property Tabela : TStockList Read FTabela write setFTabela;
      property Vendedor : Integer read FVendedor write setFVendedor;
  end;

implementation

{ TPrmStockList }

constructor TPrmStockList.Create;
begin
  FTabela := TStockList.Create;
  FTabela.RegistroCriado := 0;
  FTabela.RegistroAlterado := 0;

end;

destructor TPrmStockList.Destroy;
begin
  FTabela.DisposeOf;
end;

procedure TPrmStockList.setFTabela(const Value: TStockList);
begin
  FTabela := Value;
end;

procedure TPrmStockList.setFVendedor(const Value: Integer);
begin
  FVendedor := Value;
end;

end.

