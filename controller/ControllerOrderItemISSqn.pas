unit ControllerOrderItemISSqn;

interface
uses System.Classes, System.SysUtils,BaseController,
      tblOrderItemISSqn, tblEntity, FireDAC.Comp.Client,Md5, FireDAC.Stan.Param;

Type
  TControllerOrderItemISSqn = Class(TBaseController)
    procedure clear;
  private

  public
    Registro : TOrderItemISSqn;
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    function save:boolean;

  End;

implementation

{ ControllerOrderItemISSqn}

procedure TControllerOrderItemISSqn.clear;
begin
  ClearObj(Registro);
end;

constructor TControllerOrderItemISSqn.Create(AOwner: TComponent);
begin
  inherited;
  Registro := TOrderItemISSqn.Create;
end;

destructor TControllerOrderItemISSqn.Destroy;
begin
  FreeAndNil(Registro);
  inherited;
end;

function TControllerOrderItemISSqn.save: boolean;
begin
  try
    saveObj(Registro);
    Result := true;
  except
    Result := False;
  end;
end;


end.
