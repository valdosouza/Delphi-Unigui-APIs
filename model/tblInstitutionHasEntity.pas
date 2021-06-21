unit tblInstitutionHasEntity;

interface

Uses GenericEntity,GenericDao,CAtribEntity;

Type
  //nome da classe de entidade
  [TableName('tb_institution_has_entity')]
  TInstitutionHasEntity = Class(TGenericEntity)

  private
    Fupdated_at: TDAteTime;
    Fcreated_at: TDAteTime;
    Ftb_institution_id: Integer;
    Ftb_entity_id: Integer;

    procedure setFtb_institution_id(Value : Integer);
    procedure setFtb_entity_id(Value : Integer);
    procedure setFcreated_at(Value: Tdatetime);
    procedure setFupdated_at(Value: Tdatetime);

  public

    [KeyField('tb_institution_id')]
    [FieldName('tb_institution_id')]
    property Estabelecimento: Integer read Ftb_institution_id write setFtb_institution_id;

    [KeyField('tb_entity_id')]
    [FieldName('tb_entity_id')]
    property Entidade: Integer read Ftb_entity_id write setFtb_entity_id;

    [FieldName('created_at')]
    property RegistroCriado: TDAteTime read Fcreated_at write setFcreated_at;

    [FieldName('updated_at')]
    property RegistroAlterado: TDAteTime read Fupdated_at write setFupdated_at;

  End;

implementation

 {TInstitutionHasEntity}

procedure TInstitutionHasEntity.setFtb_entity_id(Value: Integer);
begin
  Ftb_entity_id := Value;
end;

procedure TInstitutionHasEntity.setFtb_institution_id(Value: Integer);
begin
  Ftb_institution_id := Value;
end;

procedure TInstitutionHasEntity.setFcreated_at(Value: Tdatetime);
begin
  Fcreated_at := Value;
end;

procedure TInstitutionHasEntity.setFupdated_at(Value: Tdatetime);
begin
  Fupdated_at := Value;
end;

end.
