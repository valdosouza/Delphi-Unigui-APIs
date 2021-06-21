unit ControllerKind;

interface
uses
  System.Classes, System.SysUtils, System.Variants, FireDAC.Comp.Client,
  FireDAC.Stan.Param,
  BaseController, tblKind;

Type
  TTaskKind = Class(TBaseController)

  private

  public

  Registro : TKind;

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

{ TControllerKind }

{ TTaskKind }

procedure TTaskKind.clear;
begin
  clearObj(Registro);
end;

constructor TTaskKind.Create(AOwner: TComponent);
begin
  inherited;
  Registro          := TKind.Create;
end;

function TTaskKind.delete: boolean;
begin
  Try
    deleteObj(Registro);
    Result := True;
  Except
    Result := False;
  End;
end;

destructor TTaskKind.Destroy;
begin
  Registro.DisposeOf;
  inherited;
end;


function TTaskKind.getByKey: Boolean;
begin
  _getByKey(Registro);
end;

function TTaskKind.insert: boolean;
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

function TTaskKind.save: boolean;
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

function TTaskKind.update: boolean;
begin
   try
    updateObj(Registro);
    Result := true;
  except
    Result := False;
  end;
end;

end.
