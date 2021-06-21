unit ctrl_mob_stock;

interface

uses System.Classes,System.SysUtils, FireDAC.Comp.Client,
    tblStock, ctrl_mob_base,ctrl_mob_stock_list;

Type
  TCtrlMobStock = class(TCtrlMobBase)
    private

    public
      Registro : TStock;
      StockList : TCtrlMobStockList;
      constructor Create(AOwner: TComponent); override;
      destructor Destroy; override;
      procedure createTable;
      function save:Boolean;
      procedure assign(ObjOri : TStock);
  end;

implementation


uses MainModule;


procedure TCtrlMobStock.assign(ObjOri: TStock);
begin
  _assign(ObjOri,Registro);
end;

constructor TCtrlMobStock.Create(AOwner: TComponent);
begin
  Registro := TStock.Create;
  StockList := TCtrlMobStockList.Create(Self);
  createTable;
end;

procedure TCtrlMobStock.createTable;
begin
  execcmd(concat(
                'CREATE TABLE if not exists tb_stock ( ',
                '  tb_institution_id int(11) , ',
                '  tb_merchandise_id int(11)   , ',
                '  tb_package_id int(11) , ',
                '  tb_measure_id int(11) , ',
                '  tb_color_id int(11) , ',
                '  codebar varchar(20) , ',
                '  st char(1) , ',
                '  quantity decimal(10,4) , ',
                '  minimum decimal(10,4) , ',
                '  divisor int(11) , ',
                '  location varchar(100) , ',
                '  weight decimal(10,4) , ',
                '  width decimal(10,4) , ',
                '  length decimal(10,4) , ',
                '  height decimal(10,4) , ',
                '  cost_manufactures decimal(10,4) , ',
                '  actual_cost decimal(10,4) , ',
                '  cost_price decimal(10,4) , ',
                '  negative char(1) DEFAULT ''S'', ',
                '  outline char(1) , ',
                '  created_at datetime , ',
                '  updated_at datetime ) ; '
      ));
end;

destructor TCtrlMobStock.Destroy;
begin
  {$IFDEF WIN32}
  Registro.DisposeOf;
  StockList.DisposeOf;
  {$ENDIF }
end;

function TCtrlMobStock.save: Boolean;
begin
  try
    SaveObj(Registro);
    Result := true;
  except
    Result := False;
  end;
end;

end.
