unit ControllerVehKind;

interface
uses System.Classes, System.SysUtils,BaseController,
      tblBrand, tblInstitutionHasPaymentTypes, FireDAC.Comp.Client,
      FireDAC.Stan.Param, tblVehKind ;

Type
  TControllerVehKind = Class(TBaseController)
    procedure clear;
  private

  public
    Registro : TVehKind;
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

procedure TControllerVehKind.clear;
begin
  ClearObj(Registro);
end;

constructor TControllerVehKind.Create(AOwner: TComponent);
begin
  inherited;
  Registro := TVehKind.Create;
end;

function TControllerVehKind.delete: boolean;
begin
  Try
    deleteObj(Registro);
    Result := True;
  Except
    Result := False;
  End;

end;

destructor TControllerVehKind.Destroy;
begin
  FreeAndNil(Registro);
  inherited;
end;


function TControllerVehKind.getbyKey: boolean;
begin
  _getByKey(Registro);
end;

function TControllerVehKind.insert: boolean;
begin
  try
    saveObj(Registro);
    Result := true;
  except
    Result := False;
  end;
end;

function TControllerVehKind.save: boolean;
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

