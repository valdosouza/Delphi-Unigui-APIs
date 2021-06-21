unit tblPhone;

interface

Uses GenericEntity,CAtribEntity;

Type
  //nome da classe de entidade
  [TableName('tb_phone')]
  TPhone = Class(TGenericEntity)
  private
    Fid : Integer;
    Fkind : String;
    Fcontact : String;
    Fnumber : String;
    FaddressKind : String;
    Fcreated_at: TDAteTime;
    Fupdated_at: TDAteTime;

    procedure setFid(Value: Integer);
    procedure setFkind(Value : String);
    procedure setFcontact(Value : String);
    procedure setFnumber(Value : String);
    procedure setFaddressKind(Value : String);
    procedure setFcreated_at( Value : TDateTime);
    procedure setFupdated_at( Value : TDateTime);

  public

    [KeyField('id')]
    [FieldName('id')]
    property Codigo: Integer read FID write setFID;

    [KeyField('kind')]
    [FieldName('kind')]
    property Tipo: String read FKind write setFKind;

    [FieldName('contact')]
    property Contato: String read Fcontact write setFcontact;

    [FieldName('number')]
    property Numero: String read FNumber write setFnumber;

    [FieldName('address_kind')]
    property TipoEndereco: String read FaddressKind write setFaddressKind;

    [FieldName('created_at')]
    property RegistroCriado: TDAteTime read Fcreated_at write setFcreated_at;

    [FieldName('updated_at')]
    property RegistroAlterado: TDAteTime read Fupdated_at write setFupdated_at;

  End;

implementation

{ TPhone }

procedure TPhone.setFaddressKind(Value: String);
begin
  FaddressKind := Value;
end;

procedure TPhone.setFcontact(Value: String);
begin
  Fcontact := Value;
end;

procedure TPhone.setFcreated_at(Value: TDateTime);
begin
  Fcreated_at :=  Value;
end;

procedure TPhone.setFid(Value: Integer);
begin
  Fid := Value;
end;

procedure TPhone.setFkind(Value: String);
begin
  Fkind := Value;
end;

procedure TPhone.setFnumber(Value: String);
begin
  Fnumber := Value;
end;

procedure TPhone.setFupdated_at(Value: TDateTime);
begin
  Fupdated_at := Value;
end;

end.
