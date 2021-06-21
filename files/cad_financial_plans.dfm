inherited CadFinancialPlans: TCadFinancialPlans
  ClientHeight = 409
  ClientWidth = 663
  Caption = 'Cadastro de Planos Financeiros'
  ExplicitWidth = 679
  ExplicitHeight = 468
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnl_botao: TUniPanel
    Top = 345
    Width = 663
    ExplicitTop = 333
    ExplicitWidth = 663
    object Sb_Filter: TUniSpeedButton
      Left = 467
      Top = 4
      Width = 93
      Height = 54
      Hint = ''
      Caption = 'Filtrar'
      Anchors = [akLeft, akBottom]
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
    Width = 663
    Height = 345
    ExplicitWidth = 663
    ExplicitHeight = 333
    object L_NameCompany: TUniLabel
      Left = 216
      Top = 3
      Width = 49
      Height = 14
      Hint = ''
      Caption = 'Descri'#231#227'o'
      ParentFont = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Name = 'Arial'
      TabOrder = 4
    end
    object E_Description: TUniEdit
      Left = 213
      Top = 18
      Width = 442
      Hint = ''
      CharCase = ecUpperCase
      Text = ''
      ParentFont = False
      TabOrder = 0
    end
    object Trw_Cadastro: TUniTreeView
      Left = 4
      Top = 88
      Width = 651
      Height = 142
      Hint = ''
      Items.FontData = {0100000000}
      TabOrder = 2
      Color = clWindow
      OnChange = Trw_CadastroChange
    end
    object chbx_cad_active: TUniCheckBox
      Left = 9
      Top = 236
      Width = 136
      Height = 17
      Hint = ''
      Checked = True
      Caption = 'Cadastro Ativo'
      TabOrder = 3
    end
    object E_Posit_Level: TUniEdit
      Left = 4
      Top = 18
      Width = 206
      Hint = ''
      CharCase = ecUpperCase
      Text = ''
      ParentFont = False
      TabOrder = 5
    end
    object UniLabel2: TUniLabel
      Left = 216
      Top = 3
      Width = 49
      Height = 14
      Hint = ''
      Caption = 'Descri'#231#227'o'
      ParentFont = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Name = 'Arial'
      TabOrder = 6
    end
    object UniLabel3: TUniLabel
      Left = 4
      Top = 3
      Width = 65
      Height = 14
      Hint = ''
      Caption = 'Classifica'#231#227'o'
      ParentFont = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Name = 'Arial'
      TabOrder = 7
    end
    object Rg_Cluster: TUniRadioGroup
      Left = 4
      Top = 43
      Width = 184
      Height = 41
      Hint = ''
      Items.Strings = (
        'Sint'#233'tica'
        'Anal'#237'tica')
      Caption = 'N'#237'vel Visualiza'#231#227'o'
      TabOrder = 8
      Columns = 2
    end
    object Rg_Kind: TUniRadioGroup
      Left = 377
      Top = 43
      Width = 278
      Height = 41
      Hint = ''
      Items.Strings = (
        'Centro de Custo'
        'Contas do Resultado')
      Caption = 'Tipo de Conta'
      TabOrder = 9
      Columns = 2
    end
    object Rg_Source_: TUniRadioGroup
      Left = 191
      Top = 43
      Width = 183
      Height = 41
      Hint = ''
      Items.Strings = (
        'Credora'
        'Devedora')
      Caption = 'Natureza'
      TabOrder = 10
      Columns = 2
    end
  end
  object Gbox1: TUniGroupBox [2]
    Left = 8
    Top = 259
    Width = 647
    Height = 69
    Hint = ''
    Caption = 'Digite suas Op'#231#245'es de Busca'
    TabOrder = 2
    DesignSize = (
      647
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
      Width = 532
      Hint = ''
      CharCase = ecUpperCase
      Text = ''
      ParentFont = False
      TabOrder = 3
    end
    object Sb_Search: TUniSpeedButton
      Left = 545
      Top = 10
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
