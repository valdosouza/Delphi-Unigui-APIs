unit tblClinProfessionalHasPatient;

interface

Uses GenericEntity,CAtribEntity, System.Classes, System.SysUtils;
Type
  //nome da classe de entidade
  [TableName('tb_clin_professional_has_patient')]
  TClinProfessionalHasPatient = Class(TGenericEntity)
  private
    Ftb_clin_patient_id: Integer;
    Ftb_clin_professional_id: Integer;
    Fupdated_at: TDAteTime;
    Ftb_institution_id: Integer;
    Fcreated_at: TDAteTime;
    procedure setFcreated_at(const Value: TDAteTime);
    procedure setFtb_clin_patient_id(const Value: Integer);
    procedure setFtb_clin_professional_id(const Value: Integer);
    procedure setFtb_institution_id(const Value: Integer);
    procedure setFupdated_at(const Value: TDAteTime);


  public
    [KeyField('tb_institution_id')]
    [FieldName('tb_institution_id')]
    property Estabelecimento: Integer read Ftb_institution_id write setFtb_institution_id;

    [FieldName('tb_clin_professional_id')]
    [KeyField('tb_clin_professional_id')]
    property Profissional: Integer read Ftb_clin_professional_id write setFtb_clin_professional_id;

    [FieldName('tb_clin_patient_id')]
    [KeyField('tb_clin_patient_id')]
    property Paciente: Integer read Ftb_clin_patient_id write setFtb_clin_patient_id;

    [FieldName('created_at')]
    property RegistroCriado: TDAteTime read Fcreated_at write setFcreated_at;

    [FieldName('updated_at')]
    property RegistroAlterado: TDAteTime read Fupdated_at write setFupdated_at;

  End;

implementation


{ TClinProfessionalHasPatient }

procedure TClinProfessionalHasPatient.setFcreated_at(const Value: TDAteTime);
begin
  Fcreated_at := Value;
end;

procedure TClinProfessionalHasPatient.setFtb_clin_patient_id(
  const Value: Integer);
begin
  Ftb_clin_patient_id := Value;
end;

procedure TClinProfessionalHasPatient.setFtb_clin_professional_id(
  const Value: Integer);
begin
  Ftb_clin_professional_id := Value;
end;

procedure TClinProfessionalHasPatient.setFtb_institution_id(
  const Value: Integer);
begin
  Ftb_institution_id := Value;
end;

procedure TClinProfessionalHasPatient.setFupdated_at(const Value: TDAteTime);
begin
  Fupdated_at := Value;
end;

end.
