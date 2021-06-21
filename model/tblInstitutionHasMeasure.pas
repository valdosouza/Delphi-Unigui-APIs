unit tblInstitutionHasMeasure;

interface

Uses GenericEntity,GenericDao,CAtribEntity, System.Classes, System.SysUtils;
Type
  //nome da classe de entidade
  [TableName('tb_institution_has_measure')]
  TInstitutionHasMeasure = Class(TGenericEntity)
  private
    Ftb_Measure_id: Integer;
    Factive: String;
    Fupdated_at: TDAteTime;
    FTb_institution_id: Integer;
    Fcreated_at: TDAteTime;
    procedure setFactive(const Value: String);
    procedure setFcreated_at(const Value: TDAteTime);
    procedure setFTb_institution_id(const Value: Integer);
    procedure setFtb_Measure_id(const Value: Integer);
    procedure setFupdated_at(const Value: TDAteTime);



  public
    [FieldName('tb_institution_id')]
    [KeyField('tb_institution_id')]
    property Estabelecimento: Integer read FTb_institution_id write setFTb_institution_id;

    [FieldName('tb_measure_id')]
    [KeyField('tb_measure_id')]
    property CodigoMedida: Integer read Ftb_Measure_id write setFtb_Measure_id;

    [FieldName('active')]
    property Ativo: String read Factive write setFactive;

    [FieldName('created_at')]
    property RegistroCriado: TDAteTime read Fcreated_at write setFcreated_at;

    [FieldName('updated_at')]
    property RegistroAlterado: TDAteTime read Fupdated_at write setFupdated_at;
  End;

implementation



{ TInstitutionHasMeasure }

procedure TInstitutionHasMeasure.setFactive(const Value: String);
begin
  Factive := Value;
end;

procedure TInstitutionHasMeasure.setFcreated_at(const Value: TDAteTime);
begin
  Fcreated_at := Value;
end;

procedure TInstitutionHasMeasure.setFTb_institution_id(const Value: Integer);
begin
  FTb_institution_id := Value;
end;

procedure TInstitutionHasMeasure.setFtb_Measure_id(const Value: Integer);
begin
  Ftb_Measure_id := Value;
end;

procedure TInstitutionHasMeasure.setFupdated_at(const Value: TDAteTime);
begin
  Fupdated_at := Value;
end;

end.
