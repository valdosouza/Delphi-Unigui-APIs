unit ControllerOrderToDeliver;

interface
uses System.Classes, System.SysUtils,BaseController,
      tblOrderToDeliver,FireDAC.Comp.Client,Md5, FireDAC.Stan.Param,
            Datasnap.DBClient, Data.DB, System.Generics.Collections, ControllerMerchandise,
      ControllerOrderItem,tblOrderItem  ;

Type
  TListaOrderDeliver = TObjectList<TOrderToDeliver>;

  TControllerOrderToDeliver = Class(TBaseController)
    Lista      : TListaOrderDeliver;

    procedure clear;
  private

  public
    Registro    : TOrderToDeliver;
    Merchandise : TControllerMerchandise;
    OrdemItem   : TControllerOrderItem;

    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure getList;
    function getByKey:Boolean;
    function Insert:boolean;
    function update:Boolean;

  End;

implementation

{OrderJobToBuy }


procedure TControllerOrderToDeliver.clear;
begin
  ClearObj(Registro);
end;

constructor TControllerOrderToDeliver.Create(AOwner: TComponent);
begin
  inherited;
  Registro    := TOrderToDeliver.Create;
  Lista       := TListaOrderDeliver.Create;
  Merchandise := TControllerMerchandise.Create(self);
  OrdemItem   := TControllerOrderItem.Create(self);
end;

destructor TControllerOrderToDeliver.Destroy;
begin
  FreeAndNil(Registro);
  inherited;
end;

function TControllerOrderToDeliver.Insert: boolean;
begin
  Try
    if Registro.Codigo = 0 then
      Registro.Codigo := getNextByField(Registro,'id',Registro.Estabelecimento);
    insertObj(Registro);
    Result := True;
  Except
    Result := False;
  End;
end;

function TControllerOrderToDeliver.update: Boolean;
begin
  Try
    UpdateObj(Registro);
    Result := True;
  Except
    Result := False;
  End;
end;

function TControllerOrderToDeliver.getByKey: Boolean;
begin
  _getByKey(Registro);
end;

procedure TControllerOrderToDeliver.getList;
var
  Qry : TFDQuery;
  LITem : TOrderToDeliver;
begin
  Qry := createQuery;
  with Qry do
  Begin
    sql.add(concat(
              'SELECT DISTINCT otd.* ',
              'FROM tb_order_to_deliver otd ',

              ' LEFT OUTER JOIN tb_order_has_delivery ohd ',
              ' on  ( ohd.tb_institution_id       = otd.tb_institution_id ) ',
              ' and ( ohd.tb_order_to_deliver_id  = otd.id) ',

              ' INNER JOIN tb_product pro ',
              ' on  ( pro.id = otd.tb_product_id) ',
              ' and ( pro.tb_institution_id = otd.tb_institution_id ) ',

              ' WHERE otd.tb_institution_id =:institution_id ',
              ' and (ohd.tb_order_id is null) '
               ));
    ParamByName('institution_id').AsInteger := Registro.Estabelecimento;
    Active := True;
    FetchAll;
    First;
    Lista.Clear;
    while not eof do
    Begin
      LITem := TOrderToDeliver.Create;
      with LITem do
      Begin
        Estabelecimento     := FieldByName('tb_institution_id').asInteger;
        Codigo              := FieldByName('id').asInteger;
        Ordem               := FieldByName('tb_order_id').AsInteger;
        OrdemItem           := FieldByName('tb_order_item_id').AsInteger;
        Mercadoria          := FieldByName('tb_product_id').AsInteger;
        DataRegistro        := FieldByName('dt_record').AsDateTime;
        Quantidade          := FieldByName('quantity').AsFloat;
        Estoque             := FieldByName('tb_stock_list_id').AsInteger;
        DocumentoReferencia :=  FieldByName('refer_doc').AsString;
        Status              :=  FieldByName('status').AsString;
        RegistroCriado      := FieldByName('created_at').AsDateTime;
        RegistroAlterado    := FieldByName('updated_at').AsDateTime;
      end;
      Lista.add(LITem);
      next;
    end;
    Close;
  end;
  FreeAndNil(Qry);

end;

end.
