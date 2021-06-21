unit ControllerClinProfessionalHasPatient;

interface

uses System.Classes, System.SysUtils,BaseController,
      tblClinProfessionalHasPatient, FireDAC.Comp.Client,Md5, FireDAC.Stan.Param;

Type
  TControllerClinProfessionalHasPatient = Class(TBaseController)
    procedure clear;
  private

  public
    Registro : TClinProfessionalHasPatient;
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    function save:boolean;
    function insert:boolean;
    Function delete:boolean;
    function getByKey:Boolean;
  End;

implementation

{ ControllerProvider }

procedure TControllerClinProfessionalHasPatient.clear;
begin
  clearObj(Registro);
end;

constructor TControllerClinProfessionalHasPatient.Create(AOwner: TComponent);
begin
  inherited;
  Registro := TClinProfessionalHasPatient.Create;
end;

function TControllerClinProfessionalHasPatient.delete: boolean;
begin
  Try
    deleteObj(Registro);
    Result := True;
  Except
    Result := False;
  End;
end;

destructor TControllerClinProfessionalHasPatient.Destroy;
begin
  Registro.DisposeOf;
  inherited;
end;

function TControllerClinProfessionalHasPatient.insert: boolean;
begin
  try
    SaveObj(Registro);
    Result := true;
  except
    Result := False;
  end;
end;

function TControllerClinProfessionalHasPatient.save: boolean;
begin
  try
    SaveObj(Registro);
    Result := true;
  except
    Result := False;
  end;
end;

function TControllerClinProfessionalHasPatient.getByKey: Boolean;
begin
  _getByKey(Registro);
end;

end.
