unit tblCustomer;

interface

Uses GenericEntity,CAtribEntity;

Type
  //nome da classe de entidade
  [TableName('tb_customer')]
  TCustomer = Class(TGenericEntity)
  private
    Fmultiplier: Real;
    Fcredit_value: Real;
    FActive: String;
    Fby_pass_st: String;
    FID: Integer;
    Fupdated_at: TDAteTime;
    Ftb_salesman_id: Integer;
    Fwallet: String;
    Fcredit_status: String;
    Fconsumer: String;
    Ftb_institution_id: Integer;
    Ftb_carrier_id: Integer;
    Fcreated_at: TDAteTime;
    procedure setFActive(const Value: String);
    procedure setFby_pass_st(const Value: String);
    procedure setFconsumer(const Value: String);
    procedure setFcreated_at(const Value: TDAteTime);
    procedure setFcredit_status(const Value: String);
    procedure setFcredit_value(const Value: Real);
    procedure setFID(const Value: Integer);
    procedure setFmultiplier(const Value: Real);
    procedure setFtb_carrier_id(const Value: Integer);
    procedure setFtb_institution_id(const Value: Integer);
    procedure setFtb_salesman_id(const Value: Integer);
    procedure setFupdated_at(const Value: TDAteTime);
    procedure setFwallet(const Value: String);


  public

    [KeyField('id')]
    [FieldName('id')]
    property Codigo: Integer read FID write setFID;

    [KeyField('tb_institution_id')]
    [FieldName('tb_institution_id')]
    property Estabelecimento: Integer read Ftb_institution_id write setFtb_institution_id;

    [FieldName('tb_salesman_id')]
    property Vendedor: Integer read Ftb_salesman_id write setFtb_salesman_id;

    [FieldName('tb_carrier_id')]
    property Transportador: Integer read Ftb_carrier_id write setFtb_carrier_id;

    [FieldName('credit_status')]
    property SituacaoCredito: String read Fcredit_status write setFcredit_status;

    [FieldName('credit_value')]
    property ValorCredito: Real read Fcredit_value write setFcredit_value;

    [FieldName('wallet')]
    property VendeEmCarteira: String read Fwallet write setFwallet;

    [FieldName('consumer')]
    property ConsumidorFinal: String read Fconsumer write setFconsumer;

    [FieldName('active')]
    property Ativo: String read FActive write setFActive;

    [FieldName('multiplier')]
    property Multiplicador: Real read Fmultiplier write setFmultiplier;

    [FieldName('by_pass_st')]
    property IgnoraST: String read Fby_pass_st write setFby_pass_st;

    [FieldName('created_at')]
    property RegistroCriado: TDAteTime read Fcreated_at write setFcreated_at;

    [FieldName('updated_at')]
    property RegistroAlterado: TDAteTime read Fupdated_at write setFupdated_at;


  End;

implementation


{ TCustomer }

procedure TCustomer.setFActive(const Value: String);
begin
  FActive := Value;
end;

procedure TCustomer.setFby_pass_st(const Value: String);
begin
  Fby_pass_st := Value;
end;

procedure TCustomer.setFconsumer(const Value: String);
begin
  Fconsumer := Value;
end;

procedure TCustomer.setFcreated_at(const Value: TDAteTime);
begin
  Fcreated_at := Value;
end;

procedure TCustomer.setFcredit_status(const Value: String);
begin
  Fcredit_status := Value;
end;

procedure TCustomer.setFcredit_value(const Value: Real);
begin
  Fcredit_value := Value;
end;

procedure TCustomer.setFID(const Value: Integer);
begin
  FID := Value;
end;

procedure TCustomer.setFmultiplier(const Value: Real);
begin
  Fmultiplier := Value;
end;

procedure TCustomer.setFtb_carrier_id(const Value: Integer);
begin
  Ftb_carrier_id := Value;
end;

procedure TCustomer.setFtb_institution_id(const Value: Integer);
begin
  Ftb_institution_id := Value;
end;

procedure TCustomer.setFtb_salesman_id(const Value: Integer);
begin
  Ftb_salesman_id := Value;
end;

procedure TCustomer.setFupdated_at(const Value: TDAteTime);
begin
  Fupdated_at := Value;
end;

procedure TCustomer.setFwallet(const Value: String);
begin
  Fwallet := Value;
end;

end.
