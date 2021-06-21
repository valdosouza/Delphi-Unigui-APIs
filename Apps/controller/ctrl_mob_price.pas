unit ctrl_mob_price;

interface

uses System.Classes,ctrl_mob_base, FireDAC.Comp.Client,
  System.SysUtils,  tblPrice;

Type
  TCtrlMobPrice = class(TCtrlMobBase)
    private

    public
      Registro : TPrice;
      constructor Create(AOwner: TComponent); override;
      destructor Destroy; override;
      procedure createTable;
      function getByKey:Boolean;
      function save:Boolean;
      procedure assign(ObjOri : TPrice);
  end;

implementation



uses MainModule;


procedure TCtrlMobPrice.assign(ObjOri: TPrice);
begin
  _assign(ObjOri,Registro);
end;

constructor TCtrlMobPrice.Create(AOwner: TComponent);
begin
  Registro := TPrice.Create;
  createTable;
end;

procedure TCtrlMobPrice.createTable;
begin
  execcmd(concat(
                'CREATE TABLE if not exists  tb_price ( ',
                '  tb_institution_id int(11) , ',
                '  tb_price_list_id int(11) , ',
                '  tb_product_id int(11) , ',
                '  price_tag decimal(10,6) , ',
                '  aliq_profit decimal(10,3) , ',
                '  aliq_kickback decimal(10,2) , ',
                '  quantity decimal(10,3) , ',
                '  created_at timestamp , ',
                '  updated_at timestamp ) ;'
      ));
end;

destructor TCtrlMobPrice.Destroy;
begin
  {$IFDEF WIN32}
	Registro.DisposeOf;
  {$ENDIF }

end;

function TCtrlMobPrice.getByKey: Boolean;
begin
  _getByKey(Registro);
end;

function TCtrlMobPrice.save: Boolean;
begin
  try
    SaveObj(Registro);
    Result := true;
  except
    Result := False;
  end;

end;

end.
