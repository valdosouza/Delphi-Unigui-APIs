unit ControllerOrdemItemcofins;

interface
uses System.Classes, System.SysUtils,BaseController,
      tblOrderItemCofins, tblEntity, FireDAC.Comp.Client,Md5, FireDAC.Stan.Param;

Type
  TControllerOrderItemCofins= Class(TBaseController)
    procedure clear;
  private
  public
    Registro : TOrderItemCofins;
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    function save:boolean;

  End;

implementation

{ ControllerOrderItemCofins}

procedure TControllerOrderItemCofins.clear;
begin
  ClearObj(Registro);
end;

constructor TControllerOrderItemCofins.Create(AOwner: TComponent);
begin
  inherited;
  Registro := TOrderItemCofins.Create
  end;

destructor TControllerOrderItemCofins.Destroy;
begin
  FreeAndNil(Registro);
  inherited;
end;

function TControllerOrderItemCofins.save: boolean;
begin
  try
    saveObj(Registro);
    Result := true;
  except
    Result := False;
  end;
end;


end.
