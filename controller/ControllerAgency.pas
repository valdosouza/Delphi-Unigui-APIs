unit ControllerAgency;

interface

uses
  System.Classes, System.SysUtils,BaseController,
  tblAgency, FireDAC.Comp.Client,Md5, FireDAC.Stan.Param,
  ControllerEntityFiscal, ControllerCompany, ControllerPerson, ControllerSalesMan,
  ObjAgency, tblPerson, tblCompany, tblAddress, tblPhone, tblMailing,
  tblSocialMedia;

Type
  TControllerAgency = Class(TBaseController)
    procedure clear;
  private
    Agencia:String;
  public
    Registro : TAgency;
    Fiscal : TControllerEntityFiscal;
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    function save:boolean;
    function insert:boolean;
    Function delete:boolean;
    function getByKey:Boolean;
    function getAllByKey:boolean;
    procedure fillDataObjeto(Dobj:TObjAgency);
    function saveDataObjeto(DObj : TObjAgency):Boolean;
  End;

implementation

{ ControllerAgency }

procedure TControllerAgency.clear;
begin
  clearObj(Registro);
end;

constructor TControllerAgency.Create(AOwner: TComponent);
begin
  inherited;
  Registro := TAgency.Create;
  Fiscal := TControllerEntityFiscal.Create(Self);
end;

function TControllerAgency.delete: boolean;
begin

  inherited;
end;

destructor TControllerAgency.Destroy;
begin
  Fiscal.Destroy;
  Registro.DisposeOf;
  inherited;
end;


procedure TControllerAgency.fillDataObjeto(Dobj: TObjAgency);
begin
 
end;

function TControllerAgency.insert: boolean;
begin
  try
    SaveObj(Registro);
    Result := true;
  except
    Result := False;
  end;
end;

function TControllerAgency.save: boolean;
begin
  try
    SaveObj(Registro);
    Result := true;
  except
    Result := False;
  end;


end;

function TControllerAgency.saveDataObjeto(DObj: TObjAgency): Boolean;
begin
  //  Fiscal.saveDataObjeto( DObj.Entidade);
  //Salvar Cliente
  Registro := DObj.Agencia;
  Registro.codigo := Fiscal.Registro.Codigo;
  save;

end;


function TControllerAgency.getAllByKey: boolean;
begin
  getByKey;
  Fiscal.Registro.Codigo := Registro.Codigo;
  Fiscal.getAllByKey;
End;

function TControllerAgency.getByKey: Boolean;
begin
  _getByKey(Registro);
  Fiscal.Registro.Codigo := Self.Registro.Codigo;
  Fiscal.getByKey;
end;



end.

