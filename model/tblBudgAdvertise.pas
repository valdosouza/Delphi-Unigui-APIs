unit tblBudgAdvertise;

interface

Uses GenericEntity,CAtribEntity;

Type
  //nome da classe de entidade
  [TableName('tb_budg_advertise')]
  TBudgAdvertise = Class(TGenericEntity)

  private
    Femail: String;
    FId: Integer;
    Fupdated_at: TDAteTime;
    Fnumber: Integer;
    Ftb_institution_id: Integer;
    Fcreated_at: TDAteTime;
    procedure setFcreated_at(const Value: TDAteTime);
    procedure setFemail(const Value: String);
    procedure setFId(const Value: Integer);
    procedure setFnumber(const Value: Integer);
    procedure setFtb_institution_id(const Value: Integer);
    procedure setFupdated_at(const Value: TDAteTime);
  public

    [FieldName('id')]
    [KeyField('id')]
    property Codigo: Integer read FId write setFId;

    [FieldName('tb_institution_id')]
    [KeyField('tb_institution_id')]
    property Estabelecimento: Integer read Ftb_institution_id write setFtb_institution_id;

    [FieldName('number')]
    property Numero: Integer read Fnumber write setFnumber;

    [FieldName('email')]
    property email: String read Femail write setFemail;

    [FieldName('created_at')]
    property RegistroCriado: TDAteTime read Fcreated_at write setFcreated_at;

    [FieldName('updated_at')]
    property RegistroAlterado: TDAteTime read Fupdated_at write setFupdated_at;
  End;


implementation

{ TBudgAdvertise }

procedure TBudgAdvertise.setFcreated_at(const Value: TDAteTime);
begin
  Fcreated_at := Value;
end;

procedure TBudgAdvertise.setFemail(const Value: String);
begin
  Femail := Value;
end;

procedure TBudgAdvertise.setFId(const Value: Integer);
begin
  FId := Value;
end;

procedure TBudgAdvertise.setFnumber(const Value: Integer);
begin
  Fnumber := Value;
end;

procedure TBudgAdvertise.setFtb_institution_id(const Value: Integer);
begin
  Ftb_institution_id := Value;
end;

procedure TBudgAdvertise.setFupdated_at(const Value: TDAteTime);
begin
  Fupdated_at := Value;
end;

end.
