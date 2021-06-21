unit ControllerSalesmanHasStock;

interface
 uses
  System.Classes, System.SysUtils, System.Variants, FireDAC.Comp.Client,
  FireDAC.Stan.Param,
  BaseController, tblSalesmanHasStock, prm_salesman_has_stock,
   objCashier, TypesCollection, System.Generics.Collections;
 Type

  TControllerSalesmanHasStock = Class(TBaseController)
  private

  public
    Registro : TSalesmanHasStock;
    Parametro : TPrmSalesmanHasStock;
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    function save:boolean;
    function update:boolean;
    procedure getList;
    procedure getListObjCashier;
    function delete: boolean;
    function insert:boolean;
    procedure clear;
    function getbySalesman:Boolean;
    function getMain:Integer;
  End;

implementation

{ TControllerSalesmanHasStock }

procedure TControllerSalesmanHasStock.clear;
begin
  clearObj(Registro);
end;

constructor TControllerSalesmanHasStock.Create(AOwner: TComponent);
begin
  inherited;
  Registro  := TSalesmanHasStock.Create;
  Parametro := TPrmSalesmanHasStock.create;
end;

function TControllerSalesmanHasStock.delete: boolean;
begin
  try
    deleteObj(Registro);
    Result := True;
  except
    Result := False;
  end;
end;

destructor TControllerSalesmanHasStock.Destroy;
begin
  Parametro.Destroy;
  Registro.DisposeOf;
  inherited;
end;

function TControllerSalesmanHasStock.getbySalesman: Boolean;
var
  Lc_Qry : TFDQuery;
begin
  Try
    Lc_Qry := createQuery;
    with Lc_Qry do
    Begin
      sql.add(concat('SELECT * ',
                     'FROM tb_salesman_has_stock ',
                     'WHERE tb_institution_id =:tb_institution_id ',
                     ' and tb_salesman_id=:tb_salesman_id '
      ));

      ParamByName('tb_institution_id').AsInteger  := Parametro.Estabelecimento;
      ParamByName('tb_salesman_id').AsInteger     := Parametro.Vendedor;
      Active := True;
      FetchAll;
      First;
      exist := RecordCount > 0;
      if exist then
        get(Lc_Qry,Registro);
    end;
  Finally
    FinalizaQuery(Lc_Qry);
  End;
end;

procedure TControllerSalesmanHasStock.getList;
begin

end;

procedure TControllerSalesmanHasStock.getListObjCashier;
begin

end;

function TControllerSalesmanHasStock.getMain: Integer;
var
  Lc_Qry : TFDQuery;
begin
  Try
    Lc_Qry := createQuery;
    with Lc_Qry do
    Begin
      sql.add(concat('SELECT id ',
                     'FROM tb_stock_list ',
                     'WHERE tb_institution_id =:tb_institution_id ',
                     ' and kind = ''S'' '
      ));

      ParamByName('tb_institution_id').AsInteger  := Parametro.Estabelecimento;
      Active := True;
      FetchAll;
      First;
      exist := RecordCount > 0;
      if exist then
        REsult := FieldByNAme('id').AsInteger
      else
        REsult := 1;
    end;
  Finally
    FinalizaQuery(Lc_Qry);
  End;

end;

function TControllerSalesmanHasStock.insert: boolean;
begin
  try
    insertObj(Registro);
    Result := True;
  except
    Result := False;
  end;

end;

function TControllerSalesmanHasStock.save: boolean;
begin
  try
    SaveObj(Registro);
    Result := True;
  except
    Result := False;
  end;

end;

function TControllerSalesmanHasStock.update: boolean;
begin
  try
    UpdateObj(Registro);
    Result := True;
  except
    Result := False;
  end;

end;

end.
