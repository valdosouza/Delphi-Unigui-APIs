inherited CadCategory: TCadCategory
  ClientHeight = 408
  ClientWidth = 660
  Caption = 'Cadastro de Categoria'
  ExplicitWidth = 676
  ExplicitHeight = 467
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnl_botao: TUniPanel
    Top = 344
    Width = 660
    ExplicitTop = 344
    ExplicitWidth = 660
    inherited Sb_Close: TUniSpeedButton
      Left = 559
      ExplicitLeft = 559
    end
    object Sb_Filter: TUniSpeedButton
      AlignWithMargins = True
      Left = 466
      Top = 5
      Width = 93
      Height = 54
      Hint = ''
      Margins.Left = 0
      Margins.Right = 0
      Caption = 'Filtrar'
      Align = alLeft
      ParentFont = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Name = 'Arial'
      ParentColor = False
      Color = clWindow
      IconAlign = iaTop
      TabOrder = 7
      OnClick = Sb_FilterClick
    end
  end
  inherited pnl_fundo: TUniPanel
    Width = 660
    Height = 275
    ExplicitWidth = 660
    ExplicitHeight = 275
    object L_NameCompany: TUniLabel
      AlignWithMargins = True
      Left = 5
      Top = 5
      Width = 49
      Height = 14
      Hint = ''
      Caption = 'Descri'#231#227'o'
      Align = alTop
      ParentFont = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Name = 'Arial'
      TabOrder = 4
    end
    object E_Description: TUniEdit
      AlignWithMargins = True
      Left = 5
      Top = 25
      Width = 650
      Hint = ''
      CharCase = ecUpperCase
      Text = ''
      ParentFont = False
      Align = alTop
      TabOrder = 0
    end
    object Trw_Cadastro: TUniTreeView
      AlignWithMargins = True
      Left = 5
      Top = 53
      Width = 650
      Height = 187
      Hint = ''
      Items.FontData = {0100000000}
      Align = alTop
      TabOrder = 2
      Color = clWindow
      OnChange = Trw_CadastroChange
    end
    object chbx_cad_active: TUniCheckBox
      AlignWithMargins = True
      Left = 5
      Top = 246
      Width = 650
      Height = 17
      Hint = ''
      Checked = True
      Caption = 'Cadastro Ativo'
      Align = alTop
      TabOrder = 3
    end
  end
  object Gbox1: TUniGroupBox [2]
    Left = 0
    Top = 275
    Width = 660
    Height = 69
    Hint = ''
    Caption = 'Digite suas Op'#231#245'es de Busca'
    Align = alBottom
    TabOrder = 2
    DesignSize = (
      660
      69)
    object UniLabel1: TUniLabel
      Left = 5
      Top = 14
      Width = 49
      Height = 14
      Hint = ''
      Caption = 'Descri'#231#227'o'
      ParentFont = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Name = 'Arial'
      TabOrder = 1
    end
    object E_Search: TUniEdit
      Left = 5
      Top = 29
      Width = 539
      Hint = ''
      CharCase = ecUpperCase
      Text = ''
      ParentFont = False
      TabOrder = 3
    end
    object Sb_Search: TUniSpeedButton
      Left = 553
      Top = 11
      Width = 91
      Height = 54
      Hint = ''
      Caption = 'Buscar'
      Anchors = [akLeft, akBottom]
      ParentFont = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Name = 'Arial'
      ParentColor = False
      Color = clWindow
      IconAlign = iaTop
      TabOrder = 2
      OnClick = Sb_SearchClick
    end
  end
  inherited MenuTask: TUniMainMenu
    Left = 504
  end
end
