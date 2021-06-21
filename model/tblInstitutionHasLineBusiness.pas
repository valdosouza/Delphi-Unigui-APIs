unit tblInstitutionHasLineBusiness;

interface

Uses GenericEntity,GenericDao,CAtribEntity;
Type
  //nome da classe de entidade
  [TableName('tb_institution_has_linebusiness')]
  TInstitutionHasLineBusiness = Class(TGenericEntity)
  private
    Ftb_linebusiness_id: Integer;
    Factive: String;
    Fupdated_at: TDAteTime;
    FTb_institution_id: Integer;
    Fcreated_at: TDAteTime;
    procedure setFactive(const Value: String);
    procedure setFcreated_at(const Value: TDAteTime);
    procedure setFtb_linebusiness_id(const Value: Integer);
    procedure setFTb_institution_id(const Value: Integer);
    procedure setFupdated_at(const Value: TDAteTime);


  public
    [FieldName('tb_institution_id')]
    [KeyField('tb_institution_id')]
    property Estabelecimento: Integer read FTb_institution_id write setFTb_institution_id;

    [FieldName('tb_linebusiness_id')]
    [KeyField('tb_linebusiness_id')]
    property CodigoRamoAtividade: Integer read Ftb_linebusiness_id write setFtb_linebusiness_id;

    [FieldName('active')]
    property Ativo: String read Factive write setFactive;

    [FieldName('created_at')]
    property RegistroCriado: TDAteTime read Fcreated_at write setFcreated_at;

    [FieldName('updated_at')]
    property RegistroAlterado: TDAteTime read Fupdated_at write setFupdated_at;
  End;

implementation


{ TInstitutionHasLineBusiness }

procedure TInstitutionHasLineBusiness.setFactive(const Value: String);
begin
  Factive := Value;
end;

procedure TInstitutionHasLineBusiness.setFcreated_at(const Value: TDAteTime);
begin
  Fcreated_at := Value;
end;

procedure TInstitutionHasLineBusiness.setFtb_linebusiness_id(const Value: Integer);
begin
  Ftb_linebusiness_id := Value;
end;

procedure TInstitutionHasLineBusiness.setFTb_institution_id(
  const Value: Integer);
begin
  FTb_institution_id := Value;
end;

procedure TInstitutionHasLineBusiness.setFupdated_at(const Value: TDAteTime);
begin
  Fupdated_at := Value;
end;

end.
