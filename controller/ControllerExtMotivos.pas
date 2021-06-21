unit ControllerExtMotivos;

interface
uses System.Classes, System.SysUtils,BaseController,
      tblExtMotivos, FireDAC.Comp.Client,Md5, FireDAC.Stan.Param,
      ControllerEntity;

Type
  TControllerExtMotivos = Class(TBaseController)
    procedure clear;
  private
  public
    Registro : TExtMotivos;
    Entity : TControllerEntity;
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    function save:boolean;
    function insert:boolean;
    Function delete:boolean;
    function getByKey:Boolean;
    function getAllByKey:boolean;
   End;

implementation

{ ControllerExtMotivos }

procedure TControllerExtMotivos.clear;
begin
  ClearObj(Registro);
end;

constructor TControllerExtMotivos.Create(AOwner: TComponent);
begin
  inherited;
  Registro := TExtMotivos.Create;
  Entity := TControllerEntity.Create(Self);

end;

function TControllerExtMotivos.delete: boolean;
begin
  FreeAndNil(Entity);
  FreeAndNil(Registro);
  inherited;
end;

destructor TControllerExtMotivos.Destroy;
begin
  FreeAndNil(Entity);
  FreeAndNil(Registro);
  inherited;
end;


function TControllerExtMotivos.insert: boolean;
begin
  try
    saveObj(Registro);
    Result := true;
  except
    Result := False;
  end;
end;

function TControllerExtMotivos.save: boolean;
begin
   if Registro.Codigo = 0 then
    Registro.Codigo := getNextByField(Registro,'id',0);
  try
    saveObj(Registro);
    Result := true;
  except
    Result := False;
end;


end;

function TControllerExtMotivos.getAllByKey: boolean;
begin
   getByKey;
  Entity.Registro.Codigo := Registro.Codigo;
  Entity.getAllByKey;
End;

function TControllerExtMotivos.getByKey: Boolean;
begin
  _getByKey(Registro);
 end;

end.
