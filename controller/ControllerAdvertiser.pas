unit ControllerAdvertiser;

interface
uses System.Classes, System.SysUtils,BaseController,
      tblAdvertiser, FireDAC.Comp.Client,Md5, FireDAC.Stan.Param,
      ControllerEntityFiscal, ControllerCompany, ControllerPerson, ControllerSalesMan,
  ObjAdvertiser;

Type
  TControllerAdvertiser = Class(TBaseController)
    procedure clear;
  private
    Anunciante: String;
  public
    Registro : TAdvertiser;
    Fiscal : TControllerEntityFiscal;
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    function save:boolean;
    function insert:boolean;
    Function delete:boolean;
    function getByKey:Boolean;
    function getAllByKey:boolean;
    function saveDataObjeto(DObj : TObjAdvertiser):Boolean;
  End;

implementation

{ ControllerAdvertiser }

procedure TControllerAdvertiser.clear;
begin
  clearObj(Registro);
end;

constructor TControllerAdvertiser.Create(AOwner: TComponent);
begin
  inherited;
  Registro := TAdvertiser.Create;
  Fiscal := TControllerEntityFiscal.Create(Self);
end;

function TControllerAdvertiser.delete: boolean;
begin
  inherited;
end;

destructor TControllerAdvertiser.Destroy;
begin
  Fiscal.Destroy;
  Registro.DisposeOf;
  inherited;
end;


function TControllerAdvertiser.insert: boolean;
begin
  try
    SaveObj(Registro);
    Result := true;
  except
    Result := False;
  end;
end;

function TControllerAdvertiser.save: boolean;
begin
  try
    SaveObj(Registro);
    Result := true;
  except
    Result := False;
  end;


end;

function TControllerAdvertiser.saveDataObjeto(DObj: TObjAdvertiser): Boolean;
begin
  Fiscal.saveDataObjeto(DObj.Fiscal);
  DObj.Anunciante.Codigo := DObj.Fiscal.Entidade.Entidade.Codigo;
  //Salvar Cliente
  _assign(DObj.Anunciante,Registro);
  save;

end;


function TControllerAdvertiser.getAllByKey: boolean;
begin
  getByKey;
  Fiscal.Registro.Codigo := Registro.Codigo;
  Fiscal.getAllByKey;
end;

function TControllerAdvertiser.getByKey: Boolean;
begin
  _getByKey(Registro);
  Fiscal.Registro.Codigo := Self.Registro.Codigo;
  Fiscal.getByKey;
end;


end.
