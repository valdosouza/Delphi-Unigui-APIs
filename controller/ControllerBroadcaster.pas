unit ControllerBroadcaster;

interface

uses
  System.Classes, System.SysUtils,BaseController,
  tblBroadcaster, FireDAC.Comp.Client,Md5, FireDAC.Stan.Param,
  ControllerEntityFiscal,ControllerCompany, ControllerPerson, ControllerSalesMan,
  ObjBroadCaster,ControllerBroacasterHasCirculation,ControllerMedPriceListJR,
  ControllerMedPriceListOL;

Type
  TControllerBroadcaster = Class(TBaseController)
    procedure clear;
  private
    Veiculo : String;

  public
    Registro : TBroadcaster;
    Fiscal : TControllerEntityFiscal;
    Cobertura: TControllerBroacasterHasCirculation;
    TabelaJR  : TControllerMedPriceListJR;
    TabelaOL  : TControllerMedPriceListOL;
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    function save:boolean;
    function insert:boolean;
    Function delete:boolean;
    function getByKey:Boolean;
    function getAllByKey:boolean;
    function saveDataObjeto(DObj : TObjBroadCaster):Boolean;
  End;

implementation

{ ControllerBroadcaster }


procedure TControllerBroadcaster.clear;
begin
  clearObj(Registro);
end;

constructor TControllerBroadcaster.Create(AOwner: TComponent);
begin
  inherited;
  Registro := TBroadcaster.Create;
  Fiscal := TControllerEntityFiscal.Create(Self);
  Cobertura := TControllerBroacasterHasCirculation.Create(Self);
  TabelaJR  := TControllerMedPriceListJR.Create(Self);
  TabelaOL  := TControllerMedPriceListOL.Create(Self);
end;

function TControllerBroadcaster.delete: boolean;
begin
  inherited;
end;

destructor TControllerBroadcaster.Destroy;
begin
  TabelaOL.disposeOf;
  TabelaJR.disposeOf;
  Cobertura.disposeOf;
  Fiscal.Destroy;
  Registro.DisposeOf;
  inherited;
end;


function TControllerBroadcaster.insert: boolean;
begin
  try
    SaveObj(Registro);
    Result := true;
  except
    Result := False;
  end;
end;

function TControllerBroadcaster.save: boolean;
begin
  try
    SaveObj(Registro);
    Result := true;
  except
    Result := False;
  end;


end;

function TControllerBroadcaster.saveDataObjeto(DObj: TObjBroadCaster): Boolean;
begin
  Fiscal.saveDataObjeto(DObj.Fiscal);
  DObj.VeiculoCom.Codigo := DObj.Fiscal.Entidade.Entidade.Codigo;
  //Salvar Cliente
  _assign(DObj.VeiculoCom,Registro);
  save;
end;


function TControllerBroadcaster.getAllByKey: boolean;
begin
  getByKey;
  Fiscal.Registro.Codigo := Registro.Codigo;
  Fiscal.getAllByKey;

end;

function TControllerBroadcaster.getByKey: Boolean;
begin
  _getByKey(Registro);
  Fiscal.Registro.Codigo := Self.Registro.Codigo;
  Fiscal.getByKey;
end;

end.
