unit ControllerTask;

interface
 uses
  System.Classes, System.SysUtils, System.Variants, FireDAC.Comp.Client,
  FireDAC.Stan.Param,
  BaseController, tblTask;
  Type
  TControllerTask = Class(TBaseController)
  private

  public

    Registro  : TTask;
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

{ TControllerTask }

procedure TControllerTask.clear;
begin
  clearObj(Registro);
end;

constructor TControllerTask.Create(AOwner: TComponent);
begin
  inherited;
  Registro          := TTask.Create;
end;

function TControllerTask.delete: boolean;
begin
   Try
    deleteObj(Registro);
    Result := True;
  Except
    Result := False;
  End;
end;

destructor TControllerTask.Destroy;
begin
  Registro.DisposeOf;
  inherited;
end;


function TControllerTask.getByKey: Boolean;
begin
  _getByKey(Registro);
end;

function TControllerTask.insert: boolean;
begin
  try
    insertObj(Registro);
    Result := true;
  except
    Result := False;
  end;
end;

function TControllerTask.save: boolean;
begin
  try
    SaveObj(Registro);
    Result := true;
  except
    Result := False;
  end;
end;

function TControllerTask.update: boolean;
begin
   try
    updateObj(Registro);
    Result := true;
  except
    Result := False;
  end;
end;

end.
