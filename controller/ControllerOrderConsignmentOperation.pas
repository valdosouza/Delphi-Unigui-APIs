unit ControllerOrderConsignmentOperation;

interface
uses System.Classes, System.SysUtils,BaseController,
      tblOrderConsignmentOperation, FireDAC.Comp.Client,Md5, FireDAC.Stan.Param,
      ControllerOrderItem,TypesCollection;

Type
  TControllerOrderConsignmentOperation = Class(TBaseController)
    procedure clear;
  private
  public
    Registro : TOrderConsignmentOperation;
    Item : TControllerOrderItem;
    Lista: TListOrdemConsignmentOperation;

    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    function save:boolean;
    function insert:boolean;
    Function delete:boolean;
    function getByKey:Boolean;
    procedure getList;
  End;

implementation

{ TControllerOrderConsignmentOperation }

procedure TControllerOrderConsignmentOperation.clear;
begin
  clearObj(Registro)
end;

constructor TControllerOrderConsignmentOperation.Create(AOwner: TComponent);
begin
  inherited;
  Registro := TOrderConsignmentOperation.Create;
  Item := TControllerOrderItem.create(Self);
  Lista := TListOrdemConsignmentOperation.Create;
end;

function TControllerOrderConsignmentOperation.delete: boolean;
begin
  try
    deleteObj(Registro);
    Result := True;
  except
    Result := False;
  end;
end;

destructor TControllerOrderConsignmentOperation.Destroy;
begin
  Registro.disposeOF;
  Item.disposeOF;
  Lista.disposeOF;
  inherited;
end;

function TControllerOrderConsignmentOperation.getByKey: Boolean;
begin
  _getByKey(Registro);
end;

procedure TControllerOrderConsignmentOperation.getList;
var
  Lc_Qry : TFDQuery;
  LITem : TOrderConsignmentOperation;
begin
  Try
    Lc_Qry := createQuery;
    with Lc_Qry do
    Begin
      sql.add(concat('SELECT occ.* ',
                      'FROM tb_order_consignment_operation occ ',
                      'WHERE occ.tb_institution_id =:tb_institution_id ',
                      ' AND occ.tb_order_id =:tb_order_id ',
                      ' AND occ.terminal =:terminal ',
                      ' ORDER BY occ.tb_order_item_id '));

      ParamByName('tb_institution_id').AsInteger := Registro.Estabelecimento;
      ParamByName('tb_order_id').AsInteger := Registro.Ordem;
      ParamByName('terminal').AsInteger := Registro.Terminal;
      Active := True;
      FetchAll;
      First;
      Lista.Clear;
      while not eof do
      Begin
        LITem := TOrderConsignmentOperation.Create;
        get(Lc_Qry,LITem);
        Lista.add(LITem);
        next;
      end;
    end;
  Finally
    FinalizaQuery(Lc_Qry);
  End;

end;

function TControllerOrderConsignmentOperation.insert: boolean;
begin
  try
    insertObj(Registro);
    Result := True;
  except
    Result := False;
  end;
end;

function TControllerOrderConsignmentOperation.save: boolean;
begin
  try
    SaveObj(Registro);
    Result := True;
  except
    Result := False;
  end;
end;

end.
