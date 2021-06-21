unit ControllerWorkFront;

interface
uses System.Classes, System.SysUtils,BaseController,
      tblWorkFront, tblEntity, FireDAC.Comp.Client,Md5, FireDAC.Stan.Param;

Type
  TControllerWorkFront= Class(TBaseController)
    procedure clear;
  private

  public
    Registro : TWorkFront;
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    function save:boolean;
    function getByKey:Boolean;
    function delete: boolean;

  End;

implementation

{ ControllerWorkFront}

procedure TControllerWorkFront.clear;
begin
  ClearObj(Registro);
end;

constructor TControllerWorkFront.Create(AOwner: TComponent);
begin
  inherited;
  Registro := TWorkFront.Create
  end;

function TControllerWorkFront.delete: boolean;
begin
  Try
    deleteObj(Registro);
    Result := True;
  Except
    Result := False;
  End;

end;

destructor TControllerWorkFront.Destroy;
begin
  FreeAndNil(Registro);
  inherited;
end;

function TControllerWorkFront.save: boolean;
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


function TControllerWorkFront.getByKey: Boolean;
begin
  _getByKey(Registro);
end;

end.

