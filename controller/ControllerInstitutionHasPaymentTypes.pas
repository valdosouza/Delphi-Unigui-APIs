unit ControllerInstitutionHasPaymentTypes;

interface
uses System.Classes, System.SysUtils,BaseController,
      tblInstitutionHasPaymentTypes, FireDAC.Comp.Client,Md5, FireDAC.Stan.Param;

Type
  TControllerInstitutionHasPaymentTypes = Class(TBaseController)
    procedure clear;
  private

  public
    Registro : TInstitutionHasPaymentTypes;
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    function save:boolean;
    procedure getbyKey;
    function insert:boolean;
    Function delete:boolean;
  End;

implementation

{ ControllerCarrier }

procedure TControllerInstitutionHasPaymentTypes.clear;
begin
  ClearObj(Registro);
end;

constructor TControllerInstitutionHasPaymentTypes.Create(AOwner: TComponent);
begin
  inherited;
  Registro := TInstitutionHasPaymentTypes.Create;
end;

function TControllerInstitutionHasPaymentTypes.delete: boolean;
begin
  Try
    deleteObj(Registro);
    Result := True;
  Except
    Result := False;
  End;
end;

destructor TControllerInstitutionHasPaymentTypes.Destroy;
begin
  FreeAndNil(Registro);
  inherited;
end;


function TControllerInstitutionHasPaymentTypes.insert: boolean;
begin
  try
    saveObj(Registro);
    Result := true;
  except
    Result := False;
  end;
end;

function TControllerInstitutionHasPaymentTypes.save: boolean;
begin
  try
    saveObj(Registro);
    Result := true;
  except
    Result := False;
  end;


end;

procedure TControllerInstitutionHasPaymentTypes.getbyKey;
begin
  _getByKey(Registro);
end;


end.
