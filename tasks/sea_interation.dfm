inherited SeaInteration: TSeaInteration
  Width = 549
  Height = 343
  Align = alClient
  Anchors = [akLeft, akTop, akRight, akBottom]
  ExplicitWidth = 451
  ExplicitHeight = 305
  object pnl_botao: TUniPanel
    Left = 0
    Top = 291
    Width = 549
    Height = 52
    Hint = ''
    Align = alBottom
    TabOrder = 0
    Caption = ''
    ExplicitTop = 253
    ExplicitWidth = 451
    object Sb_Inter_Comment: TUniButton
      AlignWithMargins = True
      Left = 190
      Top = 4
      Width = 90
      Height = 44
      Hint = ''
      Margins.Left = 1
      Margins.Right = 1
      Caption = 'Comentar'
      Align = alLeft
      TabOrder = 1
      OnClick = Sb_Inter_CommentClick
    end
    object Sb_Inter_proposal: TUniButton
      AlignWithMargins = True
      Left = 282
      Top = 4
      Width = 90
      Height = 44
      Hint = ''
      Margins.Left = 1
      Margins.Right = 1
      Caption = 'Proposta'
      Align = alLeft
      TabOrder = 2
      OnClick = Sb_Inter_proposalClick
    end
    object Sb_Inter_task: TUniButton
      AlignWithMargins = True
      Left = 374
      Top = 4
      Width = 90
      Height = 44
      Hint = ''
      Margins.Left = 1
      Margins.Right = 1
      Caption = 'Tarefa'
      Align = alLeft
      TabOrder = 3
      OnClick = Sb_Inter_taskClick
    end
    object Progress: TUniButton
      AlignWithMargins = True
      Left = 466
      Top = 4
      Width = 90
      Height = 44
      Hint = ''
      Margins.Left = 1
      Caption = 'Progresso'
      Align = alLeft
      TabOrder = 4
      OnClick = ProgressClick
    end
    object Sb_Inter_View: TUniButton
      AlignWithMargins = True
      Left = 98
      Top = 4
      Width = 90
      Height = 44
      Hint = ''
      Margins.Right = 1
      Caption = 'Visualizar'
      Align = alLeft
      TabOrder = 5
      OnClick = Sb_Inter_ViewClick
    end
    object Sb_Inter_Update: TUniButton
      AlignWithMargins = True
      Left = 4
      Top = 4
      Width = 90
      Height = 44
      Hint = ''
      Margins.Right = 1
      Caption = 'Atualizar'
      Align = alLeft
      TabOrder = 6
      OnClick = Sb_Inter_UpdateClick
    end
  end
  object pc_main: TUniPageControl
    Left = 0
    Top = 0
    Width = 549
    Height = 291
    Hint = ''
    ActivePage = tbs_call
    Align = alClient
    TabOrder = 1
    ExplicitWidth = 451
    ExplicitHeight = 253
    object tbs_call: TUniTabSheet
      Hint = ''
      Caption = 'Chamado Inicial'
      ExplicitWidth = 443
      ExplicitHeight = 225
      object Dbg_call: TUniDBGrid
        Left = 0
        Top = 0
        Width = 541
        Height = 263
        Hint = ''
        DataSource = ds_call
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgConfirmDelete, dgAutoRefreshRow]
        LoadMask.Message = 'Loading data...'
        Align = alClient
        TabOrder = 0
        Columns = <
          item
            FieldName = 'id'
            Title.Caption = 'Sequencia'
            Width = 64
          end
          item
            FieldName = 'updated_at'
            Title.Caption = 'Data e Hora'
            Width = 139
          end
          item
            FieldName = 'comentario'
            Title.Caption = 'Coment'#225'rio'
            Width = 391
          end
          item
            FieldName = 'situacao'
            Title.Caption = 'Situa'#231#227'o'
            Width = 187
            ReadOnly = True
          end>
      end
    end
    object tbs_proposal: TUniTabSheet
      Hint = ''
      Caption = 'Proposta'
      ExplicitWidth = 443
      ExplicitHeight = 225
      object Dbg_Proposal: TUniDBGrid
        Left = 0
        Top = 0
        Width = 541
        Height = 263
        Hint = ''
        DataSource = ds_proposal
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgConfirmDelete, dgAutoRefreshRow]
        LoadMask.Message = 'Loading data...'
        Align = alClient
        TabOrder = 0
        Columns = <
          item
            FieldName = 'id'
            Title.Caption = 'Sequencia'
            Width = 64
          end
          item
            FieldName = 'updated_at'
            Title.Caption = 'Data e Hora'
            Width = 139
          end
          item
            FieldName = 'comentario'
            Title.Caption = 'Coment'#225'rio'
            Width = 391
          end
          item
            FieldName = 'situacao'
            Title.Caption = 'Situa'#231#227'o'
            Width = 187
            ReadOnly = True
          end>
      end
    end
    object tbs_task: TUniTabSheet
      Hint = ''
      Caption = 'Tarefas'
      ExplicitWidth = 443
      ExplicitHeight = 225
      object Dbg_Task: TUniDBGrid
        Left = 0
        Top = 0
        Width = 541
        Height = 263
        Hint = ''
        DataSource = ds_task
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgConfirmDelete, dgAutoRefreshRow]
        LoadMask.Message = 'Loading data...'
        Align = alClient
        TabOrder = 0
        Columns = <
          item
            FieldName = 'id'
            Title.Caption = 'Sequencia'
            Width = 64
          end
          item
            FieldName = 'updated_at'
            Title.Caption = 'Data e Hora'
            Width = 139
          end
          item
            FieldName = 'comentario'
            Title.Caption = 'Coment'#225'rio'
            Width = 391
          end
          item
            FieldName = 'situacao'
            Title.Caption = 'Situa'#231#227'o'
            Width = 187
            ReadOnly = True
          end>
      end
    end
    object tbs_progress: TUniTabSheet
      Hint = ''
      Caption = 'Progresso'
      ExplicitWidth = 443
      ExplicitHeight = 225
      object Dbg_Progress: TUniDBGrid
        Left = 0
        Top = 0
        Width = 541
        Height = 263
        Hint = ''
        DataSource = ds_progress
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgConfirmDelete, dgAutoRefreshRow]
        LoadMask.Message = 'Loading data...'
        Align = alClient
        TabOrder = 0
        Columns = <
          item
            FieldName = 'id'
            Title.Caption = 'Sequencia'
            Width = 64
          end
          item
            FieldName = 'updated_at'
            Title.Caption = 'Data e Hora'
            Width = 139
          end
          item
            FieldName = 'comentario'
            Title.Caption = 'Coment'#225'rio'
            Width = 391
          end
          item
            FieldName = 'situacao'
            Title.Caption = 'Situa'#231#227'o'
            Width = 187
            ReadOnly = True
          end>
      end
    end
  end
  object DSP: TDataSetProvider
    DataSet = UMM.Qr_Crud
    Options = [poAllowCommandText, poUseQuoteChar]
    Left = 152
    Top = 151
  end
  object cds_task: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 392
    Top = 207
    object cds_tasktb_institution_id: TIntegerField
      FieldName = 'tb_institution_id'
      Required = True
    end
    object cds_taskid: TIntegerField
      FieldName = 'id'
      Required = True
    end
    object cds_tasktb_order_id: TIntegerField
      FieldName = 'tb_order_id'
      Required = True
    end
    object cds_taskupdated_at: TDateTimeField
      FieldName = 'updated_at'
      Required = True
    end
    object cds_taskcomentario: TStringField
      FieldName = 'comentario'
      Required = True
      Size = 100
    end
    object cds_tasksituacao: TStringField
      FieldName = 'situacao'
      Required = True
      Size = 100
    end
    object cds_taskkind: TStringField
      FieldName = 'kind'
      Required = True
      FixedChar = True
      Size = 1
    end
    object cds_tasktb_customer_id: TIntegerField
      FieldName = 'tb_customer_id'
      Required = True
    end
  end
  object ds_task: TDataSource
    DataSet = cds_task
    Left = 392
    Top = 254
  end
  object cds_call: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 240
    Top = 207
    object cds_calltb_institution_id: TIntegerField
      FieldName = 'tb_institution_id'
      Origin = 'tb_institution_id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cds_callid: TIntegerField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cds_calltb_order_id: TIntegerField
      FieldName = 'tb_order_id'
      Origin = 'tb_order_id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cds_callupdated_at: TDateTimeField
      FieldName = 'updated_at'
      Origin = 'updated_at'
      Required = True
    end
    object cds_callcomentario: TStringField
      FieldName = 'comentario'
      Origin = 'description'
      Required = True
      Size = 100
    end
    object cds_callsituacao: TStringField
      FieldName = 'situacao'
      Origin = 'description'
      ProviderFlags = []
      Required = True
      Size = 100
    end
    object cds_callkind: TStringField
      FieldName = 'kind'
      Origin = 'kind'
      Required = True
      FixedChar = True
      Size = 1
    end
    object cds_calltb_customer_id: TIntegerField
      FieldName = 'tb_customer_id'
      Origin = 'tb_customer_id'
      Required = True
    end
  end
  object ds_call: TDataSource
    DataSet = cds_call
    Left = 240
    Top = 254
  end
  object ds_proposal: TDataSource
    DataSet = cds_proposal
    Left = 312
    Top = 254
  end
  object cds_proposal: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 312
    Top = 207
    object cds_proposaltb_institution_id: TIntegerField
      FieldName = 'tb_institution_id'
      Required = True
    end
    object cds_proposalid: TIntegerField
      FieldName = 'id'
      Required = True
    end
    object cds_proposaltb_order_id: TIntegerField
      FieldName = 'tb_order_id'
      Required = True
    end
    object cds_proposalupdated_at: TDateTimeField
      FieldName = 'updated_at'
      Required = True
    end
    object cds_proposalcomentario: TStringField
      FieldName = 'comentario'
      Required = True
      Size = 100
    end
    object cds_proposalsituacao: TStringField
      FieldName = 'situacao'
      Required = True
      Size = 100
    end
    object cds_proposalkind: TStringField
      FieldName = 'kind'
      Required = True
      FixedChar = True
      Size = 1
    end
    object cds_proposaltb_customer_id: TIntegerField
      FieldName = 'tb_customer_id'
      Required = True
    end
  end
  object cds_progress: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 480
    Top = 207
    object cds_progresstb_institution_id: TIntegerField
      FieldName = 'tb_institution_id'
      Required = True
    end
    object cds_progressid: TIntegerField
      FieldName = 'id'
      Required = True
    end
    object cds_progresstb_order_id: TIntegerField
      FieldName = 'tb_order_id'
      Required = True
    end
    object cds_progressupdated_at: TDateTimeField
      FieldName = 'updated_at'
      Required = True
    end
    object cds_progresscomentario: TStringField
      FieldName = 'comentario'
      Required = True
      Size = 100
    end
    object cds_progresssituacao: TStringField
      FieldName = 'situacao'
      Required = True
      Size = 100
    end
    object cds_progresskind: TStringField
      FieldName = 'kind'
      Required = True
      FixedChar = True
      Size = 1
    end
    object cds_progresstb_customer_id: TIntegerField
      FieldName = 'tb_customer_id'
      Required = True
    end
  end
  object ds_progress: TDataSource
    DataSet = cds_progress
    Left = 480
    Top = 254
  end
end
