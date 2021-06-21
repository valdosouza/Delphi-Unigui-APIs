unit tblCrashlytics;

interface
Uses GenericEntity,CAtribEntity, Classes, SysUtils;

Type
  //nome da classe de entidade
  [TableName('tb_crashlytics')]
  TCrashlytics = Class(TGenericEntity)
  private
    FId: Integer;
    Fupdated_at: TDAteTime;
    Ftb_institution_id: Integer;
    Ftb_user_id: Integer;
    Fcreated_at: TDAteTime;
    Forigen: String;
    Fmessage: String;
    procedure setFcreated_at(const Value: TDAteTime);
    procedure setFId(const Value: Integer);
    procedure setFtb_institution_id(const Value: Integer);
    procedure setFtb_user_id(const Value: Integer);
    procedure setFupdated_at(const Value: TDAteTime);
    procedure setForigend(const Value: String);
    procedure setFmessage(const Value: String);


  public
    [FieldName('id')]
    [KeyField('id')]
    property Codigo: Integer read FId write setFId;

    [FieldName('tb_institution_id')]
    property Estabelecimento: Integer read Ftb_institution_id write setFtb_institution_id;

    [FieldName('tb_user_id')]
    property Usuario: Integer read Ftb_user_id write setFtb_user_id;

    [FieldName('origen')]
    property Origem: String read Forigen write setForigend;

    [FieldName('message')]
    property Mensagem: String read Fmessage write setFmessage;

    [FieldName('created_at')]
    property RegistroCriado: TDAteTime read Fcreated_at write setFcreated_at;

    [FieldName('updated_at')]
    property RegistroAlterado: TDAteTime read Fupdated_at write setFupdated_at;
  End;

implementation

{ TCrashlytics }

procedure TCrashlytics.setFcreated_at(const Value: TDAteTime);
begin
  Fcreated_at := Value;
end;

procedure TCrashlytics.setFId(const Value: Integer);
begin
  FId := Value;
end;

procedure TCrashlytics.setFmessage(const Value: String);
begin
  Fmessage := Value;
end;

procedure TCrashlytics.setForigend(const Value: String);
begin
  Forigen := Value;
end;

procedure TCrashlytics.setFtb_institution_id(const Value: Integer);
begin
  Ftb_institution_id := Value;
end;

procedure TCrashlytics.setFtb_user_id(const Value: Integer);
begin
  Ftb_user_id := Value;
end;

procedure TCrashlytics.setFupdated_at(const Value: TDAteTime);
begin
  Fupdated_at := Value;
end;

end.
