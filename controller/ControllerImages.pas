unit ControllerImages;

interface
uses System.Classes, System.SysUtils,BaseController,
      tblOrder, FireDAC.Comp.Client,Md5, FireDAC.Stan.Param,tblimages;

Type
  TControllerImages = Class(TBaseController)

  private

  public
    Registro : TImages;
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    function insert:Boolean;
    function delete:Boolean;
  End;
implementation

{ TControllerImages }

constructor TControllerImages.Create(AOwner: TComponent);
begin
  inherited;
  Registro := TImages.Create;
end;

function TControllerImages.delete: Boolean;
begin
  try
    insertObj(Registro);
    result := True;
  except
    result := False;
  end;
end;

destructor TControllerImages.Destroy;
begin
  Registro.DisposeOf;
  inherited;
end;

function TControllerImages.insert: Boolean;
begin
  try
    insertObj(Registro);
    result := True;
  except
    result := False;
  end;
end;

end.
