unit ControllerConfig;

interface
uses System.Classes, System.SysUtils,BaseController,
      tblConfig, FireDAC.Comp.Client;


Type
  TControllerConfig = Class(TBaseController)
  private

  public
    Registro : TConfig;
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    function clear:Boolean;
    function save:boolean;
    function getByKey: boolean;
  End;

implementation

{ TControllerConfig }

function TControllerConfig.clear: Boolean;
begin
  clearObj(Registro);
end;

constructor TControllerConfig.Create(AOwner: TComponent);
begin
  inherited;
  Registro := TConfig.Create;

end;

destructor TControllerConfig.Destroy;
begin
  FreeAndNil(Registro);
  inherited;
end;



function TControllerConfig.getByKey: boolean;
begin
  _getByKey(Registro);
end;

function TControllerConfig.save: boolean;
begin
  saveObj(Registro);
end;



end.
