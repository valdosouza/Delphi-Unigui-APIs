unit ControllerCheckOutItems;

interface
uses System.Classes, System.SysUtils,BaseController,
      GenericDao, tblCheckOutItems,System.Generics.Collections,
  FireDAC.Comp.Client;


Type
  TListaCheckOut = TObjectList<TCheckOutItems>;

  TControllerCheckOutItems = Class(TBaseController)
    Lista : TListaCheckOut;
  private

  public
    Registro : TCheckOutItems;
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    function salva:boolean;
    function insere:boolean;
    procedure getbyKey;
    procedure deleteByOrder;
    procedure getList;
    function delete:boolean;
  End;

implementation

{ TControllerCheckOutItems }

constructor TControllerCheckOutItems.Create(AOwner: TComponent);
begin
  inherited;
  Registro := TCheckOutItems.Create;
  Lista := TListaCheckOut.Create;
end;

function TControllerCheckOutItems.delete: boolean;
begin
  try
    deleteObj(Registro);
    Result := TRue;
  except
    Result := False;
  end;
end;

procedure TControllerCheckOutItems.deleteByOrder;
var
  Qry : TFDQuery;
  LcLista : TCheckOutItems;
begin
  Try
    Qry := GeraQuery;
    with Qry do
    Begin
      sql.add(concat(
                'DELETE ',
                'FROM tb_check_out_items c ',
                'where c.tb_order_id =', Registro.Pedido.toString,
                ' and tb_institution_id =',Registro.Estabelecimento.toString
              ));
      ExecSQL;
    End;
  Finally
    Qry.close;
    FreeAndNil(Qry);
  End;
end;

destructor TControllerCheckOutItems.Destroy;
begin
  FreeAndNil(Registro);
  FreeAndNil( Lista );
  inherited;
end;



procedure TControllerCheckOutItems.getbyKey;
begin
  _getByKey(Registro);
end;

procedure TControllerCheckOutItems.getList;
var
  Qry : TFdQuery;
  LcLista : TCheckOutItems;
begin
  Try
    Qry := geraQuery;
    with Qry do
    Begin
      sql.add(concat(
                'SELECT * ',
                ' FROM tb_check_out_items ',
                'where ( tb_institution_id =:institution_id ) ',
                ' and (TB_ORDER_ID =:ORDER_ID) '
            ));
      //Passagem de Parametro
      ParamByName('institution_id').AsInteger := Registro.Estabelecimento;
      ParamByName('ORDER_ID').AsInteger := Registro.Pedido;
      Active := True;
      FetchAll;
      First;
      Lista.Clear;
      while not eof do
      Begin
        LcLista := TCheckOutItems.Create;
        get(qry,LcLista);
        Lista.add(LcLista);
        next;
      end;
      Close;
    end;
  Finally
    Qry.close;
    FreeAndNil(Qry);
  End;
end;

function TControllerCheckOutItems.insere: boolean;
begin
  InsertObj(Registro);
end;

function TControllerCheckOutItems.salva: boolean;
begin
  SaveObj(Registro);
end;

end.
