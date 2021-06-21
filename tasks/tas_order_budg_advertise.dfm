inherited TasOrderBudgAdvertise: TTasOrderBudgAdvertise
  ClientHeight = 534
  ClientWidth = 1203
  Caption = 'TasOrderBudgAdvertise'
  ExplicitWidth = 1219
  ExplicitHeight = 593
  PixelsPerInch = 96
  TextHeight = 13
  object pnl_param_row_4_1: TUniPanel [0]
    Left = 0
    Top = 0
    Width = 1203
    Height = 52
    Hint = ''
    Align = alTop
    TabOrder = 0
    BorderStyle = ubsNone
    Caption = ''
    object E_Number: TUniEdit
      AlignWithMargins = True
      Left = 109
      Top = 3
      Width = 126
      Height = 46
      Hint = ''
      Text = ''
      Align = alLeft
      TabOrder = 1
      FieldLabel = 'N'#250'mero'
      FieldLabelAlign = laTop
    end
    object E_Email: TUniEdit
      AlignWithMargins = True
      Left = 241
      Top = 3
      Width = 282
      Height = 46
      Hint = ''
      Text = ''
      Align = alLeft
      TabOrder = 2
      FieldLabel = 'e-mail'
      FieldLabelAlign = laTop
    end
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
      TabOrder = 3
      FieldLabel = 'Data'
      FieldLabelAlign = laTop
    end
  end
  object Pg_Principal: TUniPageControl [1]
    Left = 0
    Top = 52
    Width = 1203
    Height = 418
    Hint = ''
    ActivePage = tbs_web
    Align = alClient
    TabOrder = 1
    object tbs_imp: TUniTabSheet
      Hint = ''
      Caption = 'Impresso'
      object dbg_Jr: TUniDBGrid
        Left = 0
        Top = 0
        Width = 1195
        Height = 354
        Hint = ''
        DataSource = ds_Imp
        Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgConfirmDelete]
        LoadMask.Message = 'Loading data...'
        Align = alTop
        Anchors = [akLeft, akTop, akRight, akBottom]
        TabOrder = 0
        Columns = <
          item
            FieldName = 'name'
            Title.Caption = 'Cidade'
            Width = 171
            ReadOnly = True
          end
          item
            FieldName = 'nick_trade'
            Title.Caption = 'Ve'#237'culo de Not'#237'cia'
            Width = 214
            ReadOnly = True
          end
          item
            FieldName = 'unit_value'
            Title.Caption = 'Valor Unit'#225'rio'
            Width = 91
            ReadOnly = True
          end
          item
            FieldName = 'formats'
            Title.Caption = 'Formato'
            Width = 149
            ReadOnly = True
          end
          item
            FieldName = 'measure'
            Title.Caption = 'Medidas'
            Width = 180
            ReadOnly = True
          end
          item
            FieldName = 'nr_columns'
            Title.Caption = 'Colunas'
            Width = 64
            ReadOnly = True
          end
          item
            FieldName = 'size_columns'
            Title.Caption = 'Altura'
            Width = 64
            ReadOnly = True
          end
          item
            FieldName = 'online_price'
            Title.Caption = 'Valor OnLine'
            Width = 70
            ReadOnly = True
          end
          item
            FieldName = 'insertion'
            Title.Caption = 'Inser'#231#245'es'
            Width = 64
            ReadOnly = True
          end>
      end
      object Sb_Insert_Parts_Imp: TUniSpeedButton
        AlignWithMargins = True
        Left = 3
        Top = 357
        Width = 127
        Height = 30
        Hint = ''
        Margins.Right = 0
        Visible = False
        AllowAllUp = True
        Caption = 'Inserir'
        Align = alLeft
        ParentFont = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Name = 'Arial'
        ParentColor = False
        Color = clWindow
        TabOrder = 1
      end
      object Sb_Change_Parts_imp: TUniSpeedButton
        AlignWithMargins = True
        Left = 130
        Top = 357
        Width = 127
        Height = 30
        Hint = ''
        Margins.Left = 0
        Margins.Right = 0
        Visible = False
        Caption = 'Alterar'
        Align = alLeft
        ParentFont = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Name = 'Arial'
        ParentColor = False
        Color = clWindow
        TabOrder = 2
      end
      object Sb_Delet_Parts_imp: TUniSpeedButton
        AlignWithMargins = True
        Left = 257
        Top = 357
        Width = 129
        Height = 30
        Hint = ''
        Margins.Left = 0
        Margins.Right = 0
        Caption = 'Excluir'
        Align = alLeft
        ParentFont = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Name = 'Arial'
        ParentColor = False
        Color = clWindow
        TabOrder = 3
        OnClick = Sb_Delet_Parts_impClick
      end
    end
    object tbs_web: TUniTabSheet
      Hint = ''
      Caption = 'On-Line'
      object dbg_rt: TUniDBGrid
        Left = 0
        Top = 0
        Width = 1195
        Height = 352
        Hint = ''
        DataSource = ds_web
        Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgConfirmDelete]
        LoadMask.Message = 'Loading data...'
        Align = alTop
        Anchors = [akLeft, akTop, akRight, akBottom]
        TabOrder = 0
        Columns = <
          item
            FieldName = 'name'
            Title.Caption = 'Cidade'
            Width = 422
            ReadOnly = True
          end
          item
            FieldName = 'link'
            Title.Caption = 'Portal'
            Width = 323
            ReadOnly = True
          end
          item
            FieldName = 'formats'
            Title.Caption = 'Formato'
            Width = 128
            ReadOnly = True
          end
          item
            FieldName = 'days'
            Title.Caption = 'Dias'
            Width = 64
            ReadOnly = True
          end
          item
            FieldName = 'page_views'
            Title.Caption = 'PageViews'
            Width = 64
            ReadOnly = True
          end
          item
            FieldName = 'unit_value'
            Title.Caption = 'ValorUnit'#225'rio'
            Width = 70
            ReadOnly = True
          end>
      end
      object Sb_Insert_Parts_web: TUniSpeedButton
        AlignWithMargins = True
        Left = 3
        Top = 355
        Width = 127
        Height = 32
        Hint = ''
        Margins.Right = 0
        Visible = False
        Caption = 'Inserir'
        Align = alLeft
        ParentFont = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Name = 'Arial'
        ParentColor = False
        Color = clWindow
        TabOrder = 1
      end
      object Sb_Change_Parts_web: TUniSpeedButton
        AlignWithMargins = True
        Left = 130
        Top = 355
        Width = 127
        Height = 32
        Hint = ''
        Margins.Left = 0
        Margins.Right = 0
        Visible = False
        Caption = 'Alterar'
        Align = alLeft
        ParentFont = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Name = 'Arial'
        ParentColor = False
        Color = clWindow
        TabOrder = 2
      end
      object Sb_Delet_Parts_web: TUniSpeedButton
        AlignWithMargins = True
        Left = 257
        Top = 355
        Width = 129
        Height = 32
        Hint = ''
        Margins.Left = 0
        Margins.Right = 0
        Caption = 'Excluir'
        Align = alLeft
        ParentFont = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Name = 'Arial'
        ParentColor = False
        Color = clWindow
        TabOrder = 3
        OnClick = Sb_Delet_Parts_webClick
      end
    end
  end
  object pnl_botao: TUniPanel [2]
    Left = 0
    Top = 470
    Width = 1203
    Height = 64
    Hint = ''
    Align = alBottom
    TabOrder = 2
    BorderStyle = ubsFrameLowered
    Caption = ''
    Layout = 'auto'
    object Sb_Close: TUniSpeedButton
      AlignWithMargins = True
      Left = 97
      Top = 5
      Width = 95
      Height = 54
      Hint = ''
      Margins.Left = 0
      Margins.Right = 0
      Caption = 'Sair'
      Align = alLeft
      ParentFont = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Name = 'Arial'
      ParentColor = False
      Color = clWindow
      IconAlign = iaTop
      TabOrder = 1
      OnClick = Sb_CloseClick
    end
    object Sb_Print: TUniSpeedButton
      AlignWithMargins = True
      Left = 2
      Top = 5
      Width = 95
      Height = 54
      Hint = ''
      Margins.Left = 0
      Margins.Right = 0
      Caption = 'Imprimir'
      Align = alLeft
      ParentFont = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Name = 'Arial'
      ParentColor = False
      Color = clWindow
      IconAlign = iaTop
      TabOrder = 2
      OnClick = Sb_PrintClick
    end
  end
  inherited cds_msg: TClientDataSet
    Left = 584
    Top = 8
  end
  inherited ds_msg: TDataSource
    Left = 696
    Top = 16
  end
  inherited MenuTask: TUniMainMenu
    Left = 632
  end
  object cds_Imp: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DSP'
    Left = 152
    Top = 199
    object cds_Impid: TIntegerField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cds_Impid_item: TIntegerField
      FieldName = 'id_item'
      Origin = 'id'
      ProviderFlags = []
      ReadOnly = True
    end
    object cds_Impnumber: TIntegerField
      FieldName = 'number'
      Origin = '`number`'
    end
    object cds_ImpCityID: TIntegerField
      FieldName = 'CityID'
      Origin = 'id'
      ProviderFlags = []
      ReadOnly = True
    end
    object cds_Impname: TStringField
      FieldName = 'name'
      Origin = '`name`'
      ProviderFlags = []
      ReadOnly = True
      Size = 100
    end
    object cds_ImpbroadcasterID: TIntegerField
      FieldName = 'broadcasterID'
      Origin = 'id'
      ProviderFlags = []
      ReadOnly = True
    end
    object cds_Impnick_trade: TStringField
      FieldName = 'nick_trade'
      Origin = 'nick_trade'
      ProviderFlags = []
      ReadOnly = True
      Size = 100
    end
    object cds_Impunit_value: TBCDField
      FieldName = 'unit_value'
      Origin = 'unit_value'
      ProviderFlags = []
      ReadOnly = True
      Precision = 10
      Size = 2
    end
    object cds_Impformats: TStringField
      FieldName = 'formats'
      Origin = 'formats'
      ProviderFlags = []
      ReadOnly = True
      Size = 100
    end
    object cds_Impmeasure: TStringField
      FieldName = 'measure'
      Origin = 'measure'
      ProviderFlags = []
      ReadOnly = True
      Size = 100
    end
    object cds_Impnr_columns: TIntegerField
      FieldName = 'nr_columns'
      Origin = 'nr_columns'
      ProviderFlags = []
      ReadOnly = True
    end
    object cds_Impsize_columns: TIntegerField
      FieldName = 'size_columns'
      Origin = 'size_columns'
      ProviderFlags = []
      ReadOnly = True
    end
    object cds_Imponline_price: TBCDField
      FieldName = 'online_price'
      Origin = 'online_price'
      ProviderFlags = []
      ReadOnly = True
      Precision = 10
      Size = 2
    end
    object cds_Impinsertion: TIntegerField
      FieldName = 'insertion'
      Origin = 'insertion'
      ProviderFlags = []
      ReadOnly = True
    end
  end
  object ds_Imp: TDataSource
    DataSet = cds_Imp
    Left = 152
    Top = 246
  end
  object DSP: TDataSetProvider
    DataSet = UMM.Qr_Crud
    Options = [poAllowCommandText, poUseQuoteChar]
    Left = 152
    Top = 151
  end
  object cds_web: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DSP'
    Left = 264
    Top = 191
    object cds_webid: TIntegerField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cds_webid_item: TIntegerField
      FieldName = 'id_item'
      Origin = 'id'
      ProviderFlags = []
      ReadOnly = True
    end
    object cds_webnumber: TIntegerField
      FieldName = 'number'
      Origin = '`number`'
    end
    object cds_webname: TStringField
      FieldName = 'name'
      Origin = '`name`'
      ProviderFlags = []
      ReadOnly = True
      Size = 100
    end
    object cds_weblink: TStringField
      FieldName = 'link'
      Origin = 'link'
      ProviderFlags = []
      ReadOnly = True
      Size = 100
    end
    object cds_webformats: TStringField
      FieldName = 'formats'
      Origin = 'formats'
      ProviderFlags = []
      ReadOnly = True
      Size = 100
    end
    object cds_webdays: TIntegerField
      FieldName = 'days'
      Origin = 'days'
      ProviderFlags = []
      ReadOnly = True
    end
    object cds_webpage_views: TIntegerField
      FieldName = 'page_views'
      Origin = 'page_views'
      ProviderFlags = []
      ReadOnly = True
    end
    object cds_webunit_value: TBCDField
      FieldName = 'unit_value'
      Origin = 'unit_value'
      ProviderFlags = []
      ReadOnly = True
      Precision = 10
      Size = 2
    end
  end
  object ds_web: TDataSource
    DataSet = cds_web
    Left = 264
    Top = 238
  end
end
