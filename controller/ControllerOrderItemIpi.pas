unit ControllerOrderItemIpi;

interface
uses System.Classes, System.SysUtils,BaseController,
      tblOrderItemIpi, tblEntity, FireDAC.Comp.Client,Md5,
      FireDAC.Stan.Param, System.Generics.Collections;

Type
  TListaOrderItemIpi = TObjectList<TOrderItemIpi>;

  TControllerOrderItemIpi = Class(TBaseController)

    procedure clear;
  private

  public
    Registro : TOrderItemIpi;
    Lista : TListaOrderItemIpi;
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    function save:boolean;
    function delete:boolean;
    function deleteByOrdem:boolean;
  End;

implementation

{ ControllerOrderItemIpi}

procedure TControllerOrderItemIpi.clear;
begin
  ClearObj(Registro);
end;

constructor TControllerOrderItemIpi.Create(AOwner: TComponent);
begin
  inherited;
  Registro := TOrderItemIpi.Create;
  Lista := TListaOrderItemIpi.Create;
end;

function TControllerOrderItemIpi.delete: boolean;
begin
  deleteObj(Registro)
end;

function TControllerOrderItemIpi.deleteByOrdem: boolean;
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
                'delete from tb_order_item_ipi ',
                'where ( tb_order_id =:order_id ) ',
                ' and (tb_institution_id =:institution_id) '
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

destructor TControllerOrderItemIpi.Destroy;
begin
  Registro.DisposeOf;
  Lista.DisposeOf;
  inherited;
end;

function TControllerOrderItemIpi.save: boolean;
begin
  try
    saveObj(Registro);
    Result := true;
  except
    Result := False;
  end;
end;

end.
