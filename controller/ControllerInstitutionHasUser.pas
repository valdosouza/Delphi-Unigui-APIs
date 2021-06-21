unit ControllerInstitutionHasUser;

interface
uses System.Classes, System.SysUtils,BaseController,
      tblInstitutionHasUser,FireDAC.Comp.Client,Md5,
      FireDAC.Stan.Param;

Type
  TControllerInstitutionHasUser = Class(TBaseController)
    procedure clear;
  private

  public
    Registro : TInstitutionHasUser;
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    function save:boolean;
    function  delete:Boolean;
    function getbyKey:Boolean;
  End;

implementation

{ ControllerInterface }

procedure TControllerInstitutionHasUser.clear;
begin
  clearObj(Registro);
end;

constructor TControllerInstitutionHasUser.Create(AOwner: TComponent);
begin
  inherited;
  Registro := TInstitutionHasUser.Create;
end;

function TControllerInstitutionHasUser.delete: Boolean;
begin
  Try
    deleteObj(Registro);
    Result := True;
  Except
    Result := False;
  End;
end;

destructor TControllerInstitutionHasUser.Destroy;
begin
  Registro.DisposeOf;
  inherited;
end;

function TControllerInstitutionHasUser.getbyKey: Boolean;
begin
  _getByKey(Registro);
end;

function TControllerInstitutionHasUser.save: boolean;
begin
  Try
    SaveObj(Registro);
    Result := True;
  Except
    Result := False;
  End;
end;

end.
