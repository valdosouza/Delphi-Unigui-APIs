inherited CadCfop: TCadCfop
  ClientHeight = 392
  ClientWidth = 567
  Caption = 'Cadastro Natureza da Opera'#231#227'o'
  ExplicitTop = -10
  ExplicitWidth = 583
  ExplicitHeight = 451
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnl_botao: TUniPanel
    Top = 328
    Width = 567
    TabOrder = 7
    ExplicitTop = 316
    ExplicitWidth = 567
    inherited SB_Save: TUniSpeedButton
      ExplicitTop = 5
    end
  end
  inherited pnl_fundo: TUniPanel
    Width = 567
    Height = 328
    TabOrder = 8
    ExplicitWidth = 567
    ExplicitHeight = 316
  end
  object E_Consise: TUniEdit [2]
    Left = 110
    Top = 24
    Width = 452
    Hint = ''
    Text = ''
    TabOrder = 1
  end
  object E_Register: TUniEdit [3]
    Left = 8
    Top = 112
    Width = 73
    Hint = ''
    Text = ''
    TabOrder = 3
  end
  object UniLabel3: TUniLabel [4]
    Left = 114
    Top = 8
    Width = 157
    Height = 13
    Hint = ''
    Caption = 'Descri'#231#227'o Resumida da Natureza'
    TabOrder = 9
  end
  object c: TUniLabel [5]
    Left = 8
    Top = 97
    Width = 40
    Height = 13
    Hint = ''
    Caption = 'Registro'
    TabOrder = 10
  end
  object Rg_way: TUniRadioGroup [6]
    Left = 83
    Top = 97
    Width = 148
    Height = 42
    Hint = ''
    Items.Strings = (
      'Entrada'
      'Sa'#237'da')
    Caption = 'Sentido'
    TabOrder = 4
    Columns = 2
  end
  object Rg_Jurisdiction: TUniRadioGroup [7]
    Left = 233
    Top = 97
    Width = 205
    Height = 42
    Hint = ''
    Items.Strings = (
      'Estadual'
      'Nacional '
      'Exterior')
    Caption = 'Al'#231'ada - Abrang'#234'ncia'
    TabOrder = 5
    Columns = 3
  end
  object Rg_Enabled: TUniRadioGroup [8]
    Left = 440
    Top = 97
    Width = 119
    Height = 42
    Hint = ''
    Items.Strings = (
      'Sim'
      'N'#227'o')
    Caption = 'Habilitado'
    TabOrder = 6
    Columns = 2
  end
  object UniLabel6: TUniLabel [9]
    Left = 8
    Top = 138
    Width = 23
    Height = 13
    Hint = ''
    Caption = 'Nota'
    TabOrder = 11
  end
  object M_Note: TUniMemo [10]
    Left = 8
    Top = 153
    Width = 554
    Height = 161
    Hint = ''
    Lines.Strings = (
      'M_Note')
    TabOrder = 12
  end
  object E_Cfop: TUniEdit [11]
    Left = 8
    Top = 24
    Width = 100
    Hint = ''
    Text = ''
    TabOrder = 0
  end
  object UniLabel2: TUniLabel [12]
    Left = 8
    Top = 8
    Width = 39
    Height = 13
    Hint = ''
    Caption = 'C.F.O.P'
    TabOrder = 13
  end
  object E_Description: TUniEdit [13]
    Left = 8
    Top = 70
    Width = 554
    Hint = ''
    Text = ''
    TabOrder = 2
  end
  object UniLabel4: TUniLabel [14]
    Left = 8
    Top = 53
    Width = 156
    Height = 13
    Hint = ''
    Caption = 'Descri'#231#227'o Completa da Natureza'
    TabOrder = 14
  end
  inherited MenuTask: TUniMainMenu
    Left = 16
    Top = 360
  end
end
