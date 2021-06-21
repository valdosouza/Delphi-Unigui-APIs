unit ControllerVehBrand;

interface
uses System.Classes, System.SysUtils,BaseController,
      tblBrand, tblInstitutionHasPaymentTypes, FireDAC.Comp.Client,
      FireDAC.Stan.Param, tblVehBrand, ControllerVehModel ;

Type
  TControllerVehBrand = Class(TBaseController)
    procedure clear;
  private

  public
    Registro  : TVehBrand;
    Modelo    : TControllerVehModel;
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    function save:boolean;
    function getbyKey:boolean;
    function insert:boolean;
    Function delete:boolean;
  End;

implementation

{ TControllerBrand }

uses Main;

{ TControllerVehKind }

procedure TControllerVehBrand.clear;
begin
  ClearObj(Registro);
end;

constructor TControllerVehBrand.Create(AOwner: TComponent);
begin
  inherited;
  Registro  := TVehBrand.Create;
  Modelo    := TControllerVehModel.Create(self);
end;

function TControllerVehBrand.delete: boolean;
begin
  Try
    deleteObj(Registro);
    Result := True;
  Except
    Result := False;
  End;

end;

destructor TControllerVehBrand.Destroy;
begin
  FreeAndNil(Registro);
  inherited;
end;


function TControllerVehBrand.getbyKey: boolean;
begin
  _getByKey(Registro);
end;

function TControllerVehBrand.insert: boolean;
begin
  try
    saveObj(Registro);
    Result := true;
  except
    Result := False;
  end;
end;

function TControllerVehBrand.save: boolean;
begin
  try
    if Registro.Codigo = 0 then
      Registro.Codigo := getNextByField(Registro,'id',0);
    saveObj(Registro);
    Result := true;
  except
    Result := False;
  end;
end;

end.
