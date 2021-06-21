unit ControllerRestGroupHasObservation;

interface
uses System.Classes, System.SysUtils,BaseController,
      Md5, FireDAC.Stan.Param,tblRestGroupHasObservation;

Type

  TControllerRestGroupHasObservation = Class(TBaseController)
    procedure clear;
  private


  public
    Registro : TRestGroupHasObservation;
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    function save:boolean;
    function insert:boolean;
    function update:boolean;
    function delete: boolean;

    function getByKey:Boolean;

  End;

implementation

procedure TControllerRestGroupHasObservation.clear;
begin
  ClearObj(Registro);
end;

constructor TControllerRestGroupHasObservation.Create(AOwner: TComponent);
begin
  inherited;
  Registro := TRestGroupHasObservation.Create;
end;

function TControllerRestGroupHasObservation.delete: boolean;
begin
  deleteObj(Registro);
end;

destructor TControllerRestGroupHasObservation.Destroy;
begin
  Registro.disposeOf;
  inherited;
end;


function TControllerRestGroupHasObservation.insert: boolean;
begin
  try
    insertObj(Registro);
    Result := true;
  except
    Result := False;
  end;
end;

function TControllerRestGroupHasObservation.save: boolean;
begin
  try
    saveObj(Registro);
    Result := true;
  except
    Result := False;
  end;
end;

function TControllerRestGroupHasObservation.update: boolean;
begin
  try
    UpdateObj(Registro);
    Result := true;
  except
    Result := False;
  end;
end;


function TControllerRestGroupHasObservation.getByKey: Boolean;
begin
  _getByKey(Registro);
end;

end.
