unit ControllerTaxPIS;

interface
uses System.Classes, System.SysUtils,BaseController,
      tblTaxPIS, tblEntity, FireDAC.Comp.Client,Md5, FireDAC.Stan.Param;

Type
  TControllerTaxPIS = Class(TBaseController)
    procedure clear;
  private

  public
    Registro : TTaxPIS;
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    function save:boolean;
    function getByKey:Boolean;
    function delete: boolean;
  End;

implementation

{ ControllerTaxPIS}

procedure TControllerTaxPIS.clear;
begin
  ClearObj(Registro);
end;

constructor TControllerTaxPIS.Create(AOwner: TComponent);
begin
  inherited;
  Registro := TTaxPIS.Create;
end;

function TControllerTaxPIS.delete: boolean;
begin
  Try
    deleteObj(Registro);
    Result := True;
  Except
    Result := False;
  End;
end;

destructor TControllerTaxPIS.Destroy;
begin
     FreeAndNil(Registro);
     inherited;
end;

function TControllerTaxPIS.save: boolean;
begin
  try
    saveObj(Registro);
    Result := true;
  except
    Result := False;
  end;
end;

function TControllerTaxPIS.getByKey: Boolean;
begin
  _getByKey(Registro);
end;

end.
