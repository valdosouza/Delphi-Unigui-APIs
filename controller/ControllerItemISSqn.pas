unit ControllerItemISSqn;

interface
uses System.Classes, System.SysUtils,BaseController,
      tblOrderItemIpi, tblEntity, FireDAC.Comp.Client,Md5, FireDAC.Stan.Param;

Type
  TControllerOrderItemIpi = Class(TBaseController)
    procedure clear;
  private

  public
    Registro : TOrderItemIpi;
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    function save:boolean;
    procedure getbyKey;
  End;

implementation

{ ControllerOrderItemIpi}

procedure TControllerOrderItemIpi.clear;
begin
  ClearObj(Registro);
end;

constructor TControllerOrderItemIpi.Create(AOwner: TComponent);
begin
  inherited;
  Registro := TOrderItemIpi.Create;
end;

destructor TControllerOrderItemIpi.Destroy;
begin
  FreeAndNil(Registro);
  inherited;
end;

function TControllerOrderItemIpi.save: boolean;
begin
  try
    saveObj(Registro);
    Result := true;
  except
    Result := False;
  end;
end;

procedure TControllerOrderItemIpi.getbyKey;
begin
  _getByKey(Registro);
end;


end.
