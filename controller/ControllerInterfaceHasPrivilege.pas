unit ControllerInterfaceHasPrivilege;

interface
uses System.Classes, System.SysUtils,BaseController,
      tblInterfaceHasPrivilege,FireDAC.Comp.Client,Md5, FireDAC.Stan.Param;

Type
  TControllerInterfaceHasPrivilege = Class(TBaseController)
    procedure clear;
  private

  public
    Registro : TInterfaceHasPrivilege;
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    function save:boolean;

    function update: Boolean;
    function insert: Boolean;
    function delete: boolean;

  End;

implementation

{ ControllerInterface }

procedure TControllerInterfaceHasPrivilege.clear;
begin
  clearObj(Registro);
end;

constructor TControllerInterfaceHasPrivilege.Create(AOwner: TComponent);
begin
  inherited;
  Registro := TInterfaceHasPrivilege.Create;
end;

function TControllerInterfaceHasPrivilege.delete: boolean;
begin
  deleteObj(Registro)
end;

destructor TControllerInterfaceHasPrivilege.Destroy;
begin
  Registro.DisposeOf;
  inherited;
end;

function TControllerInterfaceHasPrivilege.save: boolean;
begin
  Try
    SaveObj(Registro);
    Result := True;
  Except
    Result := False;
  End;
end;

function TControllerInterfaceHasPrivilege.update: Boolean;
begin
  updateObj(Registro)
end;

function TControllerInterfaceHasPrivilege.insert: Boolean;
begin
 insertObj(Registro)
end;

end.

