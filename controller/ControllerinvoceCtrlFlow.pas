unit ControllerinvoceCtrlFlow;

interface
uses System.Classes, System.SysUtils,BaseController,
      tblinvoceCtrlFlow, tblEntity, FireDAC.Comp.Client,Md5, FireDAC.Stan.Param;

Type
  TControllerinvoceCtrlFlow= Class(TBaseController)
    procedure clear;
  private

  public
    Registro : TinvoceCtrlFlow;
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    function save:boolean;

  End;

implementation

{ ControllerinvoceCtrlFlows }

procedure TControllerinvoceCtrlFlow.clear;
begin
  ClearObj(Registro);
end;

constructor TControllerinvoceCtrlFlow.Create(AOwner: TComponent);
begin
  inherited;
  Registro := TinvoceCtrlFlow.Create;
  end;

destructor TControllerinvoceCtrlFlow.Destroy;
begin
  FreeAndNil(Registro);
  inherited;
end;

function TControllerinvoceCtrlFlow.save: boolean;
begin
  try
    saveObj(Registro);
    Result := true;
  except
    Result := False;
  end;
end;

end.

