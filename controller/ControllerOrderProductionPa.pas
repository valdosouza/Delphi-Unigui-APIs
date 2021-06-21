unit ControllerOrderProductionPa;

interface
uses System.Classes, System.SysUtils,BaseController,
      tblOrderProductionPa, FireDAC.Comp.Client,Md5, FireDAC.Stan.Param,
      ControllerEntityFiscal, ControllerCompany, ControllerPerson,System.Generics.Collections,
  ControllerMerchandise;

Type
  TListaOrdemItemMp = TObjectList<TOrderProductionPa>;

  TControllerOrderProductionPa = Class(TBaseController)
    Lista: TListaOrdemItemMp;
    procedure clear;
  private


  public
    Registro : TOrderProductionPa;
    Mercadoria : TControllerMerchandise;
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    function save:boolean;
    function insert:boolean;
    Function delete:boolean;
    function getByKey:Boolean;
    function getAllByKey:boolean;
    procedure getList;
  End;

implementation

{ ControllerAccounting }

procedure TControllerOrderProductionPa.clear;
begin
  ClearObj(Registro);
end;

constructor TControllerOrderProductionPa.Create(AOwner: TComponent);
begin
  inherited;
  Registro := TOrderProductionPa.Create;
  Mercadoria := TControllerMerchandise.Create(Self);
  Lista := TListaOrdemItemMp.Create;
end;

function TControllerOrderProductionPa.delete: boolean;
begin
  Try
    deleteObj(Registro);
    Result := True;
  Except
    Result := False;
  End;
end;

destructor TControllerOrderProductionPa.Destroy;
begin
  FreeAndNil(Registro);
  FReeAndNil(Mercadoria);
  inherited;
end;


function TControllerOrderProductionPa.insert: boolean;
begin
  try
    saveObj(Registro);
    Result := true;
  except
    Result := False;
  end;
end;

function TControllerOrderProductionPa.save: boolean;
begin
  try
    saveObj(Registro);
    Result := true;
  except
    Result := False;
  end;


end;

function TControllerOrderProductionPa.getAllByKey: boolean;
begin
  getByKey;
  Mercadoria.Registro.Codigo := Registro.Produto;
  Mercadoria.getAllByKey;

end;

function TControllerOrderProductionPa.getByKey: Boolean;
begin
  _getByKey(Registro);
  Mercadoria.Registro.Codigo := Self.Registro.Codigo;
  Mercadoria.getByKey;
end;

procedure TControllerOrderProductionPa.getList;
var
  Qry : TFDQuery;
  LITem : TOrderProductionPa;
begin
  Qry := createQuery;
  with Qry do
  Begin
    sql.add(concat('SELECT * ',
                    'FROM tb_order_production_pa oi ',
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
      LITem := TOrderProductionPa.Create;
      with LITem do
      Begin
        Codigo            := fieldByName('id').asInteger;
        Estabelecimento   := fieldByName('tb_institution_id').asInteger;
        Ordem             := fieldByName('tb_order_id').asInteger;
        Produto           := fieldByName('tb_product_id').asInteger;
        Estoque           := fieldByName('tb_stock_list_id').asInteger;
        Quantidade        := fieldByName('quantity').asFloat;
        RegistroCriado    := fieldByName('created_at').AsDateTime;
        RegistroAlterado  := fieldByName('updated_at').AsDateTime;
      end;
      Lista.add(LITem);
      next;
    end;
    Close;
  end;
  FreeAndNil(Qry);
end;

end.
