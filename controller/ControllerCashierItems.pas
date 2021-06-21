unit ControllerCashierItems;

interface
 uses
  System.Classes, System.SysUtils, System.Variants, FireDAC.Comp.Client,
  FireDAC.Stan.Param,TypesCollection,Rest.json,prm_cashier_items,
  BaseController, tblCashierItems;
 Type
  TControllerCashierItems = Class(TBaseController)

  private

  public
    Registro : TCashierItems;
    Lista : TListCashierItem;
    Parametro : TPrmCashierItems;
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure setParametro(par:String);
    function save:boolean;
    function update:boolean;
    function getByKey:Boolean;Virtual;
    procedure getList;
    function delete: boolean;
    function insert:boolean;
    procedure clear;
  End;
implementation

{ TControllerCashierItems }

procedure TControllerCashierItems.clear;
begin
  clearObj(Registro);
end;

constructor TControllerCashierItems.Create(AOwner: TComponent);
begin
  inherited;
  Registro  := TCashierItems.Create;
  Lista     := TListCashierItem.Create;
  Parametro := TPrmCashierItems.Create;
end;

function TControllerCashierItems.delete: boolean;
begin
  Try
    deleteObj(Registro);
    Result := True;
  Except
    Result := False;
  End;
end;

destructor TControllerCashierItems.Destroy;
begin
  Parametro.Destroy;
  Lista.DisposeOf;
  Registro.DisposeOf;
  inherited;
end;

function TControllerCashierItems.getByKey: Boolean;
begin
  _getByKey(Registro);
end;

procedure TControllerCashierItems.getList;
var
  Lc_Qry : TFDQuery;
  LITem : TCashierItems;
begin
  try
    Lc_Qry := createQuery;
    with Lc_Qry do
    Begin
      sql.add(concat(
                'SELECT * ',
                'FROM tb_cashier_items i ',
                'where  (i.tb_institution_id =:institution_id) ',
                'and (i.tb_cashier_id =:cashier_id) ',
                'and (i.terminal =:terminal) '
      ));
      if Trim(Parametro.UltimaAtualizacao) <> '' then
      Begin
        sql.add(' AND ( c.updated_at >:updated_at ) ');
        sql.add(' order by updated_at asc ');
      End
      else
      Begin
        sql.add(' ORDER BY id asc ');
      End;
      //Se há um limite
      if ( Parametro.limite <> '0' ) and (Parametro.limite <> '') then
        sql.add(concat(' limit 0, ',Parametro.limite));
      //Passagem de parametros
      if Trim(Parametro.UltimaAtualizacao) <> '' then
        parambyname('updated_at').AsString := Parametro.UltimaAtualizacao;

      ParamByName('institution_id').AsInteger := Parametro.CaixaItens.Estabelecimento;
      ParamByName('cashier_id').AsInteger     := Parametro.CaixaItens.Caixa;
      ParamByName('terminal').AsInteger       := Parametro.CaixaItens.Terminal;
      Active := True;
      FetchAll;
      First;
      Lista.Clear;
      while not eof do
      Begin
        LITem := TCashierItems.Create;
        get(Lc_Qry,LITem);
        Lista.add(LITem);
        next;
      end;
    end;
  finally
    FinalizaQuery(Lc_Qry);
  end;
end;

function TControllerCashierItems.insert: boolean;
begin
  try
    if Registro.Codigo = 0 then
      Registro.Codigo := getNextByField(Registro,'id',Registro.Estabelecimento);
    insertObj(Registro);
    Result := true;
  except
    Result := False;
  end;
end;

function TControllerCashierItems.save: boolean;
begin
  if Registro.Codigo = 0 then
    Registro.Codigo := getNextByField(Registro,'id',0);
  try
    SaveObj(Registro);
    Result := true;
  except
    Result := False;
  end;
end;

procedure TControllerCashierItems.setParametro(par: String);
begin
  Parametro:= TJson.JsonToObject<TPrmCashierItems>(par);
  //Tratar Data
  Parametro.UltimaAtualizacao := dataMysql(Parametro.UltimaAtualizacao);
end;

function TControllerCashierItems.update: boolean;
begin
   try
    updateObj(Registro);
    Result := true;
  except
    Result := False;
  end;
end;

end.
