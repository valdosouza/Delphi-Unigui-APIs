unit ControllerProgress;

interface
 uses
  System.Classes, System.SysUtils, System.Variants, FireDAC.Comp.Client,
  FireDAC.Stan.Param,
  BaseController, tblProgress, controllertask;
  Type
  TControllerProgress = Class(TBaseController)
  private

  public

     Registro : TProgress;
     Task     : Tcontrollertask;

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

{ TControllerProgress }

procedure TControllerProgress.clear;
begin
  clearObj(Registro);
end;

constructor TControllerProgress.Create(AOwner: TComponent);
begin
  inherited;
     Registro := TProgress.Create;
     Task     := Tcontrollertask.Create(self);
end;

function TControllerProgress.delete: boolean;
begin
   Try
    deleteObj(Registro);
    Result := True;
  Except
    Result := False;
  End;
end;

destructor TControllerProgress.Destroy;
begin
  Registro.DisposeOf;
  task.DisposeOf;
  inherited;
end;

function TControllerProgress.getByKey: Boolean;
begin
  _getByKey(Registro);
end;

function TControllerProgress.insert: boolean;
begin
  try
    insertObj(Registro);
    Result := true;
  except
    Result := False;
  end;
end;

function TControllerProgress.save: boolean;
begin
  try
    SaveObj(Registro);
    Result := true;
  except
    Result := False;
  end;
end;

function TControllerProgress.update: boolean;
begin
   try
    updateObj(Registro);
    Result := true;
  except
    Result := False;
  end;
end;

end.
