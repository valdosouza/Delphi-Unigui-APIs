unit ControllerNfeEvents;

interface
uses System.Classes, System.SysUtils,BaseController,
      tblNfeEvents,  FireDAC.Comp.Client,
      FireDAC.Stan.Param, TypesCollection;

Type

  TControllerNfeEvents = Class(TBaseController)
    procedure clear;
  private

  public
    Registro : TNfeEvents;
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    function save:boolean;
    function getByKey: Boolean;
    function insert:boolean;
    Function delete:boolean;
  End;

implementation

{ ControllerBrand }

procedure TControllerNfeEvents.clear;
begin
  ClearObj(Registro);
end;

constructor TControllerNfeEvents.Create(AOwner: TComponent);
begin
  inherited;
  Registro := TNfeEvents.Create;
end;

function TControllerNfeEvents.delete: boolean;
begin
  Try
    deleteObj(Registro);
    Result := True;
  Except
    Result := False;
  End;
end;

destructor TControllerNfeEvents.Destroy;
begin
  FreeAndNil(Registro);
  inherited;
end;


function TControllerNfeEvents.insert: boolean;
begin
  try
    Registro.Codigo := getNextByField(Registro,'id',0);
    insertObj(Registro);
    Result := true;
  except
    Result := False;
  end;
end;


function TControllerNfeEvents.save: boolean;
begin
  try
   saveObj(Registro);
    Result := true;
  except
    Result := False;
  end;
end;

function TControllerNfeEvents.getByKey: Boolean;
begin
  _getByKey(Registro);
end;


end.
