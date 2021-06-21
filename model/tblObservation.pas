unit tblObservation;

interface

Uses GenericEntity,CAtribEntity;

Type
  //nome da classe de entidade
  [TableName('tb_observation')]
  TObservation = Class(TGenericEntity)
  private
    Fgeneral: String;
    Fdescription: String;
    Fid: Integer;
    Fnote: String;
    Fupdated_at: TDAteTime;
    Ftb_institution_id: Integer;
    Fcreated_at: TDAteTime;
    procedure setFcreated_at(const Value: TDAteTime);
    procedure setFdescription(const Value: String);
    procedure setFgeneral(const Value: String);
    procedure setFid(const Value: Integer);
    procedure setFnote(const Value: String);
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

    [FieldName('note')]
    property Nota: String read Fnote write setFnote;

    [FieldName('general')]
    property Geral: String read Fgeneral write setFgeneral;

    [FieldName('created_at')]
    property RegistroCriado: TDAteTime read Fcreated_at write setFcreated_at;

    [FieldName('updated_at')]
    property RegistroAlterado: TDAteTime read Fupdated_at write setFupdated_at;

	End;

implementation



{ TObservation }

procedure TObservation.setFcreated_at(const Value: TDAteTime);
begin
  Fcreated_at := Value;
end;

procedure TObservation.setFdescription(const Value: String);
begin
  Fdescription := Value;
end;

procedure TObservation.setFgeneral(const Value: String);
begin
  Fgeneral := Value;
end;

procedure TObservation.setFid(const Value: Integer);
begin
  Fid := Value;
end;

procedure TObservation.setFnote(const Value: String);
begin
  Fnote := Value;
end;

procedure TObservation.setFtb_institution_id(const Value: Integer);
begin
  Ftb_institution_id := Value;
end;

procedure TObservation.setFupdated_at(const Value: TDAteTime);
begin
  Fupdated_at := Value;
end;

end.
