unit objMeasure;


interface

uses System.SysUtils,System.Generics.Collections, ObjBase,tblMeasure;

Type

  TObjMeasure= Class(TobjBase)
  private
    FMedida: TMeasure;
    procedure SetFMedida(const Value: TMeasure);

  public
    constructor Create;Override;
    destructor Destroy;Override;
    property Medida : TMeasure read FMedida write SetFMedida;
  End;
implementation

{ TObjMeasure }

constructor TObjMeasure.Create;
begin
  inherited;
  FMedida := TMeasure.Create;
end;

destructor TObjMeasure.Destroy;
begin
  {$IFDEF WIN32}
    FMedida.DisposeOf;
  {$ENDIF }
end;

procedure TObjMeasure.SetFMedida(const Value: TMeasure);
begin
  FMedida := Value;
end;

end.
