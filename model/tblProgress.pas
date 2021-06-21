unit tblProgress;

interface
Uses GenericEntity,GenericDao,CAtribEntity, System.Classes, System.SysUtils;
Type
  //nome da classe de entidade
  [TableName('tb_Progress')]
  TProgress = Class(TGenericEntity)

  private
    Ftb_iteration_id: integer;
    Ftb_performer_id: Integer;
    Fupdated_at: TDAteTime;
    Ftb_institution_id: integer;
    FId: Integer;
    Fdt_final: TDAteTime;
    Fdt_initi: TDAteTime;
    Fcreated_at: TDAteTime;
    procedure setFcreated_at(const Value: TDAteTime);
    procedure setFdt_final(const Value: TDAteTime);
    procedure setFdt_initi(const Value: TDAteTime);
    procedure setFId(const Value: Integer);
    procedure setFtb_institution_id(const Value: integer);
    procedure setFtb_iteration_id(const Value: integer);
    procedure setFtb_performer_id(const Value: Integer);
    procedure setFupdated_at(const Value: TDAteTime);

  public

    [FieldName('tb_iteration_id')]
    [KeyField('tb_iteration_id')]
    property Iteracao: integer read Ftb_iteration_id write setFtb_iteration_id;

    [FieldName('tb_institution_id')]
    [KeyField('tb_institution_id')]
    property Estabelecimento: integer read Ftb_institution_id write setFtb_institution_id;

    [FieldName('tb_order_id')]
    [KeyField('tb_order_id')]
    property Ordem: Integer read FId write setFId;

    [FieldName('tb_performer_id')]
    property Responsavel: Integer read Ftb_performer_id write setFtb_performer_id;

    [FieldName('dt_initi')]
    property DataInicial: TDAteTime read Fdt_initi write setFdt_initi;

    [FieldName('dt_final')]
    property DataFinal: TDAteTime read Fdt_final write setFdt_final;

    [FieldName('created_at')]
    property RegistroCriado: TDAteTime read Fcreated_at write setFcreated_at;

    [FieldName('updated_at')]
    property RegistroAlterado: TDAteTime read Fupdated_at write setFupdated_at;

  End;
implementation

{ TProgress }

procedure TProgress.setFcreated_at(const Value: TDAteTime);
begin
  Fcreated_at := Value;
end;

procedure TProgress.setFdt_final(const Value: TDAteTime);
begin
  Fdt_final := Value;
end;

procedure TProgress.setFdt_initi(const Value: TDAteTime);
begin
  Fdt_initi := Value;
end;

procedure TProgress.setFId(const Value: Integer);
begin
  FId := Value;
end;

procedure TProgress.setFtb_institution_id(const Value: integer);
begin
  Ftb_institution_id := Value;
end;

procedure TProgress.setFtb_iteration_id(const Value: integer);
begin
  Ftb_iteration_id := Value;
end;

procedure TProgress.setFtb_performer_id(const Value: Integer);
begin
  Ftb_performer_id := Value;
end;

procedure TProgress.setFupdated_at(const Value: TDAteTime);
begin
  Fupdated_at := Value;
end;

end.
