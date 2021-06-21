unit ControllerOrderJobHasReserved;

interface
uses System.Classes, System.SysUtils,BaseController,
      tblOrderJobHasReserved,FireDAC.Comp.Client,Md5, FireDAC.Stan.Param;

Type
  TControllerOrderJobHasReserved = Class(TBaseController)
    procedure clear;
  private

  public
    Registro : TOrderJobHasReserved;
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    function save:boolean;

  End;

implementation

{OrderJobHasReserved }

procedure TControllerOrderJobHasReserved.clear;
begin
  ClearObj(Registro);
end;

constructor TControllerOrderJobHasReserved.Create(AOwner: TComponent);
begin
  inherited;
  Registro := TOrderJobHasReserved.Create;
end;

destructor TControllerOrderJobHasReserved.Destroy;
begin
  FreeAndNil(Registro);
  inherited;
end;

function TControllerOrderJobHasReserved.save: boolean;
begin
  Try
    saveObj(Registro);
    Result := True;
  Except
    Result := False;
  End;
end;


end.
