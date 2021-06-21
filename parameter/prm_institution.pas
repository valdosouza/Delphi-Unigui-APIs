unit prm_institution;

interface

uses tblinstitution, System.SysUtils, prm_base ;

Type
  TPrmInstitution = class(TPrmBase)
  private
    FInstitution: TInstitution;
    procedure setFInstitution(const Value: TInstitution);

  public
    constructor Create;override;
    destructor Destroy;override;

    property Institution : TInstitution read FInstitution write setFInstitution;
  end;


implementation

{ TPrmInstitution }

constructor TPrmInstitution.Create;
begin
  FInstitution := TInstitution.create;
end;

destructor TPrmInstitution.Destroy;
begin
  FInstitution.DisposeOf;

end;


procedure TPrmInstitution.setFInstitution(const Value: TInstitution);
begin
  FInstitution := Value;
end;

end.
