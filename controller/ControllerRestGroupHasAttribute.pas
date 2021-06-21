unit ControllerRestGroupHasAttribute;

interface
uses System.Classes, System.SysUtils,BaseController,
      Md5, FireDAC.Stan.Param,tblRestGroupHasAttribute;

Type

  TControllerRestGroupHasAttribute = Class(TBaseController)
    procedure clear;
  private


  public
    Registro : TRestGroupHasAttribute;
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    function save:boolean;
    function insert:boolean;
    function update:boolean;
    function delete: boolean;

    function getByKey:Boolean;

  End;

implementation

procedure TControllerRestGroupHasAttribute.clear;
begin
  ClearObj(Registro);
end;

constructor TControllerRestGroupHasAttribute.Create(AOwner: TComponent);
begin
  inherited;
  Registro := TRestGroupHasAttribute.Create;
end;

function TControllerRestGroupHasAttribute.delete: boolean;
begin
  deleteObj(Registro);
end;

destructor TControllerRestGroupHasAttribute.Destroy;
begin
  Registro.disposeOf;
  inherited;
end;


function TControllerRestGroupHasAttribute.insert: boolean;
begin
  try
    insertObj(Registro);
    Result := true;
  except
    Result := False;
  end;
end;

function TControllerRestGroupHasAttribute.save: boolean;
begin
  try
    saveObj(Registro);
    Result := true;
  except
    Result := False;
  end;
end;

function TControllerRestGroupHasAttribute.update: boolean;
begin
  try
    UpdateObj(Registro);
    Result := true;
  except
    Result := False;
  end;
end;


function TControllerRestGroupHasAttribute.getByKey: Boolean;
begin
  _getByKey(Registro);
end;

end.
