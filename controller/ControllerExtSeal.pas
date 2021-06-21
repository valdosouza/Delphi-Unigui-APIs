unit ControllerExtSeal;

interface
uses System.Classes, System.SysUtils,BaseController,
      tblExtSeal, FireDAC.Comp.Client,Md5, FireDAC.Stan.Param,
      ControllerEntity;

Type
  TControllerExtSeal = Class(TBaseController)
    procedure clear;
  private

  public
    Registro : TExtSeal;
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

{ ControllerExtKind }

procedure TControllerExtSeal.clear;
begin
  ClearObj(Registro);
end;

constructor TControllerExtSeal.Create(AOwner: TComponent);
begin
  inherited;
  Registro := TExtSeal.Create;
  Entity := TControllerEntity.Create(Self);

end;

function TControllerExtSeal.delete: boolean;
begin
  FreeAndNil(Entity);
  FreeAndNil(Registro);
  inherited;
end;

destructor TControllerExtSeal.Destroy;
begin
  FreeAndNil(Entity);
  FreeAndNil(Registro);
  inherited;
end;


function TControllerExtSeal.insert: boolean;
begin
  try
    saveObj(Registro);
    Result := true;
  except
    Result := False;
  end;
end;

function TControllerExtSeal.save: boolean;
begin
  if Registro.Codigo = 0 then
    Registro.Codigo := getNextByField(Registro,'id',Registro.Estabelecimento);
  try
    saveObj(Registro);
    Result := true;
  except
    Result := False;
  end;


end;


function TControllerExtSeal.getAllByKey: boolean;
begin
   getByKey;
  Entity.Registro.Codigo := Registro.Codigo;
  Entity.getAllByKey;
End;

function TControllerExtSeal.getByKey: Boolean;
begin
  _getByKey(Registro);
end;

end.
