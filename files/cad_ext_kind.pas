unit cad_ext_kind;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, base_registry, uniGUIClasses, uniEdit,
  uniLabel, uniPanel, Vcl.Menus, uniMainMenu, uniButton, uniBitBtn,
  uniSpeedButton, uniGUIBaseClasses, uniGroupBox, fm_measure, fm_ext_agent, ControllerExtKind,
  MainModule, msg_form, unmessages, UnFunctions, Data.DB, Datasnap.DBClient;

type
  TCadExtKind = class(TBaseRegistry)
    Ctn_Ext_Agent: TUniContainerPanel;
    UniLabel1: TUniLabel;
    E_capacity: TUniEdit;
    Ctn_Measure: TUniContainerPanel;
    UniGroupBox1: TUniGroupBox;
    E_days_to_inspection: TUniEdit;
    UniLabel2: TUniLabel;
    UniLabel3: TUniLabel;
    E_days_to_level_2: TUniEdit;
    E_days_to_level_3: TUniEdit;
    UniLabel4: TUniLabel;
    E_day_to_exp_charge: TUniEdit;
    UniLabel5: TUniLabel;
    UniGroupBox2: TUniGroupBox;
    UniLabel6: TUniLabel;
    E_tol_insp_charge_min: TUniEdit;
    UniLabel7: TUniLabel;
    E_tol_insp_charge_max: TUniEdit;
    UniLabel8: TUniLabel;
    E_tol_main_charge_min: TUniEdit;
    UniLabel9: TUniLabel;
    E_tol_main_charge_max: TUniEdit;
    UniLabel10: TUniLabel;
    E_tol_weight_loss: TUniEdit;
    UniLabel11: TUniLabel;
    E_tol_hydraulic_volume: TUniEdit;
    UniLabel12: TUniLabel;
    E_tol_permanent_expansion: TUniEdit;
    UniLabel13: TUniLabel;
    E_discharge_time: TUniEdit;
    UniLabel14: TUniLabel;
    E_jet_range: TUniEdit;
    E_load_yield: TUniEdit;
    UniLabel15: TUniLabel;
    procedure InitVariable;Override;
    procedure FormatScreen;Override;
    procedure ShowData;Override;
    procedure ShowNoData;Override;
    procedure ClearAllFields;Override;
    procedure EditionControl;Override;
    function ValidaInsert():boolean;Override;
    procedure Insert;Override;
    function ValidateSave: boolean;Override;
    procedure Save;Override;
    procedure Delete;Override;
    procedure setVariable; override;
  private
    { Private declarations }
    procedure ShowMeasure;
    procedure ShowExtAgent;
  public
    { Public declarations }
    FrMeasure : TFmMeasure;
    FrExtAgent : TFmExtAgent;
    ExtKind : TControllerExtKind;
  end;

var
  CadExtKind: TCadExtKind;

implementation

{$R *.dfm}

{ TCadExtKind }

procedure TCadExtKind.ClearAllFields;
begin
  inherited;
  ClearFields(FrMeasure);
  ClearFields(FrExtAgent);
  ExtKind.clear;
end;

procedure TCadExtKind.Delete;
begin
  inherited;
  MensageYesNo(['C O N F I R M A Ç Ã O!',
                '',
                'Deseja realmente excluir este registro?',
                'clique em SIM para confirmar.'],mpAlerta);
    FormMsg.ShowModal(
      Procedure(Sender: TComponent; AResult:Integer)
      begin
        if (Sender as TMsgForm).BotaoEscolhido > 0 then
        Begin
          ExtKind.delete;
          ClearAllFields;
        End;
      end
    );
end;

procedure TCadExtKind.EditionControl;
begin
  inherited;
  EditionControler(FrMeasure);
  EditionControler(FrExtAgent);
end;

procedure TCadExtKind.FormatScreen;
begin
  inherited;
  ShowMeasure;
  ShowExtAgent;
end;

procedure TCadExtKind.InitVariable;
begin
  inherited;
  ExtKind := TControllerExtKind.Create(self);
end;

procedure TCadExtKind.Insert;
begin
  inherited;
  ClearAllFields;
end;

procedure TCadExtKind.Save;
begin
  with ExtKind.Registro do
  Begin
    Estabelecimento := UMM.GInstitution.registro.Codigo;
    AgenteExtintor := FrExtAgent.DBLCB_Lista.KeyValue;
    CargaNominal := StrToFloatDef(E_capacity.Text,0);
    Unidade := FrMeasure.DBLCB_Lista.KeyValue;
    Inspecao := StrToIntDef(E_days_to_inspection.Text,0);
    Manutencao2 := StrToIntDef(E_days_to_level_2.Text,0);
    Manutencao3 := StrToIntDef(E_days_to_level_3.Text,0);
    CargaMaxima := StrToIntDef(E_day_to_exp_charge.Text,0);
    InspecaoMinima := StrToFloatDef(E_tol_insp_charge_min.Text,0);
    InspecaoMaxima := StrToFloatDef(E_tol_insp_charge_max.Text,0);
    ManutencaoMinima := StrToFloatDef(E_tol_main_charge_min.Text,0);
    ManutencaoMaxima := StrToFloatDef(E_tol_main_charge_max.Text,0);
    MassaMinima := StrToFloatDef(E_tol_weight_loss.Text,0);
    VolHidraulico := StrToFloatDef(E_tol_weight_loss.Text,0);
    ExpPermanente := StrToFloatDef(E_tol_hydraulic_volume.Text,0);
    TempoDescarga := StrToFloatDef(E_discharge_time.Text,0);
    AlcanceJato := StrToFloatDef(E_jet_range.Text,0);
    RendCarga := StrToFloatDef(E_load_yield.Text,0);
  End;
  ExtKind.save;

  CodigoRegistro := ExtKind.Registro.Codigo;
end;

procedure TCadExtKind.setVariable;
begin
  ExtKind.Registro.Codigo := CodigoRegistro ;
  ExtKind.Registro.Estabelecimento := UMM.GInstitution.registro.Codigo;
  ExtKind.getbyKey;
  inherited;
end;

procedure TCadExtKind.ShowData;
begin
  with ExtKind.Registro do
  Begin
    FrExtAgent.DBLCB_Lista.KeyValue := AgenteExtintor;
    E_capacity.Text := FloatToStrF(CargaNominal,ffFixed,10,2);
    FrMeasure.DBLCB_Lista.KeyValue := Unidade;
    E_days_to_inspection.Text := IntToStr(Inspecao);
    E_days_to_level_2.Text := IntToStr(Manutencao2);
    E_days_to_level_3.Text := IntToStr(Manutencao3);
    E_day_to_exp_charge.Text:= IntToStr(CargaMaxima);
    E_tol_insp_charge_min.Text := FloatToStrF(InspecaoMinima,ffFixed,10,2);
    E_tol_insp_charge_max.Text := FloatToStrF(InspecaoMaxima,ffFixed,10,2);
    E_tol_main_charge_min.Text := FloatToStrF(ManutencaoMinima,ffFixed,10,2);
    E_tol_main_charge_max.Text := FloatToStrF(ManutencaoMaxima,ffFixed,10,2);
    E_tol_weight_loss.Text := FloatToStrF(MassaMinima,ffFixed,10,2);
    E_tol_weight_loss.Text := FloatToStrF(VolHidraulico,ffFixed,10,2);
    E_tol_hydraulic_volume.Text := FloatToStrF(ExpPermanente,ffFixed,10,2);
    E_discharge_time.Text := FloatToStrF(TempoDescarga,ffFixed,10,2);
    E_jet_range.Text := FloatToStrF(AlcanceJato,ffFixed,10,2);
    E_load_yield.Text := FloatToStrF(RendCarga,ffFixed,10,2);
  End;
end;

procedure TCadExtKind.ShowExtAgent;
begin
  FrExtAgent := TFmExtAgent.Create(Self);
  FrExtAgent.Parent := Ctn_Ext_Agent;
  FrExtAgent.Listar;
  FrExtAgent.Align := alClient;
  FrExtAgent.Show;
end;

procedure TCadExtKind.ShowMeasure;
begin
  FrMeasure := TFmMeasure.Create(Self);
  FrMeasure.Parent := Ctn_Measure;
  FrMeasure.Listar;
  FrMeasure.Align := alClient;
  FrMeasure.Show;
end;

procedure TCadExtKind.ShowNoData;
begin
  ClearAllFields;
  inherited;
end;

function TCadExtKind.ValidaInsert: boolean;
begin
  Result := True;
end;

function TCadExtKind.ValidateSave: boolean;
begin
  Result:=true;
 if trim( FrExtAgent.DBLCB_Lista.Text) = '' then
  begin
    MensageAlert(['A T E N Ç Ã O!.',
                  '',
                  'Campo Agente Extintor não informado.',
                  'Preencha o campo para continuar']);
    Result := False;
    exit;
  end;

  if trim(E_capacity.Text) = '' then
  begin
    MensageAlert(['A T E N Ç Ã O!.',
                  '',
                  'Campo Carga Nominal não informado.',
                  'Preencha o campo para continuar']);
    Result := False;
    exit;
  end;

  if trim(FrMeasure.DBLCB_Lista.Text) = '' then
  begin
    MensageAlert(['A T E N Ç Ã O!.',
                  '',
                  'Campo Unidade não informado.',
                  'Preencha o campo para continuar']);
    Result := False;
    exit;
  end;

  if trim(E_day_to_exp_charge.Text) = '' then
  begin
    MensageAlert(['A T E N Ç Ã O!.',
                  '',
                  'Campo Inspeção não informado.',
                  'Preencha o campo para continuar']);
    Result := False;
    exit;
  end;

   if trim(E_days_to_level_2.Text) = '' then
  begin
    MensageAlert(['A T E N Ç Ã O!.',
                  '',
                  'Campo Manutenção Nível 2 não informado.',
                  'Preencha o campo para continuar']);
    Result := False;
    exit;
  end;

  if trim(E_days_to_level_3.Text) = '' then
  begin
    MensageAlert(['A T E N Ç Ã O!.',
                  '',
                  'Campo Manutenção Nível 3 não informado.',
                  'Preencha o campo para continuar']);
    Result := False;
    exit;
  end;

  if trim(E_day_to_exp_charge.Text) = '' then
  begin
    MensageAlert(['A T E N Ç Ã O!.',
                  '',
                  'Campo Carga Máxima Manuntenção não informado.',
                  'Preencha o campo para continuar']);
    Result := False;
    exit;
  end;

end;

end.
