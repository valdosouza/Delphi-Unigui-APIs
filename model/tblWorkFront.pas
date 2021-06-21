unit tblWorkFront;

interface

Uses GenericEntity,CAtribEntity;

Type
  //nome da classe de entidade
  [TableName('tb_work_front')]
  TWorkFront = Class(TGenericEntity)
  private
    Factive: String;
    Fdescription: String;
    Fid: Integer;
    Fupdated_at: TDAteTime;
    Ftb_institution_id: Integer;
    Fcreated_at: TDAteTime;
    procedure setFactive(const Value: String);
    procedure setFcreated_at(const Value: TDAteTime);
    procedure setFdescription(const Value: String);
    procedure setFid(const Value: Integer);
    procedure setFtb_institution_id(const Value: Integer);
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

    [FieldName('active')]
    property Ativo: String read Factive write setFactive;


    [FieldName('created_at')]
    property RegistroCriado: TDAteTime read Fcreated_at write setFcreated_at;

    [FieldName('updated_at')]
    property RegistroAlterado: TDAteTime read Fupdated_at write setFupdated_at;

	End;

implementation

{ TWorkFront }

procedure TWorkFront.setFactive(const Value: String);
begin
  Factive := Value;
end;

procedure TWorkFront.setFcreated_at(const Value: TDAteTime);
begin
  Fcreated_at := Value;
end;

procedure TWorkFront.setFdescription(const Value: String);
begin
  Fdescription := Value;
end;

procedure TWorkFront.setFid(const Value: Integer);
begin
  Fid := Value;
end;

procedure TWorkFront.setFtb_institution_id(const Value: Integer);
begin
  Ftb_institution_id := Value;
end;

procedure TWorkFront.setFupdated_at(const Value: TDAteTime);
begin
  Fupdated_at := Value;
end;

end.
