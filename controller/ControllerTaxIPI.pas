unit ControllerTaxIPI;

interface
uses System.Classes, System.SysUtils,BaseController,
      tblTaxIPI, tblEntity, FireDAC.Comp.Client,Md5, FireDAC.Stan.Param;

Type
  TControllerTaxIPI = Class(TBaseController)
    procedure clear;
  private

  public
    Registro : TTaxIPI;
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    function save:boolean;
    function getByKey:Boolean;
    function delete: boolean;
  End;

implementation

{ ControllerTaxIPI}

procedure TControllerTaxIPI.clear;
begin
  ClearObj(Registro);
end;

constructor TControllerTaxIPI.Create(AOwner: TComponent);
begin
  inherited;
  Registro := TTaxIPI.Create;
end;

function TControllerTaxIPI.delete: boolean;
begin
  Try
    deleteObj(Registro);
    Result := True;
  Except
    Result := False;
  End;
end;

destructor TControllerTaxIPI.Destroy;
begin
     FreeAndNil(Registro);
     inherited;
end;

function TControllerTaxIPI.save: boolean;
begin
  try
    saveObj(Registro);
    Result := true;
  except
    Result := False;
  end;
end;

function TControllerTaxIPI.getByKey: Boolean;
begin
  _getByKey(Registro);
end;

end.
