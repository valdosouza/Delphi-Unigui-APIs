unit ControllerSituation;

interface
uses System.Classes, System.SysUtils,BaseController,
      tblSituation, ControllerInstitution, tblEntity, FireDAC.Comp.Client,Md5, FireDAC.Stan.Param;

Type
  TControllerSituation = Class(TBaseController)
    procedure clear;
  private

  public
    Registro : TSituation;
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    function save:boolean;
    function getByKey:Boolean;
    function delete: boolean;

  End;

implementation

{ ControllerSituation}

procedure TControllerSituation.clear;
begin
  ClearObj(Registro);
end;

constructor TControllerSituation.Create(AOwner: TComponent);
begin
  inherited;
  Registro := TSituation.Create;
end;


function TControllerSituation.delete: boolean;
begin
   Try
    deleteObj(Registro);
    Result := True;
  Except
    Result := False;
  End;

end;

destructor TControllerSituation.Destroy;
begin
     FreeAndNil(Registro);
     inherited;
end;

function TControllerSituation.save: boolean;
begin
   if Registro.Codigo = 0 then
    Registro.Codigo := getNextByField(Registro,'id',Registro.Estabelecimento);
  try
    saveObj(Registro);
    Result := true;
  except
    Result := False;
  end;
end;


function TControllerSituation.getByKey: Boolean;
begin
  _getByKey(Registro);
end;

end.


