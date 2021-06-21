unit ControllerBudgAdvertise;

interface
uses System.Classes, System.SysUtils,BaseController,
      tblBudgAdvertise, Md5, FireDAC.Stan.Param,
      ControllerEntity, ControllerBank, System.Generics.Collections,
      Datasnap.DBClient, Data.DB, FireDAC.Comp.Client,  IntMedFormats,
      ControllerBudgAdvertiseImp, ControllerBudgAdvertiseWeb,
      ControllerBroadcaster, ControllerOrder;

Type

  TControllerBudgAdvertise = Class(TBaseController)
    procedure clear;
  private


  public
    Registro : TBudgAdvertise;
    Ordem : TControllerOrder;
    Veiculo : TControllerBroadcaster;
    Imp : TControllerBudgAdvertiseImp;
    Web : TControllerBudgAdvertiseWeb;
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    function save:boolean;
    function insert:boolean;
    function update:boolean;
    function delete: boolean;

    function getByKey:Boolean;

  End;

implementation

{ ControllerMedPriceListJR }

procedure TControllerBudgAdvertise.clear;
begin
  ClearObj(Registro);
end;

constructor TControllerBudgAdvertise.Create(AOwner: TComponent);
begin
  inherited;
  Registro := TBudgAdvertise.Create;
  Ordem := TControllerOrder.Create(Self);
  Veiculo := TControllerBroadcaster.Create(Self);
  Imp := TControllerBudgAdvertiseImp.Create(Self);
  Web := TControllerBudgAdvertiseWeb.Create(Self);
end;

function TControllerBudgAdvertise.delete: boolean;
begin
  deleteObj(Registro);
end;

destructor TControllerBudgAdvertise.Destroy;
begin
  Ordem.disposeOf;
  Veiculo.disposeOf;
  Imp.disposeOf;
  Web.disposeOf;
  Registro.disposeOf;
  inherited;
end;


function TControllerBudgAdvertise.insert: boolean;
begin
  try
    if Registro.Codigo = 0 then
      Registro.Codigo := getNextByField(Registro,'id',Registro.Estabelecimento);

    if Registro.Numero = 0 then
      Registro.Numero := getNextByField(Registro,'number',Registro.Estabelecimento);
    insertObj(Registro);
    Result := true;
  except
    Result := False;
  end;
end;

function TControllerBudgAdvertise.save: boolean;
begin

  try
    saveObj(Registro);
    Result := true;
  except
    Result := False;
  end;


end;

function TControllerBudgAdvertise.update: boolean;
begin
  try
    UpdateObj(Registro);
    Result := true;
  except
    Result := False;
  end;
end;


function TControllerBudgAdvertise.getByKey: Boolean;
begin
  _getByKey(Registro);
  Ordem.Registro.Estabelecimento := Registro.Estabelecimento;
  Ordem.Registro.Codigo := Registro.Codigo;
  Ordem.getByKey;
end;

end.
