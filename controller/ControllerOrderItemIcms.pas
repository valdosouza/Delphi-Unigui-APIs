unit ControllerOrderItemIcms;

interface
uses System.Classes, System.SysUtils,BaseController,
      tblOrderItemIcms, tblEntity, FireDAC.Comp.Client,Md5,
      FireDAC.Stan.Param, System.Generics.Collections;

Type
  TListaOrderItemIcms = TObjectList<TOrderItemIcms>;

  TControllerOrderItemIcms= Class(TBaseController)
    procedure clear;
  private

  public
    Registro : TOrderItemIcms;
    Lista: TListaOrderItemIcms;
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    function save:boolean;
    function delete:boolean;
    function deleteByOrdem:boolean;
  End;

implementation

{ ControllerOrderItemIcms}


procedure TControllerOrderItemIcms.clear;
begin
  ClearObj(Registro);
end;

constructor TControllerOrderItemIcms.Create(AOwner: TComponent);
begin
inherited;
  Registro := TOrderItemIcms.Create;
  Lista := TListaOrderItemIcms.Create;
end;

function TControllerOrderItemIcms.delete: boolean;
begin
  deleteObj(Registro)
end;

function TControllerOrderItemIcms.deleteByOrdem: boolean;
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
                'delete from tb_order_item_icms ',
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

destructor TControllerOrderItemIcms.Destroy;
begin
  Registro.DisposeOf;
  Lista.DisposeOf;
  inherited;
end;

function TControllerOrderItemIcms.save: boolean;
begin
  try
    saveObj(Registro);
    Result := true;
  except
    Result := False;
  end;
end;


end.
