unit tblRestSubGroup;

interface

Uses GenericEntity,CAtribEntity;

Type
  //nome da classe de entidade
  [TableName('tb_rest_subgroup')]
  TRestSubGroup = Class(TGenericEntity)

  private
    Fdescription: String;
    FId: Integer;
    Fupdated_at: TDAteTime;
    Ftb_institution_id: Integer;
    Ftb_rest_group_id: Integer;
    Fcreated_at: TDAteTime;
    Flink_url: String;
    procedure setFcreated_at(const Value: TDAteTime);
    procedure setFdescription(const Value: String);
    procedure setFId(const Value: Integer);
    procedure setFtb_institution_id(const Value: Integer);
    procedure setFtb_rest_group_id(const Value: Integer);
    procedure setFupdated_at(const Value: TDAteTime);
    procedure setFlink_url(const Value: String);

  public

    [FieldName('id')]
    [KeyField('id')]
    property Codigo: Integer read FId write setFId;

    [FieldName('tb_institution_id')]
    [KeyField('tb_institution_id')]
    property Estabelecimento: Integer read Ftb_institution_id write setFtb_institution_id;

    [FieldName('tb_rest_group_id')]
    [KeyField('tb_rest_group_id')]
    property Grupo: Integer read Ftb_rest_group_id write setFtb_rest_group_id;

    [FieldName('description')]
    property Descricao: String read Fdescription write setFdescription;

    //Retirado por que a migração do Desktop para Web não há dados
    //[FieldName('link_url')]
    property LinkUrl: String read Flink_url write setFlink_url;

    [FieldName('created_at')]
    property RegistroCriado: TDAteTime read Fcreated_at write setFcreated_at;

    [FieldName('updated_at')]
    property RegistroAlterado: TDAteTime read Fupdated_at write setFupdated_at;
  End;
implementation


{ TRestSubGroup }

procedure TRestSubGroup.setFcreated_at(const Value: TDAteTime);
begin
  Fcreated_at := Value;
end;

procedure TRestSubGroup.setFdescription(const Value: String);
begin
  Fdescription := Value;
end;

procedure TRestSubGroup.setFId(const Value: Integer);
begin
  FId := Value;
end;

procedure TRestSubGroup.setFlink_url(const Value: String);
begin
  Flink_url := Value;
end;

procedure TRestSubGroup.setFtb_institution_id(const Value: Integer);
begin
  Ftb_institution_id := Value;
end;

procedure TRestSubGroup.setFtb_rest_group_id(const Value: Integer);
begin
  Ftb_rest_group_id := Value;
end;

procedure TRestSubGroup.setFupdated_at(const Value: TDAteTime);
begin
  Fupdated_at := Value;
end;

end.
