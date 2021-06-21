unit ControllerOrderItemDetached;

interface
uses System.Classes, System.SysUtils,BaseController,
      Md5, FireDAC.Stan.Param,tblOrderItemDetached;

Type

  TControllerOrderItemDetached = Class(TBaseController)
    procedure clear;
  private

  public
    Registro : TOrderItemDetached;
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    function save:boolean;
    function insert:boolean;
    function update:boolean;
    function delete: boolean;
    function getByKey:Boolean;
  End;

implementation

procedure TControllerOrderItemDetached.clear;
begin
  ClearObj(Registro);
end;

constructor TControllerOrderItemDetached.Create(AOwner: TComponent);
begin
  inherited;
  Registro := TOrderItemDetached.Create;
end;

function TControllerOrderItemDetached.delete: boolean;
begin
  deleteObj(Registro);
end;

destructor TControllerOrderItemDetached.Destroy;
begin
  Registro.disposeOf;
  inherited;
end;


function TControllerOrderItemDetached.insert: boolean;
begin
  try
    insertObj(Registro);
    Result := true;
  except
    Result := False;
  end;
end;

function TControllerOrderItemDetached.save: boolean;
begin
  try
    saveObj(Registro);
    Result := true;
  except
    Result := False;
  end;
end;

function TControllerOrderItemDetached.update: boolean;
begin
  try
    UpdateObj(Registro);
    Result := true;
  except
    Result := False;
  end;
end;


function TControllerOrderItemDetached.getByKey: Boolean;
begin
  _getByKey(Registro);
end;

end.
