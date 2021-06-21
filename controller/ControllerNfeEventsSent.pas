unit ControllerNfeEventsSent;

interface
uses System.Classes, System.SysUtils,BaseController,
      tblNfeEventsSent,  FireDAC.Comp.Client,
      FireDAC.Stan.Param, TypesCollection;

Type

  TControllerNfeEventsSent = Class(TBaseController)
    procedure clear;
  private

  public
    Registro : TNfeEventsSent;
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    function save:boolean;
    function getByKey: Boolean;
    function insert:boolean;
    Function delete:boolean;
  End;

implementation

{ ControllerBrand }

procedure TControllerNfeEventsSent.clear;
begin
  ClearObj(Registro);
end;

constructor TControllerNfeEventsSent.Create(AOwner: TComponent);
begin
  inherited;
  Registro := TNfeEventsSent.Create;
end;

function TControllerNfeEventsSent.delete: boolean;
begin
  Try
    deleteObj(Registro);
    Result := True;
  Except
    Result := False;
  End;
end;

destructor TControllerNfeEventsSent.Destroy;
begin
  FreeAndNil(Registro);
  inherited;
end;


function TControllerNfeEventsSent.insert: boolean;
begin
  try
    Registro.Codigo := getNextByField(Registro,'id',0);
    insertObj(Registro);
    Result := true;
  except
    Result := False;
  end;
end;


function TControllerNfeEventsSent.save: boolean;
begin
  try
   saveObj(Registro);
    Result := true;
  except
    Result := False;
  end;
end;

function TControllerNfeEventsSent.getByKey: Boolean;
begin
  _getByKey(Registro);
end;

end.
