unit list_spl_product;

interface

uses list_spl_base;

type
  TListSplProduct = class(TListSplBase)
  private
    FDescricao: String;
    FCodigo: Integer;
    procedure setFCodigo(const Value: Integer);
    procedure setFDescricao(const Value: String);

   public
      property Codigo : Integer read FCodigo write setFCodigo;
      property Descricao : String Read FDescricao write setFDescricao;
  end;

implementation

{ TListSplProduct }

procedure TListSplProduct.setFCodigo(const Value: Integer);
begin
  FCodigo := Value;
end;

procedure TListSplProduct.setFDescricao(const Value: String);
begin
  FDescricao := Value;
end;

end.
