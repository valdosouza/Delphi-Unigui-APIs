unit tblFinancialBills;

interface

Uses GenericEntity,CAtribEntity;

Type
  //nome da classe de entidade
  [TableName('tb_financial_bills')]
  TFinancialBills = Class(TGenericEntity)
  private
    Foperation: String;
    Fupdated_at: TDAteTime;
    Fnumber: String;
    Fsituation: String;
    Ftb_institution_id: Integer;
    Fstage: String;
    Fkind: String;
    Ftb_order_id: Integer;
    Ftb_financial_plans_id: Integer;
    Fcreated_at: TDAteTime;
    Fparcel: Integer;
    FTerminal: Integer;
    procedure setFcreated_at(const Value: TDAteTime);
    procedure setFkind(const Value: String);
    procedure setFnumber(const Value: String);
    procedure setFoperation(const Value: String);
    procedure setFparcel(const Value: Integer);
    procedure setFsituation(const Value: String);
    procedure setFstage(const Value: String);
    procedure setFtb_financial_plans_id(const Value: Integer);
    procedure setFtb_institution_id(const Value: Integer);
    procedure setFtb_order_id(const Value: Integer);
    procedure setFupdated_at(const Value: TDAteTime);
    procedure setFTerminal(const Value: Integer);



  public
    [KeyField('tb_institution_id')]
    [FieldName('tb_institution_id')]
    property Estabelecimento: Integer read Ftb_institution_id write setFtb_institution_id;

    [KeyField('tb_order_id')]
    [FieldName('tb_order_id')]
    property Ordem: Integer read Ftb_order_id write setFtb_order_id;

    [KeyField('terminal')]
    [FieldName('terminal')]
    property Terminal: Integer read FTerminal write setFTerminal;

    [KeyField('parcel')]
    [FieldName('parcel')]
    property Parcela: Integer read Fparcel write setFparcel;


    [FieldName('tb_financial_plans_id')]
    property PlanoContas: Integer read Ftb_financial_plans_id write setFtb_financial_plans_id;

    [FieldName('number')]
    property Numero: String read Fnumber write setFnumber;

    [FieldName('kind')]
    property Tipo: String read Fkind write setFkind;

    [FieldName('situation')]
    property Situacao: String read Fsituation write setFsituation;

    [FieldName('operation')]
    property Operacao: String read Foperation write setFoperation;

    [FieldName('stage')]
    property Fase: String read Fstage write setFstage;

    [FieldName('created_at')]
    property RegistroCriado: TDAteTime read Fcreated_at write setFcreated_at;

    [FieldName('updated_at')]
    property RegistroAlterado: TDAteTime read Fupdated_at write setFupdated_at;

	End;

implementation


{ TFinancialBills }

procedure TFinancialBills.setFcreated_at(const Value: TDAteTime);
begin
  Fcreated_at := Value;
end;

procedure TFinancialBills.setFkind(const Value: String);
begin
  Fkind := Value;
end;

procedure TFinancialBills.setFnumber(const Value: String);
begin
  Fnumber := Value;
end;

procedure TFinancialBills.setFoperation(const Value: String);
begin
  Foperation := Value;
end;

procedure TFinancialBills.setFparcel(const Value: Integer);
begin
  Fparcel := Value;
end;

procedure TFinancialBills.setFsituation(const Value: String);
begin
  Fsituation := Value;
end;

procedure TFinancialBills.setFstage(const Value: String);
begin
  Fstage := Value;
end;

procedure TFinancialBills.setFtb_financial_plans_id(const Value: Integer);
begin
  Ftb_financial_plans_id := Value;
end;

procedure TFinancialBills.setFtb_institution_id(const Value: Integer);
begin
  Ftb_institution_id := Value;
end;

procedure TFinancialBills.setFtb_order_id(const Value: Integer);
begin
  Ftb_order_id := Value;
end;

procedure TFinancialBills.setFTerminal(const Value: Integer);
begin
  FTerminal := Value;
end;

procedure TFinancialBills.setFupdated_at(const Value: TDAteTime);
begin
  Fupdated_at := Value;
end;

end.
