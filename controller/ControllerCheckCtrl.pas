unit ControllerCheckCtrl;

interface
uses System.Classes, System.SysUtils,BaseController,
      tblCheckCtrl, FireDAC.Comp.Client,Md5, FireDAC.Stan.Param,
      ControllerEntity;

Type
  TControllerCheckCtrl = Class(TBaseController)
    procedure clear;
  private

  public
    Registro : TCheckCtrl;
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

{ ControllerCheckCtrl}

procedure TControllerCheckCtrl.clear;
begin
  ClearObj(Registro);
end;

constructor TControllerCheckCtrl.Create(AOwner: TComponent);
begin
  inherited;
  Registro := TCheckCtrl.Create;
  Entity := TControllerEntity.Create(Self);

end;

function TControllerCheckCtrl.delete: boolean;
begin
  FreeAndNil(Entity);
  FreeAndNil(Registro);
  inherited;
end;

destructor TControllerCheckCtrl.Destroy;
begin
  FreeAndNil(Entity);
  FreeAndNil(Registro);
  inherited;
end;

function TControllerCheckCtrl.insert: boolean;
begin
  try
    saveObj(Registro);
    Result := true;
  except
    Result := False;
  end;
end;

function TControllerCheckCtrl.save: boolean;
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


function TControllerCheckCtrl.getAllByKey: boolean;
begin
   getByKey;
  Entity.Registro.Codigo := Registro.Codigo;
  Entity.getAllByKey;
End;

function TControllerCheckCtrl.getByKey: Boolean;
begin
  _getByKey(Registro);
end;

function TControllerCheckCtrl.getCRT: String;
begin
 //
end;

function TControllerCheckCtrl.getPessoa: String;
begin
 //
end;

end.

