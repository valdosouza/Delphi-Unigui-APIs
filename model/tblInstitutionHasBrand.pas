unit tblInstitutionHasBrand;

interface

Uses GenericEntity,GenericDao,CAtribEntity, System.Classes, System.SysUtils;
Type
  //nome da classe de entidade
  [TableName('tb_institution_has_brand')]
  TInstitutionHasBrand = Class(TGenericEntity)
  private
    Ftb_brand_id: Integer;
    Factive: String;
    Fupdated_at: TDAteTime;
    FTb_institution_id: Integer;
    Fcreated_at: TDAteTime;
    procedure setFactive(const Value: String);
    procedure setFcreated_at(const Value: TDAteTime);
    procedure setFtb_brand_id(const Value: Integer);
    procedure setFTb_institution_id(const Value: Integer);
    procedure setFupdated_at(const Value: TDAteTime);


  public
    [FieldName('tb_institution_id')]
    [KeyField('tb_institution_id')]
    property Estabelecimento: Integer read FTb_institution_id write setFTb_institution_id;

    [FieldName('tb_brand_id')]
    [KeyField('tb_brand_id')]
    property CodigoMarca: Integer read Ftb_brand_id write setFtb_brand_id;

    [FieldName('active')]
    property Ativo: String read Factive write setFactive;

    [FieldName('created_at')]
    property RegistroCriado: TDAteTime read Fcreated_at write setFcreated_at;

    [FieldName('updated_at')]
    property RegistroAlterado: TDAteTime read Fupdated_at write setFupdated_at;
  End;

implementation

{ TInstitutionHasBrand }

procedure TInstitutionHasBrand.setFactive(const Value: String);
begin
  Factive := Value;
end;

procedure TInstitutionHasBrand.setFcreated_at(const Value: TDAteTime);
begin
  Fcreated_at := Value;
end;

procedure TInstitutionHasBrand.setFtb_brand_id(const Value: Integer);
begin
  Ftb_brand_id := Value;
end;

procedure TInstitutionHasBrand.setFTb_institution_id(const Value: Integer);
begin
  FTb_institution_id := Value;
end;

procedure TInstitutionHasBrand.setFupdated_at(const Value: TDAteTime);
begin
  Fupdated_at := Value;
end;

end.
