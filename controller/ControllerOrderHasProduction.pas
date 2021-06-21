unit ControllerOrderHasProduction;

interface
uses System.Classes, System.SysUtils,BaseController,
      tblOrderHasProduction,FireDAC.Comp.Client,Md5, FireDAC.Stan.Param;

Type
  TControllerOrderHasProduction = Class(TBaseController)
    procedure clear;
  private

  public
    Registro : TOrderHasProduction;

    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    function save:boolean;

  End;

implementation



{ TControllerOrderJobHasReserved }

procedure TControllerOrderHasProduction.clear;
begin
  ClearObj(Registro);
end;

constructor TControllerOrderHasProduction.Create(AOwner: TComponent);
begin
  inherited;
  Registro := TOrderHasProduction.Create;
end;

destructor TControllerOrderHasProduction.Destroy;
begin
  FreeAndNil(Registro);
  inherited;
end;




function TControllerOrderHasProduction.save: boolean;
begin
  Try
    saveObj(Registro);
    Result := True;
  Except
    Result := False;
  End;
end;

end.
