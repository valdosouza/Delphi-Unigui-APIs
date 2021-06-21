inherited TasClinQuiz: TTasClinQuiz
  ClientHeight = 412
  ClientWidth = 547
  Caption = 'Avalia'#231#227'o Cl'#237'nica'
  OnDestroy = UniFormDestroy
  ExplicitWidth = 563
  ExplicitHeight = 471
  PixelsPerInch = 96
  TextHeight = 13
  object pg_Main: TUniPageControl [0]
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 541
    Height = 406
    Hint = ''
    ActivePage = tbs_patient
    TabBarVisible = False
    Align = alClient
    TabOrder = 0
    object tbs_patient: TUniTabSheet
      Hint = ''
      TabVisible = False
      Caption = 'Pacientes'
      object pnl_pati_botao: TUniPanel
        AlignWithMargins = True
        Left = 3
        Top = 316
        Width = 527
        Height = 59
        Hint = ''
        BodyRTL = False
        Align = alBottom
        TabOrder = 0
        BorderStyle = ubsFrameLowered
        Caption = ''
        object Sb_Pati_Next: TUniSpeedButton
          AlignWithMargins = True
          Left = 432
          Top = 5
          Width = 90
          Height = 49
          Hint = ''
          Caption = 'PR'#211'XIMO'
          Align = alRight
          ParentColor = False
          Color = clWindow
          TabOrder = 1
          OnClick = Sb_Pati_NextClick
        end
        object Sb_Pati_Prior: TUniSpeedButton
          AlignWithMargins = True
          Left = 5
          Top = 5
          Width = 90
          Height = 49
          Hint = ''
          Caption = 'ANTERIOR'
          Align = alLeft
          ParentColor = False
          Color = clWindow
          TabOrder = 2
          OnClick = Sb_Pati_PriorClick
        end
      end
      object dbg_Patiente: TUniDBGrid
        AlignWithMargins = True
        Left = 3
        Top = 3
        Width = 527
        Height = 307
        Hint = ''
        ClientEvents.UniEvents.Strings = (
          
            'beforeInit=function beforeInit(sender, config)'#13#10'{'#13#10'   config.ite' +
            'mHeight = 30;'#13#10'  config.headerContainer = {'#13#10'    height: 30'#13#10'  }' +
            ';'#13#10'}')
        TitleFont.Height = -16
        DataSource = ds_patient
        WebOptions.Paged = False
        LoadMask.Message = 'Loading data...'
        Align = alClient
        TabOrder = 1
        OnColumnSort = dbg_PatienteColumnSort
        OnClearFilters = dbg_PatienteClearFilters
        OnColumnFilter = dbg_PatienteColumnFilter
        Columns = <
          item
            FieldName = 'nick_trade'
            Filtering.Enabled = True
            Filtering.Editor = E_Patient
            Title.Caption = 'Pacientes'
            Width = 412
            DisplayMemo = True
          end
          item
            FieldName = 'description'
            Filtering.Enabled = True
            Filtering.Editor = E_Modulo
            Title.Caption = 'M'#243'dulo'
            Width = 604
            ReadOnly = True
          end>
      end
      object UniHiddenPanel1: TUniHiddenPanel
        Left = 321
        Top = 49
        Width = 209
        Height = 72
        Hint = ''
        Visible = True
        DesignSize = (
          209
          72)
        object E_Patient: TUniEdit
          Left = 16
          Top = 13
          Width = 121
          Hint = ''
          CharEOL = #13
          Text = ''
          Anchors = []
          TabOrder = 0
          TabStop = False
          EmptyText = 'Nome do paciente'
          ClearButton = True
        end
        object E_Modulo: TUniEdit
          Left = 16
          Top = 41
          Width = 121
          Hint = ''
          CharEOL = #13
          Text = ''
          Anchors = []
          TabOrder = 2
          TabStop = False
          EmptyText = 'M'#243'dulo'
          ClearButton = True
        end
      end
    end
    object tbs_questionnaire: TUniTabSheet
      Hint = ''
      TabVisible = False
      Caption = 'Question'#225'rio'
      object pnl_ques_botao: TUniPanel
        AlignWithMargins = True
        Left = 3
        Top = 316
        Width = 527
        Height = 59
        Hint = ''
        BodyRTL = False
        Align = alBottom
        TabOrder = 0
        BorderStyle = ubsFrameLowered
        Caption = ''
        object Sb_ques_next: TUniSpeedButton
          AlignWithMargins = True
          Left = 432
          Top = 5
          Width = 90
          Height = 49
          Hint = ''
          Caption = 'PR'#211'XIMO'
          Align = alRight
          ParentColor = False
          Color = clWindow
          TabOrder = 1
          OnClick = Sb_ques_nextClick
        end
        object Sb_ques_prior: TUniSpeedButton
          AlignWithMargins = True
          Left = 5
          Top = 5
          Width = 90
          Height = 49
          Hint = ''
          Caption = 'ANTERIOR'
          Align = alLeft
          ParentColor = False
          Color = clWindow
          TabOrder = 2
          OnClick = Sb_ques_priorClick
        end
      end
      object dbg_Questionnaire: TUniDBGrid
        AlignWithMargins = True
        Left = 3
        Top = 3
        Width = 527
        Height = 307
        Hint = ''
        ClientEvents.UniEvents.Strings = (
          
            'beforeInit=function beforeInit(sender, config)'#13#10'{'#13#10'   config.ite' +
            'mHeight = 30;'#13#10'  config.headerContainer = {'#13#10'    height: 30'#13#10'  }' +
            ';'#13#10'}')
        TitleFont.Height = -16
        DataSource = ds_questionnaire
        WebOptions.Paged = False
        LoadMask.Message = 'Loading data...'
        Align = alClient
        TabOrder = 1
        OnColumnSort = dbg_QuestionnaireColumnSort
        Columns = <
          item
            FieldName = 'description'
            Title.Caption = 'Descri'#231#227'o da Avalia'#231#227'o'
            Width = 537
          end>
      end
    end
    object tbs_professional: TUniTabSheet
      Hint = ''
      TabVisible = False
      Caption = 'Profissionais'
      object pnl_prof_botao: TUniPanel
        AlignWithMargins = True
        Left = 3
        Top = 316
        Width = 527
        Height = 59
        Hint = ''
        BodyRTL = False
        Align = alBottom
        TabOrder = 0
        BorderStyle = ubsFrameLowered
        Caption = ''
        object Sb_Prof_Next: TUniSpeedButton
          AlignWithMargins = True
          Left = 432
          Top = 5
          Width = 90
          Height = 49
          Hint = ''
          Caption = 'PR'#211'XIMO'
          Align = alRight
          ParentColor = False
          Color = clWindow
          TabOrder = 1
          OnClick = Sb_Prof_NextClick
        end
        object Sb_Prof_adjust: TUniSpeedButton
          AlignWithMargins = True
          Left = 5
          Top = 5
          Width = 90
          Height = 49
          Hint = ''
          Caption = 'AJUSTAR'
          Align = alLeft
          ParentColor = False
          Color = clWindow
          TabOrder = 2
          OnClick = Sb_Prof_adjustClick
        end
      end
      object dbg_Profissional: TUniDBGrid
        AlignWithMargins = True
        Left = 3
        Top = 3
        Width = 527
        Height = 307
        Hint = ''
        ClientEvents.UniEvents.Strings = (
          
            'beforeInit=function beforeInit(sender, config)'#13#10'{'#13#10'   config.ite' +
            'mHeight = 30;'#13#10'  config.headerContainer = {'#13#10'    height: 30'#13#10'  }' +
            ';'#13#10'}')
        TitleFont.Height = -16
        DataSource = ds_Profissional
        WebOptions.Paged = False
        LoadMask.Message = 'Loading data...'
        Align = alClient
        TabOrder = 1
        OnColumnSort = dbg_ProfissionalColumnSort
        Columns = <
          item
            FieldName = 'nick_trade'
            Title.Caption = 'Profissional'
            Width = 382
            ReadOnly = True
          end
          item
            FieldName = 'description'
            Title.Caption = 'Profissional'
            Width = 173
            ReadOnly = True
          end>
      end
    end
    object tbs_quiz: TUniTabSheet
      Hint = ''
      TabVisible = False
      Caption = 'Avalia'#231#227'o'
      object scx_quiz: TUniScrollBox
        Left = 0
        Top = 43
        Width = 533
        Height = 270
        Hint = ''
        Align = alClient
        Color = clGradientInactiveCaption
        TabOrder = 0
      end
      object pnl_quiz_button: TUniPanel
        AlignWithMargins = True
        Left = 3
        Top = 316
        Width = 527
        Height = 59
        Hint = ''
        BodyRTL = False
        Align = alBottom
        TabOrder = 1
        BorderStyle = ubsFrameLowered
        Caption = ''
        object Sb_quiz_finish: TUniSpeedButton
          AlignWithMargins = True
          Left = 432
          Top = 5
          Width = 90
          Height = 49
          Hint = ''
          Caption = 'FINALIZAR'
          Align = alRight
          ParentColor = False
          Color = clWindow
          TabOrder = 1
          OnClick = Sb_quiz_finishClick
        end
        object Sb_quiz_prior: TUniSpeedButton
          AlignWithMargins = True
          Left = 5
          Top = 5
          Width = 90
          Height = 49
          Hint = ''
          Caption = 'ANTERIOR'
          Align = alLeft
          ParentColor = False
          Color = clWindow
          TabOrder = 2
          OnClick = Sb_quiz_priorClick
        end
      end
      object pnl_quiz_Top: TUniPanel
        AlignWithMargins = True
        Left = 3
        Top = 3
        Width = 527
        Height = 37
        Hint = ''
        BodyRTL = False
        Align = alTop
        ParentFont = False
        Font.Height = -13
        Font.Style = [fsBold]
        TabOrder = 2
        BorderStyle = ubsFrameLowered
        Alignment = taLeftJustify
        Caption = 'Informe a Data referente a avalia'#231#227'o Semanal'
        object E_Data: TUniDateTimePicker
          Left = 405
          Top = 2
          Width = 120
          Height = 33
          Hint = ''
          DateTime = 44082.000000000000000000
          DateFormat = 'dd/MM/yyyy'
          TimeFormat = 'HH:mm:ss'
          Align = alRight
          TabOrder = 1
        end
      end
    end
  end
  inherited cds_msg: TClientDataSet
    Left = 368
    Top = 368
  end
  inherited ds_msg: TDataSource
    Left = 368
    Top = 424
  end
  inherited MenuTask: TUniMainMenu
    Top = 288
  end
  object cds_profissional: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DSP'
    Left = 160
    Top = 224
    object cds_profissionalid: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInKey]
      ReadOnly = True
    end
    object cds_profissionalnick_trade: TStringField
      DisplayLabel = 'Profissional'
      FieldName = 'nick_trade'
      Origin = 'nick_trade'
      ProviderFlags = []
      ReadOnly = True
      Size = 100
    end
    object cds_profissionalIDLineBusiness: TIntegerField
      FieldName = 'IDLineBusiness'
    end
    object cds_profissionaldescription: TStringField
      DisplayLabel = 'Profissional'
      FieldName = 'description'
      Origin = 'description'
      ProviderFlags = []
      ReadOnly = True
      Size = 100
    end
  end
  object ds_Profissional: TDataSource
    DataSet = cds_profissional
    Left = 112
    Top = 408
  end
  object DSP: TDataSetProvider
    DataSet = UMM.Qr_Crud
    Left = 108
    Top = 136
  end
  object cds_patient: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DSP'
    Left = 80
    Top = 216
    object cds_patientid: TIntegerField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cds_patientnick_trade: TStringField
      DisplayLabel = 'Pacientes'
      FieldName = 'nick_trade'
      Origin = 'nick_trade'
      Size = 100
    end
    object cds_patienttb_clin_module_id: TIntegerField
      FieldName = 'tb_clin_module_id'
      Origin = 'tb_clin_module_id'
      ProviderFlags = []
      ReadOnly = True
    end
    object cds_patientdescription: TStringField
      DisplayLabel = 'M'#243'dulo'
      FieldName = 'description'
      Origin = 'description'
      ProviderFlags = []
      ReadOnly = True
      Size = 100
    end
  end
  object ds_patient: TDataSource
    DataSet = cds_patient
    Left = 208
    Top = 408
  end
  object cds_questionnaire: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DSP'
    Left = 288
    Top = 352
    object cds_questionnaireid: TIntegerField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cds_questionnairetb_institution_id: TIntegerField
      FieldName = 'tb_institution_id'
      Origin = 'tb_institution_id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object cds_questionnairedescription: TStringField
      DisplayLabel = 'Descri'#231#227'o da Avalia'#231#227'o'
      FieldName = 'description'
      Origin = 'description'
      Size = 100
    end
    object cds_questionnairedt_record: TDateField
      FieldName = 'dt_record'
      Origin = 'dt_record'
    end
    object cds_questionnairetb_clin_module_id: TIntegerField
      FieldName = 'tb_clin_module_id'
      Origin = 'tb_clin_module_id'
    end
    object cds_questionnairetb_linebusiness_id: TIntegerField
      FieldName = 'tb_linebusiness_id'
      Origin = 'tb_linebusiness_id'
    end
    object cds_questionnairetb_clin_professional_id: TIntegerField
      FieldName = 'tb_clin_professional_id'
      Origin = 'tb_clin_professional_id'
    end
    object cds_questionnaireactive: TStringField
      FieldName = 'active'
      Origin = 'active'
      FixedChar = True
      Size = 1
    end
    object cds_questionnairecreated_at: TDateTimeField
      FieldName = 'created_at'
      Origin = 'created_at'
    end
    object cds_questionnaireupdated_at: TDateTimeField
      FieldName = 'updated_at'
      Origin = 'updated_at'
    end
  end
  object ds_questionnaire: TDataSource
    DataSet = cds_questionnaire
    Left = 288
    Top = 408
  end
end
