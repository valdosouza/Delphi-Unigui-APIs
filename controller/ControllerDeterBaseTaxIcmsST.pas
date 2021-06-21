unit ControllerDeterBaseTaxIcmsST;

interface
uses System.Classes, System.SysUtils,BaseController,
      tblDeterBaseTaxIcmsST, tblEntity, FireDAC.Comp.Client,Md5, FireDAC.Stan.Param;

Type
  TControllerDeterBaseTaxIcmsST= Class(TBaseController)
    procedure clear;
  private

  public
    Registro : TDeterBaseTaxIcmsST;
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    function save:boolean;
    function getByKey:Boolean;
    function delete: boolean;
  End;

implementation

{ ControllerDeterBaseTaxIcmsST}

procedure TControllerDeterBaseTaxIcmsST.clear;
begin
  ClearObj(Registro);
end;

constructor TControllerDeterBaseTaxIcmsST.Create(AOwner: TComponent);
begin
  inherited;
  Registro := TDeterBaseTaxIcmsST.Create;
  end;

function TControllerDeterBaseTaxIcmsST.delete: boolean;
begin
  Try
    deleteObj(Registro);
    Result := True;
  Except
    Result := False;
  End;
end;

destructor TControllerDeterBaseTaxIcmsST.Destroy;
begin
  FreeAndNil(Registro);
  inherited;
end;

function TControllerDeterBaseTaxIcmsST.save: boolean;
begin
  try
    saveObj(Registro);
    Result := true;
  except
    Result := False;
  end;
end;


function TControllerDeterBaseTaxIcmsST.getByKey: Boolean;
begin
  _getByKey(Registro);
end;

end.


