unit ControllerInstitutionHasLineBusiness;

interface
uses System.Classes, System.SysUtils,BaseController,
      tblInstitutionHasLineBusiness, FireDAC.Comp.Client,Md5, FireDAC.Stan.Param;

Type
  TControllerInstitutionHasLineBusiness = Class(TBaseController)
    procedure clear;
  private

  public
    Registro : TInstitutionHasLineBusiness;
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    function save:boolean;
    procedure getbyKey;
    function insert:boolean;
    Function delete:boolean;
  End;

implementation

{ ControllerInstitutionHasLineBusiness }

procedure TControllerInstitutionHasLineBusiness.clear;
begin
  ClearObj(Registro);
end;

constructor TControllerInstitutionHasLineBusiness.Create(AOwner: TComponent);
begin
  inherited;
  Registro := TInstitutionHasLineBusiness.Create;
end;

function TControllerInstitutionHasLineBusiness.delete: boolean;
begin
  Try
    deleteObj(Registro);
    Result := True;
  Except
    Result := False;
  End;
end;

destructor TControllerInstitutionHasLineBusiness.Destroy;
begin
  FreeAndNil(Registro);
  inherited;
end;


function TControllerInstitutionHasLineBusiness.insert: boolean;
begin
  try
    saveObj(Registro);
    Result := true;
  except
    Result := False;
  end;
end;

function TControllerInstitutionHasLineBusiness.save: boolean;
begin
  try
    saveObj(Registro);
    Result := true;
  except
    Result := False;
  end;


end;

procedure TControllerInstitutionHasLineBusiness.getbyKey;
begin
  _getByKey(Registro);
end;

end.
