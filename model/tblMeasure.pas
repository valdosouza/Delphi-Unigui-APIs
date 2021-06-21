unit tblMeasure;

interface

Uses GenericEntity,CAtribEntity, Classes, SysUtils;
Type
  //nome da classe de entidade
  [TableName('tb_measure')]
  TMeasure = Class(TGenericEntity)
  private
    Fdescription: String;
    FId: Integer;
    Fupdated_at: TDAteTime;
    Fabbreviation: String;
    Fcreated_at: TDAteTime;
    Fescale: String;
    procedure setFabbreviation(const Value: String);
    procedure setFcreated_at(const Value: TDAteTime);
    procedure setFdescription(const Value: String);
    procedure setFId(const Value: Integer);
    procedure setFupdated_at(const Value: TDAteTime);
    procedure setFescale(const Value: String);

  public
    [FieldName('id')]
    [KeyField('id')]
    property Codigo: Integer read FId write setFId;

    [FieldName('description')]
    property Descricao: String read Fdescription write setFdescription;

    [FieldName('abbreviation')]
    property Abreviatura: String read Fabbreviation write setFabbreviation;

    [FieldName('escale')]
    property Escala: String read Fescale write setFescale;

    [FieldName('created_at')]
    property RegistroCriado: TDAteTime read Fcreated_at write setFcreated_at;

    [FieldName('updated_at')]
    property RegistroAlterado: TDAteTime read Fupdated_at write setFupdated_at;

  End;


implementation

{ TMeasure }

procedure TMeasure.setFabbreviation(const Value: String);
begin
  Fabbreviation := Value;
end;

procedure TMeasure.setFcreated_at(const Value: TDAteTime);
begin
  Fcreated_at := Value;
end;

procedure TMeasure.setFdescription(const Value: String);
begin
  Fdescription := Value;
end;

procedure TMeasure.setFescale(const Value: String);
begin
  Fescale := Value;
end;

procedure TMeasure.setFId(const Value: Integer);
begin
  FId := Value;
end;

procedure TMeasure.setFupdated_at(const Value: TDAteTime);
begin
  Fupdated_at := Value;
end;

end.
