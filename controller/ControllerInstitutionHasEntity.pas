unit ControllerInstitutionHasEntity;

interface
uses System.Classes, System.SysUtils,BaseController,
      tblInstitutionHasEntity,FireDAC.Comp.Client,Md5, FireDAC.Stan.Param;

Type
  TControllerInstitutionHasEntity = Class(TBaseController)
    procedure clear;
  private

  public
    Registro : TInstitutionHasEntity;
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    function save:boolean;

  End;

implementation

{ ControllerInterface }

procedure TControllerInstitutionHasEntity.clear;
begin
  clearObj(Registro);
end;

constructor TControllerInstitutionHasEntity.Create(AOwner: TComponent);
begin
  inherited;
  Registro := TInstitutionHasEntity.Create;
end;

destructor TControllerInstitutionHasEntity.Destroy;
begin
  Registro.DisposeOf;
  inherited;
end;

function TControllerInstitutionHasEntity.save: boolean;
begin
  Try
    SaveObj(Registro);
    Result := True;
  Except
    Result := False;
  End;
end;

end.
