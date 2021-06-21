unit tblInstitutionHasModule;


interface

Uses GenericEntity,GenericDao,CAtribEntity, System.Classes, System.SysUtils;

Type
  //nome da classe de entidade
  [TableName('tb_institution_has_module')]
  TInstitutionHasModule = Class(TGenericEntity)
  private
    Factive: String;
    Ftb_modules_id: Integer;
    Fupdated_at: TDAteTime;
    Ftb_institution_id: Integer;
    Fcreated_at: TDAteTime;
    procedure setFactive(const Value: String);
    procedure setFcreated_at(const Value: TDAteTime);
    procedure setFtb_institution_id(const Value: Integer);
    procedure setFtb_modules_id(const Value: Integer);
    procedure setFupdated_at(const Value: TDAteTime);


  public
    [FieldName('tb_institution_id')]
    [KeyField('tb_institution_id')]
    property Estabelecimento: Integer read Ftb_institution_id write setFtb_institution_id;

    [FieldName('tb_modules_id')]
    [KeyField('tb_modules_id')]
    property CodigoModulo: Integer read Ftb_modules_id write setFtb_modules_id;

    [FieldName('active')]
    property Ativo: String read Factive write setFactive;


    [FieldName('created_at')]
    property RegistroCriado: TDAteTime read Fcreated_at write setFcreated_at;

    [FieldName('updated_at')]
    property RegistroAlterado: TDAteTime read Fupdated_at write setFupdated_at;

  End;
implementation

{ TInstitutionHasModule }

procedure TInstitutionHasModule.setFactive(const Value: String);
begin
  Factive := Value;
end;

procedure TInstitutionHasModule.setFcreated_at(const Value: TDAteTime);
begin
  Fcreated_at := Value;
end;

procedure TInstitutionHasModule.setFtb_institution_id(const Value: Integer);
begin
  Ftb_institution_id := Value;
end;

procedure TInstitutionHasModule.setFtb_modules_id(const Value: Integer);
begin
  Ftb_modules_id := Value;
end;

procedure TInstitutionHasModule.setFupdated_at(const Value: TDAteTime);
begin
  Fupdated_at := Value;
end;

end.
