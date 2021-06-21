unit ControllerFinancialBills;

interface
uses System.Classes, System.SysUtils,BaseController, prm_financial,Rest.Json,
      tblFinancialBills, tblEntity, FireDAC.Comp.Client,Md5,prm_base,
      FireDAC.Stan.Param,ControllerFinancial,  ControllerFinancialPayment,ControllerPaymentTypes, objFinancialBills,
      TypesCollection, ControllerFinancialStatement, tblFinancialStatement;

Type
  TControllerFinancialBills = Class(TBaseController)
    Lista : TListFinancialBills;
    procedure clear;
  private

  public
    Registro : TFinancialBills;
    Financial : TControllerFinancial;
    Payment : TControllerFinancialPayment;
    PaymentType : TControllerPaymentTypes;
    Statement : TControllerFinancialStatement;
    Obj : TObjFinancialBills;
    Parametro : TPrmFinancial;
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure setParametro(par:String);
    function save:boolean;
    function getbykey:Boolean;
    function getAllbykey:Boolean;
    function saveDataObjeto(DObj : TObjFinancialBills):Boolean;
    procedure FillDataObjeto(pRegistro:TFinancialBills;DObj : TObjFinancialBills);
    procedure getlist;
    procedure getlistResults;
  End;

implementation

{ ControllerFinancialBills }



procedure TControllerFinancialBills.clear;
begin
  clearObj(Registro);
end;

constructor TControllerFinancialBills.Create(AOwner: TComponent);
begin
  inherited;
  Registro  := TFinancialBills.Create;
  Financial := TControllerFinancial.Create(Self);
  Payment   := TControllerFinancialPayment.Create(Self);
  PaymentType := TControllerPaymentTypes.Create(Self);
  Lista     := TListFinancialBills.Create;
  Statement := TControllerFinancialStatement.Create(Self);
  Obj := TObjFinancialBills.Create;
  Parametro := TPrmFinancial.create;
end;

destructor TControllerFinancialBills.Destroy;
begin
  Parametro.Destroy;
  Obj.Destroy;
  Registro.DisposeOf;
  Financial.DisposeOf;
  Payment.DisposeOf;
  PaymentType.DisposeOf;
  Lista.DisposeOf;
  Statement.DisposeOf;
  inherited;
end;

procedure TControllerFinancialBills.FillDataObjeto(pRegistro: TFinancialBills;
  DObj: TObjFinancialBills);
var
  I:Integer;
  LcItemFS : TfinancialStatement;
begin
  Financial.Registro.Estabelecimento := PRegistro.Estabelecimento;
  Financial.Registro.Terminal        := PRegistro.Terminal;
  Financial.Registro.Ordem           := PRegistro.Ordem;
  Financial.Registro.Parcela         := PRegistro.Parcela;
  Financial.getbyKey;
  if Financial.exist then
    ClonarObj(Financial.Registro, DObj.Financeiro );

  ClonarObj(PRegistro, DObj.Contas );

  Payment.Registro.Estabelecimento := PRegistro.Estabelecimento;
  Payment.Registro.Terminal        := PRegistro.Terminal;
  Payment.Registro.Ordem           := PRegistro.Ordem;
  Payment.Registro.Parcela         := PRegistro.Parcela;
  Payment.getbyKey;
  if Payment.exist then
  Begin
    ClonarObj(Payment.Registro, DObj.Pagamentos );
    //Movimento
    Statement.Registro.Estabelecimento := Payment.Registro.Estabelecimento;
    Statement.Registro.Terminal        := Payment.Registro.Terminal;
    Statement.Registro.CodigoQuitacao  := Payment.Registro.CodigoBaixa;

    Statement.getBySettledCode;
    if Statement.exist then
    BEgin
      LcItemFS := TfinancialStatement.Create;
      ClonarObj(Statement.Registro,LcItemFS );
      DObj.Movimento.Add(LcItemFS);
    End;
  End;
end;

function TControllerFinancialBills.save: boolean;
begin
  try
    SaveObj(Registro);
    Result := true;
  except
    Result := False;
  end;
end;

function TControllerFinancialBills.saveDataObjeto(
  DObj: TObjFinancialBills): Boolean;
Var
  I:Integer;
begin
  Try
    ClonarObj(DObj.Contas,Registro) ;
    Self.save;
    ClonarObj( DObj.Financeiro,Financial.Registro );
    Financial.save;
    if DObj.Pagamentos.Ordem > 0 then
    Begin
      ClonarObj( DObj.Pagamentos,Payment.Registro );
      Payment.save;
    End;
    if  DObj.Movimento.count > 0 then
    Begin
      for I := 0 to DObj.Movimento.count -1 do
      Begin
        ClonarObj(DObj.Movimento[I], Statement.Registro );
        Statement.save;
      End;
    End;
    Result := true;
  except
    Result := False;
  end;
end;


procedure TControllerFinancialBills.setParametro(par: String);
begin
  Parametro:= TJson.JsonToObject<TPrmFinancial>(par);
  //Tratar Data
  Parametro.UltimaAtualizacao := dataMysql(Parametro.UltimaAtualizacao);
end;

function TControllerFinancialBills.getAllbykey: Boolean;
begin
  _getByKey(Registro);

  Financial.Registro.Ordem            := Self.Registro.Ordem;
  Financial.Registro.Estabelecimento  := Self.Registro.Estabelecimento;
  Financial.Registro.Terminal         := Self.Registro.Terminal;
  Financial.Registro.Parcela          := Self.Registro.Parcela;
  Financial.getByKey;

  Payment.Registro.Ordem            := Self.Registro.Ordem;
  Payment.Registro.Estabelecimento  := Self.Registro.Estabelecimento;
  Payment.Registro.Terminal         := Self.Registro.Terminal;
  Payment.Registro.Parcela          := Self.Registro.Parcela;
  Payment.getByKey;

end;

function TControllerFinancialBills.getbykey: Boolean;
begin
  _getByKey(Registro);
end;

procedure TControllerFinancialBills.getlist;
var
  Lc_Qry : TFDQuery;
  LITem : TFinancialBills;
begin
  Try
    Lc_Qry := createQuery;
    with Lc_Qry do
    Begin
      sql.add(concat('SELECT * ',
                      'FROM tb_financial_bills ',
                      'WHERE tb_institution_id =:tb_institution_id '
                      ));
      //Incrementa SQL
      //Verifica de quais dispositivos serão feitos os downloads

      if Parametro.Finaceiro.Terminal > 0 then
        sql.add(' and (terminal =:terminal)' );


      if Trim(Parametro.UltimaAtualizacao) <> '' then
      Begin
        sql.add(' AND ( updated_at >:updated_at ) ');
        sql.add(' order by updated_at asc ');
      End
      else
      Begin
        if Trim(orderby)='' then orderby := 'tb_order_id';
        sql.add(concat(' ORDER BY ',orderby,'  asc '));
      End;

      //Passagem de parametros
      parambyname('tb_institution_id').AsInteger := Parametro.Finaceiro.Estabelecimento;

      if Parametro.Finaceiro.Terminal > 0 then
        parambyname('terminal').AsInteger := Parametro.Finaceiro.Terminal;

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


procedure TControllerFinancialBills.getlistResults;
var
  Lc_Qry : TFDQuery;
  LITem : TFinancialBills;
begin
  Try
    Lc_Qry := createQuery;
    with Lc_Qry do
    Begin
      sql.add(concat('SELECT * ',
                      'FROM tb_financial_bills ',
                      'WHERE tb_institution_id =:tb_institution_id '
                      ));

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

end.
