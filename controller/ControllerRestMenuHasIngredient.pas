unit ControllerRestMenuHasIngredient;

interface
uses System.Classes, System.SysUtils,BaseController,ControllerRestMenu,
      Md5, FireDAC.Stan.Param,tblRestMenuHasIngredient, ObjRestMenuHasIngredient;

Type

  TControllerRestMenuHasIngredient = Class(TBaseController)
    procedure clear;
  private

  public
    Registro : TRestMenuHasIngredient;
    RestMenu : TControllerRestMenu;
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    function save:boolean;
    function insert:boolean;
    function update:boolean;
    function delete: boolean;
    function getByKey:Boolean;
    function SaveObject(DObj: TObjRestMenuHasIngredient):Boolean;
  End;

implementation

procedure TControllerRestMenuHasIngredient.clear;
begin
  ClearObj(Registro);
end;

constructor TControllerRestMenuHasIngredient.Create(AOwner: TComponent);
begin
  inherited;
  Registro := TRestMenuHasIngredient.Create;
  RestMenu := TControllerRestMenu.Create(Self);
end;

function TControllerRestMenuHasIngredient.delete: boolean;
begin
  deleteObj(Registro);
end;

destructor TControllerRestMenuHasIngredient.Destroy;
begin
  RestMenu.disposeOf;
  Registro.disposeOf;
  inherited;
end;


function TControllerRestMenuHasIngredient.insert: boolean;
begin
  try
    insertObj(Registro);
    Result := true;
  except
    Result := False;
  end;
end;

function TControllerRestMenuHasIngredient.save: boolean;
begin
  try
    saveObj(Registro);
    Result := true;
  except
    Result := False;
  end;
end;

function TControllerRestMenuHasIngredient.SaveObject(
  DObj: TObjRestMenuHasIngredient): Boolean;
begin
  RestMenu.Registro.Estabelecimento := DObj.Ingredientes.Estabelecimento;
  RestMenu.Registro.Description     := DObj.Menu;
  RestMenu.Registro.Grupo           := DObj.Grupo;
  RestMenu.getByDescription;

  ClonarObj(DObj.Ingredientes,Registro);
  Registro.Cardapio := RestMenu.Registro.Codigo;
  save;
end;

function TControllerRestMenuHasIngredient.update: boolean;
begin
  try
    UpdateObj(Registro);
    Result := true;
  except
    Result := False;
  end;
end;


function TControllerRestMenuHasIngredient.getByKey: Boolean;
Begin
  _getByKey(Registro);
End;


end.
