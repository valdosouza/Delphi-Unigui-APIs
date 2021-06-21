unit ControllerOrderCost;


interface
uses System.Classes, System.SysUtils,BaseController,
      tblOrderCost, tblEntity, FireDAC.Comp.Client,Md5, FireDAC.Stan.Param;

Type
  TControllerOrderCost= Class(TBaseController)
    procedure clear;
  private

  public
    Registro : TOrderCost;
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    function save:boolean;

  End;

implementation

{ ControllerOrderCost}

procedure TControllerOrderCost.clear;
begin
  ClearObj(Registro);
end;

constructor TControllerOrderCost.Create(AOwner: TComponent);
begin
  inherited;
  Registro := TOrderCost.Create
  end;

destructor TControllerOrderCost.Destroy;
begin
  FreeAndNil(Registro);
  inherited;
end;

function TControllerOrderCost.save: boolean;
begin
  try
    saveObj(Registro);
    Result := true;
  except
    Result := False;
  end;
end;


end.
