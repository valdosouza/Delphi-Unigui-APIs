unit sea_clin_quiz;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, base_search, Vcl.Menus, uniMainMenu,
  Datasnap.Provider, Data.DB, Datasnap.DBClient, uniButton, uniBitBtn,
  uniSpeedButton, uniBasicGrid, uniDBGrid, uniEdit, uniGUIClasses, uniCheckBox,
  uniPageControl, uniGUIBaseClasses, uniPanel, uniDateTimePicker,
  fm_clin_module, fm_lineBusiness, fm_clin_professional, fm_clin_patient,
  uniRadioGroup, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, uniChart;

type
  TSeaClinQuiz = class(TBaseSearch)
    pnl_param_row_4_1: TUniPanel;
    pnl_data: TUniPanel;
    chbx_periodo: TUniCheckBox;
    pnl_data_campos: TUniPanel;
    DTP_Date_Initial: TUniDateTimePicker;
    DTP_Date_End: TUniDateTimePicker;
    ctn_clin_module: TUniContainerPanel;
    pnl_param_row_2: TUniPanel;
    Ctn_LineBusiness: TUniContainerPanel;
    Ctn_clin_professional: TUniContainerPanel;
    Ctn_clin_patient: TUniContainerPanel;
    cds_searchid: TIntegerField;
    cds_searchtb_institution_id: TIntegerField;
    cds_searchdt_record: TDateField;
    cds_searchpatient: TStringField;
    cds_searchmodule: TStringField;
    cds_searchquestionnaire: TStringField;
    cds_searchquestion: TStringField;
    cds_searchespeciality: TStringField;
    cds_searchprofessional: TStringField;
    cds_searchreached_tx: TBCDField;
    cds_searchreached: TStringField;
    pnl_param_row_3: TUniPanel;
    Rg_reached: TUniRadioGroup;
    cds_compositive: TClientDataSet;
    ds_compositive: TDataSource;
    cds_compositiveid: TIntegerField;
    cds_compositivetb_institution_id: TIntegerField;
    cds_compositivedt_record: TDateField;
    cds_compositivepatient: TStringField;
    cds_compositivemodule: TStringField;
    cds_compositivequestionnaire: TStringField;
    cds_compositiveespeciality: TStringField;
    cds_compositiveprofessional: TStringField;
    cds_compositivereached_tx: TBCDField;
    tbs_compositive: TUniTabSheet;
    Dbg_Compos: TUniDBGrid;
    Sb_Composite: TUniSpeedButton;
    tbs_chart: TUniTabSheet;
    pnl_chart_area: TUniPanel;
    dbg_week_avaliation: TUniDBGrid;
    cds_week_avaliation: TFDMemTable;
    ds_week_avaliation: TDataSource;
    cds_week_avaliationweek: TStringField;
    cds_week_avaliationreached_tx: TFloatField;
    Sb_Individual: TUniSpeedButton;
    cht_Area: TUniChart;
    Series_week_reached: TUniAreaSeries;
    pg_chart: TUniPageControl;
    tbs_chart_area: TUniTabSheet;
    tbs_chart_bar: TUniTabSheet;
    UniDBGrid1: TUniDBGrid;
    ctn_bar: TUniChart;
    cds_spec_evaluation: TFDMemTable;
    ds_spec_evaluation: TDataSource;
    Series_specialy_evaluation: TUniHorizBarSeries;
    cds_week_avaliationdt_record: TDateField;
    cds_spec_evaluationspeciality: TStringField;
    cds_spec_evaluationreached_tx: TFloatField;
    procedure Sb_ViewClick(Sender: TObject);
    procedure Sb_SearchClick(Sender: TObject);
    procedure pc_searchChange(Sender: TObject);
    procedure Dbg_ComposColumnSort(Column: TUniDBGridColumn;
      Direction: Boolean);
    procedure Sb_IndividualClick(Sender: TObject);
    procedure cds_week_avaliationAfterScroll(DataSet: TDataSet);
  private
    ComposSelectTxt : String;
    ComposInnerJoinTxt : String;
    ComposWhereTxt : String;
    ComposOrderByTxt : String;
    //Quando o cliente escolher direto da aba detalhada
    CodigoUnico : Integer;
    FrClinModule : TFmClinModule;
    FrLineBusiness : TFmLineBusiness;
    FrClinProfessional : TFmClinProfessional;
    FrClinPatient : TFmClinPatient;
    procedure ShowClinModule;
    procedure ShowLineBusiness;
    procedure ShowClinProfessional;
    procedure ShowClinPatient;
    //Selcionar detalhe
    procedure ComposSelectSql;
    procedure ComposInnerJoinSql;
    procedure ComposWhereSql;
    procedure ComposOrderBySql;
    procedure ComposSetParameters;
    procedure ComposSearch;
    procedure checkCodeUnique;
    //Analise individual
    function validateIndividualanalysis:Boolean;
    procedure SelectIndividualWeekanalysis;
    procedure SetChartsArea;
    procedure SelectSpecialityEvaluation;
    procedure SetChartsHorizBAr;
  protected
    procedure setSortable;Override;
    procedure InitVariable; Override;
    procedure FormatScreen;Override;
    procedure SelectSql;Override;
    procedure InnerJoinSql;Override;
    procedure WhereSql;Override;
    procedure OrderBySql;Override;

    procedure SetParameters;Override;
    procedure GetView;Override;
    procedure SetRegister;Override;

  end;

var
  SeaClinQuiz: TSeaClinQuiz;

implementation

{$R *.dfm}
uses openForms,UnFunctions, MainModule, msg_form,unmessages;

{ TSeaClinQuiz }

procedure TSeaClinQuiz.cds_week_avaliationAfterScroll(DataSet: TDataSet);
begin
  inherited;
  SelectSpecialityEvaluation;
  SetChartsHorizBAr;
end;

procedure TSeaClinQuiz.checkCodeUnique;
begin
  CodigoUnico := 0;
  if (pc_search.ActivePage = tbs_search) then
  Begin
    if cds_search.Active then
    Begin
      if cds_searchid.AsInteger > 0 then
        CodigoUnico := cds_searchid.AsInteger;
    End;
  End;
end;

procedure TSeaClinQuiz.ComposInnerJoinSql;
begin
  inherited;
  ComposInnerJoinTxt := Concat(
                   '  inner join tb_clin_questionnaire qtr ',
                   '  on (qtr.id = qiz.tb_clin_questionnaire_id) ',
                   '    and (qtr.tb_institution_id = qiz.tb_institution_id) ',
                   '  inner join tb_clin_module clm ',
                   '  on (clm.id = qiz.tb_clin_module_id) ',
                   '    and (clm.tb_institution_id = qiz.tb_institution_id) ',
                   '  inner join tb_linebusiness lbs ',
                   '  on (lbs.id = qiz.tb_linebusiness_id) ',
                   '  inner join tb_entity prf ',
                   '  on (prf.id = qiz.tb_clin_professional_id) ',
                   '  inner join tb_entity ptt ',
                   '  on (ptt.id = qiz.tb_clin_patient_id) '
  );

end;

procedure TSeaClinQuiz.ComposOrderBySql;
begin
  ComposOrderByTxt := concat(
                'order by dt_record, ',
                ' clm.description, ',
                ' lbs.description,  ',
                ' prf.name_company, ',
                ' ptt.name_company '
  );

end;

procedure TSeaClinQuiz.ComposSearch;
begin
  Try
    cds_compositive.Active := False;
    with UMM.Qr_Crud do
    Begin
      Active := False;
      sql.Clear;

      ComposSelectTxt           := '';
      ComposInnerJoinTxt        := '';
      ComposWhereTxt            := '';

      ComposOrderByTxt := '';

      ComposSelectSql;
      ComposInnerJoinSql;
      ComposWhereSql;

      if Trim(ComposSelectTxt) <> '' then
      Begin
        SQL.Add(ComposSelectTxt);
        SQL.Add(ComposInnerJoinTxt);
        SQL.Add(ComposWhereTxt);
      End;

      ComposOrderBySql;
      SQL.Add(ComposOrderByTxt);

      if (chbx_limit_result.Checked) and ( StrToIntDef(E_Limit.Text,0)>0 ) then
          SQL.Add(concat(' limit 0, ',E_Limit.Text));
      ComposSetParameters;
      Prepare;
      Active := True;
      FetchAll;
    End;
  Finally
    cds_compositive.Active := True;
    Umm.Qr_Crud.close;
  End;
end;

procedure TSeaClinQuiz.ComposSelectSql;
begin
  ComposSelectTxt := concat(
                  'select ',
                  ' qiz.id, ',
                  ' qiz.tb_institution_id,  ',
                  ' qiz.dt_record, ',
                  ' ptt.name_company patient, ',
                  ' clm.description module,',
                  ' qtr.description questionnaire, ',
                  ' lbs.description especiality, ',
                  ' prf.name_company professional, ',
                  ' qiz.reached_tx ',
                  'from tb_clin_quiz qiz '
  );


end;

procedure TSeaClinQuiz.ComposSetParameters;
begin
  with UMM.Qr_Crud do
  Begin
    ParamByName('tb_institution_id').AsInteger := UMM.GInstitution.registro.Codigo;
    if CodigoUnico > 0 then
    Begin
      ParamByName('id').AsInteger := CodigoUnico;
    End
    else
    Begin
      if chbx_periodo.Checked then
      Begin
        ParamByName('dataini').AsString := ConverteData( DTP_Date_Initial.DateTime );
        ParamByName('datafim').AsString := ConverteData( DTP_Date_End.DateTime );
      End;

      if (FrClinModule.DBLCB_Lista.Text  <> '') then
      Begin
        ParamByName('tb_clin_module_id').AsInteger := FrClinModule.DBLCB_Lista.KeyValue;
      End;

      if (FrLineBusiness.DBLCB_Lista.Text  <> '') then
      Begin
        ParamByName('tb_linebusiness_id').AsInteger := FrLineBusiness.DBLCB_Lista.KeyValue;
      End;

      if (FrClinProfessional.DBLCB_Lista.Text  <> '') then
      Begin
        ParamByName('tb_clin_professional_id').AsInteger := FrClinProfessional.DBLCB_Lista.KeyValue;
      End;

      if (FrClinPatient.DBLCB_Lista.Text  <> '') then
      Begin
        ParamByName('tb_clin_patient_id').AsInteger := FrClinPatient.DBLCB_Lista.KeyValue;
      End;
    End;
  End;
end;

procedure TSeaClinQuiz.ComposWhereSql;
begin
  inherited;
  ComposWhereTxt := 'where ( qiz.tb_institution_id =:tb_institution_id) ';
  if CodigoUnico > 0 then
  Begin
      ComposWhereTxt := concat(
                    ComposWhereTxt,
                    ' AND ( qiz.id =:id ) '
      );
  End
  else
  Begin
    if ChBx_Periodo.Checked then
    Begin
      ComposWhereTxt := concat(
                    ComposWhereTxt,
                    ' AND ( qiz.dt_record between :dataini and :datafim ) '
      );
    end;

    if (FrClinModule.DBLCB_Lista.Text  <> '') then
    Begin
      ComposWhereTxt := concat(
                    ComposWhereTxt,
                    ' AND ( qiz.tb_clin_module_id =:tb_clin_module_id) '
      );
    End;

    if (FrLineBusiness.DBLCB_Lista.Text  <> '') then
    Begin
      ComposWhereTxt := concat(
                    ComposWhereTxt,
                    ' AND ( qiz.tb_linebusiness_id =:tb_linebusiness_id) '
      );
    End;

    if (FrClinProfessional.DBLCB_Lista.Text  <> '') then
    Begin
      ComposWhereTxt := concat(
                    ComposWhereTxt,
                    ' AND ( qiz.tb_clin_professional_id =:tb_clin_professional_id) '
      );
    End;

    if (FrClinPatient.DBLCB_Lista.Text  <> '') then
    Begin
      ComposWhereTxt := concat(
                    ComposWhereTxt,
                    ' AND ( qiz.tb_clin_patient_id =:tb_clin_patient_id) '
      );
    End;

    case Rg_reached.ItemIndex of
      0:ComposWhereTxt := concat(
                    ComposWhereTxt,
                    ' AND ( qiz.reached_tx = 100 ) '
          );
      1:ComposWhereTxt := concat(
                    ComposWhereTxt,
                    ' AND ( qiz.reached_tx < 100 ) '
          );
    end;
  End;
end;

procedure TSeaClinQuiz.Dbg_ComposColumnSort(Column: TUniDBGridColumn;
  Direction: Boolean);
begin
  inherited;
  SortClientDataSetByField(cds_compositive,Column.FieldName, Direction);
end;

procedure TSeaClinQuiz.FormatScreen;
begin
  inherited;
  buttonIcon(Sb_Composite,'Consolidado.bmp');
  ShowClinModule;
  ShowLineBusiness;
  ShowClinPatient;
  ShowClinProfessional;
end;

procedure TSeaClinQuiz.GetView;
begin
  inherited;

end;

procedure TSeaClinQuiz.selectIndividualWeekanalysis;
Var
  Lc_I : Integer;
  Lc_qry : TFDQuery;
begin
  Try
    Lc_qry := TFDQuery.Create(nil);
    Lc_qry.Connection := getConnection;
    with Lc_qry do
    Begin
      Active := False;
      sql.Clear;
      sql.Add(concat(
                'select qiz.dt_record, avg(qiz.reached_tx) reached_tx ',
                'from tb_clin_quiz qiz ',
                'where ( tb_institution_id =:tb_institution_id )',
                ' and ( tb_clin_patient_id=:tb_clin_patient_id ) '
      ));

      if ChBx_Periodo.Checked then
        sql.Add(' AND ( qiz.dt_record between :dataini and :datafim ) ');

      sql.Add(' group by qiz.dt_record ');
      sql.Add(' order by qiz.dt_record ');

      ParamByName('tb_institution_id').AsInteger := umm.GInstitution.Registro.Codigo;
      ParamByName('tb_clin_patient_id').AsInteger := FrClinPatient.DBLCB_Lista.KeyValue;
      if chbx_periodo.Checked then
      Begin
        ParamByName('dataini').AsString := ConverteData( DTP_Date_Initial.DateTime );
        ParamByName('datafim').AsString := ConverteData( DTP_Date_End.DateTime );
      End;

      Prepare;
      Active := True;
      FetchAll;
      First;
      Lc_I := 1;
      cds_week_avaliation.Active := False;
      cds_week_avaliation.CreateDataSet;
      while not eof do
      Begin
        cds_week_avaliation.Append;
        cds_week_avaliation.FieldByName('dt_record').AsDateTime := FieldByName('dt_record').AsDateTime;
        cds_week_avaliation.FieldByName('week').AsString        := concat('Semana ',Lc_I.ToString);
        cds_week_avaliation.FieldByName('reached_tx').AsFloat   := FieldByName('reached_tx').AsFloat;
        cds_week_avaliation.Post;
        Next;
        inc(Lc_I);
      End;
    End;
  Finally
    Lc_qry.close;
    Lc_qry.DisposeOf;
  End;

end;

procedure TSeaClinQuiz.InitVariable;
begin
  PInterface := 59;
  inherited;
end;

procedure TSeaClinQuiz.InnerJoinSql;
begin
  inherited;
  InnerJoinTxt := Concat(
                   '  inner join tb_clin_questionnaire qtr ',
                   '  on (qtr.id = qiz.tb_clin_questionnaire_id) ',
                   '    and (qtr.tb_institution_id = qiz.tb_institution_id) ',
                   '  inner join tb_clin_answer awr ',
                   '  on (awr.tb_clin_quiz_id = qiz.id) ',
                   '    and (awr.tb_clin_questionnaire_id = qiz.tb_clin_questionnaire_id) ',
                   '    and (awr.tb_institution_id = qiz.tb_institution_id) ',
                   '  inner join tb_clin_question qtn ',
                   '  on (qtn.id = awr.tb_clin_question_id) ',
                   '    and (qtn.tb_clin_questionnaire_id = awr.tb_clin_questionnaire_id) ',
                   '    and (qtn.tb_institution_id = awr.tb_institution_id) ',
                   '  inner join tb_clin_module clm ',
                   '  on (clm.id = qiz.tb_clin_module_id) ',
                   '    and (clm.tb_institution_id = qiz.tb_institution_id) ',
                   '  inner join tb_linebusiness lbs ',
                   '  on (lbs.id = qiz.tb_linebusiness_id) ',
                   '  inner join tb_entity prf ',
                   '  on (prf.id = qiz.tb_clin_professional_id) ',
                   '  inner join tb_entity ptt ',
                   '  on (ptt.id = qiz.tb_clin_patient_id) '
  );
end;

procedure TSeaClinQuiz.OrderBySql;
begin
  inherited;
  OrderByTxt := concat(
                'order by dt_record, ',
                ' clm.description, ',
                ' lbs.description,  ',
                ' prf.name_company, ',
                ' ptt.name_company '
  );

end;


procedure TSeaClinQuiz.pc_searchChange(Sender: TObject);
begin
  inherited;
  Sb_Search.Enabled := pc_search.ActivePageIndex = 0;
  Sb_View.Enabled := pc_search.ActivePageIndex = 1;
  Sb_Composite.Enabled := pc_search.ActivePageIndex <>2;
end;

procedure TSeaClinQuiz.Sb_IndividualClick(Sender: TObject);
begin
  if validateIndividualanalysis then
  BEgin
    try
      Self.showMask('Aguarde Processamento');
      cds_week_avaliation.AfterScroll := nil;
      UniSession.Synchronize();
      SelectIndividualWeekanalysis;
      SetChartsArea;
      cds_week_avaliation.First;
      cds_week_avaliation.AfterScroll := cds_week_avaliationAfterScroll;
      pc_search.ActivePage := tbs_chart;
      pg_chart.ActivePage := tbs_chart_area;
    finally
      self.HideMask;
    end;
  End;
end;

procedure TSeaClinQuiz.Sb_SearchClick(Sender: TObject);
begin
  CodigoUnico := 0;
  inherited;
end;

procedure TSeaClinQuiz.Sb_ViewClick(Sender: TObject);
begin
  try
    Self.showMask('Aguarde Processamento');
    UniSession.Synchronize();
    checkCodeUnique;
    ComposSearch;
    pc_search.ActivePage := tbs_compositive;
    pc_searchChange(pc_search);
  finally
    self.HideMask;
  end;
end;

procedure TSeaClinQuiz.SelectSpecialityEvaluation;
Var
  Lc_I : Integer;
  Lc_qry : TFDQuery;
begin
  Try
    Lc_qry := TFDQuery.Create(nil);
    Lc_qry.Connection := getConnection;
    with Lc_qry do
    Begin
      Active := False;
      sql.Clear;
      sql.Add(concat(
                'select lb.description, avg(qiz.reached_tx) reached_tx ',
                'from tb_clin_quiz qiz ',
                '   inner join tb_linebusiness lb ',
                '   on ( lb.id = qiz.tb_linebusiness_id ) ',
                'where ( qiz.tb_institution_id =:tb_institution_id )',
                ' AND ( qiz.dt_record =:data ) '
      ));

      sql.Add(' group by 1 ');
      sql.Add(' order by lb.description ');

      ParamByName('tb_institution_id').AsInteger := umm.GInstitution.Registro.Codigo;
      ParamByName('data').AsDateTime        := cds_week_avaliationdt_record.AsDateTime;
      Prepare;
      Active := True;
      FetchAll;
      First;
      Lc_I := 1;
      cds_spec_evaluation.Active := False;
      cds_spec_evaluation.CreateDataSet;
      while not eof do
      Begin
        cds_spec_evaluation.Append;
        cds_spec_evaluation.FieldByName('speciality').AsString := FieldByName('description').AsString;
        cds_spec_evaluation.FieldByName('reached_tx').AsFloat := FieldByName('reached_tx').AsFloat;
        cds_spec_evaluation.Post;
        Next;
        inc(Lc_I);
      End;
    End;
  Finally
    Lc_qry.close;
    Lc_qry.DisposeOf;
  End;
end;

procedure TSeaClinQuiz.SelectSql;
begin
  inherited;
  SelectTxt := concat(
                  'select ',
                  ' qiz.id, ',
                  ' qiz.tb_institution_id,  ',
                  ' qiz.dt_record, ',
                  ' ptt.name_company patient, ',
                  ' clm.description module,',
                  ' qtr.description questionnaire, ',
                  ' qtn.description question,  ',
                  ' lbs.description especiality, ',
                  ' prf.name_company professional, ',
                  ' qiz.reached_tx, awr.reached ',
                  'from tb_clin_quiz qiz '
  );

end;

procedure TSeaClinQuiz.SetChartsArea;
var
  Val : Double;
  Head : string;
begin
  Series_week_reached.Clear;
  cds_week_avaliation.First;
  while not cds_week_avaliation.eof do
  Begin
    Val  :=  cds_week_avaliationreached_tx.AsFloat;
    Head :=  cds_week_avaliationweek.AsString;
    Series_week_reached.Add(Val, Head);
    cds_week_avaliation.Next;
  end;
end;

procedure TSeaClinQuiz.SetChartsHorizBAr;
var
  Val : Double;
  Head : string;
begin
  Series_specialy_evaluation.Clear;
  cds_spec_evaluation.First;
  while not cds_spec_evaluation.eof do
  Begin
    Val  := cds_spec_evaluationreached_tx.AsFloat;
    Head :=  cds_spec_evaluationspeciality.AsString;
    Series_specialy_evaluation.Add(Val, Head);
    cds_spec_evaluation.Next;
  end;
end;

procedure TSeaClinQuiz.SetParameters;
begin
  with UMM.Qr_Crud do
  Begin
    ParamByName('tb_institution_id').AsInteger := UMM.GInstitution.registro.Codigo;

    if chbx_periodo.Checked then
    Begin
      ParamByName('dataini').AsString := ConverteData( DTP_Date_Initial.DateTime );
      ParamByName('datafim').AsString := ConverteData( DTP_Date_End.DateTime );
    End;

    if (FrClinModule.DBLCB_Lista.Text  <> '') then
    Begin
      ParamByName('tb_clin_module_id').AsInteger := FrClinModule.DBLCB_Lista.KeyValue;
    End;

    if (FrLineBusiness.DBLCB_Lista.Text  <> '') then
    Begin
      ParamByName('tb_linebusiness_id').AsInteger := FrLineBusiness.DBLCB_Lista.KeyValue;
    End;

    if (FrClinProfessional.DBLCB_Lista.Text  <> '') then
    Begin
      ParamByName('tb_clin_professional_id').AsInteger := FrClinProfessional.DBLCB_Lista.KeyValue;
    End;

    if (FrClinPatient.DBLCB_Lista.Text  <> '') then
    Begin
      ParamByName('tb_clin_patient_id').AsInteger := FrClinPatient.DBLCB_Lista.KeyValue;
    End;

  End;
end;

procedure TSeaClinQuiz.SetRegister;
begin
  inherited;

end;

procedure TSeaClinQuiz.setSortable;
Var
  I:Integer;
begin
  inherited;
  for I := 0 to Dbg_Compos.Columns.Count -1 do
    Dbg_Compos.Columns[I].Sortable := TRue;
end;

procedure TSeaClinQuiz.ShowClinModule;
begin
  FrClinModule := TFmClinModule.Create(Self);
  FrClinModule.Parent := ctn_clin_module;
  FrClinModule.Listar;
  FrClinModule.Show;
  FrClinModule.Align := alClient;

end;

procedure TSeaClinQuiz.ShowClinPatient;
begin
  FrClinPatient := TFmClinPatient.Create(Self);
  FrClinPatient.Parent := Ctn_clin_patient;
  FrClinPatient.Listar;
  FrClinPatient.Show;
  FrClinPatient.Align := alClient;
end;

procedure TSeaClinQuiz.ShowClinProfessional;
begin
  FrClinProfessional := TFmClinProfessional.Create(Self);
  FrClinProfessional.Parent := Ctn_clin_professional;
  FrClinProfessional.Listar;
  FrClinProfessional.Show;
  FrClinProfessional.Align := alClient;

end;

procedure TSeaClinQuiz.ShowLineBusiness;
begin
  FrLineBusiness := TFmLineBusiness.Create(Self);
  FrLineBusiness.Parent := Ctn_LineBusiness;
  FrLineBusiness.Align := alClient;
  FrLineBusiness.Listar;
  FrLineBusiness.DBLCB_Lista.FieldLabel := 'Especialidade';
  FrLineBusiness.Show;
end;

function TSeaClinQuiz.validateIndividualanalysis: Boolean;
begin
  Result := True;
  if (trim(FrClinPatient.DBLCB_Lista.Text) = '') then
  begin
    MensageAlert(['A T E N Ç Ã O!.',
                  '',
                  'Campo Paciente deve ser Preechido.',
                  'Verifique e tente novamente']);
    setfocus(FrClinPatient.DBLCB_Lista.JSName);
    Result := False;
    exit;
  end;

end;

procedure TSeaClinQuiz.WhereSql;
begin
  inherited;
  WhereTxt := 'where ( qiz.tb_institution_id =:tb_institution_id) ';

  if ChBx_Periodo.Checked then
  Begin
    WhereTxt := concat(
                  WhereTxt,
                  ' AND ( qiz.dt_record between :dataini and :datafim ) '
    );
  end;

  if (FrClinModule.DBLCB_Lista.Text  <> '') then
  Begin
    WhereTxt := concat(
                  WhereTxt,
                  ' AND ( qiz.tb_clin_module_id =:tb_clin_module_id) '
    );
  End;

  if (FrLineBusiness.DBLCB_Lista.Text  <> '') then
  Begin
    WhereTxt := concat(
                  WhereTxt,
                  ' AND ( qiz.tb_linebusiness_id =:tb_linebusiness_id) '
    );
  End;

  if (FrClinProfessional.DBLCB_Lista.Text  <> '') then
  Begin
    WhereTxt := concat(
                  WhereTxt,
                  ' AND ( qiz.tb_clin_professional_id =:tb_clin_professional_id) '
    );
  End;

  if (FrClinPatient.DBLCB_Lista.Text  <> '') then
  Begin
    WhereTxt := concat(
                  WhereTxt,
                  ' AND ( qiz.tb_clin_patient_id =:tb_clin_patient_id) '
    );
  End;

  case Rg_reached.ItemIndex of
    0:WhereTxt := concat(
                  WhereTxt,
                  ' AND ( awr.reached = ''S'') '
        );
    1:WhereTxt := concat(
                  WhereTxt,
                  ' AND ( awr.reached = ''N'') '
        );
  end;

end;

end.
