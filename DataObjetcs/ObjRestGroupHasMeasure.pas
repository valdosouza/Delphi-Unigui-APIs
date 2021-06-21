unit ObjRestGroupHasMeasure;

interface

uses System.SysUtils, System.Generics.Collections,
     objbase, tblRestGroupHasMeasure, tblMeasure;

Type

  TObjRestGroupHasMeasure = Class(TObjBase)
    private
      FGrupoMedida: TRestGroupHasMeasure;
      FMedida: TMeasure;
      FGrupo: String;
      procedure setFGrupo(const Value: String);
      procedure setFGrupoMedida(const Value: TRestGroupHasMeasure);
      procedure setFMedida(const Value: TMeasure);
    public
      constructor Create;override;
      destructor Destroy;override;
      property Grupo : String read FGrupo write setFGrupo;
      property Medida : TMeasure read FMedida write setFMedida;
      property GrupoMedida : TRestGroupHasMeasure read FGrupoMedida write setFGrupoMedida;

  End;

implementation

{ TObjRestGroupHasMeasure }

constructor TObjRestGroupHasMeasure.Create;
begin
  inherited;
  GrupoMedida := TRestGroupHasMeasure.Create;
  Medida := TMeasure.create;
end;

destructor TObjRestGroupHasMeasure.Destroy;
begin
  GrupoMedida.DisposeOf;
  Medida.DisposeOf;
  inherited;
end;


procedure TObjRestGroupHasMeasure.setFGrupo(const Value: String);
begin
  FGrupo := Value;
end;

procedure TObjRestGroupHasMeasure.setFGrupoMedida(
  const Value: TRestGroupHasMeasure);
begin
  FGrupoMedida := Value;
end;

procedure TObjRestGroupHasMeasure.setFMedida(const Value: TMeasure);
begin
  FMedida := Value;
end;

end.
