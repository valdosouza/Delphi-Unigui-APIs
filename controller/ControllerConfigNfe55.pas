unit ControllerConfigNfe55;

interface
uses System.Classes, System.SysUtils,
      tblConfigNfe55,
      BaseController,ControllerConfigNfe,
      FireDAC.Comp.Client,Md5, FireDAC.Stan.Param;

Type
  TControllerConfigNfe55 = Class(TBaseController)
    procedure clear;
  private

  public
    Registro : TConfigNfe55;
    ConfigNfe : TControllerConfigNfe;
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    function save:boolean;
    function getByKey:Boolean;
    function delete: boolean;

  End;

implementation

{ ConfigNfe55}

procedure TControllerConfigNfe55.clear;
begin
  ClearObj(Registro);
end;

constructor TControllerConfigNfe55.Create(AOwner: TComponent);
begin
  inherited;
  Registro := TConfigNfe55.Create;
  ConfigNfe := TControllerConfigNfe.create(self);
end;


function TControllerConfigNfe55.delete: boolean;
begin
   Try
    deleteObj(Registro);
    Result := True;
  Except
    Result := False;
  End;

end;

destructor TControllerConfigNfe55.Destroy;
begin
  FreeAndNil(ConfigNfe);
  FreeAndNil(Registro);
  inherited;
end;

function TControllerConfigNfe55.save: boolean;
begin
  try
    saveObj(Registro);
    Result := true;
  except
    Result := False;
  end;
end;


function TControllerConfigNfe55.getByKey: Boolean;
begin
  _getByKey(Registro);
  ConfigNfe.Registro.Estabelecimento := Registro.Estabelecimento;
  ConfigNfe.getByKey;
end;

end.
