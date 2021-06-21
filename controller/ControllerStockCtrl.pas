unit ControllerStockCtrl;

interface
uses System.Classes, System.SysUtils,BaseController,
      tblStockCtrl, tblEntity, FireDAC.Comp.Client,Md5, FireDAC.Stan.Param;

Type
  TControllerStockCtrl = Class(TBaseController)
    procedure clear;
  private

  public
    Registro : TStockCtrl;
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    function save:boolean;

  End;

implementation

{ ControllerStockCtrl}

procedure TControllerStockCtrl.clear;
begin
  ClearObj(Registro);
end;

constructor TControllerStockCtrl.Create(AOwner: TComponent);
begin
  inherited;
  Registro := TStockCtrl.Create;
end;

destructor TControllerStockCtrl.Destroy;
begin
     FreeAndNil(Registro);
     inherited;
end;

function TControllerStockCtrl.save: boolean;
begin
  try
    saveObj(Registro);
    Result := true;
  except
    Result := False;
  end;
end;


end.
