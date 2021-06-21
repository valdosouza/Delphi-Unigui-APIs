unit ControllerTaxCofins;

interface
uses System.Classes, System.SysUtils,BaseController,
      tblTaxCofins, tblEntity, FireDAC.Comp.Client,Md5, FireDAC.Stan.Param;

Type
  TControllerTaxCofins = Class(TBaseController)
    procedure clear;
  private

  public
    Registro : TTaxCofins;
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    function save:boolean;
    function getByKey:Boolean;
    function delete: boolean;
  End;

implementation

{ ControllerTaxCofins}

procedure TControllerTaxCofins.clear;
begin
  ClearObj(Registro);
end;

constructor TControllerTaxCofins.Create(AOwner: TComponent);
begin
  inherited;
  Registro := TTaxCofins.Create;
end;

function TControllerTaxCofins.delete: boolean;
begin
  Try
    deleteObj(Registro);
    Result := True;
  Except
    Result := False;
  End;
end;

destructor TControllerTaxCofins.Destroy;
begin
     FreeAndNil(Registro);
     inherited;
end;

function TControllerTaxCofins.save: boolean;
begin
  try
    saveObj(Registro);
    Result := true;
  except
    Result := False;
  end;
end;

function TControllerTaxCofins.getByKey: Boolean;
begin
  _getByKey(Registro);
end;

end.
