unit tblState;

interface

Uses GenericEntity,CAtribEntity;

Type
  //nome da classe de entidade
  [TableName('tb_state')]
  TState = Class(TGenericEntity)

  private
    FId: Integer;
    Ftb_country_id : Integer;
    Fabbreviation : String;
    Fname: String;
    Fupdated_at: TDAteTime;
    Fcreated_at: TDAteTime;

    procedure setFid(Value: Integer);
    procedure setFtb_country_id(Value: Integer);
    procedure setFname(Value: String);
    procedure setFabbreviation(Value: String);
    procedure setFcreated_at(Value: Tdatetime);
    procedure setFupdated_at(Value: Tdatetime);

  public

    [FieldName('id')]
    [KeyField('id')]
    property Codigo: Integer read FId write setFId;

    [FieldName('tb_country_id')]
    property CodigoPais: Integer read Ftb_country_id write setFtb_country_id;

    [FieldName('abbreviation')]
    property Abreviatura: String read Fabbreviation write setFabbreviation;

    [FieldName('name')]
    property Nome: String read Fname write setFname;

    [FieldName('created_at')]
    property RegistroCriado: TDAteTime read Fcreated_at write setFcreated_at;

    [FieldName('updated_at')]
    property RegistroAlterado: TDAteTime read Fupdated_at write setFupdated_at;
  End;

implementation

procedure TState.setFid(Value: Integer);
begin
  FId := Value;
end;

procedure TState.setFname(Value: String);
begin
  FName := Value;
end;

procedure TState.setFabbreviation(Value: String);
begin
  Fabbreviation := Value;
end;

procedure TState.setFtb_country_id(Value: Integer);
begin
  Ftb_country_id := Value;
end;

procedure TState.setFcreated_at(Value: Tdatetime);
begin
  Fcreated_at := Value;
end;

procedure TState.setFupdated_at(Value: Tdatetime);
begin
  Fupdated_at := Value;
end;


end.

