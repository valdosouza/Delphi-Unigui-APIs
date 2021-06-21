unit ControllerOrderItemPis;

interface
uses System.Classes, System.SysUtils,BaseController,
      tblOrderItemPis, tblEntity, FireDAC.Comp.Client,Md5,
      FireDAC.Stan.Param, System.Generics.Collections;

Type
  TListaOrderItemPis = TObjectList<TOrderItemPis>;

  TControllerOrderItemPis = Class(TBaseController)

    procedure clear;
  private

  public
    Registro : TOrderItemPis;
    Lista : TListaOrderItemPis;
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    function save:boolean;
    function delete:boolean;
    function deleteByOrdem: boolean;
  End;

implementation

{ ControllerOrderItemPis}

procedure TControllerOrderItemPis.clear;
begin
  ClearObj(Registro);
end;

constructor TControllerOrderItemPis.Create(AOwner: TComponent);
begin
  inherited;
  Registro := TOrderItemPis.Create;
  Lista := TListaOrderItemPis.Create;
end;

function TControllerOrderItemPis.delete: boolean;
begin
  deleteObj(Registro)
end;

function TControllerOrderItemPis.deleteByOrdem: boolean;
Var
  Lc_Qry : TFDQuery;
begin
  Try
    Lc_Qry := createQuery;
    with Lc_Qry do
    Begin
      Active := False;
      sql.Clear;
      sql.Add(concat(
                'delete from tb_order_item_pis ',
                'where ( tb_order_id =:order_id ) ',
                ' and (tb_institution_id =:institution_id ) '
      ));
      ParamByName('order_id').AsInteger := Registro.Ordem;
      ParamByName('institution_id').AsInteger := Registro.Estabelecimento;
      ExecSQL;

    End;

  Finally
    Lc_Qry.close;
    FReeandNil(Lc_Qry)
  End;
end;

destructor TControllerOrderItemPis.Destroy;
begin
  Registro.DisposeOf;
  Lista.DisposeOf;
  inherited;
end;

function TControllerOrderItemPis.save: boolean;
begin
  try
    saveObj(Registro);
    Result := true;
  except
    Result := False;
  end;
end;


end.
