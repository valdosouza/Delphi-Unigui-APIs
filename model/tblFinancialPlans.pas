unit tblFinancialPlans;

interface

Uses GenericEntity,CAtribEntity, Classes, SysUtils;
Type
  //nome da classe de entidade
  [TableName('tb_financial_plans')]
  TFinancialPlans = Class(TGenericEntity)
  private
    Fposit_level: String;
    Fdescription: String;
    Fsource_: String;
    Fcluster: String;
    Fenabled: String;
    FId: Integer;
    Fupdated_at: TDAteTime;
    Ftb_institution_id: Integer;
    Fkind: String;
    Fcreated_at: TDAteTime;
    procedure setFcluster(const Value: String);
    procedure setFcreated_at(const Value: TDAteTime);
    procedure setFdescription(const Value: String);
    procedure setFenabled(const Value: String);
    procedure setFId(const Value: Integer);
    procedure setFkind(const Value: String);
    procedure setFposit_level(const Value: String);
    procedure setFsource_(const Value: String);
    procedure setFtb_institution_id(const Value: Integer);
    procedure setFupdated_at(const Value: TDAteTime);


  public
    [KeyField('id')]
    [FieldName('id')]
    property Codigo: Integer read FId write setFId;

    [KeyField('tb_institution_id')]
    [FieldName('tb_institution_id')]
    property Estabelecimento: Integer read Ftb_institution_id write setFtb_institution_id;

    [FieldName('posit_level')]
    property NivelPosicao: String read Fposit_level write setFposit_level;

    [FieldName('description')]
    property Descricao: String read Fdescription write setFdescription;

    [FieldName('source_')]
    property Fonte: String read Fsource_ write setFsource_;

    [FieldName('kind')]
    property Tipo: String read Fkind write setFkind;

    [FieldName('cluster')]
    property Agrupador: String read Fcluster write setFcluster;

    [FieldName('active')]
    property Ativo: String read Fenabled write setFenabled;

    [FieldName('created_at')]
    property RegistroCriado: TDAteTime read Fcreated_at write setFcreated_at;

    [FieldName('updated_at')]
    property RegistroAlterado: TDAteTime read Fupdated_at write setFupdated_at;

  End;


implementation

{ TFinancialPlans }

procedure TFinancialPlans.setFcluster(const Value: String);
begin
  Fcluster := Value;
end;

procedure TFinancialPlans.setFcreated_at(const Value: TDAteTime);
begin
  Fcreated_at := Value;
end;

procedure TFinancialPlans.setFdescription(const Value: String);
begin
  Fdescription := Value;
end;

procedure TFinancialPlans.setFenabled(const Value: String);
begin
  Fenabled := Value;
end;

procedure TFinancialPlans.setFId(const Value: Integer);
begin
  FId := Value;
end;

procedure TFinancialPlans.setFkind(const Value: String);
begin
  Fkind := Value;
end;

procedure TFinancialPlans.setFposit_level(const Value: String);
begin
  Fposit_level := Value;
end;

procedure TFinancialPlans.setFsource_(const Value: String);
begin
  Fsource_ := Value;
end;

procedure TFinancialPlans.setFtb_institution_id(const Value: Integer);
begin
  Ftb_institution_id := Value;
end;

procedure TFinancialPlans.setFupdated_at(const Value: TDAteTime);
begin
  Fupdated_at := Value;
end;

end.
