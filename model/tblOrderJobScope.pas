unit tblOrderJobScope;

interface

Uses GenericEntity,GenericDao,CAtribEntity, System.Classes, System.SysUtils;
Type
  //nome da classe de entidade
  [TableName('tb_order_job_scope')]
  TOrderJobScope = Class(TGenericEntity)
  private
    Fdescription: String;
    FId: Integer;
    Fnote: String;
    Fupdated_at: TDAteTime;
    Ftb_work_front_id: Integer;
    Ftb_institution_id: Integer;
    Fdt_forecast: TDateTime;
    Fvalue_forecast: Real;
    Ftb_order_id: Integer;
    Fcreated_at: TDAteTime;
    procedure setFcreated_at(const Value: TDAteTime);
    procedure setFdescription(const Value: String);
    procedure setFdt_forecast(const Value: TDateTime);
    procedure setFId(const Value: Integer);
    procedure setFnote(const Value: String);
    procedure setFtb_institution_id(const Value: Integer);
    procedure setFtb_order_id(const Value: Integer);
    procedure setFtb_work_front_id(const Value: Integer);
    procedure setFupdated_at(const Value: TDAteTime);
    procedure setFvalue_forecast(const Value: Real);

  public
    [FieldName('id')]
    [KeyField('id')]
    property Codigo: Integer read FId write setFId;

    [FieldName('tb_institution_id')]
    [KeyField('tb_institution_id')]
    property Estabelecimento: Integer read Ftb_institution_id write setFtb_institution_id;

    [FieldName('tb_order_id')]
    [KeyField('tb_order_id')]
    property Ordem: Integer read Ftb_order_id write setFtb_order_id;

    [FieldName('description')]
    property Descricao: String read Fdescription write setFdescription;

    [FieldName('tb_work_front_id')]
    property FrenteTrabalho: Integer read Ftb_work_front_id write setFtb_work_front_id;

    [FieldName('note')]
    property Detalhes: String read Fnote write setFnote;

    [FieldName('dt_forecast')]
    property DataPrevista: TDateTime read Fdt_forecast write setFdt_forecast;

    [FieldName('value_forecast')]
    property ValorPrevisto: Real read Fvalue_forecast write setFvalue_forecast;

    [FieldName('created_at')]
    property RegistroCriado: TDAteTime read Fcreated_at write setFcreated_at;

    [FieldName('updated_at')]
    property RegistroAlterado: TDAteTime read Fupdated_at write setFupdated_at;

  End;
implementation



{ TOrderJobScope }

procedure TOrderJobScope.setFcreated_at(const Value: TDAteTime);
begin
  Fcreated_at := Value;
end;

procedure TOrderJobScope.setFdescription(const Value: String);
begin
  Fdescription := Value;
end;

procedure TOrderJobScope.setFdt_forecast(const Value: TDateTime);
begin
  Fdt_forecast := Value;
end;

procedure TOrderJobScope.setFId(const Value: Integer);
begin
  FId := Value;
end;

procedure TOrderJobScope.setFnote(const Value: String);
begin
  Fnote := Value;
end;

procedure TOrderJobScope.setFtb_institution_id(const Value: Integer);
begin
  Ftb_institution_id := Value;
end;

procedure TOrderJobScope.setFtb_order_id(const Value: Integer);
begin
  Ftb_order_id := Value;
end;

procedure TOrderJobScope.setFtb_work_front_id(const Value: Integer);
begin
  Ftb_work_front_id := Value;
end;

procedure TOrderJobScope.setFupdated_at(const Value: TDAteTime);
begin
  Fupdated_at := Value;
end;

procedure TOrderJobScope.setFvalue_forecast(const Value: Real);
begin
  Fvalue_forecast := Value;
end;

end.
