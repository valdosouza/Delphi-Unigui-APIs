unit ControllerMedPosProg;

interface
uses System.Classes, System.SysUtils,BaseController,
      tblMedPosProg, FireDAC.Comp.Client,FireDAC.Stan.Param;

Type
  TControllerMedPosProg = Class(TBaseController)
    procedure clear;
  private

  public
    Registro : TMedPosProg;

    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    function save:boolean;
    function insert:boolean;
    Function delete:boolean;
    function getByKey:Boolean;
  End;

implementation

{ ControllerMedPosProg }

procedure TControllerMedPosProg.clear;
begin
  clearObj(Registro);
end;

constructor TControllerMedPosProg.Create(AOwner: TComponent);
begin
  inherited;
  Registro := TMedPosProg.Create;
end;

function TControllerMedPosProg.delete: boolean;
begin
  Try
    deleteObj(Registro);
    Result := True;
  Except
    Result := False;
  End;
end;


destructor TControllerMedPosProg.Destroy;
begin
  FreeAndNil(Registro);
  inherited;
end;


function TControllerMedPosProg.insert: boolean;
begin
  try
    SaveObj(Registro);
    Result := true;
  except
    Result := False;
  end;
end;

function TControllerMedPosProg.save: boolean;
begin
  try
    if Registro.Codigo = 0 then
      Registro.Codigo := getNextByField(Registro,'id',Registro.Estabelecimento);
    SaveObj(Registro);
    Result := true;
  except
    Result := False;
  end;
end;

function TControllerMedPosProg.getByKey: Boolean;
begin
  _getByKey(Registro);
end;

end.
