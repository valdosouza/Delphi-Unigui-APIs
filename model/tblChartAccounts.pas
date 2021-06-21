unit tblChartAccounts;

interface

Uses GenericEntity,CAtribEntity;

Type
  //nome da classe de entidade
  [TableName('tb_chart_accounts')]
  TChartAccounts = Class(TGenericEntity)
  private
    Fid : Integer;
	  Ftb_institution_id : Integer;
    Fcode : String;
    Fdescription : String;
    Fnature : String;
    Fkind : String;
    Flevel : String;
  	Fcreated_at : TDateTime;
	  Fupdated_at : TDateTime;

    procedure setFid(Value : Integer);
	  procedure setFtb_institution_id(Value : Integer);
    procedure setFcode(Value : String);
    procedure setFdescription(Value : String);
    procedure setFnature(Value : String);
    procedure setFkind(Value : String);
    procedure setFlevel(Value : String);
  	procedure setFcreated_at(Value : tdatetime);
	  procedure setFupdated_at(Value : tdatetime);

  public
    [KeyField('id')]
    [FieldName('id')]
    property Codigo: Integer read Fid write setFid;

    [KeyField('tb_institution_id')]
    [FieldName('tb_institution_id')]
    property Estabelecimento: Integer read Ftb_institution_id write setFtb_institution_id;

    [FieldName('code')]
    property Cod: String read Fcode write setFcode;

    [FieldName('description')]
    property Descricao: String read Fdescription write setFdescription;

    [FieldName('nature')]
    property Natureza: String read Fnature write setFnature;

    [FieldName('kind')]
    property Tipo: String read Fkind write setFkind;

    [FieldName('Flevel')]
    property Nivel: String read Flevel write setFlevel;

    [FieldName('created_at')]
    property RegistroCriado: TDAteTime read Fcreated_at write setFcreated_at;

    [FieldName('updated_at')]
    property RegistroAlterado: TDAteTime read Fupdated_at write setFupdated_at;

	End;

implementation


{ TChartAccounts }

procedure TChartAccounts.setFcode(Value: String);
begin
   Fcode := Value;
end;

procedure TChartAccounts.setFcreated_at(Value: tdatetime);
begin
   Fcreated_at := Value;
end;

procedure TChartAccounts.setFdescription(Value: String);
begin
   Fdescription := Value;
end;

procedure TChartAccounts.setFid(Value: Integer);
begin
  Fid := Value;
end;

procedure TChartAccounts.setFkind(Value: String);
begin
   Fkind := Value;
end;

procedure TChartAccounts.setFlevel(Value: String);
begin
  Flevel := Value;
end;

procedure TChartAccounts.setFnature(Value: String);
begin
   Fnature := Value;
end;

procedure TChartAccounts.setFtb_institution_id(Value: Integer);
begin
   Ftb_institution_id := Value;
end;

procedure TChartAccounts.setFupdated_at(Value: tdatetime);
begin
   Fupdated_at := Value;
end;

end.
