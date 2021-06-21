unit ControllerOrderItemdetail;

interface
uses System.Classes, System.SysUtils,BaseController,
      tblOrderItemDetail, tblEntity, Md5,
      FireDAC.Stan.Param, System.Generics.Collections, ControllerProduct,
      ControllerMerchandise, Datasnap.DBClient,Data.DB,FireDAC.Comp.Client;

Type
  TListaOrdemItemDetail = TObjectList<TOrderItemDetail>;

  TControllerOrderItemDetail = Class(TBaseController)

    procedure clear;
  private

  protected

  public
    Registro : TOrderItemDetail;
    Lista: TListaOrdemItemDetail;
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure getList;
    function getByKey:Boolean;
    function save:boolean;
    function insert:boolean;
    function update:boolean;
    function delete:boolean;
  End;

implementation

{ ControllerOrderItem}

procedure TControllerOrderItemDetail.clear;
begin
  clearObj(Registro);
end;

constructor TControllerOrderItemDetail.Create(AOwner: TComponent);
begin
  inherited;
  Registro := TOrderItemDetail.Create;
  Lista := TListaOrdemItemDetail.Create;
end;

function TControllerOrderItemDetail.delete: boolean;
begin
  try
    deleteObj(Registro);
    Result := true;
  except
    Result := False;
  end;
end;

destructor TControllerOrderItemDetail.Destroy;
begin
  Lista.DisposeOf;
  Registro.DisposeOf;
  inherited;
end;


function TControllerOrderItemDetail.save: boolean;
begin
  try
    SaveObj(Registro);
    Result := true;
  except
    Result := False;
  end;
end;

function TControllerOrderItemDetail.update: boolean;
begin
  Result := updateObj(Registro);
end;

function TControllerOrderItemDetail.getByKey: Boolean;
begin
  _getByKey(Registro);
end;

procedure TControllerOrderItemDetail.getList;
var
  Qry : TFDQuery;
  LITem : TOrderItemDetail;
begin
  Qry := createQuery;
  with Qry do
  Begin
    sql.add(concat('SELECT * ',
                    'FROM tb_order_item_job oij ',
                    'WHERE tb_institution_id =:tb_institution_id ',
                    ' AND tb_order_id =:tb_order_id ',
                    ' ORDER BY id '));

    ParamByName('tb_institution_id').AsInteger := Registro.Estabelecimento;
    ParamByName('tb_order_id').AsInteger := Registro.Ordem;
    Active := True;
    FetchAll;
    First;
    Lista.Clear;
    while not eof do
    Begin
      LITem := TOrderItemDetail.Create;
      with LITem do
      Begin
        Codigo              := FieldByName('id').AsInteger;
        Estabelecimento     := FieldByName('tb_institution_id').AsInteger;
        Ordem               := FieldByName('tb_order_id').AsInteger;

        Detalhes            := FieldByName('note').AsString;
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


function TControllerOrderItemDetail.insert: boolean;
begin
  Try
    insertObj(Registro);
    Result := True;
  Except
    Result := False;
  End;

end;

end.

