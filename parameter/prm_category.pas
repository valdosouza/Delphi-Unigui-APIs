unit prm_category;

interface

uses prm_base,tblcategory;

Type
  TPrmCategory = class(TPrmbase)
  private
    FCategoria: TCategory;
    procedure setFCategoria(const Value: TCategory);

  public
    constructor Create;override;
    destructor Destroy;override;
    property Categoria : TCategory read FCategoria write setFCategoria;
  end;
implementation

{ TPrmCategory }

constructor TPrmCategory.Create;
begin
  inherited;
  FCategoria := TCategory.Create;
  FCategoria.RegistroCriado := 0;
  FCategoria.RegistroAlterado := 0;

end;

destructor TPrmCategory.Destroy;
begin
  FCategoria.DisposeOf;
  inherited;
end;

procedure TPrmCategory.setFCategoria(const Value: TCategory);
begin
  FCategoria := Value;
end;

end.
