unit tblFinancialStatement;

interface

Uses GenericEntity,CAtribEntity, System.Classes, System.SysUtils;
Type
  //nome da classe de entidade
  [TableName('tb_financial_statement')]
  TFinancialStatement = Class(TGenericEntity)
  private
    Fmanual_history: String;
    Fsettled_code: Integer;
    Fcredit_value: Real;
    FFuture: String;
    Ftb_bank_historic_id: Integer;
    Ftb_payment_types_id: Integer;
    Fdebit_value: Real;
    FId: Integer;
    Ftb_bank_account_id: Integer;
    Fupdated_at: TDAteTime;
    Fconferred: String;
    Ftb_financial_plans_id_cre: Integer;
    Fdoc_reference: String;
    Ftb_institution_id: Integer;
    Ftb_financial_plans_id_deb: Integer;
    Fdt_original: TDateTime;
    Ftb_user_id: Integer;
    Fkind: String;
    Fterminal: Integer;
    Fdt_record: TDateTime;
    Fcreated_at: TDAteTime;
    procedure setFconferred(const Value: String);
    procedure setFcreated_at(const Value: TDAteTime);
    procedure setFcredit_value(const Value: Real);
    procedure setFdebit_value(const Value: Real);
    procedure setFdoc_reference(const Value: String);
    procedure setFdt_original(const Value: TDateTime);
    procedure setFdt_record(const Value: TDateTime);
    procedure setFFuture(const Value: String);
    procedure setFId(const Value: Integer);
    procedure setFkind(const Value: String);
    procedure setFmanual_history(const Value: String);
    procedure setFsettled_code(const Value: Integer);
    procedure setFtb_bank_account_id(const Value: Integer);
    procedure setFtb_bank_historic_id(const Value: Integer);
    procedure setFtb_financial_plans_id_cre(const Value: Integer);
    procedure setFtb_financial_plans_id_deb(const Value: Integer);
    procedure setFtb_institution_id(const Value: Integer);
    procedure setFtb_payment_types_id(const Value: Integer);
    procedure setFtb_user_id(const Value: Integer);
    procedure setFterminal(const Value: Integer);
    procedure setFupdated_at(const Value: TDAteTime);

  public

    [KeyField('id')]
    [FieldName('id')]
    property Codigo: Integer read FId write setFId;

    [KeyField('tb_institution_id')]
    [FieldName('tb_institution_id')]
    property Estabelecimento: Integer read Ftb_institution_id write setFtb_institution_id;

    [KeyField('terminal')]
    [FieldName('terminal')]
    property Terminal: Integer read Fterminal write setFterminal;

    [FieldName('tb_bank_account_id')]
    property ContaCorrente: Integer read Ftb_bank_account_id write setFtb_bank_account_id;

    [FieldName('dt_record')]
    property Data: TDateTime read Fdt_record write setFdt_record;

    [FieldName('tb_bank_historic_id')]
    property HistoricoBancario: Integer read Ftb_bank_historic_id write setFtb_bank_historic_id;

    [FieldName('credit_value')]
    property ValorCredito: Real read Fcredit_value write setFcredit_value;

    [FieldName('debit_value')]
    property ValorDebito: Real read Fdebit_value write setFdebit_value;

    [FieldName('manual_history')]
    property HistoricoManual: String read Fmanual_history write setFmanual_history;

    [FieldName('kind')]
    property TipoMovimento: String read Fkind write setFkind;

    [FieldName('settled_code')]
    property CodigoQuitacao: Integer read Fsettled_code write setFsettled_code;

    [FieldName('tb_user_id')]
    property Usuario: Integer read Ftb_user_id write setFtb_user_id;


    [FieldName('future')]
    property ValorFuturo: String read FFuture write setFFuture;


    [FieldName('dt_original')]
    property DataOriginal: TDateTime read Fdt_original write setFdt_original;

    [FieldName('doc_reference')]
    property DocReferencia: String read Fdoc_reference write setFdoc_reference;


    [FieldName('conferred')]
    property Conferido: String read Fconferred write setFconferred;

    [FieldName('tb_payment_types_id')]
    property FormaPagamento: Integer read Ftb_payment_types_id write setFtb_payment_types_id;

    [FieldName('tb_financial_plans_id_cre')]
    property ContaCredito : Integer read Ftb_financial_plans_id_cre write setFtb_financial_plans_id_cre;

    [FieldName('tb_financial_plans_id_deb')]
    property ContaDebito: Integer read Ftb_financial_plans_id_deb write setFtb_financial_plans_id_deb;

    [FieldName('created_at')]
    property RegistroCriado: TDAteTime read Fcreated_at write setFcreated_at;

    [FieldName('updated_at')]
    property RegistroAlterado: TDAteTime read Fupdated_at write setFupdated_at;

  End;


implementation


{ TFinancialStatement }

procedure TFinancialStatement.setFconferred(const Value: String);
begin
  Fconferred := Value;
end;

procedure TFinancialStatement.setFcreated_at(const Value: TDAteTime);
begin
  Fcreated_at := Value;
end;

procedure TFinancialStatement.setFcredit_value(const Value: Real);
begin
  Fcredit_value := Value;
end;

procedure TFinancialStatement.setFdebit_value(const Value: Real);
begin
  Fdebit_value := Value;
end;

procedure TFinancialStatement.setFdoc_reference(const Value: String);
begin
  Fdoc_reference := Value;
end;

procedure TFinancialStatement.setFdt_original(const Value: TDateTime);
begin
  Fdt_original := Value;
end;

procedure TFinancialStatement.setFdt_record(const Value: TDateTime);
begin
  Fdt_record := Value;
end;

procedure TFinancialStatement.setFFuture(const Value: String);
begin
  FFuture := Value;
end;

procedure TFinancialStatement.setFId(const Value: Integer);
begin
  FId := Value;
end;

procedure TFinancialStatement.setFkind(const Value: String);
begin
  Fkind := Value;
end;

procedure TFinancialStatement.setFmanual_history(const Value: String);
begin
  Fmanual_history := Value;
end;

procedure TFinancialStatement.setFsettled_code(const Value: Integer);
begin
  Fsettled_code := Value;
end;

procedure TFinancialStatement.setFtb_bank_account_id(const Value: Integer);
begin
  Ftb_bank_account_id := Value;
end;

procedure TFinancialStatement.setFtb_bank_historic_id(const Value: Integer);
begin
  Ftb_bank_historic_id := Value;
end;

procedure TFinancialStatement.setFtb_financial_plans_id_cre(
  const Value: Integer);
begin
  Ftb_financial_plans_id_cre := Value;
end;

procedure TFinancialStatement.setFtb_financial_plans_id_deb(
  const Value: Integer);
begin
  Ftb_financial_plans_id_deb := Value;
end;

procedure TFinancialStatement.setFtb_institution_id(const Value: Integer);
begin
  Ftb_institution_id := Value;
end;

procedure TFinancialStatement.setFtb_payment_types_id(const Value: Integer);
begin
  Ftb_payment_types_id := Value;
end;

procedure TFinancialStatement.setFtb_user_id(const Value: Integer);
begin
  Ftb_user_id := Value;
end;

procedure TFinancialStatement.setFterminal(const Value: Integer);
begin
  Fterminal := Value;
end;

procedure TFinancialStatement.setFupdated_at(const Value: TDAteTime);
begin
  Fupdated_at := Value;
end;

end.
