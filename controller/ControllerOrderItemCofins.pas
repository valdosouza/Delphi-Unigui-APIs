unit ControllerOrderItemCofins;

interface
uses System.Classes, System.SysUtils,BaseController,
      tblOrderItemCofins, tblEntity, FireDAC.Comp.Client,Md5,
       FireDAC.Stan.Param, System.Generics.Collections;

Type
  TListaOrderItemCofins = TObjectList<TOrderItemCofins>;

  TControllerOrderItemCofins= Class(TBaseController)

    procedure clear;
  private

  public
    Registro : TOrderItemCofins;
    Lista : TListaOrderItemCofins ;
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    function save:boolean;
    function delete:boolean;
    function deleteByOrdem: boolean;
  End;

implementation

{ ControllerOrderItemCofins}

procedure TControllerOrderItemCofins.clear;
begin
  ClearObj(Registro);
end;

constructor TControllerOrderItemCofins.Create(AOwner: TComponent);
begin
  inherited;
  Registro := TOrderItemCofins.Create;
  Lista := TListaOrderItemCofins.Create;
end;

function TControllerOrderItemCofins.delete: boolean;
begin
  deleteObj(Registro)
end;

function TControllerOrderItemCofins.deleteByOrdem: boolean;
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
                'delete from tb_order_item_cofins ',
                'where ( tb_order_id =:order_id ) ',
                ' and (tb_institution_id =:institution_id )'
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

destructor TControllerOrderItemCofins.Destroy;
begin
  Registro.DisposeOf;
  Lista.DisposeOf;
  inherited;
end;

function TControllerOrderItemCofins.save: boolean;
begin
  try
    saveObj(Registro);
    Result := true;
  except
    Result := False;
  end;
end;

end.
