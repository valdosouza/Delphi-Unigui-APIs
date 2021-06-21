unit ControllerOrderProductionProcess;

interface
uses System.Classes, System.SysUtils,BaseController,
      tblOrderProductionProcess, tblEntity, FireDAC.Comp.Client,Md5, FireDAC.Stan.Param;

Type
  TControllerOrderProductionProcess = Class(TBaseController)
    procedure clear;
  private

  public
    Registro : TOrderProductionProcess;
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    function save:boolean;

  End;

implementation

{ ControllerOrderProductionProcess}

procedure TControllerOrderProductionProcess.clear;
begin
  ClearObj(Registro);
end;

constructor TControllerOrderProductionProcess.Create(AOwner: TComponent);
begin
  inherited;
  Registro := TOrderProductionProcess.Create;
end;

destructor TControllerOrderProductionProcess.Destroy;
begin
     FreeAndNil(Registro);
     inherited;
end;

function TControllerOrderProductionProcess.save: boolean;
begin
  try
    saveObj(Registro);
    Result := true;
  except
    Result := False;
  end;
end;

end.
