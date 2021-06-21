unit ControllerClinPatient;

interface
uses System.Classes, System.SysUtils,BaseController,
      tblClinPatient, FireDAC.Comp.Client,Md5, FireDAC.Stan.Param,
      ControllerEntityFiscal, ControllerCompany, ControllerPerson,
      ObjProvider;

Type
  TControllerClinPatient = Class(TBaseController)
    procedure clear;
  private

  public
    Registro : TClinPatient;
    Fiscal : TControllerEntityFiscal;
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    function save:boolean;
    function insert:boolean;
    Function delete:boolean;
    function getByKey:Boolean;
    function getAllByKey:boolean;

  End;

implementation

{ ControllerProvider }

procedure TControllerClinPatient.clear;
begin
  clearObj(Registro);
end;

constructor TControllerClinPatient.Create(AOwner: TComponent);
begin
  inherited;
  Registro := TClinPatient.Create;
  Fiscal := TControllerEntityFiscal.Create(nil);
end;

function TControllerClinPatient.delete: boolean;
begin
  Try
    deleteObj(Registro);
    Result := True;
  Except
    Result := False;
  End;
end;

destructor TControllerClinPatient.Destroy;
begin
  Fiscal.Destroy;
  Registro.DisposeOf;
  inherited;
end;

function TControllerClinPatient.insert: boolean;
begin
  try
    SaveObj(Registro);
    Result := true;
  except
    Result := False;
  end;
end;

function TControllerClinPatient.save: boolean;
begin
  try
    SaveObj(Registro);
    Result := true;
  except
    Result := False;
  end;


end;


function TControllerClinPatient.getAllByKey: boolean;
begin
  getByKey;
  Fiscal.Registro.Codigo := Registro.Codigo;
  Fiscal.getAllByKey;
end;

function TControllerClinPatient.getByKey: Boolean;
begin
  _getByKey(Registro);
  Fiscal.Registro.Codigo := Self.Registro.Codigo;
  Fiscal.getByKey;
end;

end.
