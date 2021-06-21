unit ControllerConfigNfe;

interface
uses System.Classes, System.SysUtils,BaseController,
      tblConfigNfe, ControllerInstitution, tblEntity, FireDAC.Comp.Client,Md5, FireDAC.Stan.Param;

Type
  TControllerConfigNfe = Class(TBaseController)
    procedure clear;
  private

  public
    Registro : TConfigNfe;
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    function save:boolean;
    function getByKey:Boolean;
    function delete: boolean;

  End;

implementation

{ ControllerConfigNfe}

procedure TControllerConfigNfe.clear;
begin
  ClearObj(Registro);
end;

constructor TControllerConfigNfe.Create(AOwner: TComponent);
begin
  inherited;
  Registro := TConfigNfe.Create;
end;


function TControllerConfigNfe.delete: boolean;
begin
   Try
    deleteObj(Registro);
    Result := True;
  Except
    Result := False;
  End;

end;

destructor TControllerConfigNfe.Destroy;
begin
     FreeAndNil(Registro);
     inherited;
end;

function TControllerConfigNfe.save: boolean;
begin
  try
    saveObj(Registro);
    Result := true;
  except
    Result := False;
  end;
end;

function TControllerConfigNfe.getByKey: Boolean;
begin
  _getByKey(Registro);
end;

end.
