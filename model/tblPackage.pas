unit tblPackage;

interface

Uses GenericEntity,CAtribEntity, Classes, SysUtils;
Type
  //nome da classe de entidade
  [TableName('tb_package')]
  TPackage = Class(TGenericEntity)
  private
    Fdescription: String;
    FId: Integer;
    Fupdated_at: TDAteTime;
    Fabbreviation: String;
    Fcreated_at: TDAteTime;
    procedure setFabbreviation(const Value: String);
    procedure setFcreated_at(const Value: TDAteTime);
    procedure setFdescription(const Value: String);
    procedure setFId(const Value: Integer);
    procedure setFupdated_at(const Value: TDAteTime);

  public
    [FieldName('id')]
    [KeyField('id')]
    property Codigo: Integer read FId write setFId;

    [FieldName('description')]
    property Descricao: String read Fdescription write setFdescription;

    [FieldName('abbreviation')]
    property Abreviatura: String read Fabbreviation write setFabbreviation;

    [FieldName('created_at')]
    property RegistroCriado: TDAteTime read Fcreated_at write setFcreated_at;

    [FieldName('updated_at')]
    property RegistroAlterado: TDAteTime read Fupdated_at write setFupdated_at;

  End;

implementation

{ TPackage }

procedure TPackage.setFabbreviation(const Value: String);
begin
  Fabbreviation := Value;
end;

procedure TPackage.setFcreated_at(const Value: TDAteTime);
begin
  Fcreated_at := Value;
end;

procedure TPackage.setFdescription(const Value: String);
begin
  Fdescription := Value;
end;

procedure TPackage.setFId(const Value: Integer);
begin
  FId := Value;
end;

procedure TPackage.setFupdated_at(const Value: TDAteTime);
begin
  Fupdated_at := Value;
end;

end.
