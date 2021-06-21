unit ControllerConfigNfe65;

interface
uses System.Classes, System.SysUtils,BaseController,
      tblConfigNfe65, ControllerInstitution, tblEntity, FireDAC.Comp.Client,Md5,
      FireDAC.Stan.Param,ControllerConfigNfe;

Type
  TControllerConfigNfe65 = Class(TBaseController)
    procedure clear;
  private

  public
    Registro : TConfigNfe65;
    ConfigNfe : TControllerConfigNfe;
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    function save:boolean;
    function getByKey:Boolean;
    function delete: boolean;

  End;

implementation

{ ConfigNfe65}

procedure TControllerConfigNfe65.clear;
begin
  ClearObj(Registro);
end;

constructor TControllerConfigNfe65.Create(AOwner: TComponent);
begin
  inherited;
  Registro := TConfigNfe65.Create;
  ConfigNfe := TControllerConfigNfe.create(self);
end;


function TControllerConfigNfe65.delete: boolean;
begin
   Try
    deleteObj(Registro);
    Result := True;
  Except
    Result := False;
  End;

end;

destructor TControllerConfigNfe65.Destroy;
begin
 FreeAndNil(ConfigNfe);
 FreeAndNil(Registro);
 inherited;
end;

function TControllerConfigNfe65.save: boolean;
begin
  try
    saveObj(Registro);
    Result := true;
  except
    Result := False;
  end;
end;


function TControllerConfigNfe65.getByKey: Boolean;
begin
  _getByKey(Registro);
  ConfigNfe.Registro.Estabelecimento := Registro.Estabelecimento;
  ConfigNfe.getByKey;
end;

end.
