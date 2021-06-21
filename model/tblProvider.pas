unit tblProvider;

interface

Uses GenericEntity,CAtribEntity, System.Classes, System.SysUtils;
Type
  //nome da classe de entidade
  [TableName('tb_provider')]
  TProvider = Class(TGenericEntity)
  private
    FActive: String;
    FId: Integer;
    Fupdated_at: TDAteTime;
    Ftb_institution_id: Integer;
    Fcreated_at: TDAteTime;
    procedure setFActive(const Value: String);
    procedure setFcreated_at(const Value: TDAteTime);
    procedure setFId(const Value: Integer);
    procedure setFtb_institution_id(const Value: Integer);
    procedure setFupdated_at(const Value: TDAteTime);

  public
    [FieldName('id')]
    [KeyField('id')]
    property Codigo: Integer read FId write setFId;

    [KeyField('tb_institution_id')]
    [FieldName('tb_institution_id')]
    property Estabelecimento: Integer read Ftb_institution_id write setFtb_institution_id;

    [FieldName('Active')]
    property Ativo: String read FActive write setFActive;

    [FieldName('created_at')]
    property RegistroCriado: TDAteTime read Fcreated_at write setFcreated_at;

    [FieldName('updated_at')]
    property RegistroAlterado: TDAteTime read Fupdated_at write setFupdated_at;

  End;
implementation


{ TProvider }

procedure TProvider.setFActive(const Value: String);
begin
  FActive := Value;
end;

procedure TProvider.setFcreated_at(const Value: TDAteTime);
begin
  Fcreated_at := Value;
end;

procedure TProvider.setFId(const Value: Integer);
begin
  FId := Value;
end;

procedure TProvider.setFtb_institution_id(const Value: Integer);
begin
  Ftb_institution_id := Value;
end;

procedure TProvider.setFupdated_at(const Value: TDAteTime);
begin
  Fupdated_at := Value;
end;

end.
