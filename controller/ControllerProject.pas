unit ControllerProject;

interface
 uses
  System.Classes, System.SysUtils, System.Variants, FireDAC.Comp.Client,
  FireDAC.Stan.Param,
  BaseController, tblProject;

Type
  TControllerProject = Class(TBaseController)

  private

  public

  Registro : TProject;

    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    function save:boolean;
    function update:boolean;
    function getByKey:Boolean;Virtual;
    function delete: boolean;
    function insert:boolean;
    procedure clear;

  End;

implementation

{ TControllerProject }

procedure TControllerProject.clear;
begin
  clearObj(Registro);
end;

constructor TControllerProject.Create(AOwner: TComponent);
begin
  inherited;
  Registro          := TProject.Create;
end;

function TControllerProject.delete: boolean;
begin
   Try
    deleteObj(Registro);
    Result := True;
  Except
    Result := False;
  End;
end;

destructor TControllerProject.Destroy;
begin
  Registro.DisposeOf;
  inherited;
end;


function TControllerProject.getByKey: Boolean;
begin
  _getByKey(Registro);
end;

function TControllerProject.insert: boolean;
begin
  try
    if Registro.Codigo = 0 then
      Registro.Codigo := getNextByField(Registro,'id',0);
    insertObj(Registro);
    Result := true;
  except
    Result := False;
  end;
end;

function TControllerProject.save: boolean;
begin
  if Registro.Codigo = 0 then
    Registro.Codigo := getNextByField(Registro,'id',0);
  try
    SaveObj(Registro);
    Result := true;
  except
    Result := False;
  end;
end;

function TControllerProject.update: boolean;
begin
   try
    updateObj(Registro);
    Result := true;
  except
    Result := False;
  end;
end;

end.
