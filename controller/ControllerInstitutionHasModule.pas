unit ControllerInstitutionHasModule;

interface
uses System.Classes, System.SysUtils,BaseController,
      tblInstitutionHasModule,FireDAC.Comp.Client,Md5, FireDAC.Stan.Param;

Type
  TControllerInstitutionHasModule = Class(TBaseController)
    procedure clear;
  private

  public
    Registro : TInstitutionHasModule;
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    function save:boolean;

    function update: Boolean;
    function insert: Boolean;
    function delete: boolean;

  End;

implementation

{ ControllerInterface }

procedure TControllerInstitutionHasModule.clear;
begin
  clearObj(Registro);
end;

constructor TControllerInstitutionHasModule.Create(AOwner: TComponent);
begin
  inherited;
  Registro := TInstitutionHasModule.Create;
end;

function TControllerInstitutionHasModule.delete: boolean;
begin
  deleteObj(Registro)
end;

destructor TControllerInstitutionHasModule.Destroy;
begin
  Registro.DisposeOf;
  inherited;
end;

function TControllerInstitutionHasModule.save: boolean;
begin
  Try
    SaveObj(Registro);
    Result := True;
  Except
    Result := False;
  End;
end;

function TControllerInstitutionHasModule.update: Boolean;
begin
  updateObj(Registro)
end;


function TControllerInstitutionHasModule.insert: Boolean;
begin
  insertObj(Registro)
end;

end.
