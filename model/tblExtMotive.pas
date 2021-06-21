unit tblExtMotive;

interface

Uses GenericEntity,GenericDao,CAtribEntity, System.Classes, System.SysUtils;
Type
  //nome da classe de entidade
  [TableName('tb_ext_motive')]
  TExtMotivos = Class(TGenericEntity)
  private
    FId: Integer;
    Fkind: String;
    Frule: String;
    Fdescription: String;
    Fdt_record: TDateTime;
    FActive: String;
    Fcreated_at: TDAteTime;
    Fupdated_at: TDAteTime;
    procedure setFcreated_at(const Value: TDAteTime);
    procedure setFdescription(const Value: String);
    procedure setFId(const Value: Integer);
    procedure setFkind(const Value: String);
    procedure setFrule(const Value: String);
    procedure setFupdated_at(const Value: TDAteTime);



  public
    [FieldName('id')]
    [KeyField('id')]
    property Codigo: Integer read FId write setFId;

    [FieldName('kind')]
    property Tipo: String read Fkind write setFkind;

    [FieldName('rule')]
    property Norma: String read Frule write setFrule;

    [FieldName('description')]
    property Descricao: String read Fdescription write setFdescription;

    [FieldName('created_at')]
    property RegistroCriado: TDAteTime read Fcreated_at write setFcreated_at;

    [FieldName('updated_at')]
    property RegistroAlterado: TDAteTime read Fupdated_at write setFupdated_at;

  End;
implementation


{ TExtMotivos }

procedure TExtMotivos.setFcreated_at(const Value: TDAteTime);
begin
  Fcreated_at := Value;
end;

procedure TExtMotivos.setFdescription(const Value: String);
begin
  Fdescription := Value;
end;

procedure TExtMotivos.setFId(const Value: Integer);
begin
  FId := Value;
end;

procedure TExtMotivos.setFkind(const Value: String);
begin
  Fkind := Value;
end;

procedure TExtMotivos.setFrule(const Value: String);
begin
  Frule := Value;
end;

procedure TExtMotivos.setFupdated_at(const Value: TDAteTime);
begin
  Fupdated_at := Value;
end;

end.
