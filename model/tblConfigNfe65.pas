unit tblConfigNfe65;

interface

Uses GenericEntity,GenericDao,CAtribEntity, System.Classes, System.SysUtils;
Type
  //nome da classe de entidade
  [TableName('tb_config_nfe_65')]
  TConfigNfe65 = Class(TGenericEntity)
  private
    Fupdated_at: TDAteTime;
    Ftoken_nfce: String;
    Ftb_institution_id: Integer;
    Fcreated_at: TDAteTime;
    Fid_token_nfce: String;
    procedure setFcreated_at(const Value: TDAteTime);
    procedure setFid_token_nfce(const Value: String);
    procedure setFtb_institution_id(const Value: Integer);
    procedure setFtoken_nfce(const Value: String);
    procedure setFupdated_at(const Value: TDAteTime);
  public
    [KeyField('tb_institution_id')]
    [FieldName('tb_institution_id')]
    property Estabelecimento: Integer read Ftb_institution_id write setFtb_institution_id;

    [FieldName('id_token_nfce')]
    property SimboloCodigo: String read Fid_token_nfce write setFid_token_nfce;

    [FieldName('token_nfce')]
    property Simbolo: String read Ftoken_nfce write setFtoken_nfce;

    [FieldName('created_at')]
    property RegistroCriado: TDAteTime read Fcreated_at write setFcreated_at;

    [FieldName('updated_at')]
    property RegistroAlterado: TDAteTime read Fupdated_at write setFupdated_at;

  End;
implementation

{ TConfigNfe65 }

procedure TConfigNfe65.setFcreated_at(const Value: TDAteTime);
begin
  Fcreated_at := Value;
end;

procedure TConfigNfe65.setFid_token_nfce(const Value: String);
begin
  Fid_token_nfce := Value;
end;

procedure TConfigNfe65.setFtb_institution_id(const Value: Integer);
begin
  Ftb_institution_id := Value;
end;

procedure TConfigNfe65.setFtoken_nfce(const Value: String);
begin
  Ftoken_nfce := Value;
end;

procedure TConfigNfe65.setFupdated_at(const Value: TDAteTime);
begin
  Fupdated_at := Value;
end;

end.


