unit ControllerServices;

interface
uses System.Classes, System.SysUtils,BaseController,
      tblServices,FireDAC.Comp.Client,Md5, FireDAC.Stan.Param,
      ControllerPrice, ControllerProduct, ControllerStock, ControllerPriceList;

Type
  TControllerServices = Class(TBaseController)
    procedure clear;
  private


  public
    Registro    : TServices;
    Produto     : TControllerProduct;
    Preco       : TControllerPrice;
    ListaPreco  : TControllerPriceList;

    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;

    function save:boolean;
    function insert:boolean;
    function delete: boolean;

    function getByKey:Boolean;
  End;

implementation

{ TControllerServices }

procedure TControllerServices.clear;
begin
  ClearObj(Registro);
end;

constructor TControllerServices.Create(AOwner: TComponent);
begin
  inherited;
  Registro    := TServices.Create;
  Produto     := TControllerProduct.Create(self);
  Preco       := TControllerPrice.Create(self);
  ListaPreco  := TControllerPriceList.Create(self);

end;

function TControllerServices.delete: boolean;
begin
  Try
    deleteObj(Registro);
    Result := True;
  Except
    Result := False;
  End;

end;

destructor TControllerServices.Destroy;
begin
  FreeAndNil(Registro);
  FreeAndNil(Produto);
  FreeAndNil(Preco);
  FreeAndNil(ListaPreco);
  inherited;
end;


function TControllerServices.getByKey: Boolean;
begin
  _getByKey(Registro);
end;

function TControllerServices.insert: boolean;
begin
  try
    Registro.Codigo := getNextByField(Registro,'id',0);
    insertObj(Registro);
    Result := true;
    except
    Result := False;
  end;
end;

function TControllerServices.save: boolean;
begin
  try
    if Registro.Codigo = 0 then
      Registro.Codigo := getNextByField(Registro,'id',Registro.estabelecimento);
    saveObj(Registro);
    Result := true;
  except
    Result := False;
  end;
end;

end.
