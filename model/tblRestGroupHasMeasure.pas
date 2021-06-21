unit tblRestGroupHasMeasure;

interface

Uses GenericEntity,CAtribEntity;

Type
  //nome da classe de entidade
  [TableName('tb_rest_group_has_measure')]
  TRestGroupHasMeasure = Class(TGenericEntity)

  private
    Fupdated_at: TDAteTime;
    Ftb_institution_id: Integer;
    Ftb_rest_group_id: Integer;
    Fcreated_at: TDAteTime;
    Ftb_measure_id: Integer;
    Fparts: Integer;
    Fslices: Integer;
    procedure setFcreated_at(const Value: TDAteTime);
    procedure setFtb_institution_id(const Value: Integer);
    procedure setFtb_measure_id(const Value: Integer);
    procedure setFtb_rest_group_id(const Value: Integer);
    procedure setFupdated_at(const Value: TDAteTime);
    procedure setFparts(const Value: Integer);
    procedure setFslices(const Value: Integer);


  public

    [FieldName('tb_institution_id')]
    [KeyField('tb_institution_id')]
    property Estabelecimento: Integer read Ftb_institution_id write setFtb_institution_id;

    [FieldName('tb_rest_group_id')]
    [KeyField('tb_rest_group_id')]
    property Grupo: Integer read Ftb_rest_group_id write setFtb_rest_group_id;

    [KeyField('tb_measure_id')]
    [FieldName('tb_measure_id')]
    property Medida: Integer read Ftb_measure_id write setFtb_measure_id;

    [FieldName('parts')]
    property PartesSabores: Integer read Fparts write setFparts;

    [FieldName('slices')]
    property Fatias: Integer read Fslices write setFslices;

    [FieldName('created_at')]
    property RegistroCriado: TDAteTime read Fcreated_at write setFcreated_at;

    [FieldName('updated_at')]
    property RegistroAlterado: TDAteTime read Fupdated_at write setFupdated_at;
  End;

implementation


{ TRestGroupHasMeasure }

procedure TRestGroupHasMeasure.setFcreated_at(const Value: TDAteTime);
begin
  Fcreated_at := Value;
end;

procedure TRestGroupHasMeasure.setFparts(const Value: Integer);
begin
  Fparts := Value;
end;

procedure TRestGroupHasMeasure.setFslices(const Value: Integer);
begin
  Fslices := Value;
end;

procedure TRestGroupHasMeasure.setFtb_institution_id(const Value: Integer);
begin
  Ftb_institution_id := Value;
end;

procedure TRestGroupHasMeasure.setFtb_measure_id(const Value: Integer);
begin
  Ftb_measure_id := Value;
end;

procedure TRestGroupHasMeasure.setFtb_rest_group_id(const Value: Integer);
begin
  Ftb_rest_group_id := Value;
end;

procedure TRestGroupHasMeasure.setFupdated_at(const Value: TDAteTime);
begin
  Fupdated_at := Value;
end;

end.
