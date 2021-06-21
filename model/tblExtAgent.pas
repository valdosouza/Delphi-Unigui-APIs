unit tblExtAgent;

interface

Uses GenericEntity,GenericDao,CAtribEntity, System.Classes, System.SysUtils;
Type
  //nome da classe de entidade
  [TableName('tb_ext_agent')]
  TExtAgent = Class(TGenericEntity)
  private
    Fdescription: String;
    FId: Integer;
    Fclass: String;
    Fdesc_inmetro: String;
    Fupdated_at: TDAteTime;
    Fcreated_at: TDAteTime;
    procedure setFclass(const Value: String);
    procedure setFcreated_at(const Value: TDAteTime);
    procedure setFdesc_inmetro(const Value: String);
    procedure setFdescription(const Value: String);
    procedure setFId(const Value: Integer);
    procedure setFupdated_at(const Value: TDAteTime);

  public
    [FieldName('id')]
    [KeyField('id')]
    property Codigo: Integer read FId write setFId;

    [FieldName('description')]
    property Descricao: String read Fdescription write setFdescription;

    [FieldName('class')]
    property Classe: String read Fclass write setFclass;

    [FieldName('desc_inmetro')]
    property InMetro: String read Fdesc_inmetro write setFdesc_inmetro;

    [FieldName('created_at')]
    property RegistroCriado: TDAteTime read Fcreated_at write setFcreated_at;

    [FieldName('updated_at')]
    property RegistroAlterado: TDAteTime read Fupdated_at write setFupdated_at;

  End;
implementation


{ TExtAgent }

procedure TExtAgent.setFclass(const Value: String);
begin
  Fclass := Value;
end;

procedure TExtAgent.setFcreated_at(const Value: TDAteTime);
begin
  Fcreated_at := Value;
end;

procedure TExtAgent.setFdescription(const Value: String);
begin
  Fdescription := Value;
end;

procedure TExtAgent.setFdesc_inmetro(const Value: String);
begin
  Fdesc_inmetro := Value;
end;

procedure TExtAgent.setFId(const Value: Integer);
begin
  FId := Value;
end;

procedure TExtAgent.setFupdated_at(const Value: TDAteTime);
begin
  Fupdated_at := Value;
end;

end.
