unit tblSocialMedia;

interface

Uses GenericEntity,CAtribEntity, System.SysUtils;

Type
  //nome da classe de entidade
  [TableName('tb_social_media')]
  TSocialMedia = Class(TGenericEntity)

  private
    FId: Integer;
    Fkind : String;
    Flink : String;
    Fupdated_at: TDAteTime;
    Fcreated_at: TDAteTime;

    procedure setFid(Value: Integer);
    procedure setFkind(Value: String);
    procedure setFlink(Value: String);
    procedure setFcreated_at(Value: Tdatetime);
    procedure setFupdated_at(Value: Tdatetime);

  public

    [FieldName('id')]
    [KeyField('id')]
    property Codigo: Integer read FId write setFId;

    [FieldName('kind')]
    [KeyField('kind')]
    property Tipo: String read FKind write setFkind;

    [FieldName('link')]
    property Link: String read Flink write setFlink;

    [FieldName('created_at')]
    property RegistroCriado: TDAteTime read Fcreated_at write setFcreated_at;

    [FieldName('updated_at')]
    property RegistroAlterado: TDAteTime read Fupdated_at write setFupdated_at;

  End;

implementation

{ TSocialMedia }

procedure TSocialMedia.setFcreated_at(Value: Tdatetime);
begin
  Fcreated_at := Value;
end;

procedure TSocialMedia.setFid(Value: Integer);
begin
  FId := Value;
end;

procedure TSocialMedia.setFkind(Value: String);
begin
  Fkind := Value;
end;

procedure TSocialMedia.setFlink(Value: String);
begin
  Flink := Value;
end;

procedure TSocialMedia.setFupdated_at(Value: Tdatetime);
begin
  Fupdated_at := Value;
end;

end.
