unit ControllerFreightMode;

interface
uses System.Classes, System.SysUtils,BaseController,
      tblFreightMode, tblEntity, FireDAC.Comp.Client,Md5, FireDAC.Stan.Param;

Type
  TControllerFreightMode = Class(TBaseController)
    procedure clear;
  private

  public
    Registro : TFreightMode;
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    function save:boolean;
    function getByKey:Boolean;
    function delete: boolean;
  End;

implementation

{ TControllerFreightMode }

procedure TControllerFreightMode.clear;
begin
  ClearObj(Registro);
end;

constructor TControllerFreightMode.Create(AOwner: TComponent);
begin
  inherited;
  Registro := TFreightMode.Create;
end;

function TControllerFreightMode.delete: boolean;
begin
  Try
    deleteObj(Registro);
    Result := True;
  Except
    Result := False;
  End;

end;

destructor TControllerFreightMode.Destroy;
begin
     FreeAndNil(Registro);
     inherited;
end;

function TControllerFreightMode.getByKey: Boolean;
begin
  _getByKey(Registro);
end;

function TControllerFreightMode.save: boolean;
begin
  try
    saveObj(Registro);
    Result := true;
  except
    Result := False;
  end;
end;

end.
