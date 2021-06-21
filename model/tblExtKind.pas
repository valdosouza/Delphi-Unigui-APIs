unit tblExtKind;

interface

Uses GenericEntity,GenericDao,CAtribEntity, System.Classes, System.SysUtils;
Type
  //nome da classe de entidade
  [TableName('tb_ext_kind')]
  TExtKind = Class(TGenericEntity)
  private
    FId: Integer;
    Ftb_institution_id: Integer;
    Ftb_ext_agenc_id: Integer;
    Fcapacity: Real;
    Ftb_measure_id: Integer;
    Fdays_to_inspection: Integer;
    Fdays_to_level_2: Integer;
    Fdays_to_level_3: Integer;
    Fday_to_exp_charge: Integer;
    Ftol_insp_charge_min: Real;
    Ftol_insp_charge_max: Real;
    Ftol_main_charge_min: Real;
    Ftol_main_charge_max: Real;
    Ftol_weight_loss: Real;
    Ftol_hydraulic_volume: Real;
    Ftol_permanent_expansion: Real;
    Fdischarge_time: Real;
    Fjet_range: Real;
    Fload_yield: Real;
    Fcreated_at: TDAteTime;
    Fupdated_at: TDAteTime;
    procedure setFcapacity(const Value: Real);
    procedure setFcreated_at(const Value: TDAteTime);
    procedure setFday_to_exp_charge(const Value: Integer);
    procedure setFdays_to_inspection(const Value: Integer);
    procedure setFdays_to_level_2(const Value: Integer);
    procedure setFdays_to_level_3(const Value: Integer);
    procedure setFdischarge_time(const Value: Real);
    procedure setFId(const Value: Integer);
    procedure setFjet_range(const Value: Real);
    procedure setFload_yield(const Value: Real);
    procedure setFtb_ext_agenc_id(const Value: Integer);
    procedure setFtb_institution_id(const Value: Integer);
    procedure setFtb_measure_id(const Value: Integer);
    procedure setFtol_hydraulic_volume(const Value: Real);
    procedure setFtol_insp_charge_max(const Value: Real);
    procedure setFtol_insp_charge_min(const Value: Real);
    procedure setFtol_main_charge_max(const Value: Real);
    procedure setFtol_main_charge_min(const Value: Real);
    procedure setFtol_permanent_expansion(const Value: Real);
    procedure setFtol_weight_loss(const Value: Real);
    procedure setFupdated_at(const Value: TDAteTime);


  public
    [FieldName('id')]
    [KeyField('id')]
    property Codigo: Integer read FId write setFId;

    [KeyField('tb_institution_id')]
    [FieldName('tb_institution_id')]
    property Estabelecimento: Integer read Ftb_institution_id write setFtb_institution_id;

    [FieldName('tb_ext_agent_id')]
    property AgenteExtintor: Integer read Ftb_ext_agenc_id write setFtb_ext_agenc_id;

    [FieldName('capacity')]
    property CargaNominal: Real read Fcapacity write setFcapacity;

    [FieldName('tb_measure_id')]
    property Unidade: Integer read Ftb_measure_id write setFtb_measure_id;

    [FieldName('days_to_inspection')]
    property Inspecao: Integer read Fdays_to_inspection write setFdays_to_inspection;

    [FieldName('days_to_level_2')]
    property Manutencao2: Integer read Fdays_to_level_2 write setFdays_to_level_2;

    [FieldName('days_to_level_3')]
    property Manutencao3: Integer read Fdays_to_level_3 write setFdays_to_level_3;

    [FieldName('day_to_exp_charge')]
    property CargaMaxima: Integer read Fday_to_exp_charge write setFday_to_exp_charge;

    [FieldName('tol_insp_charge_min')]
    property InspecaoMinima: Real read Ftol_insp_charge_min write setFtol_insp_charge_min;

    [FieldName('tol_insp_charge_max')]
    property InspecaoMaxima: Real read Ftol_insp_charge_max write setFtol_insp_charge_max;

    [FieldName('tol_main_charge_min')]
    property ManutencaoMinima: Real read Ftol_main_charge_min write setFtol_main_charge_min;

    [FieldName('tol_main_charge_max')]
    property ManutencaoMaxima: Real read Ftol_main_charge_max write setFtol_main_charge_max;

    [FieldName('tol_weight_loss')]
    property MassaMinima: Real read Ftol_weight_loss write setFtol_weight_loss;

    [FieldName('tol_hydraulic_volume')]
    property VolHidraulico: Real read Ftol_hydraulic_volume write setFtol_hydraulic_volume;

    [FieldName('tol_permanent_expansion')]
    property ExpPermanente: Real read Ftol_permanent_expansion write setFtol_permanent_expansion;

    [FieldName('discharge_time')]
    property TempoDescarga: Real read Fdischarge_time write setFdischarge_time;

    [FieldName('jet_range')]
    property AlcanceJato: Real read Fjet_range write setFjet_range;

    [FieldName('load_yield')]
    property RendCarga: Real read Fload_yield write setFload_yield;

    [FieldName('created_at')]
    property RegistroCriado: TDAteTime read Fcreated_at write setFcreated_at;

    [FieldName('updated_at')]
    property RegistroAlterado: TDAteTime read Fupdated_at write setFupdated_at;

  End;
implementation


{ TExtKind }

procedure TExtKind.setFcapacity(const Value: Real);
begin
  Fcapacity := Value;
end;

procedure TExtKind.setFcreated_at(const Value: TDAteTime);
begin
  Fcreated_at := Value;
end;

procedure TExtKind.setFdays_to_inspection(const Value: Integer);
begin
  Fdays_to_inspection := Value;
end;

procedure TExtKind.setFdays_to_level_2(const Value: Integer);
begin
  Fdays_to_level_2 := Value;
end;

procedure TExtKind.setFdays_to_level_3(const Value: Integer);
begin
  Fdays_to_level_3 := Value;
end;

procedure TExtKind.setFday_to_exp_charge(const Value: Integer);
begin
  Fday_to_exp_charge := Value;
end;

procedure TExtKind.setFdischarge_time(const Value: Real);
begin
  Fdischarge_time := Value;
end;

procedure TExtKind.setFId(const Value: Integer);
begin
  FId := Value;
end;

procedure TExtKind.setFjet_range(const Value: Real);
begin
  Fjet_range := Value;
end;

procedure TExtKind.setFload_yield(const Value: Real);
begin
  Fload_yield := Value;
end;

procedure TExtKind.setFtb_ext_agenc_id(const Value: Integer);
begin
  Ftb_ext_agenc_id := Value;
end;

procedure TExtKind.setFtb_institution_id(const Value: Integer);
begin
  Ftb_institution_id := Value;
end;

procedure TExtKind.setFtb_measure_id(const Value: Integer);
begin
  Ftb_measure_id := Value;
end;

procedure TExtKind.setFtol_hydraulic_volume(const Value: Real);
begin
  Ftol_hydraulic_volume := Value;
end;

procedure TExtKind.setFtol_insp_charge_max(const Value: Real);
begin
  Ftol_insp_charge_max := Value;
end;

procedure TExtKind.setFtol_insp_charge_min(const Value: Real);
begin
  Ftol_insp_charge_min := Value;
end;

procedure TExtKind.setFtol_main_charge_max(const Value: Real);
begin
  Ftol_main_charge_max := Value;
end;

procedure TExtKind.setFtol_main_charge_min(const Value: Real);
begin
  Ftol_main_charge_min := Value;
end;

procedure TExtKind.setFtol_permanent_expansion(const Value: Real);
begin
  Ftol_permanent_expansion := Value;
end;

procedure TExtKind.setFtol_weight_loss(const Value: Real);
begin
  Ftol_weight_loss := Value;
end;

procedure TExtKind.setFupdated_at(const Value: TDAteTime);
begin
  Fupdated_at := Value;
end;

end.
