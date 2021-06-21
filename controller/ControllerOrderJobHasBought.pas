unit ControllerOrderJobHasBought;

interface
uses System.Classes, System.SysUtils,BaseController,
      tblOrderJobHasBought,FireDAC.Comp.Client,Md5, FireDAC.Stan.Param;

Type
  TControllerOrderJobHasBought = Class(TBaseController)
    procedure clear;
  private

  public
    Registro : TOrderJobHasBought;
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    function save:boolean;

  End;

implementation

{OrderJobHasBought}


procedure TControllerOrderJobHasBought.clear;
begin
  ClearObj(Registro);
end;

constructor TControllerOrderJobHasBought.Create(AOwner: TComponent);
begin
  inherited;
  Registro := TOrderJobHasBought.Create;
end;

destructor TControllerOrderJobHasBought.Destroy;
begin
  FreeAndNil(Registro);
  inherited;
end;

function TControllerOrderJobHasBought.save: boolean;
begin
  Try
    saveObj(Registro);
    Result := True;
  Except
    Result := False;
  End;
end;

end.
