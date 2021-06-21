unit tblProposal;

interface
Uses GenericEntity,GenericDao,CAtribEntity, System.Classes, System.SysUtils;
Type
  //nome da classe de entidade
  [TableName('tb_Proposal')]
  TProposal = Class(TGenericEntity)

  private
    Fforecast_time: Ttime;
    Ftb_iteration_id: integer;
    Ftag_value: Real;
    Fupdated_at: TDAteTime;
    Ftb_institution_id: integer;
    FId: Integer;
    Fcreated_at: TDAteTime;
    procedure setFcreated_at(const Value: TDAteTime);
    procedure setFforecast_time(const Value: Ttime);
    procedure setFId(const Value: Integer);
    procedure setFtag_value(const Value: Real);
    procedure setFtb_institution_id(const Value: integer);
    procedure setFtb_iteration_id(const Value: integer);
    procedure setFupdated_at(const Value: TDAteTime);


  public

    [FieldName('tb_iteration_id')]
    [KeyField('tb_iteration_id')]
    property Iteracao: integer read Ftb_iteration_id write setFtb_iteration_id;

    [FieldName('tb_institution_id')]
    [KeyField('tb_institution_id')]
    property Estabelecimento: integer read Ftb_institution_id write setFtb_institution_id;

    [FieldName('tb_order_id')]
    [KeyField('tb_order_id')]
    property Ordem: Integer read FId write setFId;

    [FieldName('forecast_time')]
    property TempoPrevsto: Ttime read Fforecast_time write setFforecast_time;

    [FieldName('tag_value')]
    property Valor: Real read Ftag_value write setFtag_value;

    [FieldName('created_at')]
    property RegistroCriado: TDAteTime read Fcreated_at write setFcreated_at;

    [FieldName('updated_at')]
    property RegistroAlterado: TDAteTime read Fupdated_at write setFupdated_at;

  End;

implementation

{ TProposal }

procedure TProposal.setFcreated_at(const Value: TDAteTime);
begin
  Fcreated_at := Value;
end;

procedure TProposal.setFforecast_time(const Value: Ttime);
begin
  Fforecast_time := Value;
end;

procedure TProposal.setFId(const Value: Integer);
begin
  FId := Value;
end;

procedure TProposal.setFtag_value(const Value: Real);
begin
  Ftag_value := Value;
end;

procedure TProposal.setFtb_institution_id(const Value: integer);
begin
  Ftb_institution_id := Value;
end;

procedure TProposal.setFtb_iteration_id(const Value: integer);
begin
  Ftb_iteration_id := Value;
end;

procedure TProposal.setFupdated_at(const Value: TDAteTime);
begin
  Fupdated_at := Value;
end;

end.
