unit tblInstitutionHasPackage;

interface

Uses GenericEntity,GenericDao,CAtribEntity, System.Classes, System.SysUtils;
Type
  //nome da classe de entidade
  [TableName('tb_institution_has_package')]
  TInstitutionHasPackage = Class(TGenericEntity)
  private
    Ftb_Package_id: Integer;
    Factive: String;
    Fupdated_at: TDAteTime;
    FTb_institution_id: Integer;
    Fcreated_at: TDAteTime;
    procedure setFactive(const Value: String);
    procedure setFcreated_at(const Value: TDAteTime);
    procedure setFtb_Package_id(const Value: Integer);
    procedure setFTb_institution_id(const Value: Integer);
    procedure setFupdated_at(const Value: TDAteTime);


  public
    [FieldName('tb_institution_id')]
    [KeyField('tb_institution_id')]
    property Estabelecimento: Integer read FTb_institution_id write setFTb_institution_id;

    [FieldName('tb_package_id')]
    [KeyField('tb_package_id')]
    property CodigoEmbalagem: Integer read Ftb_Package_id write setFtb_Package_id;

    [FieldName('active')]
    property Ativo: String read Factive write setFactive;

    [FieldName('created_at')]
    property RegistroCriado: TDAteTime read Fcreated_at write setFcreated_at;

    [FieldName('updated_at')]
    property RegistroAlterado: TDAteTime read Fupdated_at write setFupdated_at;
  End;

implementation

{ TInstitutionHasPackage }

procedure TInstitutionHasPackage.setFactive(const Value: String);
begin
  Factive := Value;
end;

procedure TInstitutionHasPackage.setFcreated_at(const Value: TDAteTime);
begin
  Fcreated_at := Value;
end;

procedure TInstitutionHasPackage.setFtb_Package_id(const Value: Integer);
begin
  Ftb_Package_id := Value;
end;

procedure TInstitutionHasPackage.setFTb_institution_id(const Value: Integer);
begin
  FTb_institution_id := Value;
end;

procedure TInstitutionHasPackage.setFupdated_at(const Value: TDAteTime);
begin
  Fupdated_at := Value;
end;

end.
