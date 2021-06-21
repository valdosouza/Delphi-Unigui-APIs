unit tblMedMaterial;

interface

Uses GenericEntity,GenericDao,CAtribEntity, System.Classes, System.SysUtils;
Type
  //nome da classe de entidade
  [TableName('tb_med_material')]
  TMedMaterial = Class(TGenericEntity)
  private
    FId: Integer;
    Ftb_institution_id: Integer;
    Fdescription: String;
    Fdestiny: Integer;
    Factive: String;
    Fcreated_at: TDAteTime;
    Fupdated_at: TDAteTime;
    procedure setFId(const Value: Integer);
    procedure setFtb_institution_id(const Value: Integer);
    procedure setFdescription(const Value: String);
    procedure setFdestiny(const Value: Integer);
    procedure setFactive(const Value: String);
    procedure setFcreated_at(const Value: TDAteTime);
    procedure setFupdated_at(const Value: TDAteTime);



  public
    [FieldName('id')]
    [KeyField('id')]
    property Codigo: Integer read FId write setFId;

    [FieldName('tb_institution_id')]
    [KeyField('tb_institution_id')]
    property Estabelecimento: Integer read Ftb_institution_id write setFtb_institution_id;

    [FieldName('description')]
    property Descricao: String read Fdescription write setFdescription;

    [FieldName('destiny')]
    property Destino: Integer read Fdestiny write setFdestiny;

    [FieldName('active')]
    property Ativo: String read Factive write setFactive;

    [FieldName('created_at')]
    property RegistroCriado: TDAteTime read Fcreated_at write setFcreated_at;

    [FieldName('updated_at')]
    property RegistroAlterado: TDAteTime read Fupdated_at write setFupdated_at;

  End;


implementation




{ TMedMaterial }

procedure TMedMaterial.setFId(const Value: Integer);
begin
  FId := Value;
end;

procedure TMedMaterial.setFtb_institution_id(const Value: Integer);
begin
  Ftb_institution_id := Value;
end;

procedure TMedMaterial.setFdescription(const Value: String);
begin
  Fdescription := Value;
end;

procedure TMedMaterial.setFdestiny(const Value: Integer);
begin
  Fdestiny := Value;
end;

procedure TMedMaterial.setFactive(const Value: String);
begin
  Factive := Value;
end;

procedure TMedMaterial.setFcreated_at(const Value: TDAteTime);
begin
  Fcreated_at := Value;
end;

procedure TMedMaterial.setFupdated_at(const Value: TDAteTime);
begin
  Fupdated_at := Value;
end;

end.
