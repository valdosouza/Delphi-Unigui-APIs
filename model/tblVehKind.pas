unit tblVehKind;

interface

Uses GenericEntity,GenericDao,CAtribEntity, System.Classes, System.SysUtils;
Type
  //nome da classe de entidade
  [TableName('tb_veh_kind')]
  TVehKind = Class(TGenericEntity)
  private
    Fdescription: String;
    FId: Integer;
    Fupdated_at: TDAteTime;
    Frenavam: String;
    Fcreated_at: TDAteTime;
    procedure setFcreated_at(const Value: TDAteTime);
    procedure setFdescription(const Value: String);
    procedure setFId(const Value: Integer);
    procedure setFrenavam(const Value: String);
    procedure setFupdated_at(const Value: TDAteTime);


  public
    [FieldName('id')]
    [KeyField('id')]
    property Codigo: Integer read FId write setFId;

    [FieldName('renavam')]
    property Renavam: String read Frenavam write setFrenavam;

    [FieldName('description')]
    property Descricao: String read Fdescription write setFdescription;

    [FieldName('created_at')]
    property RegistroCriado: TDAteTime read Fcreated_at write setFcreated_at;

    [FieldName('updated_at')]
    property RegistroAlterado: TDAteTime read Fupdated_at write setFupdated_at;

  End;
implementation

{ TVehKind }

procedure TVehKind.setFcreated_at(const Value: TDAteTime);
begin
  Fcreated_at := Value;
end;

procedure TVehKind.setFdescription(const Value: String);
begin
  Fdescription := Value;
end;

procedure TVehKind.setFId(const Value: Integer);
begin
  FId := Value;
end;

procedure TVehKind.setFrenavam(const Value: String);
begin
  Frenavam := Value;
end;

procedure TVehKind.setFupdated_at(const Value: TDAteTime);
begin
  Fupdated_at := Value;
end;

end.
