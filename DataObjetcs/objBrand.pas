unit objBrand;


interface

uses ObjBase,tblBrand;

Type

  TObjBrand = Class(TobjBase)
  private
    FMarca: TBrand;

    procedure SetFMarca(const Value: TBrand);
  public
    constructor Create;Override;
    destructor Destroy;Override;

    property Marca : TBrand read FMarca write SetFMarca;
  End;

implementation

{ TObjBrand }

constructor TObjBrand.Create;
begin
  inherited;
  FMarca := TBrand.Create;
end;

destructor TObjBrand.Destroy;
begin
  {$IFDEF WIN32}
    FMarca.DisposeOf;
  {$ENDIF }
end;

procedure TObjBrand.SetFMarca(const Value: TBrand);
begin
  FMarca := Value;
end;

end.
