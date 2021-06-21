unit tblImages;

interface

Uses GenericEntity,GenericDao,CAtribEntity, Classes, SysUtils;
Type
  //nome da classe de entidade
  [TableName('tb_images')]
  TImages = Class(TGenericEntity)
  private
    Ftb_entity_id: Integer;
    Fupdated_at: TDAteTime;
    Ffile_name: String;
    Ftb_institution_id: Integer;
    Falbum: String;
    Fcreated_at: TDAteTime;
    Fsequence: Integer;
    procedure setFalbum(const Value: String);
    procedure setFcreated_at(const Value: TDAteTime);
    procedure setFfile_name(const Value: String);
    procedure setFtb_entity_id(const Value: Integer);
    procedure setFtb_institution_id(const Value: Integer);
    procedure setFupdated_at(const Value: TDAteTime);
    procedure setFsequence(const Value: Integer);

  public
    [KeyField('tb_institution_id')]
    [FieldName('tb_institution_id')]
    property Estabelecimento: Integer read Ftb_institution_id write setFtb_institution_id;

    [KeyField('album')]
    [FieldName('album')]
    property Album: String read Falbum write setFalbum;

    [KeyField('file_name')]
    [FieldName('file_name')]
    property NomeArquivo: String read Ffile_name write setFfile_name;

    [FieldName('tb_entity_id')]
    property Entidade: Integer read Ftb_entity_id write setFtb_entity_id;

    [FieldName('sequence')]
    property Sequencia: Integer read Fsequence write setFsequence;

    [FieldName('created_at')]
    property RegistroCriado: TDAteTime read Fcreated_at write setFcreated_at;

    [FieldName('updated_at')]
    property RegistroAlterado: TDAteTime read Fupdated_at write setFupdated_at;

  End;

implementation

{ TImages }

procedure TImages.setFalbum(const Value: String);
begin
  Falbum := Value;
end;

procedure TImages.setFcreated_at(const Value: TDAteTime);
begin
  Fcreated_at := Value;
end;

procedure TImages.setFfile_name(const Value: String);
begin
  Ffile_name := Value;
end;

procedure TImages.setFsequence(const Value: Integer);
begin
  Fsequence := Value;
end;

procedure TImages.setFtb_entity_id(const Value: Integer);
begin
  Ftb_entity_id := Value;
end;

procedure TImages.setFtb_institution_id(const Value: Integer);
begin
  Ftb_institution_id := Value;
end;

procedure TImages.setFupdated_at(const Value: TDAteTime);
begin
  Fupdated_at := Value;
end;

end.
