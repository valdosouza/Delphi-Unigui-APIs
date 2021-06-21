inherited PesCepLogradouro: TPesCepLogradouro
  ClientHeight = 454
  ClientWidth = 771
  Caption = 'Pesquisa CEP por Logradouro'
  ExplicitWidth = 787
  ExplicitHeight = 493
  PixelsPerInch = 96
  TextHeight = 13
  object Pnl_Fundo: TUniPanel [0]
    Left = 0
    Top = 48
    Width = 771
    Height = 335
    Hint = ''
    Align = alClient
    TabOrder = 0
    BorderStyle = ubsFrameLowered
    Caption = ''
    LayoutConfig.IgnorePosition = False
    object StrGrdResult: TUniStringGrid
      Left = 2
      Top = 2
      Width = 767
      Height = 331
      Hint = ''
      RowCount = 2
      ColCount = 6
      DefaultColWidth = 40
      DefaultRowHeight = 18
      Options = [goVertLine, goHorzLine, goRangeSelect, goRowSelect]
      Columns = <>
      Align = alClient
      TabOrder = 1
    end
  end
  object Pnl_Parametros: TUniPanel [1]
    Left = 0
    Top = 0
    Width = 771
    Height = 48
    Hint = ''
    Align = alTop
    TabOrder = 1
    BorderStyle = ubsFrameLowered
    Caption = ''
    LayoutConfig.IgnorePosition = False
    object ctn_state: TUniContainerPanel
      Left = 670
      Top = 3
      Width = 93
      Height = 38
      Hint = ''
      ParentColor = False
      TabOrder = 3
    end
    object E_busca_Cidade: TUniEdit
      Left = 435
      Top = 17
      Width = 231
      Hint = ''
      CharCase = ecUpperCase
      Text = ''
      TabOrder = 2
    end
    object UniLabel3: TUniLabel
      Left = 436
      Top = 2
      Width = 33
      Height = 13
      Hint = ''
      Caption = 'Cidade'
      ParentFont = False
      Font.Color = clNavy
      TabOrder = 5
    end
    object E_busca_Logradouro: TUniEdit
      Left = 101
      Top = 17
      Width = 332
      Hint = ''
      CharCase = ecUpperCase
      Text = ''
      TabOrder = 1
    end
    object UniLabel1: TUniLabel
      Left = 103
      Top = 2
      Width = 55
      Height = 13
      Hint = ''
      Caption = 'Logradouro'
      ParentFont = False
      Font.Color = clNavy
      TabOrder = 6
    end
    object E_Busca_Tipo: TUniEdit
      Left = 4
      Top = 17
      Width = 95
      Hint = ''
      CharCase = ecUpperCase
      Text = ''
      TabOrder = 0
    end
    object UniLabel2: TUniLabel
      Left = 6
      Top = 2
      Width = 20
      Height = 13
      Hint = ''
      Caption = 'Tipo'
      ParentFont = False
      Font.Color = clNavy
      TabOrder = 7
    end
  end
  object Pnl_Botoes: TUniPanel [2]
    Left = 0
    Top = 383
    Width = 771
    Height = 71
    Hint = ''
    Align = alBottom
    TabOrder = 2
    BorderStyle = ubsFrameLowered
    Caption = ''
    LayoutConfig.IgnorePosition = False
    object Sb_Close: TUniSpeedButton
      Left = 188
      Top = 5
      Width = 92
      Height = 60
      Hint = ''
      Caption = 'Fechar - ESC'
      ParentColor = False
      Color = clWindow
      IconAlign = iaTop
      TabOrder = 1
      OnClick = Sb_CloseClick
    end
    object Sb_View: TUniSpeedButton
      Left = 96
      Top = 5
      Width = 92
      Height = 60
      Hint = ''
      Caption = 'Visualizar - F8'
      ParentColor = False
      Color = clWindow
      IconAlign = iaTop
      TabOrder = 2
      OnClick = Sb_ViewClick
    end
    object Sb_Search: TUniSpeedButton
      Left = 4
      Top = 5
      Width = 92
      Height = 60
      Hint = ''
      Caption = 'Buscar - F7'
      ParentColor = False
      Color = clWindow
      IconAlign = iaTop
      TabOrder = 3
      OnClick = Sb_SearchClick
    end
  end
end
