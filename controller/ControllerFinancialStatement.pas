unit ControllerFinancialStatement;

interface
uses System.Classes, System.SysUtils,BaseController,
      tblFinancialPlans,FireDAC.Comp.Client,Md5, FireDAC.Stan.Param,
      System.Generics.Defaults, System.Generics.Collections,
      tblFinancialStatement, objFinancialStatement, ControllerPaymentTypes;

Type

  TListaFinancialStatement = TObjectList<TFinancialStatement>;

  TControllerFinancialStatement = Class(TBaseController)

    procedure clear;
  private
    function getNext:Integer;
  public
    Registro : TFinancialStatement;
    Lista: TListaFinancialStatement;
    PaymentType : TControllerPaymentTypes;
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    function save:boolean;
    procedure getAll;
    function insert:boolean;
    function getByKey:Boolean;
    function getBySettledCode:Boolean;
    function saveDataObjeto(DObj : TObjFinancialStatement):Boolean;
    function ValorContaRealizada(Fc_Tipo,Fc_Plano,Fc_Campo:String;Fc_DataIni,Fc_DataFim:TDate):Real;
  End;

implementation

{ ControllerFinancialPlans }

uses UnFunctions;


procedure TControllerFinancialStatement.clear;
begin
  clearObj(Registro);
end;

constructor TControllerFinancialStatement.Create(AOwner: TComponent);
begin
  inherited;
  Registro := TFinancialStatement.Create;
  Lista := TListaFinancialStatement.Create;
  PaymentType := TControllerPaymentTypes.create(self);
end;


destructor TControllerFinancialStatement.Destroy;
begin
  PaymentType.disposeOf;
  Registro.disposeOf;
  Lista.disposeOf;
  inherited;
end;


function TControllerFinancialStatement.insert: boolean;
begin
  Registro.Codigo := getNextByField(Registro,'id',Registro.Estabelecimento);
  try
    SaveObj(Registro);
    Result := true;
  except
    Result := False;
  end;
end;

function TControllerFinancialStatement.save: boolean;
begin
  if Registro.Codigo = 0 then
    Registro.Codigo := getNext;
  try
    SaveObj(Registro);
    Result := true;
  except
    Result := False;
  end;
end;


function TControllerFinancialStatement.saveDataObjeto(
  DObj: TObjFinancialStatement): Boolean;
begin
  try
    ClonarObj(DObj.Movimento, Registro );
    if DObj.FormaPagamento <> '' then
    Begin
      PaymentType.Registro.Descricao := DObj.FormaPagamento;
      PaymentType.getByDescripton;
      Registro.FormaPagamento := PaymentType.Registro.Codigo;
    end;
    SaveObj(Registro);
    Result := true;
  except
    Result := False;
  end;
end;

function TControllerFinancialStatement.ValorContaRealizada(Fc_Tipo, Fc_Plano,
  Fc_Campo: String; Fc_DataIni, Fc_DataFim: TDate): Real;
Var
  Lc_Qry : TFDQuery;
begin
  try
    Lc_Qry := createQuery;
    with Lc_Qry do
    Begin
      Active := False;
      SQL.Clear;
      if ( Fc_Tipo = 'R' ) then
      Begin
        SQL.Add('SELECT SUM(' + Fc_Campo + ') total_value '+
                'FROM tb_financial_statement fs '+
                '   INNER JOIN tb_financial_plans fp '+
                '   ON  (fp.id = tb_financial_plans_id_cre) ');
      End
      else
      Begin
        SQL.Add('SELECT SUM(' + Fc_Campo + ') total_value '+
                'FROM tb_financial_statement fs '+
                '   INNER JOIN tb_financial_plans fp '+
                '   ON  (fp.id = tb_financial_plans_id_deb) ');
      End;

      SQL.Add('Where posit_level like  :posit_level AND (fp.dt_record :DATAINI AND :DATAFIM) ');

      ParamByName('posit_level').AsAnsiString := Fc_Plano +'%';
      ParamByName('DATAINI').AsDate := Fc_DataIni;
      ParamByName('DATAFIM').AsDate := Fc_DataFim;
      Active := True;
      Result := FieldByName('total_value').AsFloat;
    end;
  finally
    Lc_Qry.Close;
    FreeAndNil(Lc_Qry);
  end;
end;


procedure TControllerFinancialStatement.getAll;
var
  Lc_Qry : TFDQuery;
  lFinancialSate: TFinancialStatement;
begin
  Lc_Qry := createQuery;
  with Lc_Qry do
  Begin
    sql.add('SELECT * '+
            'FROM tb_financial_statement '+
            'WHERE tb_institution_id =:tb_institution_id '
            );

    ParamByName('tb_institution_id').AsInteger := Registro.Estabelecimento;
    Active := True;
    FetchAll;
    First;
    Lista.Clear;
    while not eof do
    Begin
      lFinancialSate := TFinancialStatement.Create;
      get(Lc_Qry,lFinancialSate);
      Lista.add(lFinancialSate);
      next;
    end;
    Close;
  end;
  FreeAndNil(Lc_Qry);
end;

function TControllerFinancialStatement.getByKey: Boolean;
begin
  _getByKey(Registro);
end;

function TControllerFinancialStatement.getBySettledCode: Boolean;
var
  Lc_Qry : TFDQuery;
  LITem : TFinancialStatement;
begin
  Try
    Lc_Qry := createQuery;
    with Lc_Qry do
    Begin
      sql.add(concat(
              'SELECT fs.* ',
              'FROM tb_financial_statement fs ',
              'WHERE ( fs.tb_institution_id =:tb_institution_id ) ',
              ' and  ( fs.settled_code=:settled_code ) '
      ));
      ParamByName('tb_institution_id').AsInteger := Registro.Estabelecimento;
      ParamByName('settled_code').AsInteger := Registro.CodigoQuitacao;
      Active := True;
      FetchAll;
      exist := RecordCount > 0;
      if exist then
        get(Lc_Qry,Registro);
    end;
  Finally
    FinalizaQuery(Lc_Qry);
  End;
end;

function TControllerFinancialStatement.getNext: Integer;
var
  Lc_qry: TFDQuery;
begin
  Try
    Lc_qry := createQuery;
    with Lc_qry do
    Begin
      sql.Clear;
      sql.Add(concat(
                  'SELECT MAX(id) id ',
                  'FROM tb_financial_statement fs ',
                  ' where ( fs.tb_institution_id =:tb_institution_id ) ',
                  ' and ( fs.terminal =:terminal) '
                  ));
      ParamByName('tb_institution_id').AsInteger  := Registro.Estabelecimento;
      ParamByName('terminal').AsInteger           := Registro.Terminal;
      Active := True;
      First;
      result := StrToIntDef(FieldByName('id').AsString,0) + 1;
    End;
  Finally
    FinalizaQuery(Lc_Qry);
  End;
end;

end.

