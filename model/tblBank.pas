unit tblBank;

interface

Uses GenericEntity,GenericDao,CAtribEntity, System.Classes, System.SysUtils;
Type
  //nome da classe de entidade
  [TableName('tb_bank')]
  TBank = Class(TGenericEntity)
  private
    FId: Integer;
    Fupdated_at: TDAteTime;
    Fnumber: String;
    Fcreated_at: TDAteTime;
    procedure setFcreated_at(const Value: TDAteTime);
    procedure setFId(const Value: Integer);
    procedure setFnumber(const Value: String);
    procedure setFupdated_at(const Value: TDAteTime);


  public
    [FieldName('id')]
    [KeyField('id')]
    property Codigo: Integer read FId write setFId;

    [FieldName('number')]
    property Numero: String read Fnumber write setFnumber;

    [FieldName('created_at')]
    property RegistroCriado: TDAteTime read Fcreated_at write setFcreated_at;

    [FieldName('updated_at')]
    property RegistroAlterado: TDAteTime read Fupdated_at write setFupdated_at;

  End;
implementation



{ TBank }

procedure TBank.setFcreated_at(const Value: TDAteTime);
begin
  Fcreated_at := Value;
end;

procedure TBank.setFId(const Value: Integer);
begin
  FId := Value;
end;

procedure TBank.setFnumber(const Value: String);
begin
  Fnumber := Value;
end;

procedure TBank.setFupdated_at(const Value: TDAteTime);
begin
  Fupdated_at := Value;
end;

end.
