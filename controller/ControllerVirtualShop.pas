unit ControllerVirtualShop;

interface
uses System.Classes, System.SysUtils,BaseController,
      tblVirtualShop, FireDAC.Comp.Client,Md5, FireDAC.Stan.Param,
      ControllerEntityFiscal, ControllerCompany, ControllerPerson, ControllerSalesMan;

Type
  TControllerVirtualShop = Class(TBaseController)
    procedure clear;
  private
    Agencia:String;

  public
    Registro : TVirtualShop;
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    function save:boolean;
    function insert:boolean;
    Function delete:boolean;
    function getByKey:Boolean;
    function getAllByKey:boolean;
  End;

implementation

{ ControllerVirtualShop }

procedure TControllerVirtualShop.clear;
begin
  ClearObj(Registro);
end;

constructor TControllerVirtualShop.Create(AOwner: TComponent);
begin
  inherited;
  Registro := TVirtualShop.Create;
end;

function TControllerVirtualShop.delete: boolean;
begin
  FreeAndNil(Registro);
  inherited;
end;

destructor TControllerVirtualShop.Destroy;
begin
  FreeAndNil(Registro);
  inherited;
end;


function TControllerVirtualShop.insert: boolean;
begin
  try
    saveObj(Registro);
    Result := true;
  except
    Result := False;
  end;
end;

function TControllerVirtualShop.save: boolean;
begin
   try
    saveObj(Registro);
    Result := true;
  except
    Result := False;
  end;


end;


function TControllerVirtualShop.getAllByKey: boolean;
begin
  getByKey;
End;

function TControllerVirtualShop.getByKey: Boolean;
begin
  _getByKey(Registro);
end;

end.
