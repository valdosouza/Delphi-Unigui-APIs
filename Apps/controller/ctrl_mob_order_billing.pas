unit ctrl_mob_order_billing;

interface

uses System.Classes,ctrl_mob_base,FireDAC.Comp.Client,
  System.SysUtils, tblOrderBilling;

Type
  TCtrlMobOrderBilling = class(TCtrlMobBase)
    private

    public
      Registro : TOrderBilling;
      constructor Create(AOwner: TComponent); override;
      destructor Destroy; override;
      procedure createTable;
    function save:boolean;
    function getByKey:Boolean;
    function delete:Boolean;
    procedure Clear;

  end;

implementation

  { TCtrlMobOrderBilling }

uses MainModule;


procedure TCtrlMobOrderBilling.Clear;
begin
  clearObj(Registro);
end;

constructor TCtrlMobOrderBilling.Create(AOwner: TComponent);
begin
  Registro := TORderBilling.create;
  createTable;
end;

procedure TCtrlMobOrderBilling.createTable;
begin
  execcmd(concat(
            'CREATE TABLE if not exists tb_order_billing ( ',
            '  id int(11) NOT NULL, ',
            '  tb_institution_id int(11) NOT NULL, ',
            '  terminal int(11) NOT NULL , ',
            '  tb_payment_types_id int(11) NOT NULL, ',
            '  plots varchar(3) DEFAULT NULL, ',
            '  deadline varchar(255) DEFAULT NULL, ',
            '  task_owner int(11) DEFAULT NULL, ',
            '  created_at datetime DEFAULT NULL, ',
            '  updated_at datetime DEFAULT NULL)  '
                ));
end;

function TCtrlMobOrderBilling.delete: Boolean;
begin
  try
    deleteObj(Registro);
    Result := true;
  except
    Result := False;
  end;

end;

destructor TCtrlMobOrderBilling.Destroy;
begin
  {$IFDEF WIN32}
  Registro.disposeOf;
  {$ENDIF }

end;

function TCtrlMobOrderBilling.getByKey: Boolean;
begin
  _getByKey(Registro);
end;

function TCtrlMobOrderBilling.save: boolean;
begin
  try
    SaveObj(Registro);
    Result := true;
  except
    Result := False;
  end;

end;

end.
