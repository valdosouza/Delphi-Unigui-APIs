unit tblCountry;

interface

Uses GenericEntity,CAtribEntity;

Type
  //nome da classe de entidade
  [TableName('tb_country')]
  TCountry = Class(TGenericEntity)

  private
    FId: Integer;
    Fname: String;
    Fupdated_at: TDAteTime;
    Fcreated_at: TDAteTime;


    procedure setFid(Value: Integer);
    procedure setFname(Value: String);
    procedure setFcreated_at(Value: Tdatetime);
    procedure setFupdated_at(Value: Tdatetime);


  public

    [FieldName('id')]
    [KeyField('id')]
    property Codigo: Integer read FId write setFId;

    [FieldName('name')]
    property Nome: String read Fname write setFname;

    [FieldName('created_at')]
    property RegistroCriado: TDAteTime read Fcreated_at write setFcreated_at;

    [FieldName('updated_at')]
    property RegistroAlterado: TDAteTime read Fupdated_at write setFupdated_at;

  End;

implementation

{TCountry}

procedure TCountry.setFcreated_at(Value: Tdatetime);
begin
  Fcreated_at := Value;
end;

procedure TCountry.setFid(Value: Integer);
begin
  FId := Value;
end;

procedure TCountry.setFname(Value: String);
begin
  FName := Value;
end;


procedure TCountry.setFupdated_at(Value: Tdatetime);
begin
  Fupdated_at := Value;
end;


end.
