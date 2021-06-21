unit ControllerOrderToBuy;

interface
uses System.Classes, System.SysUtils,BaseController,
      tblOrderToBuy,FireDAC.Comp.Client,Md5, FireDAC.Stan.Param,
      Datasnap.DBClient, Data.DB, System.Generics.Collections, ControllerMerchandise,
      ControllerOrderItem,tblOrderItem  ;

Type
  TListaOrderJobBuy = TObjectList<TOrderJobToBuy>;

  TControllerOrderToBuy = Class(TBaseController)
    Lista      : TListaOrderJobBuy;

    procedure clear;
  private

  public
    Registro    : TOrderJobToBuy;
    Merchandise : TControllerMerchandise;
    OrdemItem   : TControllerOrderItem;

    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure getList;

    function Insert:boolean;

  End;

implementation

{OrderJobToBuy }

procedure TControllerOrderToBuy.clear;
begin
  ClearObj(Registro);
end;

constructor TControllerOrderToBuy.Create(AOwner: TComponent);
begin
  inherited;
  Registro    := TOrderJobToBuy.Create;
  Lista       := TListaOrderJobBuy.Create;
  Merchandise := TControllerMerchandise.Create(self);
  OrdemItem   := TControllerOrderItem.Create(self);
end;

destructor TControllerOrderToBuy.Destroy;
begin
  FreeAndNil(Registro);
  inherited;
end;

function TControllerOrderToBuy.Insert: boolean;
begin
  Try
    if Registro.Codigo = 0 then
      Registro.Codigo := getNextByField(Registro,'id',Registro.Estabelecimento);
    saveObj(Registro);
    Result := True;
  Except
    Result := False;
  End;
end;

procedure TControllerOrderToBuy.getList;
var
  Qry : TFDQuery;
  LITem : TOrderJobToBuy;
begin
  Qry := createQuery;
  with Qry do
  Begin
    sql.add(concat(
              'SELECT DISTINCT otb.* ',
              'FROM tb_order_to_buy otb ',

              ' LEFT OUTER JOIN tb_order_has_purchase ohp ',
              ' on  ( ohp.tb_institution_id = otb.tb_institution_id ) ',
              ' and ( ohp.tb_order_to_buy_id       = otb.id) ',

              ' INNER JOIN tb_product pro ',
              ' on  ( pro.id = otb.tb_product_id) ',
              ' and ( pro.tb_institution_id = otb.tb_institution_id ) ',

              ' WHERE otb.tb_institution_id =:institution_id ',
              ' and (ohp.tb_order_id is null) '
               ));
    ParamByName('institution_id').AsInteger := Registro.Estabelecimento;
    Active := True;
    FetchAll;
    First;
    Lista.Clear;
    while not eof do
    Begin
      LITem := TOrderJobToBuy.Create;
      with LITem do
      Begin
        Codigo            := FieldByName('id').AsInteger;
        Estabelecimento   := FieldByName('tb_institution_id').asInteger;
        Ordem             := FieldByName('tb_order_id').AsInteger;
        OrdemItem         := FieldByName('tb_order_item_id').AsInteger;
        Mercadoria        := FieldByName('tb_product_id').AsInteger;
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
