unit tblCity;

interface

Uses GenericEntity,CAtribEntity;

Type
  //nome da classe de entidade
  [TableName('tb_city')]
  TCity = Class(TGenericEntity)

  private
    FId: Integer;
    Ftb_state_id : Integer;
    Fibge : String;
    Fname: String;
    Fupdated_at: TDAteTime;
    Fcreated_at: TDAteTime;
    Faliq_iss: Real;
    Fdensity: Real;
    Farea: Real;
    Fpopulation: Integer;

    procedure setFid(Value: Integer);
    procedure setFtb_state_id(Value: Integer);
    procedure setFibge(Value: String);
    procedure setFname(Value: String);
    procedure setFcreated_at(Value: Tdatetime);
    procedure setFupdated_at(Value: Tdatetime);
    procedure setFaliq_iss(const Value: Real);
    procedure setFarea(const Value: Real);
    procedure setFdensity(const Value: Real);
    procedure setFpopulation(const Value: Integer);

  public

    [FieldName('id')]
    [KeyField('id')]
    property Codigo: Integer read FId write setFId;

    [FieldName('tb_state_id')]
    property CodigoEstado: Integer read Ftb_state_id write setFtb_state_id;

    [FieldName('ibge')]
    property IBGE: String read Fibge write setFibge;

    [FieldName('name')]
    property Nome: String read Fname write setFname;

    [FieldName('aliq_iss')]
    property AliquotaISS: Real read Faliq_iss write setFaliq_iss;

    [FieldName('population')]
    property Populacao: Integer read Fpopulation write setFpopulation;

    [FieldName('density')]
    property Densidade: Real read Fdensity write setFdensity;

    [FieldName('area')]
    property Area: Real read Farea write setFarea;

    [FieldName('created_at')]
    property RegistroCriado: TDAteTime read Fcreated_at write setFcreated_at;

    [FieldName('updated_at')]
    property RegistroAlterado: TDAteTime read Fupdated_at write setFupdated_at;
  End;

implementation

procedure TCity.setFid(Value: Integer);
begin
  FId := Value;
end;

procedure TCity.setFname(Value: String);
begin
  FName := Value;
end;

procedure TCity.setFpopulation(const Value: Integer);
begin
  Fpopulation := Value;
end;

procedure TCity.setFibge(Value: String);
begin
  Fibge := Value;
end;

procedure TCity.setFtb_state_id(Value: Integer);
begin
  Ftb_state_id := Value;
end;

procedure TCity.setFaliq_iss(const Value: Real);
begin
  Faliq_iss := Value;
end;

procedure TCity.setFarea(const Value: Real);
begin
  Farea := Value;
end;

procedure TCity.setFcreated_at(Value: Tdatetime);
begin
  Fcreated_at := Value;
end;

procedure TCity.setFdensity(const Value: Real);
begin
  Fdensity := Value;
end;

procedure TCity.setFupdated_at(Value: Tdatetime);
begin
  Fupdated_at := Value;
end;


end.
