unit ctrl_mob_product;

interface

uses System.Classes,ctrl_mob_base, System.SysUtils,
  FireDAC.Comp.Client, tblProduct, ctrl_mob_price;

Type
  TCtrlMobProduct = class(TCtrlMobBase)
    private

    public
      Registro : TProduct;
      price : TCtrlMobPrice;
      constructor Create(AOwner: TComponent); override;
      destructor Destroy; override;
      procedure createTable;
      function save:Boolean;
      procedure assign(ObjOri : TProduct);
      function getByKey:Boolean;

  end;

implementation

uses MainModule;


procedure TCtrlMobProduct.assign(ObjOri: TProduct);
begin
  _assign(ObjOri,Registro);
end;

constructor TCtrlMobProduct.Create(AOwner: TComponent);
begin
  Registro := TProduct.Create;
  price := TCtrlMobPrice.Create(Self);
  createTable;
end;

procedure TCtrlMobProduct.createTable;
begin
  execcmd(concat(
                'CREATE TABLE  if not exists tb_product ( ',
                '  id int(11) , ',
                '  identifier varchar(50) , ',
                '  tb_institution_id int(11) , ',
                '  description varchar(100) , ',
                '  tb_category_id int(11) , ',
                '  tb_financial_plans_id int(11) , ',
                '  promotion char(1) , ',
                '  highlights char(1) , ',
                '  active char(1) , ',
                '  published char(1) , ',
                '  note blob, ',
                '  created_at datetime , ',
                '  updated_at datetime ) ; '
      ));
end;

destructor TCtrlMobProduct.Destroy;
begin
  {$IFDEF WIN32}
  Registro.DisposeOf;
  price.DisposeOf;

  {$ENDIF }
end;

function TCtrlMobProduct.getByKey: Boolean;
begin
  _getByKey(Registro);
end;

function TCtrlMobProduct.save: Boolean;
begin
  try
    SaveObj(Registro);
    Result := true;
  except
    Result := False;
  end;

end;

end.
