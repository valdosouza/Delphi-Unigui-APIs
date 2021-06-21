unit prm_measure;

interface

uses System.SysUtils, prm_base,tblmeasure;

Type
  TPrmMeasure = class(TPrmbase)
  private
    FMedida: TMeasure;
    procedure setFMedida(const Value: TMeasure);

  public
    constructor Create;Override;
    destructor Destroy;Override;
    property Medida: TMeasure read FMedida write setFMedida;
  end;

implementation

{ TPrmMeasure }

constructor TPrmMeasure.Create;
begin
  inherited;
  FMedida := TMeasure.Create;
  FMedida.RegistroCriado := 0;
  FMedida.RegistroAlterado := 0;

end;

destructor TPrmMeasure.Destroy;
begin
  FMedida.DisposeOf;
  inherited;
end;

procedure TPrmMeasure.setFMedida(const Value: TMeasure);
begin
  FMedida := Value;
end;

end.
