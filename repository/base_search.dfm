inherited BaseSearch: TBaseSearch
  ClientHeight = 399
  ClientWidth = 834
  Caption = 'Base Search'
  ExplicitWidth = 850
  ExplicitHeight = 458
  PixelsPerInch = 96
  TextHeight = 13
  object Pnl_Fundo: TUniPanel [0]
    Left = 0
    Top = 0
    Width = 834
    Height = 335
    Hint = ''
    Align = alClient
    TabOrder = 0
    BorderStyle = ubsFrameLowered
    Caption = ''
    LayoutConfig.IgnorePosition = False
    object pc_search: TUniPageControl
      Left = 2
      Top = 2
      Width = 830
      Height = 331
      Hint = ''
      ActivePage = tbs_param
      Align = alClient
      TabOrder = 1
      OnChange = pc_searchChange
      object tbs_param: TUniTabSheet
        Hint = ''
        Caption = 'Par'#226'metros da Busca'
        object pnl_param: TUniPanel
          Left = 0
          Top = 0
          Width = 822
          Height = 272
          Hint = ''
          Align = alClient
          TabOrder = 0
          BorderStyle = ubsFrameLowered
          Caption = ''
        end
        object pnl_config: TUniPanel
          Left = 0
          Top = 272
          Width = 822
          Height = 31
          Hint = ''
          Align = alBottom
          TabOrder = 1
          Caption = ''
          object chbx_limit_result: TUniCheckBox
            AlignWithMargins = True
            Left = 4
            Top = 4
            Width = 320
            Height = 23
            Hint = ''
            Checked = True
            Caption = 'Limitar o n'#250'mero de registros para otimizar o tempo de Busca'
            Align = alLeft
            TabOrder = 1
            OnChange = chbx_limit_resultChange
          end
          object E_Limit: TUniEdit
            AlignWithMargins = True
            Left = 330
            Top = 4
            Width = 88
            Height = 23
            Hint = ''
            Alignment = taCenter
            Text = '50'
            Align = alLeft
            TabOrder = 2
          end
        end
      end
      object tbs_search: TUniTabSheet
        Hint = ''
        Caption = 'Resultado da Busca'
        object dbg_Search: TUniDBGrid
          Left = 0
          Top = 0
          Width = 822
          Height = 303
          Hint = ''
          DataSource = ds_search
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgConfirmDelete, dgAutoRefreshRow]
          WebOptions.RetainCursorOnSort = True
          LoadMask.Message = 'Carregando os dados'
          Align = alClient
          TabOrder = 0
          OnColumnSort = dbg_SearchColumnSort
          OnDblClick = dbg_SearchDblClick
        end
      end
    end
  end
  object Pnl_Botoes: TUniPanel [1]
    Left = 0
    Top = 335
    Width = 834
    Height = 64
    Hint = ''
    Align = alBottom
    TabOrder = 1
    BorderStyle = ubsFrameLowered
    Caption = ''
    LayoutConfig.IgnorePosition = False
    object Sb_Close: TUniSpeedButton
      AlignWithMargins = True
      Left = 281
      Top = 5
      Width = 92
      Height = 54
      Hint = ''
      Margins.Left = 0
      Margins.Right = 0
      Caption = 'Fechar - ESC'
      Align = alLeft
      ParentColor = False
      Color = clWindow
      IconAlign = iaTop
      TabOrder = 1
      OnClick = Sb_CloseClick
    end
    object Sb_View: TUniSpeedButton
      AlignWithMargins = True
      Left = 189
      Top = 5
      Width = 92
      Height = 54
      Hint = ''
      Margins.Left = 0
      Margins.Right = 0
      Caption = 'Visualizar - F8'
      Align = alLeft
      ParentColor = False
      Color = clWindow
      IconAlign = iaTop
      TabOrder = 2
      OnClick = Sb_ViewClick
    end
    object Sb_Search: TUniSpeedButton
      AlignWithMargins = True
      Left = 97
      Top = 5
      Width = 92
      Height = 54
      Hint = ''
      Margins.Left = 0
      Margins.Right = 0
      Caption = 'Buscar - F7'
      Align = alLeft
      ParentColor = False
      Color = clWindow
      IconAlign = iaTop
      TabOrder = 3
      OnClick = Sb_SearchClick
    end
    object Sb_Register: TUniSpeedButton
      AlignWithMargins = True
      Left = 5
      Top = 5
      Width = 92
      Height = 54
      Hint = ''
      Margins.Right = 0
      Caption = 'Cadastrar - F2'
      Align = alLeft
      ParentColor = False
      Color = clWindow
      IconAlign = iaTop
      Scale = bbsLarge
      TabOrder = 4
      OnClick = Sb_RegisterClick
    end
  end
  inherited cds_msg: TClientDataSet
    Left = 152
    Top = 49
  end
  inherited ds_msg: TDataSource
    Left = 200
    Top = 48
  end
  object ds_search: TDataSource [4]
    DataSet = cds_search
    Left = 152
    Top = 246
  end
  object cds_search: TClientDataSet [5]
    Aggregates = <>
    Params = <>
    ProviderName = 'DSP'
    Left = 152
    Top = 199
  end
  object DSP: TDataSetProvider [6]
    DataSet = UMM.Qr_Crud
    Options = [poAllowCommandText, poUseQuoteChar]
    Left = 152
    Top = 151
  end
end
