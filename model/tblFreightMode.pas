unit tblFreightMode;

interface

Uses GenericEntity,GenericDao,CAtribEntity, System.Classes, System.SysUtils;
Type
  //nome da classe de entidade
  [TableName('tb_freight_mode')]
  TFreightMode = Class(TGenericEntity)
  private
    Fdescription: String;
    FId: String;
    Fupdated_at: TDAteTime;
    Fcreated_at: TDAteTime;
    procedure setFcreated_at(const Value: TDAteTime);
    procedure setFdescription(const Value: String);
    procedure setFId(const Value: String);
    procedure setFupdated_at(const Value: TDAteTime);

  public
    [FieldName('id')]
    [KeyField('id')]
    property Codigo: String read FId write setFId;

    [FieldName('description')]
    property Descricao: String read Fdescription write setFdescription;

    [FieldName('created_at')]
    property RegistroCriado: TDAteTime read Fcreated_at write setFcreated_at;

    [FieldName('updated_at')]
    property RegistroAlterado: TDAteTime read Fupdated_at write setFupdated_at;

  End;
implementation


{ TFreightMode }

procedure TFreightMode.setFcreated_at(const Value: TDAteTime);
begin
  Fcreated_at := Value;
end;

procedure TFreightMode.setFdescription(const Value: String);
begin
  Fdescription := Value;
end;

procedure TFreightMode.setFId(const Value: String);
begin
  FId := Value;
end;

procedure TFreightMode.setFupdated_at(const Value: TDAteTime);
begin
  Fupdated_at := Value;
end;

end.
