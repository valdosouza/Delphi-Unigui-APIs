unit tblCollaborator;

interface

Uses GenericEntity,CAtribEntity;

Type
  //nome da classe de entidade
  [TableName('tb_collaborator')]
  TCollaborator = Class(TGenericEntity)
  private
    Fvote_zone: String;
    Fvote_number: String;
    Ffahters_name: String;
    FActive: String;
    Fid: Integer;
    Fmothers_name: String;
    Fsalary: Real;
    Fupdated_at: TDatetime;
    Fpis: String;
    Ftb_institution_id: Integer;
    Fdt_admission: TDateTime;
    Fmilitary_certificate: String;
    Fvote_section: String;
    Fcreated_at: TDatetime;
    Fdt_resignation: TdateTime;
    procedure setFActive(const Value: String);
    procedure setFcreated_at(const Value: TDatetime);
    procedure setFdt_admission(const Value: TDateTime);
    procedure setFdt_resignation(const Value: TdateTime);
    procedure setFfahters_name(const Value: String);
    procedure setFid(const Value: Integer);
    procedure setFmilitary_certificate(const Value: String);
    procedure setFmothers_name(const Value: String);
    procedure setFpis(const Value: String);
    procedure setFsalary(const Value: Real);
    procedure setFtb_institution_id(const Value: Integer);
    procedure setFupdated_at(const Value: TDatetime);
    procedure setFvote_number(const Value: String);
    procedure setFvote_section(const Value: String);
    procedure setFvote_zone(const Value: String);



  public
	  [KeyField('id')]
    [FieldName('id')]
    property Codigo: Integer read Fid write setFid;

	  [KeyField('tb_institution_id')]
    [FieldName('tb_institution_id')]
    property Estabelecimento: Integer read Ftb_institution_id write setFtb_institution_id;

    [FieldName('dt_admission')]
    property DataAdmissao: TDateTime read Fdt_admission write setFdt_admission;

    [FieldName('dt_resignation')]
    property DataDemissao: TdateTime read Fdt_resignation write setFdt_resignation;

    [FieldName('salary')]
    property Salario: Real read Fsalary write setFsalary;

    [FieldName('fahters_name')]
    property Pai: String read Ffahters_name write setFfahters_name;

    [FieldName('mothers_name')]
    property Mamae: String read Fmothers_name write setFmothers_name;

    [FieldName('vote_number')]
    property Titulo: String read Fvote_number write setFvote_number;

    [FieldName('vote_zone')]
    property Zona: String read Fvote_zone write setFvote_zone;

    [FieldName('vote_section')]
    property Sessão: String read Fvote_section write setFvote_section;

    [FieldName('military_certificate')]
    property Certificado: String read Fmilitary_certificate write setFmilitary_certificate;

   [FieldName('active')]
    property Ativo: String read FActive write setFActive;

    [FieldName('pis')]
    property Pis: String read Fpis write setFpis;


	  [FieldName('created_at')]
    property RegistroCriado: TDatetime read Fcreated_at write setFcreated_at;

    [FieldName('updated_at')]
    property RegistroAlterado: TDatetime read Fupdated_at write setFupdated_at;

	End;

implementation



{ TCollaborator }

procedure TCollaborator.setFActive(const Value: String);
begin
  FActive := Value;
end;

procedure TCollaborator.setFcreated_at(const Value: TDatetime);
begin
  Fcreated_at := Value;
end;

procedure TCollaborator.setFdt_admission(const Value: TDateTime);
begin
  Fdt_admission := Value;
end;

procedure TCollaborator.setFdt_resignation(const Value: TdateTime);
begin
  Fdt_resignation := Value;
end;

procedure TCollaborator.setFfahters_name(const Value: String);
begin
  Ffahters_name := Value;
end;

procedure TCollaborator.setFid(const Value: Integer);
begin
  Fid := Value;
end;

procedure TCollaborator.setFmilitary_certificate(const Value: String);
begin
  Fmilitary_certificate := Value;
end;

procedure TCollaborator.setFmothers_name(const Value: String);
begin
  Fmothers_name := Value;
end;

procedure TCollaborator.setFpis(const Value: String);
begin
  Fpis := Value;
end;

procedure TCollaborator.setFsalary(const Value: Real);
begin
  Fsalary := Value;
end;

procedure TCollaborator.setFtb_institution_id(const Value: Integer);
begin
  Ftb_institution_id := Value;
end;

procedure TCollaborator.setFupdated_at(const Value: TDatetime);
begin
  Fupdated_at := Value;
end;

procedure TCollaborator.setFvote_number(const Value: String);
begin
  Fvote_number := Value;
end;

procedure TCollaborator.setFvote_section(const Value: String);
begin
  Fvote_section := Value;
end;

procedure TCollaborator.setFvote_zone(const Value: String);
begin
  Fvote_zone := Value;
end;

end.
