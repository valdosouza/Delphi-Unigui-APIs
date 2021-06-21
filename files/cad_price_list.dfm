inherited CadPriceList: TCadPriceList
  ClientHeight = 168
  ClientWidth = 568
  Caption = 'Cadastro Tabela de Pre'#231'o'
  ExplicitWidth = 584
  ExplicitHeight = 227
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnl_botao: TUniPanel
    Top = 104
    Width = 568
    ExplicitTop = 104
    ExplicitWidth = 568
    object UniRadioGroup1: TUniRadioGroup
      Left = 336
      Top = -93
      Width = 185
      Height = 91
      Hint = ''
      Caption = 'UniRadioGroup1'
      TabOrder = 7
    end
  end
  inherited pnl_fundo: TUniPanel
    Width = 568
    Height = 104
    ExplicitWidth = 568
    ExplicitHeight = 104
    object L_Codigo: TUniLabel
      Left = 6
      Top = 6
      Width = 33
      Height = 14
      Hint = ''
      Caption = 'C'#243'digo'
      ParentFont = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Name = 'Arial'
      TabOrder = 5
    end
    object E_ID: TUniEdit
      Left = 6
      Top = 21
      Width = 53
      Hint = ''
      Text = ''
      TabOrder = 0
      ReadOnly = True
    end
    object L_Validade: TUniLabel
      Left = 115
      Top = 48
      Width = 41
      Height = 14
      Hint = ''
      Caption = 'Validade'
      ParentFont = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Name = 'Arial'
      TabOrder = 6
    end
    object E_Description: TUniEdit
      Left = 61
      Top = 21
      Width = 501
      Hint = ''
      CharCase = ecUpperCase
      Text = ''
      ParentFont = False
      TabOrder = 1
    end
    object L_MargemLucro: TUniLabel
      Left = 6
      Top = 48
      Width = 69
      Height = 14
      Hint = ''
      Caption = 'Margem Lucro'
      ParentFont = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Name = 'Arial'
      TabOrder = 7
    end
    object DTP_Validity: TUniDateTimePicker
      Left = 115
      Top = 63
      Width = 120
      Hint = ''
      DateTime = 42916.000000000000000000
      DateFormat = 'dd/MM/yyyy'
      TimeFormat = 'HH:mm:ss'
      TabOrder = 3
    end
    object L_Descrição: TUniLabel
      Left = 61
      Top = 6
      Width = 49
      Height = 14
      Hint = ''
      Caption = 'Descri'#231#227'o'
      ParentFont = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Name = 'Arial'
      TabOrder = 8
    end
    object E_Aliq_Profit: TUniEdit
      Left = 6
      Top = 63
      Width = 106
      Hint = ''
      CharCase = ecUpperCase
      Alignment = taRightJustify
      Text = ''
      ParentFont = False
      TabOrder = 2
    end
  end
  object Rg_Modality: TUniRadioGroup [2]
    Left = 247
    Top = 49
    Width = 315
    Height = 48
    Hint = ''
    Items.Strings = (
      'Vista '
      'Prazo'
      'Ambos')
    Caption = 'Modalidade'
    TabOrder = 2
    Columns = 3
  end
  inherited MenuTask: TUniMainMenu
    Left = 48
    Top = 120
  end
end
