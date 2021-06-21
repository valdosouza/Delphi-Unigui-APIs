unit tblCarrier;

interface

Uses GenericEntity,GenericDao,CAtribEntity, System.Classes, System.SysUtils;
Type
  //nome da classe de entidade
  [TableName('tb_carrier')]
  TCarrier = Class(TGenericEntity)
  private
    FActive: String;
    FId: Integer;
    Fupdated_at: TDAteTime;
    Ftb_institution_id: Integer;
    Fcreated_at: TDAteTime;
    procedure setFcreated_at(const Value: TDAteTime);
    procedure setFActive(const Value: String);
    procedure setFId(const Value: Integer);
    procedure setFtb_institution_id(const Value: Integer);
    procedure setFupdated_at(const Value: TDAteTime);

  public
    [FieldName('id')]
    [KeyField('id')]
    property Codigo: Integer read FId write setFId;

    [FieldName('tb_institution_id')]
    property Estabelecimento: Integer read Ftb_institution_id write setFtb_institution_id;

    [FieldName('active')]
    property Ativo: String read FActive write setFActive;

    [FieldName('created_at')]
    property RegistroCriado: TDAteTime read Fcreated_at write setFcreated_at;

    [FieldName('updated_at')]
    property RegistroAlterado: TDAteTime read Fupdated_at write setFupdated_at;

  End;
implementation

{ TCarrier }

procedure TCarrier.setFcreated_at(const Value: TDAteTime);
begin
  Fcreated_at := Value;
end;

procedure TCarrier.setFActive(const Value: String);
begin
  FActive := Value;
end;

procedure TCarrier.setFId(const Value: Integer);
begin
  FId := Value;
end;

procedure TCarrier.setFtb_institution_id(const Value: Integer);
begin
  Ftb_institution_id := Value;
end;

procedure TCarrier.setFupdated_at(const Value: TDAteTime);
begin
  Fupdated_at := Value;
end;

end.
