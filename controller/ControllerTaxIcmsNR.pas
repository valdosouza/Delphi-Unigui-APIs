unit ControllerTaxIcmsNR;

interface
uses System.Classes, System.SysUtils,BaseController,
      tblTaxIcmsNR, tblEntity, FireDAC.Comp.Client,Md5, FireDAC.Stan.Param;

Type
  TControllerTaxIcmsNR = Class(TBaseController)
    procedure clear;
  private

  public
    Registro : TTaxIcmsNR;
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    function save:boolean;
    function getByKey:Boolean;
    function delete: boolean;
  End;

implementation

{ ControllerTaxIcmsNR}

procedure TControllerTaxIcmsNR.clear;
begin
  ClearObj(Registro);
end;

constructor TControllerTaxIcmsNR.Create(AOwner: TComponent);
begin
  inherited;
  Registro := TTaxIcmsNR.Create;
end;

function TControllerTaxIcmsNR.delete: boolean;
begin
  Try
    deleteObj(Registro);
    Result := True;
  Except
    Result := False;
  End;

end;

destructor TControllerTaxIcmsNR.Destroy;
begin
     FreeAndNil(Registro);
     inherited;
end;

function TControllerTaxIcmsNR.save: boolean;
begin
  try
    saveObj(Registro);
    Result := true;
  except
    Result := False;
  end;
end;


function TControllerTaxIcmsNR.getByKey: Boolean;
begin
  _getByKey(Registro);
end;

end.
