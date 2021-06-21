unit tblIterationHasIteration;

interface

Uses GenericEntity,GenericDao,CAtribEntity, System.Classes, System.SysUtils;
Type
  //nome da classe de entidade
  [TableName('tb_iteration_has_iteration')]
  TIterationHasIteration = Class(TGenericEntity)

  private
    Fupdated_at: TDAteTime;
    Ftb_institution_id: integer;
    Ftb_iteration_id_detail: integer;
    Ftb_iteration_id_master: integer;
    FId: Integer;
    Fcreated_at: TDAteTime;
    procedure setFcreated_at(const Value: TDAteTime);
    procedure setFId(const Value: Integer);
    procedure setFtb_institution_id(const Value: integer);
    procedure setFtb_iteration_id_detail(const Value: integer);
    procedure setFtb_iteration_id_master(const Value: integer);
    procedure setFupdated_at(const Value: TDAteTime);

  public

    [FieldName('tb_institution_id')]
    [KeyField('tb_institution_id')]
    property Estabelecimento: integer read Ftb_institution_id write setFtb_institution_id;

    [FieldName('tb_order_id')]
    [KeyField('tb_order_id')]
    property Ordem: Integer read FId write setFId;

    [FieldName('tb_iteration_id_master')]
    [KeyField('tb_iteration_id_master')]
    property MasterId: integer read Ftb_iteration_id_master write setFtb_iteration_id_master;

    [FieldName('tb_iteration_id_detail')]
    [KeyField('tb_iteration_id_detail')]
    property DetailId: integer read Ftb_iteration_id_detail write setFtb_iteration_id_detail;

    [FieldName('created_at')]
    property RegistroCriado: TDAteTime read Fcreated_at write setFcreated_at;

    [FieldName('updated_at')]
    property RegistroAlterado: TDAteTime read Fupdated_at write setFupdated_at;

  End;

implementation

{ TIterationHasIteration }

procedure TIterationHasIteration.setFcreated_at(const Value: TDAteTime);
begin
  Fcreated_at := Value;
end;

procedure TIterationHasIteration.setFId(const Value: Integer);
begin
  FId := Value;
end;

procedure TIterationHasIteration.setFtb_institution_id(const Value: integer);
begin
  Ftb_institution_id := Value;
end;

procedure TIterationHasIteration.setFtb_iteration_id_detail(
  const Value: integer);
begin
  Ftb_iteration_id_detail := Value;
end;

procedure TIterationHasIteration.setFtb_iteration_id_master(
  const Value: integer);
begin
  Ftb_iteration_id_master := Value;
end;

procedure TIterationHasIteration.setFupdated_at(const Value: TDAteTime);
begin
  Fupdated_at := Value;
end;

end.
