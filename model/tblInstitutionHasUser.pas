unit tblInstitutionHasUser;

interface

Uses GenericEntity,GenericDao,CAtribEntity, System.Classes, System.SysUtils;
Type
  //nome da classe de entidade
  [TableName('tb_institution_has_User')]
  TInstitutionHasUser = Class(TGenericEntity)
  private
    Ftb_User_id: Integer;
    Factive: String;
    Fupdated_at: TDAteTime;
    FTb_institution_id: Integer;
    Fcreated_at: TDAteTime;
    Fkind: String;
    procedure setFactive(const Value: String);
    procedure setFcreated_at(const Value: TDAteTime);
    procedure setFtb_User_id(const Value: Integer);
    procedure setFTb_institution_id(const Value: Integer);
    procedure setFupdated_at(const Value: TDAteTime);
    procedure setFkind(const Value: String);

  public
    [FieldName('tb_institution_id')]
    [KeyField('tb_institution_id')]
    property Estabelecimento: Integer read FTb_institution_id write setFTb_institution_id;

    [FieldName('tb_user_id')]
    [KeyField('tb_user_id')]
    property Usuario: Integer read Ftb_user_id write setFtb_user_id;

    [FieldName('kind')]
    property Tipo: String read Fkind write setFkind;

    [FieldName('active')]
    property Ativo: String read Factive write setFactive;

    [FieldName('created_at')]
    property RegistroCriado: TDAteTime read Fcreated_at write setFcreated_at;

    [FieldName('updated_at')]
    property RegistroAlterado: TDAteTime read Fupdated_at write setFupdated_at;
  End;

implementation


{ TInstitutionHasUser }

procedure TInstitutionHasUser.setFactive(const Value: String);
begin
  Factive := Value;
end;

procedure TInstitutionHasUser.setFcreated_at(const Value: TDAteTime);
begin
  Fcreated_at := Value;
end;

procedure TInstitutionHasUser.setFkind(const Value: String);
begin
  Fkind := Value;
end;

procedure TInstitutionHasUser.setFtb_User_id(const Value: Integer);
begin
  Ftb_User_id := Value;
end;

procedure TInstitutionHasUser.setFTb_institution_id(const Value: Integer);
begin
  FTb_institution_id := Value;
end;

procedure TInstitutionHasUser.setFupdated_at(const Value: TDAteTime);
begin
  Fupdated_at := Value;
end;

end.
