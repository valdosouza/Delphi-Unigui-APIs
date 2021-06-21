unit ControllerMedMaterial;

interface
uses System.Classes, System.SysUtils,BaseController,
      tblMedMaterial, FireDAC.Comp.Client,FireDAC.Stan.Param;

Type
  TControllerMedMaterial = Class(TBaseController)
    procedure clear;
  private

  public
    Registro : TMedMaterial;

    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    function save:boolean;
    function insert:boolean;
    Function delete:boolean;
    function getByKey:Boolean;
  End;

implementation

{ ControllerMedMaterial }

procedure TControllerMedMaterial.clear;
begin
  clearObj(Registro);
end;

constructor TControllerMedMaterial.Create(AOwner: TComponent);
begin
  inherited;
  Registro := TMedMaterial.Create;
end;

function TControllerMedMaterial.delete: boolean;
begin
  inherited;
end;


destructor TControllerMedMaterial.Destroy;
begin
  FreeAndNil(Registro);
  inherited;
end;


function TControllerMedMaterial.insert: boolean;
begin
  try
    SaveObj(Registro);
    Result := true;
  except
    Result := False;
  end;
end;

function TControllerMedMaterial.save: boolean;
begin
  try
    if Registro.Codigo = 0 then
      Registro.Codigo := getNextByField(Registro,'id',Registro.Estabelecimento);
    SaveObj(Registro);
    Result := true;
  except
    Result := False;
  end;
end;


function TControllerMedMaterial.getByKey: Boolean;
begin
  _getByKey(Registro);
end;

end.
