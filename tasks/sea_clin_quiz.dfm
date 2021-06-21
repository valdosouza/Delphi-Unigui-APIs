inherited SeaClinQuiz: TSeaClinQuiz
  ClientHeight = 484
  Caption = 'Consulta Avalia'#231#245'es'
  ExplicitHeight = 543
  PixelsPerInch = 96
  TextHeight = 13
  inherited Pnl_Fundo: TUniPanel
    Height = 420
    ExplicitHeight = 420
    inherited pc_search: TUniPageControl
      Height = 416
      ActivePage = tbs_chart
      ExplicitHeight = 416
      inherited tbs_param: TUniTabSheet
        ExplicitHeight = 388
        inherited pnl_param: TUniPanel
          Height = 357
          ExplicitHeight = 357
          object pnl_param_row_4_1: TUniPanel
            Left = 2
            Top = 2
            Width = 818
            Height = 52
            Hint = ''
            Align = alTop
            TabOrder = 1
            BorderStyle = ubsNone
            Caption = ''
            object pnl_data: TUniPanel
              Left = 0
              Top = 0
              Width = 216
              Height = 52
              Hint = ''
              Align = alLeft
              TabOrder = 1
              BorderStyle = ubsNone
              Caption = ''
              object chbx_periodo: TUniCheckBox
                AlignWithMargins = True
                Left = 3
                Top = 5
                Width = 210
                Height = 17
                Hint = ''
                Margins.Top = 5
                Margins.Bottom = 0
                Checked = True
                Caption = 'Data Inicial            Data Final'
                Align = alTop
                TabOrder = 1
              end
              object pnl_data_campos: TUniPanel
                Left = 0
                Top = 22
                Width = 216
                Height = 30
                Hint = ''
                Align = alClient
                TabOrder = 2
                BorderStyle = ubsNone
                Caption = ''
                object DTP_Date_Initial: TUniDateTimePicker
                  AlignWithMargins = True
                  Left = 3
                  Top = 3
                  Width = 100
                  Height = 24
                  Hint = ''
                  DateTime = 42916.000000000000000000
                  DateFormat = 'dd/MM/yyyy'
                  TimeFormat = 'HH:mm:ss'
                  Align = alLeft
                  TabOrder = 1
                end
                object DTP_Date_End: TUniDateTimePicker
                  AlignWithMargins = True
                  Left = 109
                  Top = 3
                  Width = 100
                  Height = 24
                  Hint = ''
                  DateTime = 42916.000000000000000000
                  DateFormat = 'dd/MM/yyyy'
                  TimeFormat = 'HH:mm:ss'
                  Align = alLeft
                  TabOrder = 2
                end
              end
            end
            object ctn_clin_module: TUniContainerPanel
              Left = 561
              Top = 0
              Width = 287
              Height = 52
              Hint = ''
              ParentColor = False
              Align = alLeft
              TabOrder = 2
            end
            object Ctn_LineBusiness: TUniContainerPanel
              Left = 216
              Top = 0
              Width = 345
              Height = 52
              Hint = ''
              ParentColor = False
              Align = alLeft
              TabOrder = 3
            end
          end
          object pnl_param_row_2: TUniPanel
            Left = 2
            Top = 54
            Width = 818
            Height = 52
            Hint = ''
            Align = alTop
            TabOrder = 2
            BorderStyle = ubsNone
            Caption = ''
            object Ctn_clin_professional: TUniContainerPanel
              Left = 416
              Top = 0
              Width = 402
              Height = 52
              Hint = ''
              ParentColor = False
              Align = alLeft
              TabOrder = 1
            end
            object Ctn_clin_patient: TUniContainerPanel
              Left = 0
              Top = 0
              Width = 416
              Height = 52
              Hint = ''
              ParentColor = False
              Align = alLeft
              TabOrder = 2
            end
          end
          object pnl_param_row_3: TUniPanel
            Left = 2
            Top = 106
            Width = 818
            Height = 52
            Hint = ''
            Align = alTop
            TabOrder = 3
            BorderStyle = ubsNone
            Caption = ''
            object Rg_reached: TUniRadioGroup
              Left = 0
              Top = 0
              Width = 287
              Height = 52
              Hint = ''
              Items.Strings = (
                'SIM'
                'N'#195'O'
                'TODOS')
              ItemIndex = 2
              Align = alLeft
              Caption = 'Itens Alcan'#231'ados'
              TabOrder = 1
              Columns = 3
            end
          end
        end
        inherited pnl_config: TUniPanel
          Top = 357
          ExplicitTop = 357
        end
      end
      inherited tbs_search: TUniTabSheet
        Caption = 'Resultado Anal'#237'tico'
        ExplicitHeight = 388
        inherited dbg_Search: TUniDBGrid
          Height = 388
          Columns = <
            item
              FieldName = 'dt_record'
              Title.Caption = 'Data'
              Width = 88
            end
            item
              FieldName = 'question'
              Title.Caption = 'Pergunta'
              Width = 604
              ReadOnly = True
            end
            item
              FieldName = 'reached'
              Title.Caption = 'Alcance'
              Width = 67
              Alignment = taCenter
              ReadOnly = True
            end
            item
              FieldName = 'reached_tx'
              Title.Caption = 'Taxa Alcance'
              Width = 84
              Alignment = taCenter
            end
            item
              FieldName = 'patient'
              Title.Caption = 'Paciente'
              Width = 130
              ReadOnly = True
            end
            item
              FieldName = 'module'
              Title.Caption = 'M'#243'dulo'
              Width = 118
              ReadOnly = True
            end
            item
              FieldName = 'questionnaire'
              Title.Caption = 'Avalia'#231#227'o'
              Width = 180
              ReadOnly = True
            end
            item
              FieldName = 'especiality'
              Title.Caption = 'Especialidade'
              Width = 194
              ReadOnly = True
            end
            item
              FieldName = 'professional'
              Title.Caption = 'Profissional'
              Width = 604
              ReadOnly = True
            end>
        end
      end
      object tbs_compositive: TUniTabSheet
        Hint = ''
        Caption = 'Resultado S'#237'nt'#233'tico'
        object Dbg_Compos: TUniDBGrid
          Left = 0
          Top = 0
          Width = 822
          Height = 388
          Hint = ''
          DataSource = ds_compositive
          LoadMask.Message = 'Carregando os dados'
          Align = alClient
          TabOrder = 0
          OnColumnSort = Dbg_ComposColumnSort
          OnDblClick = dbg_SearchDblClick
          Columns = <
            item
              FieldName = 'dt_record'
              Title.Caption = 'Data'
              Width = 88
            end
            item
              FieldName = 'reached_tx'
              Title.Caption = 'Taxa Alcance'
              Width = 84
              Alignment = taCenter
            end
            item
              FieldName = 'patient'
              Title.Caption = 'Paciente'
              Width = 286
              ReadOnly = True
            end
            item
              FieldName = 'module'
              Title.Caption = 'M'#243'dulo'
              Width = 118
              ReadOnly = True
            end
            item
              FieldName = 'questionnaire'
              Title.Caption = 'Avalia'#231#227'o'
              Width = 180
              ReadOnly = True
            end
            item
              FieldName = 'especiality'
              Title.Caption = 'Especialidade'
              Width = 194
              ReadOnly = True
            end
            item
              FieldName = 'professional'
              Title.Caption = 'Profissional'
              Width = 604
              ReadOnly = True
            end>
        end
      end
      object tbs_chart: TUniTabSheet
        Hint = ''
        Caption = 'Gr'#225'ficos'
        object pnl_chart_area: TUniPanel
          Left = 0
          Top = 0
          Width = 822
          Height = 388
          Hint = ''
          Align = alClient
          TabOrder = 0
          BorderStyle = ubsFrameLowered
          Caption = ''
          object dbg_week_avaliation: TUniDBGrid
            Left = 2
            Top = 2
            Width = 191
            Height = 384
            Hint = ''
            DataSource = ds_week_avaliation
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgConfirmDelete, dgAutoRefreshRow]
            WebOptions.Paged = False
            LoadMask.Message = 'Loading data...'
            Align = alLeft
            TabOrder = 1
            Columns = <
              item
                FieldName = 'week'
                Title.Caption = 'Evolu'#231#227'o'
                Width = 80
              end
              item
                FieldName = 'reached_tx'
                Title.Caption = 'Taxa Alcance'
                Width = 68
              end>
          end
          object pg_chart: TUniPageControl
            Left = 193
            Top = 2
            Width = 627
            Height = 384
            Hint = ''
            ActivePage = tbs_chart_bar
            Align = alClient
            TabOrder = 2
            object tbs_chart_area: TUniTabSheet
              Hint = ''
              Caption = 'Semanal'
              object cht_Area: TUniChart
                Left = 0
                Top = 0
                Width = 619
                Height = 356
                Hint = ''
                Animate = True
                Axes.AxisA.Title = 'N'#237'vel de Recupera'#231#227'o'
                Axes.AxisB.HideLabel = True
                Axes.AxisB.Title = 'Semanas'
                Title.Text.Strings = (
                  'Area Chart')
                BorderStyle = ubsFrameLowered
                Legend.Font.Color = clBlack
                Legend.Font.Name = 'Arial'
                Legend.Visible = False
                LayoutConfig.BodyPadding = '10'
                LayoutConfig.Anchor = '0 -25'
                LayoutConfig.RowSpan = 1
                Align = alClient
                object Series_week_reached: TUniAreaSeries
                  Title = 'Alcance'
                  Brush.Color = clMoneyGreen
                  Brush.Opacity = 0.899999976158142100
                  Brush.Default = False
                end
              end
            end
            object tbs_chart_bar: TUniTabSheet
              Hint = ''
              Caption = 'Especialidade'
              object UniDBGrid1: TUniDBGrid
                Left = 0
                Top = 0
                Width = 191
                Height = 356
                Hint = ''
                DataSource = ds_spec_evaluation
                Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgConfirmDelete, dgAutoRefreshRow]
                WebOptions.Paged = False
                LoadMask.Message = 'Loading data...'
                Align = alLeft
                TabOrder = 0
                Columns = <
                  item
                    FieldName = 'speciality'
                    Title.Caption = 'Especialidade'
                    Width = 80
                  end
                  item
                    FieldName = 'reached_tx'
                    Title.Caption = 'Taxa Alcance'
                    Width = 68
                  end>
              end
              object ctn_bar: TUniChart
                Left = 191
                Top = 0
                Width = 428
                Height = 356
                Hint = ''
                Animate = True
                Axes.AxisA.Title = 'Especialidades'
                Axes.AxisB.Title = 'Alcance nas avalia'#231#245'es'
                Axes.AxisB.MinorTickSteps = 10.000000000000000000
                Axes.AxisB.MajorTickSteps = 10.000000000000000000
                Axes.AxisB.Grid.Normal.Enabled = True
                Axes.AxisB.Grid.Even.Enabled = True
                Title.Text.Strings = (
                  'Area Chart')
                BorderStyle = ubsFrameLowered
                Legend.Font.Color = clBlack
                Legend.Font.Name = 'Arial'
                Legend.Visible = False
                LayoutConfig.BodyPadding = '10'
                LayoutConfig.Anchor = '0 -25'
                LayoutConfig.RowSpan = 1
                Align = alClient
                object Series_specialy_evaluation: TUniHorizBarSeries
                  Title = 'Series_specialy_evaluation'
                end
              end
            end
          end
        end
      end
    end
  end
  inherited Pnl_Botoes: TUniPanel
    Top = 420
    ExplicitTop = 420
    inherited Sb_Close: TUniSpeedButton
      Left = 553
      Align = alRight
      ExplicitLeft = 553
    end
    inherited Sb_View: TUniSpeedButton
      Left = 645
      Visible = False
      Align = alRight
      ExplicitLeft = 645
    end
    inherited Sb_Search: TUniSpeedButton
      Left = 2
      Caption = 'Anal'#237'tico - F7'
      ExplicitLeft = 2
    end
    inherited Sb_Register: TUniSpeedButton
      Left = 740
      Visible = False
      Align = alRight
      ExplicitLeft = 740
    end
    object Sb_Composite: TUniSpeedButton
      AlignWithMargins = True
      Left = 94
      Top = 5
      Width = 92
      Height = 54
      Hint = ''
      Margins.Left = 0
      Margins.Right = 0
      Caption = 'Sint'#233'tico - F9'
      Align = alLeft
      ParentColor = False
      Color = clWindow
      IconAlign = iaTop
      TabOrder = 5
      OnClick = Sb_ViewClick
    end
    object Sb_Individual: TUniSpeedButton
      AlignWithMargins = True
      Left = 186
      Top = 5
      Width = 92
      Height = 54
      Hint = ''
      Margins.Left = 0
      Margins.Right = 0
      Caption = 'Individual - F10'
      Align = alLeft
      ParentColor = False
      Color = clWindow
      IconAlign = iaTop
      TabOrder = 6
      OnClick = Sb_IndividualClick
    end
  end
  inherited cds_search: TClientDataSet
    object cds_searchid: TIntegerField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cds_searchtb_institution_id: TIntegerField
      FieldName = 'tb_institution_id'
      Origin = 'tb_institution_id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object cds_searchdt_record: TDateField
      DisplayLabel = 'Data'
      FieldName = 'dt_record'
      Origin = 'dt_record'
    end
    object cds_searchpatient: TStringField
      DisplayLabel = 'Paciente'
      FieldName = 'patient'
      Origin = 'name_company'
      ProviderFlags = []
      ReadOnly = True
      Size = 100
    end
    object cds_searchmodule: TStringField
      DisplayLabel = 'M'#243'dulo'
      FieldName = 'module'
      Origin = 'description'
      ProviderFlags = []
      ReadOnly = True
      Size = 100
    end
    object cds_searchquestionnaire: TStringField
      DisplayLabel = 'Avalia'#231#227'o'
      FieldName = 'questionnaire'
      Origin = 'description'
      ProviderFlags = []
      ReadOnly = True
      Size = 100
    end
    object cds_searchquestion: TStringField
      DisplayLabel = 'Pergunta'
      FieldName = 'question'
      Origin = 'description'
      ProviderFlags = []
      ReadOnly = True
      Size = 100
    end
    object cds_searchespeciality: TStringField
      DisplayLabel = 'Especialidade'
      FieldName = 'especiality'
      Origin = 'description'
      ProviderFlags = []
      ReadOnly = True
      Size = 100
    end
    object cds_searchprofessional: TStringField
      DisplayLabel = 'Profissional'
      FieldName = 'professional'
      Origin = 'name_company'
      ProviderFlags = []
      ReadOnly = True
      Size = 100
    end
    object cds_searchreached_tx: TBCDField
      DisplayLabel = 'Taxa Alcance'
      FieldName = 'reached_tx'
      Origin = 'reached_tx'
      Precision = 10
      Size = 2
    end
    object cds_searchreached: TStringField
      DisplayLabel = 'Alcance'
      FieldName = 'reached'
      Origin = 'reached'
      ProviderFlags = []
      ReadOnly = True
      FixedChar = True
      Size = 1
    end
  end
  inherited MenuTask: TUniMainMenu
    Top = 65528
  end
  object cds_compositive: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DSP'
    Left = 280
    Top = 183
    object cds_compositiveid: TIntegerField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cds_compositivetb_institution_id: TIntegerField
      FieldName = 'tb_institution_id'
      Origin = 'tb_institution_id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object cds_compositivedt_record: TDateField
      FieldName = 'dt_record'
      Origin = 'dt_record'
    end
    object cds_compositivepatient: TStringField
      FieldName = 'patient'
      Origin = 'name_company'
      ProviderFlags = []
      ReadOnly = True
      Size = 100
    end
    object cds_compositivemodule: TStringField
      FieldName = 'module'
      Origin = 'description'
      ProviderFlags = []
      ReadOnly = True
      Size = 100
    end
    object cds_compositivequestionnaire: TStringField
      FieldName = 'questionnaire'
      Origin = 'description'
      ProviderFlags = []
      ReadOnly = True
      Size = 100
    end
    object cds_compositiveespeciality: TStringField
      FieldName = 'especiality'
      Origin = 'description'
      ProviderFlags = []
      ReadOnly = True
      Size = 100
    end
    object cds_compositiveprofessional: TStringField
      FieldName = 'professional'
      Origin = 'name_company'
      ProviderFlags = []
      ReadOnly = True
      Size = 100
    end
    object cds_compositivereached_tx: TBCDField
      FieldName = 'reached_tx'
      Origin = 'reached_tx'
      Precision = 10
      Size = 2
    end
  end
  object ds_compositive: TDataSource
    DataSet = cds_compositive
    Left = 280
    Top = 230
  end
  object cds_week_avaliation: TFDMemTable
    AfterScroll = cds_week_avaliationAfterScroll
    FieldDefs = <>
    IndexDefs = <>
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    StoreDefs = True
    Left = 152
    Top = 296
    object cds_week_avaliationweek: TStringField
      FieldName = 'week'
      Size = 10
    end
    object cds_week_avaliationreached_tx: TFloatField
      FieldName = 'reached_tx'
    end
    object cds_week_avaliationdt_record: TDateField
      FieldName = 'dt_record'
    end
  end
  object ds_week_avaliation: TDataSource
    DataSet = cds_week_avaliation
    Left = 152
    Top = 358
  end
  object cds_spec_evaluation: TFDMemTable
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 280
    Top = 296
    object cds_spec_evaluationspeciality: TStringField
      FieldName = 'speciality'
      Size = 100
    end
    object cds_spec_evaluationreached_tx: TFloatField
      FieldName = 'reached_tx'
    end
  end
  object ds_spec_evaluation: TDataSource
    DataSet = cds_spec_evaluation
    Left = 280
    Top = 358
  end
end
