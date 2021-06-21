unit ControllerDeterBaseTaxIcms;

interface
uses System.Classes, System.SysUtils,BaseController,
      tblDeterBaseTaxIcms, tblEntity, FireDAC.Comp.Client,Md5, FireDAC.Stan.Param;

Type
  TControllerDeterBaseTaxIcms= Class(TBaseController)
    procedure clear;
  private

  public
    Registro : TDeterBaseTaxIcms;
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    function save:boolean;
    function getByKey:Boolean;
    function delete: boolean;
  End;

implementation

{ ControllerDeterBaseTaxIcms }

procedure TControllerDeterBaseTaxIcms.clear;
begin
  ClearObj(Registro);
end;

constructor TControllerDeterBaseTaxIcms.Create(AOwner: TComponent);
begin
  inherited;
  Registro := TDeterBaseTaxIcms.Create;
  end;

function TControllerDeterBaseTaxIcms.delete: boolean;
begin
  Try
    deleteObj(Registro);
    Result := True;
  Except
    Result := False;
  End;
end;

destructor TControllerDeterBaseTaxIcms.Destroy;
begin
  FreeAndNil(Registro);
  inherited;
end;

function TControllerDeterBaseTaxIcms.save: boolean;
begin
  try
    saveObj(Registro);
    Result := true;
  except
    Result := False;
  end;
end;

function TControllerDeterBaseTaxIcms.getByKey: Boolean;
begin
  _getByKey(Registro);
end;

end.

