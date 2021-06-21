unit prm_merchandise;

interface
uses  System.SysUtils, tblMerchandise,prm_base;

Type
  TPrmMerchandise = class(TPrmBAse)
  private
    FMercadoria: TMerchandise;
    procedure setFMercadoria(const Value: TMerchandise);
    public
      constructor Create;override;
      destructor Destroy;override;
      property Mercadoria : TMerchandise read FMercadoria write setFMercadoria;
  end;

implementation

{ TPrmMerchandise }


constructor TPrmMerchandise.Create;
begin
  inherited;
  FMercadoria := TMerchandise.Create;
  FMercadoria.RegistroCriado := 0;
  FMercadoria.RegistroAlterado := 0;

end;

destructor TPrmMerchandise.Destroy;
begin
  FMercadoria.disposeof;
  inherited;
end;


procedure TPrmMerchandise.setFMercadoria(const Value: TMerchandise);
begin
  FMercadoria := Value;
end;

end.
