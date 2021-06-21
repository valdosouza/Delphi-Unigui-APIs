unit ControllerOrderJobToDelivery;

interface
uses System.Classes, System.SysUtils,BaseController,
      tblOrderJobToDelivery,FireDAC.Comp.Client,Md5, FireDAC.Stan.Param,
      Datasnap.DBClient, Data.DB, System.Generics.Collections, ControllerMerchandise,
      ControllerOrderItem,tblOrderItem  ;

Type
  TListaOrderJobDelivery = TObjectList<TOrderJobToDelivery>;

  TControllerOrderJobToDelivery = Class(TBaseController)
    Lista      : TListaOrderJobDelivery;

    procedure clear;
  private

  public
    Registro    : TOrderJobToDelivery;
    Merchandise : TControllerMerchandise;
    OrdemItem   : TControllerOrderItem;

    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure getList;

    function save:boolean;

  End;

implementation

{OrderJobToBuy }


procedure TControllerOrderJobToDelivery.clear;
begin
  ClearObj(Registro);
end;

constructor TControllerOrderJobToDelivery.Create(AOwner: TComponent);
begin
  inherited;
  Registro    := TOrderJobToDelivery.Create;
  Lista       := TListaOrderJobDelivery.Create;
  Merchandise := TControllerMerchandise.Create(self);
  OrdemItem   := TControllerOrderItem.Create(self);
end;

destructor TControllerOrderJobToDelivery.Destroy;
begin
  FreeAndNil(Registro);
  inherited;
end;

function TControllerOrderJobToDelivery.save: boolean;
begin
  Try
    saveObj(Registro);
    Result := True;
  Except
    Result := False;
  End;
end;


procedure TControllerOrderJobToDelivery.getList;
var
  Qry : TFDQuery;
  LITem : TOrderJobToDelivery;
begin
  Qry := createQuery;
  with Qry do
  Begin
    sql.add(concat(
              ' SELECT DISTINCT  otd.* ',
               '  FROM  tb_order_item oij ',
               '  INNER JOIN  tb_order_to_deliver otd ',
               '  on (oij.id = otd.tb_order_item_id)  ',
               '  and  ( oij.tb_institution_id = otd.tb_institution_id) ',

               '  INNER JOIN tb_product pro ',
               '  on (pro.id = oij.tb_product_id) ',
               '  and (pro.tb_institution_id = oij.tb_institution_id ) ',

               '  LEFT OUTER JOIN tb_order_has_delivery ohd   ',
               '  on (ohd.tb_order_item_id = otd.tb_order_item_id ) ',
               '  and  ( ohd.tb_institution_id = ohd.tb_institution_id) ',
               '  WHERE otd.tb_institution_id =:tb_institution_id ',
               '  and ohd.tb_order_item_id is null ',
               '  order by pro.description '
                    ));
    ParamByName('tb_institution_id').AsInteger := Registro.Estabelecimento;
    Active := True;
    FetchAll;
    First;
    Lista.Clear;
    while not eof do
    Begin
      LITem := TOrderJobToDelivery.Create;
      with LITem do
      Begin
        Estabelecimento   := FieldByName('tb_institution_id').asInteger;
        Ordem             := FieldByName('tb_order_id').AsInteger;
        OrdemItem         := FieldByName('tb_order_item_id').AsInteger;
        DataRegistro      := FieldByName('dt_record').AsDateTime;
        Quantidade        := FieldByName('quantity').AsFloat;
        RegistroCriado    := FieldByName('created_at').AsDateTime;
        RegistroAlterado  := FieldByName('updated_at').AsDateTime;

      end;
      Lista.add(LITem);
      next;
    end;
    Close;
  end;
  FreeAndNil(Qry);

end;

end.
