unit ControllerPriority;

interface
 uses
  System.Classes, System.SysUtils, System.Variants, FireDAC.Comp.Client,
  FireDAC.Stan.Param,
  BaseController, tblPriority;
Type
  TControllerPriority = Class(TBaseController)
  private

  public

    Registro : TPriority;

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

{ TControllerPriority }

procedure TControllerPriority.clear;
begin
  clearObj(Registro);
end;

constructor TControllerPriority.Create(AOwner: TComponent);
begin
  inherited;
  Registro          := TPriority.Create;
end;

function TControllerPriority.delete: boolean;
begin
  Try
    deleteObj(Registro);
    Result := True;
  Except
    Result := False;
  End;
end;

destructor TControllerPriority.Destroy;
begin
  Registro.DisposeOf;
  inherited;
end;

function TControllerPriority.getByKey: Boolean;
begin
  _getByKey(Registro);
end;

function TControllerPriority.insert: boolean;
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

function TControllerPriority.save: boolean;
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

function TControllerPriority.update: boolean;
begin
   try
    updateObj(Registro);
    Result := true;
  except
    Result := False;
  end;
end;

end.
