unit ControllerExtKind;

interface
uses System.Classes, System.SysUtils,BaseController,
      tblExtKind, FireDAC.Comp.Client,Md5, FireDAC.Stan.Param,
      ControllerEntity;

Type
  TControllerExtKind = Class(TBaseController)
    procedure clear;
  private

  public
    Registro : TExtKind;
    Entity : TControllerEntity;
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    function save:boolean;
    function insert:boolean;
    Function delete:boolean;
    function getByKey:Boolean;
    function getAllByKey:boolean;
    function getCRT: String;
    function getPessoa: String;
  End;

implementation

{ ControllerExtKind }

procedure TControllerExtKind.clear;
begin
  ClearObj(Registro);
end;

constructor TControllerExtKind.Create(AOwner: TComponent);
begin
  inherited;
  Registro := TExtKind.Create;
  Entity := TControllerEntity.Create(Self);

end;

function TControllerExtKind.delete: boolean;
begin
  FreeAndNil(Entity);
  FreeAndNil(Registro);
  inherited;
end;

destructor TControllerExtKind.Destroy;
begin
  FreeAndNil(Entity);
  FreeAndNil(Registro);
  inherited;
end;


function TControllerExtKind.insert: boolean;
begin
  try
    saveObj(Registro);
    Result := true;
  except
    Result := False;
  end;
end;

function TControllerExtKind.save: boolean;
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


function TControllerExtKind.getAllByKey: boolean;
begin
   getByKey;
  Entity.Registro.Codigo := Registro.Codigo;
  Entity.getAllByKey;
End;

function TControllerExtKind.getByKey: Boolean;
begin
  _getByKey(Registro);
end;

function TControllerExtKind.getCRT: String;
begin
 //
end;

function TControllerExtKind.getPessoa: String;
begin
 //
end;

end.
