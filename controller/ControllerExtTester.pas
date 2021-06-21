unit ControllerExtTester;

interface
uses System.Classes, System.SysUtils,BaseController,
      tblExtTester, FireDAC.Comp.Client,Md5, FireDAC.Stan.Param,
      ControllerEntity;

Type
  TControllerExtTester = Class(TBaseController)
    procedure clear;
  private

  public
    Registro : TExtTester;
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

{ ControllerExtTester}

procedure TControllerExtTester.clear;
begin
  ClearObj(Registro);
end;

constructor TControllerExtTester.Create(AOwner: TComponent);
begin
  inherited;
  Registro := TExtTester.Create;
  Entity := TControllerEntity.Create(Self);
end;

function TControllerExtTester.delete: boolean;
begin
  Try
    deleteObj(Registro);
    Result := True;
  Except
    Result := False;
  End;
end;

destructor TControllerExtTester.Destroy;
begin
  FreeAndNil(Registro);
  FReeAndNil(Entity);
  inherited;
end;


function TControllerExtTester.insert: boolean;
begin
  try
    SaveObj(Registro);
    Result := true;
  except
    Result := False;
  end;
end;

function TControllerExtTester.save: boolean;
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


function TControllerExtTester.getAllByKey: boolean;
begin
  getByKey;
  Entity.Registro.Codigo := Registro.Codigo;
  Entity.getAllByKey;

end;

function TControllerExtTester.getByKey: Boolean;
begin
  _getByKey(Registro);
  Entity.Registro.Codigo := Self.Registro.Codigo;
  Entity.getByKey;
end;

end.
