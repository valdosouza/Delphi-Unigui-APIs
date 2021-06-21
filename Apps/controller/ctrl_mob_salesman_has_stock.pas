unit ctrl_mob_salesman_has_stock;

interface

uses System.Classes,ctrl_mob_base, System.SysUtils,
  FireDAC.Comp.Client, tblSalesmanHasStock;

Type
  TCtrlMobSalesmanHasStock = class(TCtrlMobBase)
    private

    public
      Registro : TSalesmanHasStock;
      constructor Create(AOwner: TComponent); override;
      destructor Destroy; override;
      procedure createTable;
      function save:Boolean;
      procedure assign(ObjOri : TSalesmanHasStock);
      function getbySalesman:boolean;
  end;

implementation

{ TCtrlMobSalesmanHasStock }

procedure TCtrlMobSalesmanHasStock.assign(ObjOri: TSalesmanHasStock);
begin
  _assign(ObjOri,Registro);
end;

constructor TCtrlMobSalesmanHasStock.Create(AOwner: TComponent);
begin
  inherited;
  Registro := TSalesmanHasStock.Create;
  createTable;
end;

procedure TCtrlMobSalesmanHasStock.createTable;
begin
  execcmd(concat(
                'CREATE TABLE if not exists tb_salesman_has_stock ( ',
                '  tb_institution_id int(11) NOT NULL , ',
                '  tb_salesman_id int(11) NOT NULL , ',
                '  tb_stock_id int(11) NOT NULL , ',
                '  created_at datetime , ',
                '  updated_at datetime , ',
                '  PRIMARY KEY (tb_institution_id,tb_salesman_id,tb_stock_id) ) '
      ));
end;

destructor TCtrlMobSalesmanHasStock.Destroy;
begin
  {$IFDEF WIN32}
  Registro.DisposeOf;
  inherited;
  {$ENDIF }
end;

function TCtrlMobSalesmanHasStock.getbySalesman: boolean;
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

      ParamByName('tb_institution_id').AsInteger  := Registro.Estabelecimento;
      ParamByName('tb_salesman_id').AsInteger     := Registro.Vendedor;
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


function TCtrlMobSalesmanHasStock.save: Boolean;
begin
  try
    SaveObj(Registro);
    Result := TRue;
  Except
    Result := FAlse
  end;
end;

end.

