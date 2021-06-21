unit ControllerRestSubGroup;

interface
uses System.Classes, System.SysUtils,BaseController,
      Md5, FireDAC.Stan.Param,tblRestSubGroup;

Type

  TControllerRestSubGroup = Class(TBaseController)
    procedure clear;
  private


  public
    Registro : TRestSubGroup;
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    function save:boolean;
    function insert:boolean;
    function update:boolean;
    function delete: boolean;
    function getByKey:Boolean;
  End;

implementation


procedure TControllerRestSubGroup.clear;
begin
  ClearObj(Registro);
end;

constructor TControllerRestSubGroup.Create(AOwner: TComponent);
begin
  inherited;
  Registro := TRestSubGroup.Create;
end;

function TControllerRestSubGroup.delete: boolean;
begin
  deleteObj(Registro);
end;

destructor TControllerRestSubGroup.Destroy;
begin
  Registro.disposeOf;
  inherited;
end;


function TControllerRestSubGroup.insert: boolean;
begin
  try
    insertObj(Registro);
    Result := true;
  except
    Result := False;
  end;
end;

function TControllerRestSubGroup.save: boolean;
begin
  try
    saveObj(Registro);
    Result := true;
  except
    Result := False;
  end;
end;

function TControllerRestSubGroup.update: boolean;
begin
  try
    UpdateObj(Registro);
    Result := true;
  except
    Result := False;
  end;
end;


function TControllerRestSubGroup.getByKey: Boolean;
begin
  _getByKey(Registro);
end;

end.
