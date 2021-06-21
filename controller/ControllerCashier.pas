unit ControllerCashier;

interface
 uses
  System.Classes, System.SysUtils, System.Variants, FireDAC.Comp.Client,
  FireDAC.Stan.Param, prm_cashier,Rest.json,
  BaseController, tblCashier, ControllerCashierItems, tblCashierItems,
   objCashier, TypesCollection, System.Generics.Collections;
 Type

  TObjListCashier = TObjectList<TObjCashier>;

  TControllerCashier = Class(TBaseController)
  private

  public
    Registro  : TCashier;
    Items     : TControllerCashierItems;
    Obj       : TObjCashier;
    ListaObj : TObjListCashier;
    Lista : TListCashier;
    Parametro : TPrmCashier;

    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure setParametro(par:String);
    function save:boolean;
    function update:boolean;
    function saveDataObjeto(DObj : TobjCashier):Boolean;
    procedure fillDataObjeto(pCashier:TCashier);
    function getByKey:Boolean;Virtual;
    procedure getList;
    procedure getListObjCashier;
    function delete: boolean;
    function insert:boolean;
    procedure clear;
  End;
implementation

{ TControllerCashier }

procedure TControllerCashier.clear;
begin
  clearObj(Registro);
end;

constructor TControllerCashier.Create(AOwner: TComponent);
begin
  inherited;
  Registro  := TCashier.Create;
  Items     := TControllerCashierItems.Create(nil);
  Obj       := TObjCashier.Create;
  ListaObj  := TObjListCashier.Create;
  Lista     := TListCashier.Create;
  Parametro := TPrmCashier.Create;
end;

function TControllerCashier.delete: boolean;
begin
  Try
    deleteObj(Registro);
    Result := True;
  Except
    Result := False;
  End;
end;

destructor TControllerCashier.Destroy;
begin
  Parametro.Destroy;
  Registro.DisposeOf;
  Items.DisposeOf;
  Obj.Destroy;
  ListaObj.DisposeOf;
  Lista.DisposeOf;
  inherited;
end;

procedure TControllerCashier.fillDataObjeto(pCashier: TCashier);
Var
  I:Integer;
  LcItem : TCashierItems;
begin
  Obj.Caixa := pCashier;

  items.Registro.Estabelecimento  := pCashier.Estabelecimento;
  items.Registro.Terminal         := pCashier.Terminal;
  items.Registro.Caixa            :=  pCashier.Codigo;
  Items.getList;
  for I := 0 to Items.Lista.Count-1 do
  Begin
    LcItem := TCashierItems.Create;
    LcItem := Items.Lista[I];
    Obj.Items.Add(LcItem);
  End;
end;

function TControllerCashier.getByKey: Boolean;
begin
  _getByKey(Registro);
end;

procedure TControllerCashier.getList;
var
  Lc_Qry : TFDQuery;
  LITem : TCashier;
begin
  try
    Lc_Qry := createQuery;
    with Lc_Qry do
    Begin
      sql.add(concat(
                'SELECT * ',
                'FROM tb_cashier c ',
                'where (c.id > 0) ',
                'and (c.tb_institution_id =:institution_id) '
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

      ParamByName('institution_id').AsInteger := Parametro.Caixa.Estabelecimento;
      Active := True;
      FetchAll;
      First;
      Lista.Clear;
      while not eof do
      Begin
        LITem := TCashier.Create;
        get(Lc_Qry,LITem);
        Lista.add(LITem);
        next;
      end;
    end;
  finally
    FinalizaQuery(Lc_Qry);
  end;
end;

procedure TControllerCashier.getListObjCashier;
Var
  I : Integer;
  LcReg : TCashier;
begin
  ListaObj.Clear;
  for I := 0 to (Lista.Count - 1)do
  Begin
    LcReg := TCashier.Create;
    LcReg := Lista[I];
    fillDataObjeto(LcReg);
    ListaObj.Add( Obj );
  End;
end;

function TControllerCashier.insert: boolean;
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


function TControllerCashier.save: boolean;
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

function TControllerCashier.saveDataObjeto(DObj: TobjCashier): Boolean;
Var
  I : Integer;
begin
  try
    SaveObj( DObj.Caixa );

    for I := 0 to DObj.Items.Count -1 do
    Begin
      ClonarObj(DObj.Items[I], items.Registro );
      items.save;
    End;
    Result := true;
  except
    Result := False;
  end;
end;

procedure TControllerCashier.setParametro(par: String);
begin
  Parametro:= TJson.JsonToObject<TPrmCashier>(par);
  //Tratar Data
  Parametro.UltimaAtualizacao := dataMysql(Parametro.UltimaAtualizacao);
end;

function TControllerCashier.update: boolean;
begin
   try
    updateObj(Registro);
    Result := true;
  except
    Result := False;
  end;
end;

end.
