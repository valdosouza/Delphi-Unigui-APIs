unit ControllerOrderItemdetailOptional;

interface
uses System.Classes, System.SysUtils,BaseController,
      tblorderItemDetailOptional, tblEntity, Md5,
      FireDAC.Stan.Param, System.Generics.Collections, ControllerProduct,
      ControllerMerchandise, Datasnap.DBClient,Data.DB,FireDAC.Comp.Client;

Type
  TListaOrdemItemDetailOptional = TObjectList<TOrderItemDetailOptional>;

  TControllerOrderItemDetailOptional = Class(TBaseController)

    procedure clear;
  private

  protected

  public
    Registro : TOrderItemDetailOptional;
    Lista: TListaOrdemItemDetailOptional;
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

procedure TControllerOrderItemDetailOptional.clear;
begin
  clearObj(Registro);
end;

constructor TControllerOrderItemDetailOptional.Create(AOwner: TComponent);
begin
  inherited;
  Registro := TOrderItemDetailOptional.Create;
  Lista := TListaOrdemItemDetailOptional.Create;
end;

function TControllerOrderItemDetailOptional.delete: boolean;
begin
  try
    deleteObj(Registro);
    Result := true;
  except
    Result := False;
  end;
end;

destructor TControllerOrderItemDetailOptional.Destroy;
begin
  Lista.DisposeOf;
  Registro.DisposeOf;
  inherited;
end;


function TControllerOrderItemDetailOptional.save: boolean;
begin
  try
    SaveObj(Registro);
    Result := true;
  except
    Result := False;
  end;
end;

function TControllerOrderItemDetailOptional.update: boolean;
begin
  Result := updateObj(Registro);
end;

function TControllerOrderItemDetailOptional.getByKey: Boolean;
begin
  _getByKey(Registro);
end;

procedure TControllerOrderItemDetailOptional.getList;
var
  Qry : TFDQuery;
  LITem : TOrderItemDetailOptional;
begin
  Try
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
        LITem := TOrderItemDetailOptional.Create;
        get(Qry,LITem);
        Lista.add(LITem);
        next;
      end;
      Close;
    end;
  Finally
    FinalizaQuery(Qry);
  End;
end;


function TControllerOrderItemDetailOptional.insert: boolean;
begin
  Try
    insertObj(Registro);
    Result := True;
  Except
    Result := False;
  End;

end;

end.

