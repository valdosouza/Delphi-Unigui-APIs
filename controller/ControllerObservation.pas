unit ControllerObservation;

interface
uses System.Classes, System.SysUtils,BaseController,
      tblObservation, tblEntity, FireDAC.Comp.Client,Md5, FireDAC.Stan.Param;

Type
  TControllerObservation= Class(TBaseController)
    procedure clear;
  private

  public
    Registro : TObservation;
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    function save:boolean;
    function getByKey:Boolean;
    function delete: boolean;

  End;

implementation

{ ControllerObservation}

procedure TControllerObservation.clear;
begin
  ClearObj(Registro);
end;

constructor TControllerObservation.Create(AOwner: TComponent);
begin
  inherited;
  Registro := TObservation.Create
  end;

function TControllerObservation.delete: boolean;
begin
  Try
    deleteObj(Registro);
    Result := True;
  Except
    Result := False;
  End;

end;

destructor TControllerObservation.Destroy;
begin
  FreeAndNil(Registro);
  inherited;
end;

function TControllerObservation.save: boolean;
begin
  if Registro.Codigo = 0 then
    Registro.Codigo := getNextByField(Registro,'id',0);
  try
    saveObj(Registro);
    Result := true;
  except
    Result := False;
  end;
end;


function TControllerObservation.getByKey: Boolean;
begin
  _getByKey(Registro);
end;

end.

