inherited CadClinQuestionnaire: TCadClinQuestionnaire
  ClientHeight = 510
  ClientWidth = 818
  Caption = 'Cadastro de Question'#225'rio'
  ExplicitWidth = 834
  ExplicitHeight = 569
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnl_botao: TUniPanel
    Top = 446
    Width = 818
    TabOrder = 1
    ExplicitTop = 446
    ExplicitWidth = 818
  end
  inherited pnl_fundo: TUniPanel
    Width = 818
    Height = 446
    TabOrder = 0
    ExplicitWidth = 818
    ExplicitHeight = 446
    object pnl_fundo_row_1: TUniPanel
      Left = 2
      Top = 2
      Width = 814
      Height = 52
      Hint = ''
      Align = alTop
      TabOrder = 0
      BorderStyle = ubsNone
      Caption = ''
      object DTP_Date: TUniDateTimePicker
        AlignWithMargins = True
        Left = 3
        Top = 3
        Width = 100
        Height = 46
        Hint = ''
        DateTime = 42916.000000000000000000
        DateFormat = 'dd/MM/yyyy'
        TimeFormat = 'HH:mm:ss'
        Align = alLeft
        TabOrder = 1
        FieldLabel = 'Data'
        FieldLabelAlign = laTop
      end
      object E_Questionnaire: TUniEdit
        AlignWithMargins = True
        Left = 109
        Top = 3
        Width = 415
        Height = 46
        Hint = ''
        Text = ''
        Align = alClient
        TabOrder = 2
        FieldLabel = 'Descri'#231#227'o do Question'#225'rio'
        FieldLabelAlign = laTop
      end
      object ctn_clin_module: TUniContainerPanel
        Left = 527
        Top = 0
        Width = 287
        Height = 52
        Hint = ''
        ParentColor = False
        Align = alRight
        TabOrder = 3
      end
    end
    object pnl_fundo_row_2: TUniPanel
      Left = 2
      Top = 54
      Width = 814
      Height = 52
      Hint = ''
      Align = alTop
      TabOrder = 1
      BorderStyle = ubsNone
      Caption = ''
      object Ctn_LineBusiness: TUniContainerPanel
        Left = 0
        Top = 0
        Width = 345
        Height = 52
        Hint = ''
        ParentColor = False
        Align = alLeft
        TabOrder = 1
      end
      object Ctn_clin_professional: TUniContainerPanel
        Left = 345
        Top = 0
        Width = 469
        Height = 52
        Hint = ''
        ParentColor = False
        Align = alClient
        TabOrder = 2
      end
    end
    object pnl_fundo_row_3: TUniPanel
      Left = 2
      Top = 131
      Width = 814
      Height = 313
      Hint = ''
      Align = alClient
      TabOrder = 2
      ShowCaption = False
      TitleVisible = True
      Title = #193'rea de Edi'#231#227'o das Perguntas'
      Caption = ''
      object pnl_fundo_row_3_1: TUniPanel
        Left = 1
        Top = 1
        Width = 812
        Height = 52
        Hint = ''
        Align = alTop
        TabOrder = 0
        Caption = ''
        object E_Question: TUniEdit
          AlignWithMargins = True
          Left = 4
          Top = 4
          Width = 804
          Height = 44
          Hint = ''
          Text = ''
          Align = alClient
          TabOrder = 1
          FieldLabel = 'Descri'#231#227'o da Pergunta'
          FieldLabelAlign = laTop
        end
      end
      object pnl_fundo_row_3_2: TUniPanel
        Left = 1
        Top = 53
        Width = 812
        Height = 52
        Hint = ''
        Align = alTop
        TabOrder = 1
        Caption = ''
        object sb_Insert_Question: TUniSpeedButton
          AlignWithMargins = True
          Left = 4
          Top = 4
          Width = 115
          Height = 44
          Hint = ''
          Caption = 'Inserir'
          Align = alLeft
          ParentFont = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clNavy
          Font.Name = 'Arial'
          ParentColor = False
          Color = clWindow
          TabOrder = 1
          OnClick = sb_Insert_QuestionClick
        end
        object sb_Delete_Question: TUniSpeedButton
          AlignWithMargins = True
          Left = 246
          Top = 4
          Width = 115
          Height = 44
          Hint = ''
          Caption = 'Excluir'
          Align = alLeft
          ParentFont = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clNavy
          Font.Name = 'Arial'
          ParentColor = False
          Color = clWindow
          TabOrder = 2
          OnClick = sb_Delete_QuestionClick
        end
        object SB_Save_Question: TUniSpeedButton
          AlignWithMargins = True
          Left = 364
          Top = 4
          Width = 115
          Height = 44
          Hint = ''
          Margins.Left = 0
          Margins.Right = 0
          Caption = 'Gravar'
          Align = alLeft
          ParentFont = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clNavy
          Font.Name = 'Arial'
          ParentColor = False
          Color = clWindow
          TabOrder = 3
          OnClick = SB_Save_QuestionClick
        end
        object SB_Cancel_Question: TUniSpeedButton
          AlignWithMargins = True
          Left = 479
          Top = 4
          Width = 115
          Height = 44
          Hint = ''
          Margins.Left = 0
          Margins.Right = 0
          Caption = 'Cancelar'
          Align = alLeft
          ParentFont = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clNavy
          Font.Name = 'Arial'
          ParentColor = False
          Color = clWindow
          TabOrder = 4
          OnClick = SB_Cancel_QuestionClick
        end
        object sb_Change_Question: TUniSpeedButton
          AlignWithMargins = True
          Left = 125
          Top = 4
          Width = 115
          Height = 44
          Hint = ''
          Caption = 'Alterar'
          Align = alLeft
          ParentFont = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clNavy
          Font.Name = 'Arial'
          ParentColor = False
          Color = clWindow
          TabOrder = 5
          OnClick = SB_Change_QuestionClick
        end
      end
      object dbg_Search: TUniDBGrid
        Left = 1
        Top = 105
        Width = 812
        Height = 207
        Hint = ''
        DataSource = ds_question
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgConfirmDelete, dgTitleClick]
        WebOptions.FetchAll = True
        LoadMask.Message = 'Carregando os dados'
        Align = alClient
        TabOrder = 3
        Columns = <
          item
            FieldName = 'id'
            Title.Caption = 'C'#243'digo'
            Width = 64
            Visible = False
          end
          item
            FieldName = 'description'
            Title.Caption = 'Descri'#231#227'o da Pergunta'
            Width = 646
          end>
      end
    end
    object pnl_fundo_row_4: TUniPanel
      Left = 2
      Top = 106
      Width = 814
      Height = 25
      Hint = ''
      Align = alTop
      TabOrder = 4
      BorderStyle = ubsNone
      Caption = ''
      object chbx_ativo: TUniCheckBox
        AlignWithMargins = True
        Left = 3
        Top = 3
        Width = 70
        Height = 19
        Hint = ''
        Caption = 'Ativo'
        Align = alLeft
        TabOrder = 1
      end
    end
  end
  inherited cds_msg: TClientDataSet
    Left = 16
    Top = 184
  end
  inherited ds_msg: TDataSource
    Left = 16
    Top = 240
  end
  inherited MenuTask: TUniMainMenu
    Left = 24
    Top = 136
  end
  object cds_question: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 24
    Top = 296
    object cds_questionid: TIntegerField
      DisplayLabel = 'C'#243'digo'
      DisplayWidth = 10
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Visible = False
    end
    object cds_questiondescription: TStringField
      DisplayLabel = 'Descri'#231#227'o da Pergunta'
      DisplayWidth = 107
      FieldName = 'description'
      Origin = 'description'
      Size = 100
    end
  end
  object ds_question: TDataSource
    DataSet = cds_question
    Left = 24
    Top = 352
  end
end
