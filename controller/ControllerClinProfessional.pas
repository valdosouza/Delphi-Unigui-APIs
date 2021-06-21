unit ControllerClinProfessional;

interface
uses System.Classes, System.SysUtils,BaseController,
      tblClinProfessional, FireDAC.Comp.Client,Md5, FireDAC.Stan.Param,
      ControllerEntityFiscal, ControllerClinProfessionalHasPatient;

Type
  TControllerClinProfessional = Class(TBaseController)

  private

  public
    Registro : TClinProfessional;
    Fiscal : TControllerEntityFiscal;
    HasPatient : TControllerClinProfessionalHasPatient;
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure clear;
    function save:boolean;
    function insert:boolean;
    Function delete:boolean;
    function getByKey:Boolean;
    function getAllByKey:boolean;

  End;

implementation

{ ControllerProvider }


procedure TControllerClinProfessional.clear;
begin
  clearObj(Registro);
end;

constructor TControllerClinProfessional.Create(AOwner: TComponent);
begin
  inherited;
  Registro := TClinProfessional.Create;
  Fiscal := TControllerEntityFiscal.Create(nil);
  HasPatient := TControllerClinProfessionalHasPatient.Create(nil);
end;

function TControllerClinProfessional.delete: boolean;
begin
  Try
    deleteObj(Registro);
    Result := True;
  Except
    Result := False;
  End;
end;

destructor TControllerClinProfessional.Destroy;
begin
  HasPatient.DisposeOf;
  Fiscal.Destroy;
  Registro.DisposeOf;
  inherited;
end;

function TControllerClinProfessional.insert: boolean;
begin
  try
    insertObj(Registro);
    Result := true;
  except
    Result := False;
  end;
end;

function TControllerClinProfessional.save: boolean;
begin
  try
    SaveObj(Registro);
    Result := true;
  except
    Result := False;
  end;


end;


function TControllerClinProfessional.getAllByKey: boolean;
begin
  getByKey;
  Fiscal.Registro.Codigo := Registro.Codigo;
  Fiscal.getAllByKey;
end;

function TControllerClinProfessional.getByKey: Boolean;
begin
  _getByKey(Registro);
  Fiscal.Registro.Codigo := Self.Registro.Codigo;
  Fiscal.getByKey;
end;

end.
