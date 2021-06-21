unit ControllerOrderItemII;

interface
uses System.Classes, System.SysUtils,BaseController,
      tblOrderItemII, tblEntity, FireDAC.Comp.Client,Md5, FireDAC.Stan.Param,
      System.Generics.Collections;

Type
  TListaOrderItemII = TObjectList<TOrderItemII>;

  TControllerOrderItemII = Class(TBaseController)

    procedure clear;
  private

  public
    Registro : TOrderItemII;
    Lista : TListaOrderItemII;
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    function save:boolean;
    function delete:boolean;
    function deleteByOrdem: boolean;

  End;

implementation

{ ControllerOrderItemII }

procedure TControllerOrderItemII.clear;
begin
  ClearObj(Registro);
end;

constructor TControllerOrderItemII.Create(AOwner: TComponent);
begin
  inherited;
  Registro := TOrderItemII.Create;
  Lista := TListaOrderItemII.Create;
end;

function TControllerOrderItemII.delete: boolean;
begin
  deleteObj(Registro)
end;

function TControllerOrderItemII.deleteByOrdem: boolean;
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
                'delete from tb_order_item_ii ',
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

destructor TControllerOrderItemII.Destroy;
begin
  Registro.DisposeOf;
  Lista.DisposeOf;
  inherited;
end;

function TControllerOrderItemII.save: boolean;
begin
  try
    saveObj(Registro);
    Result := true;
  except
    Result := False;
  end;
end;


end.

