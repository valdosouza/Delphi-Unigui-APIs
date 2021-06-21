unit tblContact;

interface

Uses GenericEntity,GenericDao,CAtribEntity, System.Classes, System.SysUtils;
Type
  //nome da classe de entidade
  [TableName('tb_contact')]
  TContact = Class(TGenericEntity)
  private
    FActive: String;
    FId: Integer;
    Fupdated_at: TDAteTime;
    Ftb_institution_id: Integer;
    Fcreated_at: TDAteTime;
    Ftb_entity_owner_id: Integer;
    procedure setFActive(const Value: String);
    procedure setFcreated_at(const Value: TDAteTime);
    procedure setFId(const Value: Integer);
    procedure setFtb_institution_id(const Value: Integer);
    procedure setFupdated_at(const Value: TDAteTime);
    procedure setFtb_entity_owner_id(const Value: Integer);


  public
    [FieldName('id')]
    [KeyField('id')]
    property Codigo: Integer read FId write setFId;

    [KeyField('tb_institution_id')]
    [FieldName('tb_institution_id')]
    property Estabelecimento: Integer read Ftb_institution_id write setFtb_institution_id;

    [FieldName('tb_entity_owner_id')]
//    [KeyField('tb_entity_owner_id')]
    property EntidadePai: Integer read Ftb_entity_owner_id write setFtb_entity_owner_id;

    [FieldName('Active')]
    property Ativo: String read FActive write setFActive;

    [FieldName('created_at')]
    property RegistroCriado: TDAteTime read Fcreated_at write setFcreated_at;

    [FieldName('updated_at')]
    property RegistroAlterado: TDAteTime read Fupdated_at write setFupdated_at;

  End;
implementation



{ TContact }

procedure TContact.setFActive(const Value: String);
begin
  FActive := Value;
end;

procedure TContact.setFcreated_at(const Value: TDAteTime);
begin
  Fcreated_at := Value;
end;

procedure TContact.setFId(const Value: Integer);
begin
  FId := Value;
end;

procedure TContact.setFtb_entity_owner_id(const Value: Integer);
begin
  Ftb_entity_owner_id := Value;
end;

procedure TContact.setFtb_institution_id(const Value: Integer);
begin
  Ftb_institution_id := Value;
end;

procedure TContact.setFupdated_at(const Value: TDAteTime);
begin
  Fupdated_at := Value;
end;

end.
