unit ControllerCollaborator;

interface

uses
  System.Classes, System.SysUtils,BaseController,
  tblCollaborator, tblEntity, FireDAC.Comp.Client,Md5, FireDAC.Stan.Param,
  ControllerCompany, ControllerPerson, ControllerAddress, ControllerEntityFiscal,
  objCollaborator,ObjEntityFiscal  ;

Type
  TControllerCollaborator= Class(TBaseController)
    procedure clear;
  private
    TipoPessoa:String;

  public
    Registro : TCollaborator;
    Fiscal : TControllerEntityFiscal;
    Obj: TobjCollaborator;
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    function save:boolean;
    function insert:boolean;
    Function delete:boolean;
    function getByKey:Boolean;
    function getAllByKey:boolean;
    function saveDataObjeto(DObj: TObjEntityFiscal; Colab:TCollaborator): Boolean;
  End;

implementation

{ ControllerCollaborator }

procedure TControllerCollaborator.clear;
begin
  clearObj(Registro);
end;

constructor TControllerCollaborator.Create(AOwner: TComponent);
begin
  inherited;
  Registro := TCollaborator.Create;
  Fiscal := TControllerEntityFiscal.Create(nil);
  Obj := TobjCollaborator.create;
end;

function TControllerCollaborator.delete: boolean;
begin
  inherited;
end;

destructor TControllerCollaborator.Destroy;
begin
  Fiscal.Destroy;
  Registro.DisposeOf;
  Obj.Destroy;
  inherited;
end;

function TControllerCollaborator.save: boolean;
begin
  try
    SaveObj(Registro);
    Result := true;
  except
    Result := False;
  end;
end;

function TControllerCollaborator.saveDataObjeto(DObj: TObjEntityFiscal; Colab:TCollaborator): Boolean;
begin
  Fiscal.saveDataObjeto(DObj);
  _assign(Colab,self.Registro);
  self.Registro.codigo := DObj.Entidade.Entidade.Codigo;
  self.save;
end;


function TControllerCollaborator.getAllByKey: boolean;
begin
  getByKey;
  Fiscal.Registro.Codigo := Registro.Codigo;
  Fiscal.getAllByKey;
end;

function TControllerCollaborator.getByKey: Boolean;
begin
  _getByKey(Registro);
end;


function TControllerCollaborator.insert: boolean;
begin
  try
    SaveObj(Registro);
    Result := true;
  except
    Result := False;
  end;
end;

end.

