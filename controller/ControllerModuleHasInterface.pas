unit ControllerModuleHasInterface;

interface
uses System.Classes, System.SysUtils,BaseController,
      tblModuleHasInterface,FireDAC.Comp.Client,Md5, FireDAC.Stan.Param ;

Type
  TControllerModuleHasInterface = Class(TBaseController)
    procedure clear;
  private

  public
    Registro : TModuleHasInterface;

    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    function save:boolean;
    function update: Boolean;
    function insert: Boolean;
    function delete: boolean;

  End;

implementation

{ ControllerInterface }


procedure TControllerModuleHasInterface.clear;
begin
  clearObj(Registro);
end;

constructor TControllerModuleHasInterface.Create(AOwner: TComponent);
begin
  inherited;
  Registro := TModuleHasInterface.Create;
end;

function TControllerModuleHasInterface.delete: boolean;
begin
  Try
    deleteObj(Registro);
    Result := True;
  Except
    Result := False;
  End;
end;

destructor TControllerModuleHasInterface.Destroy;
begin
  FreeAndNil(Registro);
  inherited;
end;

function TControllerModuleHasInterface.save: boolean;
begin
  Try
    SaveObj(Registro);
    Result := True;
  Except
    Result := False;
  End;
end;

function TControllerModuleHasInterface.update: Boolean;
begin
  updateObj(Registro)
end;


function TControllerModuleHasInterface.insert: Boolean;
begin
  insertObj(Registro)
end;

end.
