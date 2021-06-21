unit ctrl_mob_order_totalizer;

interface

uses System.Classes,System.SysUtils,
  FireDAC.Comp.Client, tblOrderTotalizer, ctrl_mob_base;

Type
  TCtrlMobOrderTotalizer = class(TCtrlMobBase)
    private

    public
      Registro : TOrderTotalizer;
      constructor Create(AOwner: TComponent); override;
      destructor Destroy; override;
      procedure createTable;
      function save:Boolean;
      function getbyKey:Boolean;
      function delete:Boolean;
      procedure Clear;
  end;

implementation

  { TCtrlMobOrderTotalizer }

uses MainModule;


procedure TCtrlMobOrderTotalizer.Clear;
begin
  clearObj(Registro);
end;

constructor TCtrlMobOrderTotalizer.Create(AOwner: TComponent);
begin
  Registro := TOrderTotalizer.create;
  createTable;
end;

procedure TCtrlMobOrderTotalizer.createTable;
begin
  execcmd(concat(
            'CREATE TABLE   if not exists  tb_order_totalizer ( ',
            '  id int(11) NOT NULL, ',
            '  tb_institution_id int(11) NOT NULL, ',
            '  terminal int(11) NOT NULL ,  ',
            '  items_qtde int(11) NOT NULL, ',
            '  product_qtde decimal(10,3) DEFAULT NULL, ',
            '  product_value decimal(10,3) DEFAULT NULL, ',
            '  IPI_value decimal(10,3) DEFAULT NULL, ',
            '  discount_aliquot decimal(10,3) DEFAULT NULL, ',
            '  discount_value decimal(10,2) DEFAULT NULL, ',
            '  expenses_value decimal(10,2) DEFAULT NULL, ',
            '  total_value decimal(10,2) DEFAULT NULL, ',
            '  created_at datetime DEFAULT NULL, ',
            '  updated_at datetime DEFAULT NULL) '
      ));
end;

function TCtrlMobOrderTotalizer.delete: Boolean;
begin
  Try
    deleteObj(Registro);
    Result := True;
  Except
    Result := False;
  End;

end;

destructor TCtrlMobOrderTotalizer.Destroy;
begin
  {$IFDEF WIN32}
  Registro.disposeOf;
  {$ENDIF }

end;

function TCtrlMobOrderTotalizer.getbyKey: Boolean;
begin
  _getByKey(Registro);
end;

function TCtrlMobOrderTotalizer.save: Boolean;
begin
  try
    if Registro.Codigo = 0 then
      Registro.Codigo := getNextByField(Registro,'id',Registro.Estabelecimento);
    SaveObj(Registro);
    Result := true;
  except
    Result := False;
  end;
end;

end.
