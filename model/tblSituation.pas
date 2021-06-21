unit tblSituation;

interface

Uses GenericEntity,CAtribEntity;

Type
  //nome da classe de entidade
  [TableName('tb_situation')]
  TSituation = Class(TGenericEntity)
  private
		Fid : Integer;
		Ftb_institution_id : Integer;
    Fdescription : String;
    Fmodulo : String;
    Fflag_01 : String;
    Fflag_02 : String;
    Fflag_03 : String;
    Fflag_04 : String;
    Factive : String;
    Fcreated_at : TDateTime;
		Fupdated_at : TDateTime;
    procedure setFActive(const Value: String);
    procedure setFcreated_at(const Value: TDatetime);
    procedure setFdescription(const Value: String);
    procedure setFflag_01(const Value: String);
    procedure setFflag_02(const Value: String);
    procedure setFflag_03(const Value: String);
    procedure setFflag_04(const Value: String);
    procedure setFid(const Value: Integer);
    procedure setFmodulo(const Value: String);
    procedure setFtb_institution_id(const Value: Integer);
    procedure setFupdated_at(const Value: TDatetime);



  public
    [KeyField('id')]
    [FieldName('id')]
    property Codigo: Integer read Fid write setFid;

	  [KeyField('tb_institution_id')]
    [FieldName('tb_institution_id')]
    property Estabelecimento: Integer read Ftb_institution_id write setFtb_institution_id;

    [FieldName('description')]
    property Descricao: String read Fdescription write setFdescription;

    [FieldName('modulo')]
    property Modulo: String read Fmodulo write setFmodulo;

    [FieldName('flag_01')]
    property Flag1: String read Fflag_01 write setFflag_01;

   [FieldName('flag_02')]
    property Flag2: String read Fflag_02 write setFflag_02;

    [FieldName('flag_03')]
    property Flag3: String read Fflag_03 write setFflag_03;

    [FieldName('flag_04')]
    property Flag4: String read Fflag_04 write setFflag_04;

    [FieldName('active')]
    property Ativo: String read FActive write setFActive;

	  [FieldName('created_at')]
    property RegistroCriado: TDatetime read Fcreated_at write setFcreated_at;

    [FieldName('updated_at')]
    property RegistroAlterado: TDatetime read Fupdated_at write setFupdated_at;

	End;

implementation




{ TSituation }

procedure TSituation.setFActive(const Value: String);
begin
  FActive := Value;
end;

procedure TSituation.setFcreated_at(const Value: TDatetime);
begin
  Fcreated_at := Value;
end;

procedure TSituation.setFdescription(const Value: String);
begin
  Fdescription := Value;
end;

procedure TSituation.setFflag_01(const Value: String);
begin
  Fflag_01 := Value;
end;

procedure TSituation.setFflag_02(const Value: String);
begin
  Fflag_02 := Value;
end;

procedure TSituation.setFflag_03(const Value: String);
begin
  Fflag_03 := Value;
end;

procedure TSituation.setFflag_04(const Value: String);
begin
  Fflag_04 := Value;
end;

procedure TSituation.setFid(const Value: Integer);
begin
  Fid := Value;
end;

procedure TSituation.setFmodulo(const Value: String);
begin
  Fmodulo := Value;
end;

procedure TSituation.setFtb_institution_id(const Value: Integer);
begin
  Ftb_institution_id := Value;
end;

procedure TSituation.setFupdated_at(const Value: TDatetime);
begin
  Fupdated_at := Value;
end;

end.
