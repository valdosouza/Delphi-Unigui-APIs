unit ObjRestGroupHasOptional;

interface

uses System.SysUtils, System.Generics.Collections,
     objbase, tblRestGroupHasOptional;

Type

  TObjRestGroupHasOptional = Class(TObjBase)
    private
    FOpcional: TRestGroupHasOptional;
    procedure setFOpcional(const Value: TRestGroupHasOptional);
    public
    constructor Create;override;
    destructor Destroy;override;
    property Opcional : TRestGroupHasOptional read FOpcional write setFOpcional;

  End;

implementation

{ TObjRestGroupHasOptional }

constructor TObjRestGroupHasOptional.Create;
begin
  inherited;
  Opcional := TRestGroupHasOptional.Create;
end;

destructor TObjRestGroupHasOptional.Destroy;
begin
  Opcional.DisposeOf;
  inherited;
end;


procedure TObjRestGroupHasOptional.setFOpcional(
  const Value: TRestGroupHasOptional);
begin
  FOpcional := Value;
end;

end.
