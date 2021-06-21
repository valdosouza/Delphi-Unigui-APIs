unit ControllerOrderShipping;

interface
uses System.Classes, System.SysUtils,BaseController,
      tblOrderShipping, tblEntity, FireDAC.Comp.Client,Md5,
      FireDAC.Stan.Param,ControllerEntity,ControllerCarrier,ControllerFreightMode;

Type
  TControllerOrderShipping = Class(TBaseController)
    procedure clear;
  private

  public
    Registro : TOrderShipping;
    LocalEntrega : TControllerEntity;
    ModalFrete : TControllerFreightMode;
    TRansportadora : TControllerCarrier;
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    function save:boolean;
    function getByKey:Boolean;
    function UpdateModalCarrier:Boolean;
  End;

implementation

{ ControllerShipping}

procedure TControllerOrderShipping.clear;
begin
  ClearObj(Registro);
end;

constructor TControllerOrderShipping.Create(AOwner: TComponent);
begin
  inherited;
  Registro := TOrderShipping.Create;
  LocalEntrega := TControllerEntity.Create(self);
  TRansportadora := TControllerCarrier.Create(self);
  ModalFrete := TControllerFreightMode.Create(self);
end;

destructor TControllerOrderShipping.Destroy;
begin
  Registro.DisposeOf;
  LocalEntrega.DisposeOf;
  ModalFrete.DisposeOf;
  TRansportadora.DisposeOf;
  inherited;
end;

function TControllerOrderShipping.save: boolean;
begin
  try
    saveObj(Registro);
    Result := true;
  except
    Result := False;
  end;
end;

function TControllerOrderShipping.UpdateModalCarrier: Boolean;
Var
  qry : TFDQuery;
begin
  qry := createQuery;
  with qry do
  Begin
    Active := False;
    sql.Add(concat(
              'update tb_order_shipping osp set ',
              'osp.tb_carrier_id=:carrier_id, ',
              'osp.tb_freight_mode_id =:freight_mode_id ',
              'where ( id =:order_id ) ',
              ' and (	tb_institution_id =:institution_id) '
    ));
    ParamByName('carrier_id').AsInteger := Registro.Transportadora;
    ParamByName('freight_mode_id').AsString := Registro.ModalidadeFrete;
    ParamByName('order_id').AsInteger := Registro.Codigo;
    ParamByName('institution_id').AsInteger := Registro.Estabelecimento;
    ExecSQL;
  End;
  qry.Close;
  FreeAndNil(qry);
end;


function TControllerOrderShipping.getByKey: Boolean;
begin
  _getByKey(Registro);
  ModalFrete.Registro.Codigo := Registro.ModalidadeFrete;
  ModalFrete.getByKey;
end;

end.
