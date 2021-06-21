inherited CadCity: TCadCity
  ClientHeight = 162
  ClientWidth = 568
  Caption = 'Cadastro de Cidades'
  ExplicitWidth = 584
  ExplicitHeight = 221
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnl_botao: TUniPanel
    Top = 98
    Width = 568
    ExplicitTop = 89
    ExplicitWidth = 568
    inherited SB_Save: TUniSpeedButton
      ExplicitTop = 5
    end
  end
  inherited pnl_fundo: TUniPanel
    Width = 568
    Height = 98
    ExplicitWidth = 568
    ExplicitHeight = 89
    object ctn_state: TUniContainerPanel
      Left = 1
      Top = 3
      Width = 93
      Height = 38
      Hint = ''
      ParentColor = False
      TabOrder = 0
    end
    object L_Descricao: TUniLabel
      Left = 198
      Top = 1
      Width = 100
      Height = 14
      Hint = ''
      Caption = 'Descri'#231#227'o da Cidade'
      ParentFont = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Name = 'Arial'
      TabOrder = 6
    end
    object L_Codigo: TUniLabel
      Left = 96
      Top = 2
      Width = 33
      Height = 14
      Hint = ''
      Caption = 'C'#243'digo'
      ParentFont = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Name = 'Arial'
      TabOrder = 7
    end
    object E_City: TUniEdit
      Left = 197
      Top = 17
      Width = 366
      Hint = ''
      CharCase = ecUpperCase
      Text = ''
      ParentFont = False
      TabOrder = 2
    end
    object E_ID: TUniEdit
      Left = 96
      Top = 17
      Width = 100
      Hint = ''
      Text = ''
      TabOrder = 1
    end
    object L_ibge: TUniLabel
      Left = 3
      Top = 42
      Width = 59
      Height = 14
      Hint = ''
      Caption = 'C'#243'digo IBGE'
      ParentFont = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Name = 'Arial'
      TabOrder = 8
    end
    object E_ibge: TUniEdit
      Left = 3
      Top = 57
      Width = 100
      Hint = ''
      Text = ''
      TabOrder = 4
    end
    object L_Aliq_Iss: TUniLabel
      Left = 104
      Top = 41
      Width = 79
      Height = 14
      Hint = ''
      Caption = 'Aliquota ISS (%)'
      ParentFont = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Name = 'Arial'
      TabOrder = 9
    end
    object E_Aliq_Iss: TUniFormattedNumberEdit
      Left = 104
      Top = 57
      Width = 96
      Hint = ''
      Alignment = taRightJustify
      TabOrder = 5
      DecimalUseOSDefault = True
    end
  end
  inherited MenuTask: TUniMainMenu
    Left = 352
    Top = 48
  end
end
