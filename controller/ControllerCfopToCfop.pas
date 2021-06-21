unit ControllerCfopToCfop;

interface
uses System.Classes, System.SysUtils,BaseController,
      tblCfopToCfop, FireDAC.Comp.Client,Md5, FireDAC.Stan.Param;

Type
  TControllerCfopToCfop = Class(TBaseController)
    procedure clear;
  private

  public
    Registro : TCfopToCfop;
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    function save:boolean;
    function getByKey:Boolean;
    function delete: boolean;
  End;

implementation

{ ControllerCfopToCfop }

procedure TControllerCfopToCfop.clear;
begin
  clearObj(Registro);
end;

constructor TControllerCfopToCfop.Create(AOwner: TComponent);
begin
  inherited;
  Registro := TCfopToCfop.Create;
end;

function TControllerCfopToCfop.delete: boolean;
begin
  Try
    deleteObj(Registro);
    Result := True;
  Except
    Result := False;
  End;
end;

destructor TControllerCfopToCfop.Destroy;
begin
  FreeAndNil(Registro);
  inherited;
end;

function TControllerCfopToCfop.save: boolean;
begin
  try
    SaveObj(Registro);
    Result := true;
  except
    Result := False;
  end;
end;


function TControllerCfopToCfop.getByKey: Boolean;
begin
  _getByKey(Registro);
end;

end.

