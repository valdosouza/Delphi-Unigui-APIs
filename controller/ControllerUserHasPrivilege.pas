unit ControllerUserHasPrivilege;

interface
uses System.Classes, System.SysUtils,BaseController,
      tblUserHasPrivilege,FireDAC.Comp.Client,Md5, FireDAC.Stan.Param;

Type
  TControllerUserHasPrivilege = Class(TBaseController)
    procedure clear;
  private

  public
    Registro : TUserHasPrivilege;
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    function save:boolean;

  End;

implementation

procedure TControllerUserHasPrivilege.clear;
begin
  ClearObj(Registro);
end;

constructor TControllerUserHasPrivilege.Create(AOwner: TComponent);
begin
  inherited;
  Registro := TUserHasPrivilege.Create;
end;

destructor TControllerUserHasPrivilege.Destroy;
begin
  Registro.DisposeOf;
  inherited;
end;

function TControllerUserHasPrivilege.save: boolean;
begin
  Try
    saveObj(Registro);
    Result := True;
  Except
    Result := False;
  End;
end;

end.

