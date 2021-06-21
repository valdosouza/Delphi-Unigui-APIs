inherited CadOrder: TCadOrder
  ClientHeight = 241
  ClientWidth = 582
  Caption = 'Cadastro de Ordem'
  ExplicitWidth = 598
  ExplicitHeight = 300
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnl_botao: TUniSimplePanel
    Top = 177
    Width = 582
    ExplicitTop = 170
    ExplicitWidth = 582
  end
  inherited pnl_fundo: TUniSimplePanel
    Width = 582
    Height = 177
    ExplicitWidth = 582
    ExplicitHeight = 170
    object L_Validade: TUniLabel
      Left = 6
      Top = 3
      Width = 22
      Height = 14
      Hint = ''
      Caption = 'Data'
      ParentFont = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Name = 'Arial'
      TabOrder = 1
    end
    object DTP_Date: TUniDateTimePicker
      Left = 6
      Top = 18
      Width = 120
      Hint = ''
      DateTime = 42916.000000000000000000
      DateFormat = 'dd/MM/yyyy'
      TimeFormat = 'HH:mm:ss'
      TabOrder = 2
    end
    object L_Observação: TUniLabel
      Left = 6
      Top = 47
      Width = 60
      Height = 14
      Hint = ''
      Caption = 'Observa'#231#227'o'
      ParentFont = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Name = 'Arial'
      TabOrder = 3
    end
  end
  object UniLabel1: TUniLabel [2]
    Left = 132
    Top = 3
    Width = 34
    Height = 14
    Hint = ''
    Caption = 'Status '
    ParentFont = False
    Font.Charset = ANSI_CHARSET
    Font.Color = clNavy
    Font.Name = 'Arial'
    TabOrder = 2
  end
  object E_Status: TUniEdit [3]
    Left = 132
    Top = 18
    Width = 45
    Hint = ''
    CharCase = ecUpperCase
    Text = ''
    ParentFont = False
    TabOrder = 3
  end
  object M_Note: TUniMemo [4]
    Left = 8
    Top = 67
    Width = 554
    Height = 97
    Hint = ''
    Lines.Strings = (
      'M_Note')
    TabOrder = 4
  end
  inherited Menu: TUniMainMenu
    Left = 592
    Top = 120
  end
end
