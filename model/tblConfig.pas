unit tblConfig;

interface

Uses GenericEntity,GenericDao,CAtribEntity, System.Classes, System.SysUtils;
Type
  //nome da classe de entidade
  [TableName('tb_config')]
  TConfig = Class(TGenericEntity)
  private
    Fcontent: String;
    Fupdated_at: TDAteTime;
    Ffield: String;
    Ftb_institution_id: Integer;
    Ftb_user_id: Integer;
    Fcreated_at: TDAteTime;
    procedure setFcontent(const Value: String);
    procedure setFcreated_at(const Value: TDAteTime);
    procedure setFfield(const Value: String);
    procedure setFtb_institution_id(const Value: Integer);
    procedure setFtb_user_id(const Value: Integer);
    procedure setFupdated_at(const Value: TDAteTime);


  public
    [KeyField('tb_institution_id')]
    [FieldName('tb_institution_id')]
    property Estabelecimento: Integer read Ftb_institution_id write setFtb_institution_id;

    [KeyField('field')]
    [FieldName('field')]
    property Campo: String read Ffield write setFfield;

    [FieldName('tb_user_id')]
    property Usuario: Integer read Ftb_user_id write setFtb_user_id;

    [FieldName('content')]
    property Conteudo: String read Fcontent write setFcontent;

    [FieldName('created_at')]
    property RegistroCriado: TDAteTime read Fcreated_at write setFcreated_at;

    [FieldName('updated_at')]
    property RegistroAlterado: TDAteTime read Fupdated_at write setFupdated_at;
  End;



implementation

{ TConfig }

procedure TConfig.setFcontent(const Value: String);
begin
  Fcontent := Value;
end;

procedure TConfig.setFcreated_at(const Value: TDAteTime);
begin
  Fcreated_at := Value;
end;

procedure TConfig.setFfield(const Value: String);
begin
  Ffield := Value;
end;

procedure TConfig.setFtb_institution_id(const Value: Integer);
begin
  Ftb_institution_id := Value;
end;

procedure TConfig.setFtb_user_id(const Value: Integer);
begin
  Ftb_user_id := Value;
end;

procedure TConfig.setFupdated_at(const Value: TDAteTime);
begin
  Fupdated_at := Value;
end;

end.

