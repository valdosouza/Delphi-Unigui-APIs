unit tblNfeEvents;

interface

Uses GenericEntity,GenericDao,CAtribEntity, System.Classes, System.SysUtils;
Type
  //nome da classe de entidade
  [TableName('tb_nfe_events')]
  TNfeEvents = Class(TGenericEntity)
  private
    Fdescription: String;
    FId: Integer;
    Fupdated_at: TDAteTime;
    Fcreated_at: TDAteTime;
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

    [FieldName('created_at')]
    property RegistroCriado: TDAteTime read Fcreated_at write setFcreated_at;

    [FieldName('updated_at')]
    property RegistroAlterado: TDAteTime read Fupdated_at write setFupdated_at;

  End;


implementation

{ TNfeEvents }

procedure TNfeEvents.setFcreated_at(const Value: TDAteTime);
begin
  Fcreated_at := Value;
end;

procedure TNfeEvents.setFdescription(const Value: String);
begin
  Fdescription := Value;
end;

procedure TNfeEvents.setFId(const Value: Integer);
begin
  FId := Value;
end;

procedure TNfeEvents.setFupdated_at(const Value: TDAteTime);
begin
  Fupdated_at := Value;
end;

end.
