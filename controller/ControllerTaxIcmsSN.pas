unit ControllerTaxIcmsSN;

interface
uses System.Classes, System.SysUtils,BaseController,
      tblTaxIcmsSN, tblEntity, FireDAC.Comp.Client,Md5, FireDAC.Stan.Param;

Type
  TControllerTaxIcmsSN = Class(TBaseController)
    procedure clear;
  private

  public
    Registro : TTaxIcmsSN;
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    function save:boolean;
    function getByKey:Boolean;
    function delete: boolean;

  End;

implementation

{ ControllerTaxIcmsSN}

procedure TControllerTaxIcmsSN.clear;
begin
  ClearObj(Registro);
end;

constructor TControllerTaxIcmsSN.Create(AOwner: TComponent);
begin
  inherited;
  Registro := TTaxIcmsSN.Create;
end;

function TControllerTaxIcmsSN.delete: boolean;
begin
  Try
    deleteObj(Registro);
    Result := True;
  Except
    Result := False;
  End;
end;

destructor TControllerTaxIcmsSN.Destroy;
begin
     FreeAndNil(Registro);
     inherited;
end;

function TControllerTaxIcmsSN.save: boolean;
begin
  try
    saveObj(Registro);
    Result := true;
  except
    Result := False;
  end;
end;

function TControllerTaxIcmsSN.getByKey: Boolean;
begin
  _getByKey(Registro);
end;

end.
