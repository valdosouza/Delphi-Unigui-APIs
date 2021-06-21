unit tblDevices;

interface

Uses GenericEntity,GenericDao,CAtribEntity;

Type
  //nome da classe de entidade
  [TableName('tb_devices')]
  TDevices = Class(TGenericEntity)
  private
    Factive: String;
    Fdescription: String;
    Fid: Integer;
    Fupdated_at: TDAteTime;
    Fidentification: String;
    Fapp_name: String;
    Ftb_institution_id: Integer;
    Ftb_user_id: Integer;
    Fshelf_life: TDateTime;
    Fcreated_at: TDAteTime;
    procedure setFactive(const Value: String);
    procedure setFapp_name(const Value: String);
    procedure setFcreated_at(const Value: TDAteTime);
    procedure setFdescription(const Value: String);
    procedure setFid(const Value: Integer);
    procedure setFidentification(const Value: String);
    procedure setFshelf_life(const Value: TDateTime);
    procedure setFtb_institution_id(const Value: Integer);
    procedure setFtb_user_id(const Value: Integer);
    procedure setFupdated_at(const Value: TDAteTime);


  public
    [KeyField('id')]
    [FieldName('id')]
    property Codigo: Integer read Fid write setFid;

    [KeyField('tb_institution_id')]
    [FieldName('tb_institution_id')]
    property Estabelecimento: Integer read Ftb_institution_id write setFtb_institution_id;

    [FieldName('description')]
    property Descricao: String read Fdescription write setFdescription;

    [FieldName('tb_user_id')]
    property Usuario: Integer read Ftb_user_id write setFtb_user_id;

    [FieldName('identification')]
    property Identificacao: String read Fidentification write setFidentification;

    [FieldName('shelf_life')]
    property Validade: TDateTime read Fshelf_life write setFshelf_life;

    [FieldName('app_name')]
    property NomeApp: String read Fapp_name write setFapp_name;

    [FieldName('active')]
    property Ativo: String read Factive  write setFactive;
    [FieldName('created_at')]
    property RegistroCriado: TDAteTime read Fcreated_at write setFcreated_at;

    [FieldName('updated_at')]
    property RegistroAlterado: TDateTime read Fupdated_at write setFupdated_at;
  End;

implementation

{ TDevices }

procedure TDevices.setFactive(const Value: String);
begin
  Factive := Value;
end;

procedure TDevices.setFapp_name(const Value: String);
begin
  Fapp_name := Value;
end;

procedure TDevices.setFcreated_at(const Value: TDAteTime);
begin
  Fcreated_at := Value;
end;

procedure TDevices.setFdescription(const Value: String);
begin
  Fdescription := Value;
end;

procedure TDevices.setFid(const Value: Integer);
begin
  Fid := Value;
end;

procedure TDevices.setFidentification(const Value: String);
begin
  Fidentification := Value;
end;

procedure TDevices.setFshelf_life(const Value: TDateTime);
begin
  Fshelf_life := Value;
end;

procedure TDevices.setFtb_institution_id(const Value: Integer);
begin
  Ftb_institution_id := Value;
end;

procedure TDevices.setFtb_user_id(const Value: Integer);
begin
  Ftb_user_id := Value;
end;

procedure TDevices.setFupdated_at(const Value: TDAteTime);
begin
  Fupdated_at := Value;
end;

end.
