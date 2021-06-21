unit tblEntityHasMailing;

interface

Uses GenericEntity,GenericDao,CAtribEntity, System.Classes, System.SysUtils;
Type
  //nome da classe de entidade
  [TableName('tb_entity_has_mailing')]
  TEntityHasMailing = Class(TGenericEntity)
  private
    Ftb_entity_id: Integer;
    Ftb_mailing_id: Integer;
    Fupdated_at: TDAteTime;
    Ftb_mailing_group_id: Integer;
    Fcreated_at: TDAteTime;
    procedure setFcreated_at(const Value: TDAteTime);
    procedure setFtb_entity_id(const Value: Integer);
    procedure setFtb_mailing_group_id(const Value: Integer);
    procedure setFtb_mailing_id(const Value: Integer);
    procedure setFupdated_at(const Value: TDAteTime);

  public
    [FieldName('tb_entity_id')]
    [KeyField('tb_entity_id')]
    property Entidade: Integer read Ftb_entity_id write setFtb_entity_id;

    [FieldName('tb_mailing_id')]
    [KeyField('tb_mailing_id')]
    property Mailing: Integer read Ftb_mailing_id write setFtb_mailing_id;

    [FieldName('tb_mailing_group_id')]
    [KeyField('tb_mailing_group_id')]
    property Grupo: Integer read Ftb_mailing_group_id write setFtb_mailing_group_id;

    [FieldName('created_at')]
    property RegistroCriado: TDAteTime read Fcreated_at write setFcreated_at;

    [FieldName('updated_at')]
    property RegistroAlterado: TDAteTime read Fupdated_at write setFupdated_at;
  End;

implementation


{ TEntityHasMailing }

procedure TEntityHasMailing.setFcreated_at(const Value: TDAteTime);
begin
  Fcreated_at := Value;
end;

procedure TEntityHasMailing.setFtb_entity_id(const Value: Integer);
begin
  Ftb_entity_id := Value;
end;

procedure TEntityHasMailing.setFtb_mailing_group_id(const Value: Integer);
begin
  Ftb_mailing_group_id := Value;
end;

procedure TEntityHasMailing.setFtb_mailing_id(const Value: Integer);
begin
  Ftb_mailing_id := Value;
end;

procedure TEntityHasMailing.setFupdated_at(const Value: TDAteTime);
begin
  Fupdated_at := Value;
end;

end.
