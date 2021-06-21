unit ControllerOrderItemLoose;

interface
uses System.Classes, System.SysUtils,BaseController,
      tblOrderItemLoose, tblEntity, FireDAC.Comp.Client,Md5, FireDAC.Stan.Param;

Type
  TControllerOrderItemLoose = Class(TBaseController)
    procedure clear;
  private

  public
    Registro : TOrderItemLoose;
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    function save:boolean;

    End;

implementation

{ ControllerOrderItemLoose}

procedure TControllerOrderItemLoose.clear;
begin
  ClearObj(Registro);
end;

constructor TControllerOrderItemLoose.Create(AOwner: TComponent);
begin
  inherited;
  Registro := TOrderItemLoose.Create;
end;

destructor TControllerOrderItemLoose.Destroy;
begin
  FreeAndNil(Registro);
  inherited;
end;

function TControllerOrderItemLoose.save: boolean;
begin
  try
    saveObj(Registro);
    Result := true;
  except
    Result := False;
  end;
end;

end.
