unit tblRestMenu;

interface

Uses GenericEntity,CAtribEntity;

Type
  //nome da classe de entidade
  [TableName('tb_rest_menu')]
  TRestMenu = Class(TGenericEntity)

  private

    Factive: String;
    FId: Integer;
    Fupdated_at: TDAteTime;
    Fdescription: String;
    Ftb_institution_id: Integer;
    Ftb_rest_subgroup_id: Integer;
    Ftb_rest_group_id: Integer;
    Fcreated_at: TDAteTime;
    Flink_url: String;
    procedure setFactive(const Value: String);
    procedure setFcreated_at(const Value: TDAteTime);
    procedure setFdescription(const Value: String);
    procedure setFId(const Value: Integer);

    procedure setFtb_institution_id(const Value: Integer);
    procedure setFtb_rest_group_id(const Value: Integer);
    procedure setFtb_rest_subgroup_id(const Value: Integer);
    procedure setFupdated_at(const Value: TDAteTime);
    procedure setFlink_url(const Value: String);

  public

    [FieldName('id')]
    [KeyField('id')]
    property Codigo: Integer read FId write setFId;

    [FieldName('tb_institution_id')]
    [KeyField('tb_institution_id')]
    property Estabelecimento: Integer read Ftb_institution_id write setFtb_institution_id;

    [FieldName('description')]
    property Description: String read Fdescription write setFdescription;

    [FieldName('tb_rest_group_id')]
    property Grupo: Integer read Ftb_rest_group_id write setFtb_rest_group_id;

    [FieldName('tb_rest_subgroup_id')]
    property SubGrupo: Integer read Ftb_rest_subgroup_id write setFtb_rest_subgroup_id;

    //Retirado por que a migração do Desktop para Web não há dados
    //[FieldName('link_url')]
    property linkUrl: String read Flink_url write setFlink_url;

    [FieldName('active')]
    property Ativo: String read Factive write setFactive;


    [FieldName('created_at')]
    property RegistroCriado: TDAteTime read Fcreated_at write setFcreated_at;

    [FieldName('updated_at')]
    property RegistroAlterado: TDAteTime read Fupdated_at write setFupdated_at;
  End;


implementation


{ TRestMenu }

procedure TRestMenu.setFactive(const Value: String);
begin
  Factive := Value;
end;

procedure TRestMenu.setFcreated_at(const Value: TDAteTime);
begin
  Fcreated_at := Value;
end;

procedure TRestMenu.setFdescription(const Value: String);
begin
  Fdescription := Value;
end;

procedure TRestMenu.setFId(const Value: Integer);
begin
  FId := Value;
end;

procedure TRestMenu.setFlink_url(const Value: String);
begin
  Flink_url := Value;
end;

procedure TRestMenu.setFtb_institution_id(const Value: Integer);
begin
  Ftb_institution_id := Value;
end;

procedure TRestMenu.setFtb_rest_group_id(const Value: Integer);
begin
  Ftb_rest_group_id := Value;
end;

procedure TRestMenu.setFtb_rest_subgroup_id(const Value: Integer);
begin
  Ftb_rest_subgroup_id := Value;
end;

procedure TRestMenu.setFupdated_at(const Value: TDAteTime);
begin
  Fupdated_at := Value;
end;

end.
