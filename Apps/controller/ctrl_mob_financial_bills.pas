unit ctrl_mob_financial_bills;

interface
uses System.Classes, System.SysUtils,ctrl_mob_base,
      tblFinancialBills, tblEntity, FireDAC.Comp.Client,Md5,prm_financial,
      FireDAC.Stan.Param,ctrl_mob_financial, ctrl_mob_financial_payment, ctrl_mob_payment_type, objFinancialBills,
      TypesCollection, ctrl_mob_financial_statement, tblFinancialStatement;

Type
  TCtrlMobFinancialBills = class(TCtrlMobBase)

    procedure clear;
  private

  public
    Registro      : TFinancialBills;
    MFinancial    : TCtrlMobFinancial;
    MPayment      : TCtrlMobFinancialPayment;
    MPaymentType  : TCtrlMobPaymentType;
    MStatement    : TCtrlMobFinancialStatement;
    Lista         : TListFinancialBills;
    Obj           : TObjFinancialBills;
    Parametro     : TPrmFinancial;
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure setParametro(par:String);
    procedure createTable;
    function save:boolean;
    function insert:boolean;
    function getbykey:Boolean;
    function getAllbykey:Boolean;
    procedure FillDataObjeto(PcRegistro: TFinancialBills);
    function saveDataObjeto(DObj : TObjFinancialBills):Boolean;
    function getlist:Boolean;

  End;

implementation

{ TCtrlMobFinancialBills }



procedure TCtrlMobFinancialBills.clear;
begin
  clearObj(Registro);
end;

constructor TCtrlMobFinancialBills.Create(AOwner: TComponent);
begin
  inherited;
  Registro            := TFinancialBills.Create;
  MFinancial          := TCtrlMobFinancial.Create(Self);
  MPayment            := TCtrlMobFinancialPayment.Create(Self);
  MPaymentType        := TCtrlMobPaymentType.Create(Self);
  MStatement          := TCtrlMobFinancialStatement.Create(Self);
  Lista               := TListFinancialBills.Create;
  Obj                 := TObjFinancialBills.Create;
  Parametro           := TPrmFinancial.Create;
  createTable;
end;

procedure TCtrlMobFinancialBills.createTable;
begin
  execcmd(concat(
                'CREATE TABLE if not exists tb_financial_bills ( ',
                '  tb_institution_id int(11) NOT NULL, ',
                '  tb_order_id int(11) NOT NULL, ',
                '  terminal int(11) NOT NULL DEFAULT ''0'', ',
                '  parcel int(11) NOT NULL, ',
                '  tb_financial_plans_id int(11) NOT NULL DEFAULT ''0'', ',
                '  number varchar(60) DEFAULT NULL, ',
                '  kind varchar(2) DEFAULT NULL, ',
                '  situation varchar(1) DEFAULT NULL, ',
                '  operation varchar(1) DEFAULT NULL, ',
                '  stage varchar(1) DEFAULT NULL, ',
                '  created_at datetime DEFAULT NULL, ',
                '  updated_at datetime DEFAULT NULL) '
      ));
end;

destructor TCtrlMobFinancialBills.Destroy;
begin
  {$IFDEF WIN32}
  Lista.DisposeOf;
  Registro.DisposeOf;
  Parametro.Destroy;
  inherited;
  {$ENDIF }
end;

procedure TCtrlMobFinancialBills.FillDataObjeto(PcRegistro: TFinancialBills);
var
  I:Integer;
  LcItemFS : TfinancialStatement;
begin
  MFinancial.Registro.Estabelecimento := PcRegistro.Estabelecimento;
  MFinancial.Registro.Terminal        := PcRegistro.Terminal;
  MFinancial.Registro.Ordem           := PcRegistro.Ordem;
  MFinancial.Registro.Parcela         := PcRegistro.Parcela;
  MFinancial.getbyKey;
  if MFinancial.exist then
    ClonarObj(MFinancial.Registro, Obj.Financeiro );

  ClonarObj(PcRegistro, Obj.Contas );

  MPayment.Registro.Estabelecimento := PcRegistro.Estabelecimento;
  MPayment.Registro.Terminal        := PcRegistro.Terminal;
  MPayment.Registro.Ordem           := PcRegistro.Ordem;
  MPayment.Registro.Parcela         := PcRegistro.Parcela;
  MPayment.getbyKey;
  if MPayment.exist then
  Begin
    ClonarObj(MPayment.Registro, Obj.Pagamentos );
    //Movimento
    MStatement.Registro.Estabelecimento := MPayment.Registro.Estabelecimento;
    MStatement.Registro.Terminal        := MPayment.Registro.Terminal;
    MStatement.Registro.CodigoQuitacao  := MPayment.Registro.CodigoBaixa;

    MStatement.getBySettledCode;
    if MStatement.exist then
    BEgin
      LcItemFS := TfinancialStatement.Create;
      ClonarObj(MStatement.Registro,LcItemFS );
      Obj.Movimento.Add(LcItemFS);
    End;
  End;

end;

function TCtrlMobFinancialBills.save: boolean;
begin
  try
    SaveObj(Registro);
    Result := true;
  except
    Result := False;
  end;
end;

function TCtrlMobFinancialBills.saveDataObjeto(
  DObj: TObjFinancialBills): Boolean;
Var
  I:Integer;
begin
  ClonarObj(DObj.Contas,Registro) ;
  Self.save;
  ClonarObj( DObj.Financeiro,MFinancial.Registro );
  MFinancial.save;
  if DObj.Pagamentos.Ordem > 0 then
  Begin
    ClonarObj( DObj.Pagamentos,MPayment.Registro );
    MPayment.save;
  End;
  if  DObj.Movimento.count > 0 then
  Begin
    for I := 0 to DObj.Movimento.count -1 do
    Begin
      ClonarObj(DObj.Movimento[I], MStatement.Registro );
      MStatement.save;
    End;
  End;
end;


procedure TCtrlMobFinancialBills.setParametro(par: String);
begin

end;

function TCtrlMobFinancialBills.getAllbykey: Boolean;
begin
  _getByKey(Registro);

  MFinancial.Registro.Ordem            := Self.Registro.Ordem;
  MFinancial.Registro.Estabelecimento  := Self.Registro.Estabelecimento;
  MFinancial.Registro.Terminal         := Self.Registro.Terminal;
  MFinancial.Registro.Parcela          := Self.Registro.Parcela;
  MFinancial.getByKey;

  MPayment.Registro.Ordem            := Self.Registro.Ordem;
  MPayment.Registro.Estabelecimento  := Self.Registro.Estabelecimento;
  MPayment.Registro.Terminal         := Self.Registro.Terminal;
  MPayment.Registro.Parcela          := Self.Registro.Parcela;
  MPayment.getByKey;

end;

function TCtrlMobFinancialBills.getbykey: Boolean;
begin
  _getByKey(Registro);
end;

function TCtrlMobFinancialBills.getlist: Boolean;
var
  Lc_Qry : TFDQuery;
  LITem : TFinancialBills;
begin
  Try
    Lc_Qry := createQuery;
    with Lc_Qry do
    Begin
      sql.add(concat('SELECT fb.* ',
                      'FROM tb_financial_bills fb ',
                      'WHERE fb.tb_institution_id =:tb_institution_id '
                      ));
      //incremeta SQL
      if Registro.Ordem > 0 then
        sql.add('AND tb_order_id =:tb_order_id');

      if Trim( Parametro.UltimaAtualizacao ) <> '' then
      Begin
        sql.add(' AND ( updated_at >:updated_at ) ');
        sql.add(' order by updated_at asc ');
      End
      else
      Begin
        sql.add(concat(' ORDER BY ',orderby,'  asc '));
      End;

      //Passagem de parametros
      ParamByName('tb_institution_id').AsInteger := Parametro.Finaceiro.Estabelecimento;
      if Parametro.Finaceiro.Ordem > 0 then
        ParamByName('tb_order_id').AsInteger := Parametro.Finaceiro.Ordem;

      if Trim(Parametro.UltimaAtualizacao) <> '' then
        parambyname('updated_at').AsString := Parametro.UltimaAtualizacao;

      Active := True;
      FetchAll;
      First;
      Lista.Clear;
      while not eof do
      Begin
        LITem := TFinancialBills.Create;
        get(Lc_Qry,LITem);
        Lista.add(LITem);
        next;
      end;
    end;
  Finally
    FinalizaQuery(Lc_Qry);
  End;
end;

function TCtrlMobFinancialBills.insert: boolean;
begin
  try
    insertObj(Registro);
    Result := true;
  except
    Result := False;
  end;

end;

end.
