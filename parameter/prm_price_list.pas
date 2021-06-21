unit prm_price_list;

interface

uses System.SysUtils,prm_base,tblPriceList, TypesCollection;

Type
  TPrmPriceList = class(TPrmBase)
    private
    FTabela: TPriceList;
    procedure setFTabela(const Value: TPriceList);

    public
      constructor Create;override;
      destructor Destroy;override;
      property Tabela : TPriceList read FTabela write setFTabela;
  end;
implementation

{ TPrmPriceList }

constructor TPrmPriceList.Create;
begin
  inherited;
  FTabela := TPriceList.Create;
  FTabela.RegistroCriado := 0;
  FTabela.RegistroAlterado := 0;

end;

destructor TPrmPriceList.Destroy;
begin
  FTabela.DisposeOf;
  inherited;
end;

procedure TPrmPriceList.setFTabela(const Value: TPriceList);
begin
  FTabela := Value;
end;

end.
