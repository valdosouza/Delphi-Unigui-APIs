unit ControllerRestGroupHasOptional;

interface
uses System.Classes, System.SysUtils,BaseController,
      Md5, FireDAC.Stan.Param,tblRestGroupHasOptional,
      ObjRestGRoupHasOptional, ControllerRestGroup;

Type

  TControllerRestGroupHasOptional = Class(TBaseController)
    procedure clear;
  private


  public
    Registro : TRestGroupHasOptional;
    RestGRoup : TControllerRestGroup;
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    function save:boolean;
    function insert:boolean;
    function update:boolean;
    function delete: boolean;

    function getByKey:Boolean;
   function SaveObject(DObj: TObjRestGroupHasOptional):Boolean;
  End;

implementation

procedure TControllerRestGroupHasOptional.clear;
begin
  ClearObj(Registro);
end;

constructor TControllerRestGroupHasOptional.Create(AOwner: TComponent);
begin
  inherited;
  Registro := TRestGroupHasOptional.Create;
  RestGRoup := TControllerRestGroup.Create(self);
end;

function TControllerRestGroupHasOptional.delete: boolean;
begin
  deleteObj(Registro);
end;

destructor TControllerRestGroupHasOptional.Destroy;
begin
  RestGRoup.disposeOf;
  Registro.disposeOf;
  inherited;
end;


function TControllerRestGroupHasOptional.insert: boolean;
begin
  try
    insertObj(Registro);
    Result := true;
  except
    Result := False;
  end;
end;

function TControllerRestGroupHasOptional.save: boolean;
begin
  try
    saveObj(Registro);
    Result := true;
  except
    Result := False;
  end;
end;

function TControllerRestGroupHasOptional.SaveObject(
  DObj: TObjRestGroupHasOptional): Boolean;
begin
  ClonarObj(DObj.Opcional, Registro);
  save;
end;

function TControllerRestGroupHasOptional.update: boolean;
begin
  try
    UpdateObj(Registro);
    Result := true;
  except
    Result := False;
  end;
end;


function TControllerRestGroupHasOptional.getByKey: Boolean;
begin
  _getByKey(Registro);
end;

end.
