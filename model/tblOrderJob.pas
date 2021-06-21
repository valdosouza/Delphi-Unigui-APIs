unit tblOrderJob;

interface

Uses GenericEntity,GenericDao,CAtribEntity;

Type
  //nome da classe de entidade
  [TableName('tb_order_job')]
  TOrderJob = Class(TGenericEntity)
  private
    Fcost_value: REal;
    Fdescription: String;
    Ftb_customer_id: Integer;
    Ftb_order_id: Integer;
    Fupdated_at: TDAteTime;
    Fnumber: Integer;
    Fdt_start: TDateTime;
    Ftb_situation_id: Integer;
    Ftb_institution_id: Integer;
    Fdt_forecast: TDateTime;
    Fdt_end: TDateTime;
    Fcreated_at: TDAteTime;
    procedure setFcost_value(const Value: REal);
    procedure setFcreated_at(const Value: TDAteTime);
    procedure setFdescription(const Value: String);
    procedure setFdt_end(const Value: TDateTime);
    procedure setFdt_forecast(const Value: TDateTime);
    procedure setFdt_start(const Value: TDateTime);
    procedure setFnumber(const Value: Integer);
    procedure setFtb_customer_id(const Value: Integer);
    procedure setFtb_institution_id(const Value: Integer);
    procedure setFtb_order_id(const Value: Integer);
    procedure setFtb_situation_id(const Value: Integer);
    procedure setFupdated_at(const Value: TDAteTime);


  public

    [KeyField('id')]
    [FieldName('id')]
    property Codigo: Integer read Ftb_order_id write setFtb_order_id;

    [KeyField('tb_institution_id')]
    [FieldName('tb_institution_id')]
    property Estabelecimento: Integer read Ftb_institution_id write setFtb_institution_id;

    [FieldName('number')]
    property Numero: Integer read Fnumber write setFnumber;

    [FieldName('description')]
    property Descricao: String read Fdescription write setFdescription;

    [FieldName('tb_customer_id')]
    property Cliente :  Integer read Ftb_customer_id write setFtb_customer_id;

    [FieldName('tb_situation_id')]
    property Situacao :  Integer read Ftb_situation_id write setFtb_situation_id;

    [FieldName('dt_start')]
    property DataInicio :  TDateTime read Fdt_start write setFdt_start;

    [FieldName('dt_forecast')]
    property DataPrevista :  TDateTime read Fdt_forecast write setFdt_forecast;

    [FieldName('dt_end')]
    property DataFinal :  TDateTime read Fdt_end write setFdt_end;

    [FieldName('cost_value')]
    property CustodaObra :  REal read Fcost_value write setFcost_value;

    [FieldName('created_at')]
    property RegistroCriado: TDAteTime read Fcreated_at write setFcreated_at;

    [FieldName('updated_at')]
    property RegistroAlterado: TDAteTime read Fupdated_at write setFupdated_at;

  End;

implementation


{ TOrderJob }

procedure TOrderJob.setFcost_value(const Value: REal);
begin
  Fcost_value := Value;
end;

procedure TOrderJob.setFcreated_at(const Value: TDAteTime);
begin
  Fcreated_at := Value;
end;

procedure TOrderJob.setFdescription(const Value: String);
begin
  Fdescription := Value;
end;

procedure TOrderJob.setFdt_end(const Value: TDateTime);
begin
  Fdt_end := Value;
end;

procedure TOrderJob.setFdt_forecast(const Value: TDateTime);
begin
  Fdt_forecast := Value;
end;

procedure TOrderJob.setFdt_start(const Value: TDateTime);
begin
  Fdt_start := Value;
end;

procedure TOrderJob.setFnumber(const Value: Integer);
begin
  Fnumber := Value;
end;

procedure TOrderJob.setFtb_customer_id(const Value: Integer);
begin
  Ftb_customer_id := Value;
end;

procedure TOrderJob.setFtb_institution_id(const Value: Integer);
begin
  Ftb_institution_id := Value;
end;

procedure TOrderJob.setFtb_order_id(const Value: Integer);
begin
  Ftb_order_id := Value;
end;

procedure TOrderJob.setFtb_situation_id(const Value: Integer);
begin
  Ftb_situation_id := Value;
end;

procedure TOrderJob.setFupdated_at(const Value: TDAteTime);
begin
  Fupdated_at := Value;
end;

end.
