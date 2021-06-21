unit ctrl_mob_financial_payment;


interface
uses System.Classes, System.SysUtils,ctrl_mob_base,
      tblFinancialPayment, tblEntity, FireDAC.Comp.Client,Md5, FireDAC.Stan.Param;

Type
  TCtrlMobFinancialPayment= Class(TCtrlMobBase)
    procedure clear;
  private
    function getSettleCode:Integer;
  public
    Registro : TFinancialPayment;
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure createTable;
    function save:boolean;
    function delete:Boolean;
    function getByKey:Boolean;
    function settle:Boolean;
  End;

implementation

{ TCtrlMobFinancialPayment }

procedure TCtrlMobFinancialPayment.clear;
begin
  clearObj(Registro);
end;

constructor TCtrlMobFinancialPayment.Create(AOwner: TComponent);
begin
  inherited;
  Registro := TFinancialPayment.Create;
  createTable;
end;

procedure TCtrlMobFinancialPayment.createTable;
begin
  execcmd(concat(
                'CREATE TABLE if not exists  tb_financial_payment ( ',
                '  tb_institution_id int(11) NOT NULL, ',
                '  tb_order_id int(11) NOT NULL, ',
                '  terminal int(11) NOT NULL DEFAULT ''0'', ',
                '  parcel int(11) NOT NULL, ',
                '  interest_value decimal(10,2) DEFAULT NULL, ',
                '  late_value decimal(10,2) DEFAULT NULL, ',
                '  discount_aliquot decimal(10,2) DEFAULT NULL, ',
                '  paid_value decimal(10,2) DEFAULT NULL, ',
                '  dt_payment date DEFAULT NULL, ',
                '  dt_real_payment date DEFAULT NULL, ',
                '  settled varchar(1) DEFAULT NULL, ',
                '  tb_financial_plans_id int(11) NOT NULL DEFAULT ''0'', ',
                '  settled_code int(11) DEFAULT NULL, ',
                '  created_at datetime DEFAULT NULL, ',
                '  updated_at datetime DEFAULT NULL) '
      ));
end;

function TCtrlMobFinancialPayment.delete: Boolean;
begin
  try
    deleteObj(Registro);
    Result := True;
  except
    REsult := False;
  end;
end;

destructor TCtrlMobFinancialPayment.Destroy;
begin
  {$IFDEF WIN32}
  Registro.DisposeOf;
  inherited;
  {$ENDIF }
end;

function TCtrlMobFinancialPayment.save: boolean;
begin
  try
    SaveObj(Registro);
    Result := true;
  except
    Result := False;
  end;
end;


function TCtrlMobFinancialPayment.settle: Boolean;
begin
  try
    Registro.CodigoBaixa := getSettleCode;
    insertObj(Registro);
    Result := True;
  except
    Result := False;
  end;
end;

function TCtrlMobFinancialPayment.getByKey: Boolean;
begin
  _getByKey(Registro);
end;

function TCtrlMobFinancialPayment.getSettleCode: Integer;
Var
  Lc_Qry : TFdquery;
begin
  Try
    Lc_Qry := createQuery;
    with Lc_Qry do
    Begin
      Active := False;
      sql.Clear;
      sql.Add(concat(
              'select max(settled_code) code ',
              'from tb_financial_payment fp ',
              'where ( fp.tb_institution_id =:tb_institution_id ) '
      ));
      ParamByName('tb_institution_id').AsInteger := Registro.Estabelecimento;
      Active := True;
      Result := StrToIntDef( FieldByName('code').AsString,0) + 1;
    End;
  Finally
    FinalizaQuery(Lc_Qry);
  End;
end;

end.
